classdef ClassEngine
    
    properties
        InnerDiam;
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
    end
    
end
