function [L,U,P] = luFactor(A)
%luFactor 
%   performs an luFactorization on matrix A
syms x %%used to store variables
fs(x)=func;
if nargin<4
maxiter=200;
es=0.0001;
end

fxl=fs(xl);
fxu=fs(xu);

if fxl*fxu>0
    error('Both guesses have same sign, enter new guesses')
end
ea=es+1;
xr=0;
iter=0;
    while ea>es
        fxl=fs(xl);
        fxu=fs(xu);
        root=xu-(fxu*(xl-xu)/(fxl-fxu));
        fx=fs(root);
        if fxl*fx<0
            xu=root;
        elseif fxu*fx<0
            xl=root;
        end
        ea= abs(((root-xr)/root))*100;
        xr=root;
        iter=iter+1;
        if iter == maxiter
            break
        end
    end


