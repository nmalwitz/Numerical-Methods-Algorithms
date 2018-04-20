function I = Simpson(x,y)
%Simpson estimates the integral of an array
if size(x) ~= size(y)
    error('both x and y inputs must be the same length')
elseif diff(x) ~= ones(size(diff(x)))
    error('x-values must have equal spacing')
else
    z = size(x);
    evenint = [1 1];
    if mod(z,2) == evenint
        I = (x(end)-x(1))*((y(1)+(4*y(ceil(end/2)))+y(end))/x(end));
    end
end

