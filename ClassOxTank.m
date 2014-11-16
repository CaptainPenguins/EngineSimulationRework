classdef ClassOxTank
    
    properties
        InsideTemp;
        Volume;
        FillFactor;
        FillTemp;
        OxMassTotal;
        OxMassLiquid;
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
        
        function obj = Initialize()
        end
        
    end
    
end
