classdef ClassRocket
    
    properties
        % ----- ambient air -----
        AmbientTemp;
        AmbientPressure;
        AirDensity;
        AirViscosity;
        
        OuterDiam;
        
        InitMass;
        Mass
        TotalImpulse;
        
        Altitude;
        
        Velocity;
        Mach;
        Drag;
        DragCoef;
        Reynolds;
    end
    
    methods
        
        function object = ClassRocket(AmbientTemp, OutsideDiam, InitMass)
            
            if (nargin >= 1)
                disp('Created rocket from hard-coded numbers');
                object.AmbientTemp= AmbientTemp;
                object.OuterDiam = OutsideDiam;
                object.InitMass = InitMass;
            else
                data = xlsread('ObjectProperties.xlsx', 'Rocket');
                object.AmbientTemp = data(1);
                object.OuterDiam = data(2);
                object.InitMass = data(3);
            end
        end
        
        function obj = Initialize(obj)
            
            global LaunchAltitude
            
            obj.Altitude = LaunchAltitude;
            obj.Velocity = 0;
            obj.TotalImpulse = 0;
            
        end
        
        function obj = Update(obj, i, engine, deltaT)
            
            global AmbientPressureRef  % in Pa
            global TempSlope  % in K/m
            global GasConstR  % in (J/K/mol)
            global MolarMass  % in (kg/mol)
            global gravity %  in (m/s^2)
            % ----- Sutherland's Constants -----
            global AirViscosityRef  % in (Pa*s)
            global TempConst  % in K
            global TempRef  % in K
            
            % See 'atmosphericProperties.m'
            size(obj.AmbientTemp)
            class(obj.AmbientTemp)
            obj.AmbientTemp(1)
            obj.Altitude
            temp = obj.AmbientTemp(1,1) + TempSlope * ...
                (obj.Altitude(1,1) - obj.Altitude(i,1));
            obj.AmbientTemp = [obj.AmbientTemp; temp];
            
            temp = AmbientPressureRef * (1 - TempSlope ...
                * obj.Altitude(i) / obj.AmbientTemp(1)) ^ (gravity * MolarMass...
                / GasConstR / obj.Altitude(i));
            obj.AmbientPressure = [obj.AmbientPressure; temp];
            
            temp = obj.AmbientPressure(i) * MolarMass / GasConstR ...
                / obj.AmbientTemp(i);
            obj.AirDensity = [obj.AirDensity; temp];
            
            temp = AirViscosityRef * (TempRef + TempConst) / ...
                (obj.AmbientTemp(i) + TempConst) * (obj.AmbientTemp(i) / ...
                TempRef) ^ 1.5;
            obj.AirViscosity = [obj.AirViscosity; temp];
            
            global DragMach
            global DragCoef
            global AirSpecificHeatRatio  % unitless, Cp/Cv
            
            % See 'Aerodynamics.m'
            obj.Mach(i) = obj.Velocity(i) / sqrt(AirSpecificHeatRatio * GasConstR ...
                *obj.AmbientTemp(i) / MolarMass);
            obj.Reynolds(i) = obj.AirDensity(i) * obj.Velocity(i) * obj.OuterDiam ...
                / obj.AirViscosity(i);
            obj.DragCoef(i) = interp1(DragMach, DragCoef, obj.Mach(i));
            obj.Drag(i) = 0.5 * obj.DragCoef(i) * obj.Velocity(i) ^ 2 * pi / 4 ...
                * obj.OuterDiam ^ 2;
            
            global LaunchAngle
            
            % See 'kinematics.m'
            acceleration = (engine.Thrust - obj.Drag - obj.Mass) / gravity;
            if i == 1
                obj.Velocity = acceleration * deltaT;
                obj.Altitude = deltaT * obj.Velocity * sin(LaunchAngle);
            else
                obj.Velocity(i) = obj.Velocity(i - 1) + acceleration * deltaT;
                obj.Altitude(i) = obj.Altitude(i - 1) + deltaT * obj.Velocity(i) * sin(LaunchAngle);
            end
        end
        
    end
    
end
