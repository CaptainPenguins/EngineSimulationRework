classdef ClassOxTank
    
    properties
        InsideTemp;
        Volume;
        FillFactor;
        FillTemp;
        OxMassTotal;
        OxMassLiquid;
        Pressure;
    end
    
    methods
        
        function object = ClassOxTank(InsideTemp, Volume, FillFactor, FillTemp)
            
            if (nargin >= 1)
                
                disp('Created ox tank from hard-coded numbers');
                object.InsideTemp = InsideTemp;
                object.Volume = Volume;
                object.FillFactor = FillFactor;
                object.FillTemp = FillTemp;
            else
                
                data = xlsread('ObjectProperties.xlsx', 'OxTank');
                object.InsideTemp = data(1);
                object.Volume = data(2);
                object.FillFactor = data(3);
                object.FillTemp = data(4);
                
            end
        end
        
        function obj = Initialize(obj)
            
            global psiToPa
            global OxPressureGuess
            global N2OTemp
            global N2OVaporDensity
            global N2OLiquidDensity
            
            obj.Pressure = OxPressureGuess * psiToPa;
            
            fillLiquidDensity = interp1(N2OTemp, N2OLiquidDensity, obj.FillTemp);
            fillVaporDensity = interp1(N2OTemp, N2OVaporDensity, obj.FillTemp);
            
            obj.OxMassLiquid = obj.Volume * fillLiquidDensity * obj.FillFactor;
            obj.OxMassTotal = obj.OxMassLiquid + ...
                obj.Volume * fillVaporDensity * (1 - obj.FillFactor);
            
        end
        
    end
    
end
