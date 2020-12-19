

function [y,time_domain] = implicit_euler(fy,der_fy,y0,dt,t_end) 
    
%% Initialization
    time_domain = 0:dt:t_end;
    N = length(time_domain);
    y = zeros(1,N);
    y(1) = y0;
    Accuracy = 1e-4;
    num_of_iterations = 50;
%% Newton's method parameters
    d_G = @(Y) 1 - (dt*der_fy(Y));
    for i=2:N
        G = @(Y) Y - y(i-1) - dt*fy(Y);
        initial_guess = y(i-1);
        y(i) = newton_method(G,d_G,initial_guess,Accuracy,num_of_iterations);
        
        if isnan(y(i)) 
            fprintf("There is no convergence in IE for time step = "+num2str(dt)+"\n");
            fprintf("These values shall not be considered henceforth for evaluation.\n");
            fprintf("==================================================================\n");
            return 
        end
    end 
end