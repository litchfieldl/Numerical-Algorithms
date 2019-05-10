%Created By: Logan Litchfield 
%Date Created: March 30th, 2019
function [L,U,P] = luFactor(A)
%%This function completes an LU decomposition from an inputed matrix A.This
%includes a pivot matrix defined as P. 
%   
%   Variables:
%   A = Coefficient matrix 
%   L = Lower Triangular Matrix 
%   U = Upper Triangular Matrix 
%   P = Pivot Matrix 
%
%   Matrix A must be a square matrix in order for this function to work. 
%  
%   Example: 2 4 1
%            4 6 2
%            5 7 9 
%  
%   To obtain upper, lower, and pivot matracies, function must be called 
%   as following: 
%       [L,U,P]=luFactor(A)
%
%   Calling the funciton as [L,U]=luFactor(A) will result in the upper and
%   lower matracies only. 

%Checking for input error 
[x,y]=size(A);
if x~=y
    error('Inputed Matrix must be square.') 
end
if nargin~=1
    error('There must be exactly 1 input.')
end
%Defining L, U and P matracies 
%Have U equal A to be able to eliminate coefficients 
%Have both L and P equal to identity matrix
L=eye(y);
U=A;
P=eye(y);
for c=1:x-1
    %Identifying/Setting Pivot Elements by finding biggest coefficient 
    piv=max(abs(U(c:x,c)));
    for d=c:x
        if(abs(U(d,c))==piv)
            new=d;
        end
    end
    %Pivot rows (in P, L, and U) so biggest coefficient is on top and 
    %to avoid division by zero and subtractive cancelation
    P([c,new],:)=P([new,c],:);
    L([c,new],1:c-1)=L([new,c],1:c-1);
    U([c,new],c:x)=U([new,c],c:x);
    %Setting values for L matrix and U Matrix 
    for j=1+c:x
        L(j,c)=U(j,c)/U(c,c);
        U(j,c:x)=U(j,c:x)-L(j,c)*U(c,c:x);
    end
end
end