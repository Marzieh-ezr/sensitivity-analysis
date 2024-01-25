function RMSE_positive=sensitivityRMSE(S_model)
RMSE_positive=zeros(1,1500);
%RMSE_negative=zeros(1,1500);
for i=2:1500;
    a=S_model{i-1}(3330:4048);                              %Pa signal associated with u-delta_u
    a=a/max(a(:));                              
    b=S_model{i}(3330:4048);                                %PA signal associated with the nominal value of u
    b=b/max(b(:));
    %c=S_model{i+1}(3330:4048);                              %Pa signal associated with u+delta_u
    %c=c/max(c(:));
RMSE_P= sqrt(mean((b-a).^2))/sqrt(mean((b).^2))*100;
%RMSE_N= sqrt(mean((b-c).^2))/sqrt(mean((b).^2))*100;
RMSE_positive(i)=RMSE_P;
%RMSE_negative(i)=RMSE_N;
RMSE_P=0;
%RMSE_N=0;

end