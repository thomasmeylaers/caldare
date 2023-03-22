function dTdt = odefcn(t,T)
    
    pump_power = 1000; %[W]
    pump_time = 3600*12; %[s]
    pool_area = 3*8; %[m^2]
    operationele_uren = 11; % [h]
    
    alpha = 5.8; %[W/m^2K] heat transfer coeff
    cpa = 1005; % [kg/JK] specific heat coeff
    epsilon=0.9; % white paint
    sigma= 5.67* 10^(-8) % stefan
    
    pump_energy = pump_power*pump_time*2.77777778 * 10^(-7); %[kWh]
    
    
    % Ruimte
    temp_ruimte = 23;
    psat_ruimte = calculatePressure(temp_ruimte);
    phi_ruimte = 0.65;
    p=10^5;
    x_ruimte = 0.622*phi_ruimte*psat_ruimte/(p-phi_ruimte*psat_ruimte)
    
    % Water
    temp_water = 34;
    psat_water = calculatePressure(temp_water);
    phi_water = 1;
    x_water = 0.622*phi_water*psat_water/(p-phi_water*psat_water)
    
    m = alpha*pool_area/cpa*(x_water-x_ruimte) % [kg/s]
    
    L = 2267000; % [J/kg] Latent heat evaporation
    Q_latent = m*L
    
    Q_convection = alpha *pool_area  *  (temp_water-temp_ruimte)
    
    Q_straling = pool_area*epsilon*sigma*((temp_water+273)^4- (temp_ruimte+273)^4)
    
    Q_in = Q_straling+Q_convection+Q_latent
    verbruik_stationair = Q_in* 10^(-3) * operationele_uren % [kWh]
    kosten_stationair = verbruik_stationair * 0.13;
    
    
    temp_begin = 28;
    volume = pool_area*1.6;
    rho = 1000;
    cpw = 4186;


    Q_in_opstart = 200 * 10 ^3;
    x_water_start = 0.622*phi_water*calculatePressure(T-273)/(p-phi_water*calculatePressure(T-273));
    m_start = alpha*pool_area/cpa*(x_water_start-x_ruimte); % [kg/s]
    Q_start_latent = m_start*L;
    
    Q_start_straling = pool_area*epsilon*sigma*((T)^4- (temp_ruimte+273)^4);
    
    Q_start_convection = alpha *pool_area  *  (T-273-temp_ruimte);
    dTdt = (Q_in_opstart - Q_start_convection-Q_start_straling-Q_start_latent)/(rho*volume*cpw);
end