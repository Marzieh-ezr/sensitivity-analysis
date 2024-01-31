function [S_exp,S_model]=Removedelay(tdms_struct, wavelength,PA_signals,absorption_coefficient)

%this function calculates the error variance between the experimental data
%and the best fit out the PA forward model. it assumes that they have got
%the same sampling rate but different length and probably shifted. 


channels=tdms_struct.(['M',num2str(wavelength),'D0']);
S_exp=Mean_Tdms(channels);
%S_exp=tdms_struct.(['M',num2str(wavelength),'D0']).v0_CH0.data;
S_model=PA_signals{absorption_coefficient};
size_model=size(S_model);
size_exp=size(S_exp);


%correct offset of experimental signal.
S_exp=S_exp-mean(S_exp(1:150));

%match time delays of experimental and simulated signals
index_S_exp=find(S_exp==max(S_exp(:)));
index_S_model=find(S_model==max(S_model(:)));
%delay=index_S_model-index_S_exp;%based on finding maximum of the signal
delay=finddelay(S_exp,S_model);%based on finding maximum cross corralation
size_exp=size(S_exp);
size_model=size(S_model);

if delay >=0;
S_exp_delayed=zeros(1,delay+size_exp(1,2));
    S_exp_delayed(delay+1:end)=S_exp;
S_exp=S_exp_delayed;
else
    delay=-delay;
S_model_delayed=zeros(1,delay+size_model(1,2));
S_model_delayed(delay+1:end)=S_model;
S_model=S_model_delayed; 
end


end