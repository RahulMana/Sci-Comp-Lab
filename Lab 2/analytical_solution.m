function Analytical_solution(t)

% 1.  Takes in time domain as input argument and outputs the polpulation 
%     variation with respect to time.
% 2.  Plots the function p.
    func = @(t) 10./(1+ 9.*exp(-t)); 
    p = func(t);
    plot(t,p,'-r');
    hold on;
end