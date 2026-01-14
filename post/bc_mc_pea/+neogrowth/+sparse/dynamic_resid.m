function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(4, 1);
end
[T_order, T] = neogrowth.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(3, 1);
    residual(1) = (y(5)^(-params(2))) - (T(1)*T(3));
    residual(2) = (y(4)) - (y(6)*T(4)-y(5)+y(1)*(1-params(4)));
    residual(3) = (log(y(6))) - (params(5)*log(y(3))+x(1));
end
