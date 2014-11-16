% Define global variables used for the simulation
global pi2
global inToM
global N2OProperties
global N2OTemp
global N2OVaporDensity
global N2OLiquidDensity

inToM = 0.0254;
pi2 = 2 * pi;

N2OProperties = importdata('N2OProperties.txt');
T_rho = N2OProperties.data(:,1); 
rhoL_ref = N2OProperties.data(:,3); 
rhoV_ref = N2OProperties.data(:,2);
