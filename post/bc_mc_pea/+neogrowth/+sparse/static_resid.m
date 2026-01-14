function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(4, 1);
end
[T_order, T] = neogrowth.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(3, 1);
    residual(1) = (T(1)) - (T(1)*params(1)*T(3));
    residual(2) = (y(1)) - (y(3)*T(4)-y(2)+y(1)*(1-params(4)));
    residual(3) = (log(y(3))) - (log(y(3))*params(5)+x(1));
end
