function f = forcing_function()

% Dependencies: 
%     Calling   : None 
%     Called by : ODE_tests

    f = @(p) (1 - (p/10)).*p;
end