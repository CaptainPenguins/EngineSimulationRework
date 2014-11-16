classdef ClassPlumbing
    
    properties
        Length;
        Diam;
        Num90Bent;
        MassFlowRate;
    end
    
    methods
        
        function object = ClassPlumbing(Length, Diam, Num90Bent)
            
            if (nargin >= 1)
                disp('Created plumbing from hard-coded numbers');
                object.Length = Length;
                object.Diam = Diam;
                object.Num90Bent = Num90Bent;
            else
                data = xlsread('ObjectProperties.xlsx', 'Plumbing');
                object.Length= data(1);
                object.Diam = data(2);
                object.Num90Bent = data(3);
            end
        end
        
        function obj = Initialize(obj)
            
            global MassFlowRateGuess;
            
            obj.MassFlowRate = MassFlowRateGuess;
            
        end
        
    end
    
end
