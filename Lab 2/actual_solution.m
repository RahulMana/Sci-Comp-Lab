function f = actual_solution()

% Dependencies: 
%     Calling   : None 
%     Called by : ODE_tests

    f = @(t) 10./(1+ 9.*exp(-t));
end