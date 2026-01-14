function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(2, 1);
  residual(1)=(y(4))-(y(6)*y(1)^params(3)-y(5)+y(1)*(1-params(4)));
  T(1)=params(1)*y(8)^(-params(2));
  T(2)=1+params(3)*y(9)*y(4)^(params(3)-1)-params(4);
  residual(2)=(y(5)^(-params(2)))-(T(1)*T(2));
if nargout > 3
    g1_v = NaN(6, 1);
g1_v(1)=(-(1-params(4)+y(6)*getPowerDeriv(y(1),params(3),1)));
g1_v(2)=1;
g1_v(3)=(-(T(1)*params(3)*y(9)*getPowerDeriv(y(4),params(3)-1,1)));
g1_v(4)=1;
g1_v(5)=getPowerDeriv(y(5),(-params(2)),1);
g1_v(6)=(-(T(2)*params(1)*getPowerDeriv(y(8),(-params(2)),1)));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 2, 6);
end
end
