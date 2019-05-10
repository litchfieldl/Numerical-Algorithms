function [I] = Simpson(x,y)
%Created By: Logan Litchfield 
%Date Create: April 15th, 2019 
%
%This function uses the Simpson's 1/3 Rule to numerically integrate inputed
%array values. 
%   
%   Variables:
%   x = x value array  
%   y = y value array 
%   I = numerical integration value 
%   
%   The inputed x and y arrays must be the same length for this function to
%   work. Note that to obtain the correct integral, each element in the x
%   vector must correspond directly to the same spot in the y vector.
%
%   Example:
%       f(5)=6 and f(6)=3
%       x=[5 6] and y=[6 3]

%Error check for length of x and y
if length(x)~=length(y)
    error('Inputs for x and y must be the same length')
end
%Setting variables 
d=diff(x);
n=length(x);
d1=diff(d);
%Error check for equally spaced intervals
for i=1:length(d1)
    if d1(i)>(1500*eps)&&d1(i)~=0
        %Error message for non-equal spaced intervals 
         error('X input values do not have equal spacing. Simposons rule can not be used.')
    end
end   
%Preforming Simpson's rule with even number of elements
if rem(length(x),2)~=0
   I=((x(n)-x(1))/(3*(n-1)))*((y(1)+(4*sum(y(2:2:n)))+(2*sum(y(3:2:n-1)))+y(n)));
%Preforming Simpson's and Trapezodial Rule for odd number of elements 
elseif rem(n,2)==0
        %Warning message conveying trapezodial rule for last increment
        warning('Due to an odd number of increments, the trapizodial rule must be used on the last interval of the inputed array.');
        I2=((x(n-1)-x(1))/(3*(n-2)))*((y(1)+(4*sum(y(2:2:n-1)))+(2*sum(y(3:2:n-2)))+y(n-1)));
        I3=((x(n)-x(n-1))/(2))*(y(n)+y(n-1));
        I=I2+I3;
end
end

