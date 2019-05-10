%Created By: Logan Litchfield 
%Date Created: February 27th, 2019 
function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%This function preforms a calculation to find the root of an inputed
%function within inputed parameters. 
%   Input the function you want evaluated in the 'func' variable. Insert
%   your lower (xl) and upper (xu) bounds. Default relative error (es) is
%   set at 0.0001% and the maxium iterations is set at 200. You may enter
%   other specifications for the relative error and maximum iterations if
%   so desired. 
%Determining if Root Exists in given parameters
if sign(func(xl))==sign(func(xu))
    error('Brackets (xl & xu) are the same sign; no root exists') 
end
%Setting relative error
if nargin<4
    es=0.0001;
end
%Setting maximum iterations
if nargin<5
    maxiter=200;
end
format long
%Defining variables
iter=0;
ea=100; 
xr=0;
%Preforming false position calculation given set conditions
while ((ea>=es)&&(iter<maxiter))
    iter=iter+1; 
    old=xr;
    xr=xu-((func(xu)*(xl-xu))/((func(xl)-func(xu))));
    ea=(abs((xr-old)/xr)*100);
    if xr<0
        xu=xr;
    elseif xr>0
        xl=xr;
    end
end
%Displaying answers
root=xr;
fx=func(xr);
fprintf('The root of the function is:\n%.15f\n',root);
fprintf('The value of the function at the root is:\n%.15f\n',fx);
fprintf('The relative error of this approximation is:\n%.15f\n',ea);
fprintf('The number of iterations used was:\n%.0f\n',iter);
end

