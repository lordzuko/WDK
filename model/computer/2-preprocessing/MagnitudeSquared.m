classdef MagnitudeSquared < Computer
    
    methods (Access = public)
        
        function obj = MagnitudeSquared()
            obj.name = 'E';
            obj.inputPort = ComputerPort(ComputerPortType.kSignal, ComputerSizeType.kNx3);
            obj.outputPort = ComputerPort(ComputerPortType.kSignal,ComputerSizeType.kN);
        end
        
        function dataOut = compute(~,x)
            dataOut = x(:,1).^2 + x(:,2).^2 + x(:,3).^2;
        end
    end
end