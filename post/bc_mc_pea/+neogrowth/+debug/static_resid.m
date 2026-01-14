function [lhs, rhs] = static_resid(y, x, params)
T = NaN(4, 1);
lhs = NaN(3, 1);
rhs = NaN(3, 1);
T(1) = y(2)^(-params(2));
T(2) = y(1)^(params(3)-1);
T(3) = 1+params(3)*y(3)*T(2)-params(4);
T(4) = y(1)^params(3);
lhs(1) = T(1);
rhs(1) = T(1)*params(1)*T(3);
lhs(2) = y(1);
rhs(2) = y(3)*T(4)-y(2)+y(1)*(1-params(4));
lhs(3) = log(y(3));
rhs(3) = log(y(3))*params(5)+x(1);
end
