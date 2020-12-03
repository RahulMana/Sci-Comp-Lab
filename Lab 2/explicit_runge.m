function [y,time_domain] = explicit_runge(yf,y0,del_t,t_end)
%========================================================================
% t     - is the independent variable of the ODE.
% y     - is the dependent variable of the ODE.
% fy    - is the governing function whose value depends upon y (and t).
% N     - number of points in the time domain 
% del_t - is the time inrement
%========================================================================
    time_domain = 0:del_t:t_end;
    N = length(time_domain);
    y = zeros(1,N);
    y(1) = y0;
    for i=2:N 
       R1 = yf(y(i-1));
       R2 = yf(y(i-1) + 0.5*del_t*R1);
       R3 = yf(y(i-1) + 0.5*del_t*R2);
       R4 = yf(y(i-1) + del_t*R3);
       y(i) = y(i-1) + (del_t/6)*(R1 + 2*R2 + 2*R3 + R4);
    end
end