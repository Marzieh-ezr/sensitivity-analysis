function E= errorvariance(S_exp, S_model, signalcutposition_1, signalcutposition_2,scaling_factor)


% this function calculates the error variance between the experimental and
% the simulated PA time resolved signals in an specific
% wavelength/absotption coefficient

S_exp=S_exp(signalcutposition_1:signalcutposition_2);
S_model=S_model(signalcutposition_1:signalcutposition_2);

S_exp=scaling_factor*S_exp/max(S_exp(:));
S_model=S_model/max(S_model(:));

S=size(S_exp);

E=(1/(S(1,2)*(S(1,2)-2)))*(sum((S_exp-S_model).^2));

end 