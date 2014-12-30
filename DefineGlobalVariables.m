% Define global variables used for the simulation
global pi2
pi2 = 2 * pi;

global inToM
inToM = 0.0254;

global psiToPa
psiToPa = 6894.727;

global kelvin
kelvin = 273.15;

global OxPressureGuess  % in psi
OxPressureGuess = 700;

global EnginePressureGuess % in psi
EnginePressureGuess = 250;

global EngineTempGuess  % in Celsius
EngineTempGuess = 3500;

global MassFlowRateGuess % in (kg/s)
MassFlowRateGuess = 1;

global LaunchAltitude  % in meters
LaunchAltitude = 1318.3;

global ExitGasMachGuess  % in mach number
ExitGasMachGuess = 2.5;

global N2OProperties
global N2OTemp
global N2OVaporDensity
global N2OLiquidDensity
N2OProperties = importdata('N2OProperties.txt');
N2OTemp = N2OProperties.data(:,1); 
N2OLiquidDensity = N2OProperties.data(:,3); 
N2OVaporDensity = N2OProperties.data(:,2);

global AmbientPressureRef  % in Pa
AmbientPressureRef = 101325;

global TempSlope  % in K/m
TempSlope = 0.0065;

global GasConstR  % in (J/K/mol)
GasConstR = 8.3145;

global MolarMass  % in (kg/mol)
MolarMass = 0.0289644;

global AirSpecificHeatRatio  % unitless, Cp/Cv
AirSpecificHeatRatio = 1.4;

global gravity %  in (m/s^2)
gravity = 9.81;

% ----- Sutherland's Constants -----
global AirViscosityRef  % in (Pa*s)
AirViscosityRef = 18.27e-6;

global TempConst  % in K
TempConst = 120;

global TempRef  % in K
TempRef = 291.15;

global DragCoefChart
global DragMach
global DragCoef
DragCoefChart = importdata('DragCoefficients.txt'); 
DragMach = DragCoefChart.data(:,1); 
DragCoef = DragCoefChart.data(:,2); 

global LaunchAngle
LaunchAngle = 85 / 360 * 2 * pi;















