function [g2_v, T_order, T] = dynamic_g2(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(8, 1);
end
[T_order, T] = neogrowth.sparse.dynamic_g2_tt(y, x, params, steady_state, T_order, T);
g2_v = NaN(10, 1);
g2_v(1)=(-(T(1)*params(3)*y(9)*getPowerDeriv(y(4),params(3)-1,2)));
g2_v(2)=(-(T(7)*T(8)));
g2_v(3)=(-(T(1)*params(3)*T(6)));
g2_v(4)=getPowerDeriv(y(5),(-params(2)),2);
g2_v(5)=(-(T(3)*params(1)*getPowerDeriv(y(8),(-params(2)),2)));
g2_v(6)=(-(T(8)*params(3)*T(2)));
g2_v(7)=(-(y(6)*getPowerDeriv(y(1),params(3),2)));
g2_v(8)=(-T(5));
g2_v(9)=(-(params(5)*(-1)/(y(3)*y(3))));
g2_v(10)=(-1)/(y(6)*y(6));
end
