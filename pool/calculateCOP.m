function [carnotCOP] = calculateCOP(T_H,T_C)
    carnotCOP = T_H/(T_H-T_C);
end

