classdef Variance
    %Beam profile
    %   Beam profile at different points
    
    properties
        wavelength
        Samplesize
        Meanamplitude         %Distance from aperture
        Lowerlimit
        Upperlimit
      end
    
    methods
        function obj = BeamProfile(Samplesize,Meanamplitude,Lowerlimit,Upperlimit)
            %This function Construct an instance of this class
            if nargin==5 
               obj.wavelength = wavelength;
               obj.Samplesize = Samplesize;
               obj.Meanamplitude = Meanamplitude;
               obj.Lowerlimit = Lowerlimit;
               obj.Upperlimit = Upperlimit;
            end
        end
    end  
end