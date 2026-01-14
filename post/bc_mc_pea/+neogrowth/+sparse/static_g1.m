function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(5, 1);
end
[T_order, T] = neogrowth.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(7, 1);
g1_v(1)=(-(T(1)*params(1)*params(3)*y(3)*getPowerDeriv(y(1),params(3)-1,1)));
g1_v(2)=1-(1-params(4)+y(3)*getPowerDeriv(y(1),params(3),1));
g1_v(3)=T(5)-T(3)*params(1)*T(5);
g1_v(4)=1;
g1_v(5)=(-(T(1)*params(1)*params(3)*T(2)));
g1_v(6)=(-T(4));
g1_v(7)=1/y(3)-params(5)*1/y(3);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 3, 3);
end
