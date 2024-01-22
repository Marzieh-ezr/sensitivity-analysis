classdef Variance
    %Beam profile
    %   Beam profile at different points
    
    properties
        wavelength
        Meanamplitude         %Distance from aperture
        Lowerlimit
        Upperlimit
      end
    
    methods
        function obj = Variance(wavelength,Meanamplitude,Lowerlimit,Upperlimit)
            %This function Construct an instance of this class
            if nargin==4 
               obj.wavelength = wavelength;
               obj.Meanamplitude = Meanamplitude;
               obj.Lowerlimit = Lowerlimit;
               obj.Upperlimit = Upperlimit;
            end
        end
    end  
end