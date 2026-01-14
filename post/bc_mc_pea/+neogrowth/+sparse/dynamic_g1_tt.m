function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = neogrowth.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 8
    T = [T; NaN(8 - size(T, 1), 1)];
end
T(5) = getPowerDeriv(y(1),params(3),1);
T(6) = getPowerDeriv(y(4),params(3)-1,1);
T(7) = params(3)*y(9)*T(6);
T(8) = params(1)*getPowerDeriv(y(8),(-params(2)),1);
end
