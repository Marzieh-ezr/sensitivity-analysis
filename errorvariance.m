function E= errorvariance(S_exp, S_model, cutposition_1, cutposition_2)

S_exp=S_exp(cutposition_1:cutposition_2);
S_model=S_model(cutposition_1:cutposition_2);

S=size(S_exp);

E=(1/(S(1,2)*(S(1,2)-2)))*(sum((Y_exp_pos-Y_model_pos).^2));

end 