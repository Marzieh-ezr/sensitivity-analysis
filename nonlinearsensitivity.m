function [F_plusplus, F_plusminus, F_minuminus, F_plusminus]=nonlinearsensitivity(PA_signals, absorption_coefficient, signalcutposition_1_sim, signalcutposition_2_sim)

%this function calculates the sensitivity of the PA forward model to the
%absorption coefficient and the scaling parameter using different adjusment
%factores in one specific wavelenght.


delta_F=zeros(60,60);



PA_signal_base=PA_signals{absorption_coefficient}(signalcutposition_1_sim:signalcutposition_2_sim);
S=size(PA_signal_base);



for i=0:60
deltau=i-30;
PA_signal_deltau=PA_signals{absorption_coefficient+deltau}(signalcutposition_1_sim:signalcutposition_2_sim);
    for j= 0:60
        deltaa=1+((j-30)/100);
        Delta=0;
        for k=1:S(1,2)
            data=0;
            data=abs(((1+deltaa)*PA_signal_deltau(k))-PA_signal_base(k));
            Delta=Delat+data;
        end
        
delta_F(i,j)=Delta;
    
    end
end 

end 
            
            
            
    
        
    