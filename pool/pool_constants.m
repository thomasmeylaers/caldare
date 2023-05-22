pump_power = 1000; %[W]
pump_time = 3600*12; %[s]
pool_area = 3*8; %[m^2]

operationele_uren = 11; % [h]
nacht_uren = 24- operationele_uren;
weekend_uren = 63;

volume = pool_area*1.6;
rho = 1000;
cpw = 4186;
cp= 1005;

alpha = 5.8; %[W/m^2K] heat transfer coeff
cpa = 1005; % [kg/JK] specific heat coeff
epsilon=0.9; % white paint 
epsilon_mat = 0.9; % blue polyethylene
sigma= 5.67* 10^(-8); % stefan

pump_energy = pump_power*pump_time*2.77777778 * 10^(-7); %[kWh]

% Ruimte
psat_ruimte = calculatePressure(gebouw_temp);
phi_ruimte = 0.65;
p=10^5;
x_ruimte = 0.622*phi_ruimte*psat_ruimte/(p-phi_ruimte*psat_ruimte);

% Water
L = 2267000; % [J/kg] Latent heat evaporation
temp_water = 32.7;
psat_water = calculatePressure(temp_water);
phi_water = 1;
x_water = 0.622*phi_water*psat_water/(p-phi_water*psat_water);

% Weekend
temp_water_weekend = 30.35;
psat_water_weekend = calculatePressure(temp_water_weekend);
phi_water = 1;
x_water_weekend = 0.622*phi_water*psat_water_weekend/(p-phi_water*psat_water_weekend);


uren_nacht = 24-openingsuren;