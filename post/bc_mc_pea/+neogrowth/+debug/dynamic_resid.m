function [lhs, rhs] = dynamic_resid(y, x, params, steady_state)
T = NaN(4, 1);
lhs = NaN(3, 1);
rhs = NaN(3, 1);
T(1) = params(1)*y(8)^(-params(2));
T(2) = y(4)^(params(3)-1);
T(3) = 1+params(3)*y(9)*T(2)-params(4);
T(4) = y(1)^params(3);
lhs(1) = y(5)^(-params(2));
rhs(1) = T(1)*T(3);
lhs(2) = y(4);
rhs(2) = y(6)*T(4)-y(5)+y(1)*(1-params(4));
lhs(3) = log(y(6));
rhs(3) = params(5)*log(y(3))+x(1);
end
