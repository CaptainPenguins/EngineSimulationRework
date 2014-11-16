% UTAT Rocket Engine Simulation
% EngineSimulation_Main

clear

DefineGlobalVariables

% ----- Create objects ----- 
% Loaded global variables from 'ObjectProperties.xlsx'
disp('Creating objects');

engine = ClassEngine();
fuelcore = ClassFuelCore();
injector = ClassInjector();
nozzle = ClassNozzle();
oxtank = ClassOxTank();
plumbing = ClassPlumbing();
rocket = ClassRocket();

% ----- Initialize fuel core-----
disp('Initializing fuel core')
fuelcore = fuelcore.Initialize(engine);
oxtank = oxtank.Initialize();







