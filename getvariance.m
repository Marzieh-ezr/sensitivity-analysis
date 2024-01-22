function [mean_amplitude, lower_limit, upper_limit]= getvariance(tdms_struct, wavelength,  signalcutposition_1_exp, signalcutposition_2_exp)

%this function calculates the variance properties of the time resolved PA experimental
%signals. every single PA signal which is obtained at a specific
%wavelenghth can be reproduce by a vector with an arbitrary number of
%elements. this function only works on the part of the signal which is
%specified by the user by signalcutposition_1 and signalcutposition_2.

%mean amplitude: the mean value of the amplitude of the time resolved PA
%signals out of several experimental data for different time ponts. it is a
%vector with the same size as the PA signal.

%lower-limit: the lower-limit of the amplitude of the time resolved PA
%signals out of several experimental data for different time ponts.it is a
%vector with the same size as the PA signal.


%upper_limit: the upper_limit of the amplitude of the time resolved PA
%signals out of several experimental data for different time ponts.it is a
%vector with the same size as the PA signal.


%tdms_struct: the TDMS file containing experimental data.

% wavelenght: the wavelenght of the interest
%==========================================================================================================================================================


channels= tdms_struct.(['M', num2str(wavelength), 'D0']);
samplesize=numel(fieldnames(channels))-2;

sample=channels.v0_CH0.data(signalcutposition_1_exp:signalcutposition_2_exp);
Size=size(sample);

mean_amplitude=zeros(1,Size(1,2));
lower_limit=zeros(1,Size(1,2));
upper_limit=zeros(1,Size(1,2));

Data= zeros(1,samplesize);


for i= 1: Size(1,2)
    for j=1:samplesize
    data=channels.(['v', num2str(j-1),'_CH0']).data;
    data_1=data(signalcutposition_1_exp:signalcutposition_2_exp);
    data_2=data_1(1,i);
    Data(j)=data_2;
    end
  mean_amplitude(i)= mean(Data);
  lower_limit(i)= min(Data);
  upper_limit(i)= max(Data);
end


end