classdef ClassRocket
 
    properties
        AmbientTemp;
        OutsideTemp;
        InitMass;
    end
    
    methods
        
        function object = ClassRocket(AmbientTemp, OutsideTemp, InitlMass)
            
            if (nargin >= 1)
                disp('Created rocket from hard-coded numbers');
                object.AmbientTemp= AmbientTemp;
                object.OutsideTemp = OutsideTemp;
                object.InitMass = InitMass;
            else
                data = xlsread('ObjectProperties.xlsx', 'Rocket');
                object.AmbientTemp = data(1);
                object.OutsideTemp = data(2);
                object.InitMass = data(3);
            end
        end
    end
    
end
