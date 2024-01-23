function delta_F =nonlinearsensitivity(PA_signals, absorption_coefficient, signalcutposition_1_sim, signalcutposition_2_sim)

%this function calculates the sensitivity of the PA forward model to the
%absorption coefficient and the scaling parameter using different adjusment
%factores in one specific wavelenght.

%delta_F(31,31)=0; when deltau and deltaa both are equal to zero.

%PA_signals is a cell containing all the PA signals in different absorption
%coefficients. the number of each cell element stands for the absorption
%coefficient value which is set to calculate the PA signal stored in that
%cell element
%signalcutposition_1_sim, signalcutposition_2_sim specify the section of
%the signal we intend to investigate. it is the first compression part of
%PA signals in our case

delta_F=zeros(60,60);



PA_signal_base=PA_signals{absorption_coefficient}(signalcutposition_1_sim:signalcutposition_2_sim);    %PA signal when deltau and deltaa are both equal to zero
S=size(PA_signal_base);



for i=1:61
deltau=i-31;    %variation in tyhe absorption coefficient
PA_signal_deltau=PA_signals{absorption_coefficient+deltau}(signalcutposition_1_sim:signalcutposition_2_sim);
    for j= 1:61
        deltaa=((j-31)/100);   %variation in the scaling factor
        Delta=0;
        for k=1:S(1,2)
            data=0;
            data=abs(((1+deltaa)*PA_signal_deltau(k))-PA_signal_base(k));
            Delta=Delta+data;
        end
        
delta_F(i,j)=Delta;
    
    end
end 

end 
            
            
            
    
        
    