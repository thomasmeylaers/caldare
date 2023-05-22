function [indices] = getIndexInterp(vector,value)
%GETINDEXINTERP Summary of this function goes here
%   Detailed explanation goes here
% Interpolate the vector
interpolated = interp1(vector, 1:numel(vector), value, 'nearest');

% Find the indices of the interpolated value
indices = round(interpolated);

end

