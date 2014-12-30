classdef ClassEngine
    
    properties
        InnerDiam;
        Pressure;
        Temp;
        XY;
        Polar;
        
        Thrust;
    end
    
    methods
        
        function object = ClassEngine(InnerDiam)
            
            if (nargin >= 1)
                
                disp('Created engine from hard-coded numbers');
                object.InnerDiam = InnerDiam;

            else
                
                data = xlsread('ObjectProperties.xlsx', 'Engine');
                object.InnerDiam = data(1);
                
            end
        end
        
        function obj = Initialize(obj)
            
            global EnginePressureGuess;
            global EngineTempGuess;
            global psiToPa;
            global kelvin;
            
            obj.Pressure = EnginePressureGuess * psiToPa;
            obj.Temp = EngineTempGuess + kelvin;
            
            global pi2
            
            obj.Polar(:, 1) = (0:0.01:pi2)';
            obj.Polar(:, 2) = obj.InnerDiam / 2;
            
            obj.XY(:, 1) = obj.InnerDiam / 2 * cos(obj.Polar(:, 1));
            obj.XY(:, 2) = obj.InnerDiam / 2 * sin(obj.Polar(:, 1));
            
            obj.Thrust = 500;
            
        end
        
        function obj = Update(obj, fuelcore)
            
            obj.Thrust = 500;
            fuelcore.RegressionRate = 0.05;
            
        end
    end
    
end
