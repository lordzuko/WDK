%returns the first component of the frequency representation of the signal
classdef SpectralEnergy < Computer
    
    properties (Access = public)
        fourierTransform;
    end
    
    methods (Access = public)
        
        function obj = SpectralEnergy()
            obj.name = 'SpectralEnergy';
            obj.inputPort = ComputerPort(ComputerPortType.kSignal,ComputerSizeType.kN);
            obj.outputPort = ComputerPort(ComputerPortType.kFeature);
        end
        
        function result = compute(obj,signal)
            
            localFourierTransform = obj.fourierTransform;
            
            %if isempty(localFourierTransform)
                %localFourierTransform = fft(signal);%this is probably wrong, should be tested
            %end
            
            Y = optimizedFFT(signal,localFourierTransform);
            N = length(Y);
            Y = Y(1:ceil(N/2));
            pow = Y.*conj(Y);
            result = sum(pow) / N;
        end
    end
end