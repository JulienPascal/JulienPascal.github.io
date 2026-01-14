
if exist('OCTAVE_VERSION', 'builtin')

    function T = cell2table(C, varargin)
        if nargin > 1
            opts = varargin{2};
            varname = opts{1};
        else
            varname = 'Var1';
        end
        T = struct();
        for i = 1:size(C,2)
            T.(varname) = C(:,i);
        end
    end

    function T = struct2table(S, varargin)
        T = S;
    end

    function T = array2table(A, varargin)
        if nargin > 1
            opts = varargin{2};
            varnames = opts{1};
        else
            nvars = size(A,2);
            varnames = cell(1, nvars);
            for i = 1:nvars
                varnames{i} = sprintf('Var%d', i);
            end
        end

        T = struct();
        for i = 1:size(A,2)
            if iscell(varnames)
                fieldname = varnames{i};
            else
                fieldname = varnames;
            end
            T.(fieldname) = A(:,i);
        end
    end

    function writetable(T, filename)
        fid = fopen(filename, 'w');
        fields = fieldnames(T);

        % Write header
        for i = 1:length(fields)
            fprintf(fid, '%s', fields{i});
            if i < length(fields)
                fprintf(fid, ',');
            else
                fprintf(fid, '\n');
            end
        end

        % Number of rows
        nRows = length(T.(fields{1}));

        % Write data
        for row = 1:nRows
            for col_idx = 1:length(fields)
                col = T.(fields{col_idx});
                value = col(row,:);
                if iscell(col)
                    fprintf(fid, '%s', col{row});
                elseif ischar(value)
                    fprintf(fid, '%s', strtrim(value));
                elseif isnumeric(value)
                    fprintf(fid, '%g', value);
                else
                    error('writetable: unsupported data type in column %d', col_idx);
                end

                if col_idx < length(fields)
                    fprintf(fid, ',');
                else
                    fprintf(fid, '\n');
                end
            end
        end

        fclose(fid);
    end



end

% Go to working directory
% cd '/content';

% Run Dynare
dynare neogrowth.mod noclearall

% Postprocess
k_pos = strmatch('k', M_.endo_names, 'exact');
c_pos = strmatch('c', M_.endo_names, 'exact');
z_pos = strmatch('z', M_.endo_names, 'exact');

var_positions = [k_pos; c_pos; z_pos];
Sim_series = oo_.endo_simul(var_positions, :)';
var_names = M_.endo_names_long(var_positions, :);

if ~exist('output/Linearization', 'dir')
    mkdir('output/Linearization');
end

% Save steady state values manually
var_list = cellstr(oo_.var_list);  % Variable names
ss_values = oo_.mean;              % Steady state values

fid = fopen('output/Linearization/SS_values.csv', 'w');
fprintf(fid, 'Variable,MeanValue\n');  % Header

for i = 1:length(var_list)
    fprintf(fid, '%s,%g\n', var_list{i}, ss_values(i));
end

fclose(fid);


% Save simulated series
%Sim_table = array2table(Sim_series, 'VariableNames', cellstr(var_names));
%writetable(Sim_table, 'output/Linearization/Sim_series.csv');

% Save Sim_series manually
csvwrite('output/Linearization/Sim_series_only_data.csv', Sim_series);

% Also write header separately
fid = fopen('output/Linearization/Sim_series.csv', 'w');
fprintf(fid, 'k,c,z\n'); % header with variable names

data = Sim_series; % already transposed correctly (observations x variables)

for i = 1:size(data,1)
    fprintf(fid, '%g,%g,%g\n', data(i,1), data(i,2), data(i,3));
end

fclose(fid);

% State-space matrices
A = oo_.dr.ghx(oo_.dr.inv_order_var(M_.state_var'), :);
B = oo_.dr.ghu(oo_.dr.inv_order_var(M_.state_var'), :);
control = (1:size(oo_.dr.ghu,1))';
state = M_.state_var';
for j = 1:length(state)
    control(control == state(j)) = [];
end
C = oo_.dr.ghx(oo_.dr.inv_order_var(control), :);
D = oo_.dr.ghu(oo_.dr.inv_order_var(control), :);

S_variables_names = M_.endo_names(state,:);
X_variables_names = M_.endo_names(control,:);
shocks_names = M_.exo_names;

% Save variable names
writetable(cell2table(cellstr(S_variables_names)), 'output/Linearization/state_variables_names.csv');
writetable(cell2table(cellstr(X_variables_names)), 'output/Linearization/control_variables_names.csv');
writetable(cell2table(cellstr(shocks_names)), 'output/Linearization/exo_variables_names.csv');

% Save matrices A, B, C, D
csvwrite('output/Linearization/A.csv', A);
csvwrite('output/Linearization/B.csv', B);
csvwrite('output/Linearization/C.csv', C);
csvwrite('output/Linearization/D.csv', D);

% Simulations with shocks
len_T = 10;
e1 = zeros(len_T, 1);
e1(1) = 1.0;
horizon = length(e1) + 1;
shocks = zeros(M_.exo_nbr, horizon);
shocks(strcmp(cellstr(shocks_names), 'eps'), 2:horizon) = e1;
Ssim = zeros(length(state), horizon);
Xsim = zeros(length(control), horizon);

for j = 2:horizon
    Ssim(:,j) = A * Ssim(:,j-1) + B * shocks(:,j);
    Xsim(:,j) = C * Ssim(:,j-1) + D * shocks(:,j);
end

csvwrite('output/Linearization/Ssim.csv', Ssim');
csvwrite('output/Linearization/Xsim.csv', Xsim');
