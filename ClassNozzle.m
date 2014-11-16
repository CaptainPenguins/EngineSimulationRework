classdef ClassNozzle
    
    properties
        throatDiam;
        exitDiam;
        divergeLeng;
        GasSpeed;
    end
    
    methods
        
        function object = ClassNozzle(throatDiam, exitDiam, divergeLeng)
            
            if (nargin >= 1)
                
                disp('Created nozzle from hard-coded numbers');
                object.throatDiam = throatDiam;
                object.exitDiam = exitDiam;
                object.divergeLeng = divergeLeng;
            else
                
                data = xlsread('ObjectProperties.xlsx', 'Nozzle');
                object.throatDiam = data(1);
                object.exitDiam = data(2);
                object.divergeLeng = data(3);
                
            end
        end
        
        function obj = Initialize(obj)
            
            global ExitGasMachGuess;
            
            obj.GasSpeed = ExitGasMachGuess;
            
        end
    end
    
end
