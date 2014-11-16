classdef ClassInjector
    
    properties
        PoreDiam;
        InletDiam;
        NumPore;
    end
    
    methods
        
        function object = ClassInjector(PoreDiam, InletDiam, NumPore)
            
            if (nargin >= 1)
                disp('Created injector from hard-coded numbers');
                object.PoreDiam = PoreDiam;
                object.InletDiam = InletDiam;
                object.NumPore = NumPore;
            else
                data = xlsread('ObjectProperties.xlsx', 'Injector');
                object.PoreDiam = data(1);
                object.InletDiam = data(2);
                object.NumPore = data(3);
            end
        end
    end
    
end
