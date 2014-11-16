classdef ClassFuelCore
    
    properties
        InnerDiam;
        Length;
        Density;
        XY;
        Polar;
        OpenArea;
        Mass;
    end
    
    methods
        
        % Constructor
        function object = ClassFuelCore(InnerDiam, Length, Density)
            
            if (nargin >= 1)
                disp('Created fuel core from hard-coded numbers');
                object.InnerDiam = InnerDiam;
                object.Length = Length;
                object.Density = Density;
            else
                data = xlsread('ObjectProperties.xlsx', 'FuelCore');
                object.InnerDiam = data(1);
                object.Length = data(2);
                object.Density = data(3);
            end
        end
        
        % Create Initial Geometry
        function obj = Initialize(obj, engine)
            
            global pi2
            
            obj.Polar(:, 1) = (0:0.01:pi2)';
            obj.Polar(:, 2) = obj.InnerDiam / 2;
            
            obj.XY(:, 1) = obj.InnerDiam / 2 * cos(obj.Polar(:, 1));
            obj.XY(:, 2) = obj.InnerDiam / 2 * sin(obj.Polar(:, 1));
            
            obj.OpenArea = polyarea(obj.XY(:,1), obj.XY(:,2));
            
            obj.Mass = obj.Density * obj.Length * (engine.InnerDiam ^ 2 ...
                * pi / 4 - obj.OpenArea);
        end

    end
    
end
