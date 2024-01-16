classdef Variance
    %Beam profile
    %   Beam profile at different points
    
    properties
        Samplesize
        Meanamplitude         %Distance from aperture
        Lowerlimit
        Upperlimit
      end
    
    methods
        function obj = BeamProfile(Samplesize,Meanamplitude,Lowerlimit,Upperlimit)
            %This function Construct an instance of this class
            if nargin==4    
               obj.Samplesize = Samplesize;
               obj.Meanamplitude = Meanamplitude;
               obj.Lowerlimit = Lowerlimit;
               obj.Upperlimit = Upperlimit;
            end
        end
    end  
end