%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info
options_ = [];
M_.fname = 'neogrowth';
M_.dynare_version = '6.0';
oo_.dynare_version = '6.0';
options_.dynare_version = '6.0';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(1,1);
M_.exo_names_tex = cell(1,1);
M_.exo_names_long = cell(1,1);
M_.exo_names(1) = {'eps'};
M_.exo_names_tex(1) = {'eps'};
M_.exo_names_long(1) = {'eps'};
M_.endo_names = cell(3,1);
M_.endo_names_tex = cell(3,1);
M_.endo_names_long = cell(3,1);
M_.endo_names(1) = {'k'};
M_.endo_names_tex(1) = {'k'};
M_.endo_names_long(1) = {'k'};
M_.endo_names(2) = {'c'};
M_.endo_names_tex(2) = {'c'};
M_.endo_names_long(2) = {'c'};
M_.endo_names(3) = {'z'};
M_.endo_names_tex(3) = {'z'};
M_.endo_names_long(3) = {'z'};
M_.endo_partitions = struct();
M_.param_names = cell(6,1);
M_.param_names_tex = cell(6,1);
M_.param_names_long = cell(6,1);
M_.param_names(1) = {'beta'};
M_.param_names_tex(1) = {'beta'};
M_.param_names_long(1) = {'beta'};
M_.param_names(2) = {'gamma'};
M_.param_names_tex(2) = {'gamma'};
M_.param_names_long(2) = {'gamma'};
M_.param_names(3) = {'alpha'};
M_.param_names_tex(3) = {'alpha'};
M_.param_names_long(3) = {'alpha'};
M_.param_names(4) = {'delta'};
M_.param_names_tex(4) = {'delta'};
M_.param_names_long(4) = {'delta'};
M_.param_names(5) = {'rho'};
M_.param_names_tex(5) = {'rho'};
M_.param_names_long(5) = {'rho'};
M_.param_names(6) = {'sigma_eps'};
M_.param_names_tex(6) = {'sigma\_eps'};
M_.param_names_long(6) = {'sigma_eps'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 3;
M_.param_nbr = 6;
M_.orig_endo_nbr = 3;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.learnt_shocks = [];
M_.learnt_endval = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
M_.matched_irfs = {};
M_.matched_irfs_weights = {};
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.ramsey_policy = false;
options_.discretionary_policy = false;
M_.nonzero_hessian_eqs = [1 2 3];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.eq_nbr = 3;
M_.ramsey_orig_eq_nbr = 0;
M_.ramsey_orig_endo_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 1 3 0;
 0 4 6;
 2 5 7;]';
M_.nstatic = 0;
M_.nfwrd   = 1;
M_.npred   = 1;
M_.nboth   = 1;
M_.nsfwrd   = 2;
M_.nspred   = 2;
M_.ndynamic   = 3;
M_.dynamic_tmp_nbr = [4; 4; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , 'k' ;
  3 , 'name' , '3' ;
};
M_.mapping.k.eqidx = [1 2 ];
M_.mapping.c.eqidx = [1 2 ];
M_.mapping.z.eqidx = [1 2 3 ];
M_.mapping.eps.eqidx = [3 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.block_structure.time_recursive = false;
M_.block_structure.block(1).Simulation_Type = 3;
M_.block_structure.block(1).endo_nbr = 1;
M_.block_structure.block(1).mfs = 1;
M_.block_structure.block(1).equation = [ 3];
M_.block_structure.block(1).variable = [ 3];
M_.block_structure.block(1).is_linear = false;
M_.block_structure.block(1).NNZDerivatives = 2;
M_.block_structure.block(1).bytecode_jacob_cols_to_sparse = [0 1 ];
M_.block_structure.block(2).Simulation_Type = 8;
M_.block_structure.block(2).endo_nbr = 2;
M_.block_structure.block(2).mfs = 2;
M_.block_structure.block(2).equation = [ 2 1];
M_.block_structure.block(2).variable = [ 1 2];
M_.block_structure.block(2).is_linear = false;
M_.block_structure.block(2).NNZDerivatives = 6;
M_.block_structure.block(2).bytecode_jacob_cols_to_sparse = [1 3 4 6 ];
M_.block_structure.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure.block(2).g1_sparse_rowval = int32([1 1 2 1 2 2 ]);
M_.block_structure.block(2).g1_sparse_colval = int32([1 3 3 4 4 6 ]);
M_.block_structure.block(2).g1_sparse_colptr = int32([1 2 2 4 6 6 7 ]);
M_.block_structure.variable_reordered = [ 3 1 2];
M_.block_structure.equation_reordered = [ 3 2 1];
M_.block_structure.incidence(1).lead_lag = -1;
M_.block_structure.incidence(1).sparse_IM = [
 2 1;
 3 3;
];
M_.block_structure.incidence(2).lead_lag = 0;
M_.block_structure.incidence(2).sparse_IM = [
 1 1;
 1 2;
 2 1;
 2 2;
 2 3;
 3 3;
];
M_.block_structure.incidence(3).lead_lag = 1;
M_.block_structure.incidence(3).sparse_IM = [
 1 2;
 1 3;
];
M_.block_structure.dyn_tmp_nbr = 2;
M_.state_var = [3 1 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(3, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(6, 1);
M_.endo_trends = struct('deflator', cell(3, 1), 'log_deflator', cell(3, 1), 'growth_factor', cell(3, 1), 'log_growth_factor', cell(3, 1));
M_.NNZDerivatives = [11; 14; -1; ];
M_.dynamic_g1_sparse_rowval = int32([2 3 1 2 1 2 2 3 1 1 3 ]);
M_.dynamic_g1_sparse_colval = int32([1 3 4 4 5 5 6 6 8 9 10 ]);
M_.dynamic_g1_sparse_colptr = int32([1 2 2 3 5 7 9 9 10 11 12 ]);
M_.dynamic_g2_sparse_indices = int32([1 4 4 ;
1 4 8 ;
1 4 9 ;
1 5 5 ;
1 8 8 ;
1 8 9 ;
2 1 1 ;
2 1 6 ;
3 3 3 ;
3 6 6 ;
]);
M_.lhs = {
'c^(-gamma)'; 
'k'; 
'log(z)'; 
};
M_.static_tmp_nbr = [4; 1; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 3;
M_.block_structure_stat.block(1).endo_nbr = 1;
M_.block_structure_stat.block(1).mfs = 1;
M_.block_structure_stat.block(1).equation = [ 3];
M_.block_structure_stat.block(1).variable = [ 3];
M_.block_structure_stat.block(2).Simulation_Type = 6;
M_.block_structure_stat.block(2).endo_nbr = 2;
M_.block_structure_stat.block(2).mfs = 2;
M_.block_structure_stat.block(2).equation = [ 2 1];
M_.block_structure_stat.block(2).variable = [ 2 1];
M_.block_structure_stat.variable_reordered = [ 3 2 1];
M_.block_structure_stat.equation_reordered = [ 3 2 1];
M_.block_structure_stat.incidence.sparse_IM = [
 1 1;
 1 2;
 1 3;
 2 1;
 2 2;
 2 3;
 3 3;
];
M_.block_structure_stat.tmp_nbr = 4;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 2 1 2 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 1 2 2 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 3 5 ]);
M_.static_g1_sparse_rowval = int32([1 2 1 2 1 2 3 ]);
M_.static_g1_sparse_colval = int32([1 1 2 2 3 3 3 ]);
M_.static_g1_sparse_colptr = int32([1 3 5 8 ]);
M_.params(1) = 0.95;
beta = M_.params(1);
M_.params(2) = 1.0;
gamma = M_.params(2);
M_.params(3) = 0.3;
alpha = M_.params(3);
M_.params(4) = 0.1;
delta = M_.params(4);
M_.params(5) = 0.8;
rho = M_.params(5);
M_.params(6) = 0.14;
sigma_eps = M_.params(6);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(1) = (M_.params(3)*M_.params(1)/(1-M_.params(1)*(1-M_.params(4))))^(1/(1-M_.params(3)));
oo_.steady_state(2) = (M_.params(3)*M_.params(1)/(1-M_.params(1)*(1-M_.params(4))))^(M_.params(3)/(1-M_.params(3)))-M_.params(4)*(M_.params(3)*M_.params(1)/(1-M_.params(1)*(1-M_.params(4))))^(M_.params(3)/(1-M_.params(3)));
oo_.steady_state(3) = 1;
oo_.exo_steady_state(1) = 0;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = M_.params(6)^2;
options_.irf = 100;
options_.order = 1;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);
options_.order = 2;
options_.periods = 50000;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'neogrowth_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'neogrowth_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'neogrowth_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'neogrowth_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'neogrowth_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'neogrowth_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'neogrowth_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'neogrowth_results.mat'], 'options_mom_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
