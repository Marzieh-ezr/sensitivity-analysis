function C=covariance(tdms_struct, wavelength, PA_signals, absorption_coefficient,scaling_factor, signalcutposition_1, signalcutposition_2);

% This function calculates the Covariance matrix for the PA forward model.

%PA_signals is a cell containing all the PA signals in different absorption
%coefficients. the number of each cell element stands for the absorption
%coefficient value which is set to calculate the PA signal stored in that
%cell element signalcutposition_1_sim, signalcutposition_2_sim specify the
%section of the signal we intend to investigate. it is the first
%compression part of PA signals in our case

%================================================================================================
scaling_factor=1;
[S_exp,PA_signal_base]=Removedelay(tdms_struct, wavelength,PA_signals,absorption_coefficient);
PA_signal_base=PA_signal_base(signalcutposition_1:signalcutposition_2); 
PA_signal_base=PA_signal_base/max(PA_signal_base(:));%PA signal when deltau and deltaa are both equal to zero
S=size(PA_signal_base);

C=zeros(S(1,2),2);
deltau=1; %variation in tyhe absorption coefficient
deltaa=0.001; %variation in the scaling factor

[S_exp,PA_signal_adjusted]=Removedelay(tdms_struct, wavelength,PA_signals,absorption_coefficient+deltau);
PA_signal_adjusted=PA_signal_adjusted(signalcutposition_1:signalcutposition_2);
PA_signal_adjusted=PA_signal_adjusted/max(PA_signal_adjusted(:));

C(:,1)=scaling_factor*(PA_signal_adjusted-PA_signal_base)/deltau;
C(:,2)=PA_signal_base;
      
end 
