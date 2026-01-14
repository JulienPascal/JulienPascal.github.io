
% optimal_growth.mod
% Dynare file for the standard optimal growth model (first-order approximation)

var k c z;
varexo eps;

parameters beta gamma alpha delta rho sigma_eps;

% Parameter values
beta      = 0.95;
gamma     = 1.0;      % CRRA coefficient
alpha     = 0.3;
delta     = 0.1;
rho       = 0.8;
sigma_eps = 0.14;

model;
% Euler equation (after substituting the marginal utility condition)
c^(-gamma) = beta * c(+1)^(-gamma) * ( alpha * z(+1) * k^(alpha-1) + 1 - delta );

% Resource constraint (law of motion for capital)
k = z * k(-1)^alpha - c + (1-delta)*k(-1);

% Technology process (AR(1) in logs)
log(z) = rho*log(z(-1)) + eps;

end;

initval;
% Initial guesses for the steady state
k   = ((alpha*beta)/(1 - beta*(1-delta)))^(1/(1-alpha));
c   = ((alpha*beta)/(1 - beta*(1-delta)))^(alpha/(1-alpha)) - delta*(((alpha*beta)/(1 - beta*(1-delta)))^(alpha/(1-alpha)));
z   = 1;
eps = 0;
end;

steady;
check;

shocks;
var eps = sigma_eps^2;
end;

% IRF
stoch_simul(order=1, irf=100);

% SIMULATED SERIES
stoch_simul(periods=50000);
