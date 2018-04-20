function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%
%falsePosition estimate root of a function
%
%   INPUTS:
%   func = the function being evaluated
%   xl = the lower guess/bracket
%   xu = the upper guess/bracket
%   es = the desired relative error (defaults to 0.0001%)
%   maxiter = the number of iterations desired (defaults to 200)
%
%   OUTPUTS:
%   root = the estimated root location
%   fx = the function evaluated at the root location
%   ea = the approximate relative error (%)
%   iter = how many iterations were performed
%
%   DESCRIPTION:
%   The falsePosition function uses the false position method to
%   approximate the root of the function the user inputs. See input variables
%   and output variables above.

if nargin < 4
    iter = 0;
    while iter < 200
        if func(xl) == 0
            disp('xl is the root')
        elseif func(xu) == 0
            disp('xu is the root')
        elseif xl*xu > 0
            error('input variables must bracket the x-axis')
        else
            root = xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));
            fx = func(root);
            ea = abs((root-xu)/root)*100;
        end
        iter = iter + 1;
    end
    es = ea;
    while es >= 0.0001
        root = xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));
        fx = func(root);
        ea = abs((root-xu)/root)*100;
        es = ea;
    end
elseif nargin >= 4
    iter = 0;
    ea = 999;
    while es < ea && iter < maxiter
        if func(xl) == 0
            disp('xl is the root')
        elseif func(xu) == 0
            disp('xu is the root')
        elseif xl*xu > 0
            error('input variables must bracket the x-axis')
        else
            root = xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));
            fx = func(root);
            ea = abs((root-xu)/root)*100;
        end
        iter = iter + 1;
    end
end