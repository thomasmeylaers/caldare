function [pressure] = calculatePressure(temp)
%Calculate the saturation pressure for a given temperature [K]
R = 461;
T0 = 273.15;
e0 = 0.6113 * 10^3;
L = 2.5*10^6;
temp = temp + 273.15;

pressure = e0*exp((L/R)*(1/T0-1/temp));
end

