function [y,time_domain] = adam_moulton_linear2(y0,dt,t_end) 
    
%% Initialization
    time_domain = 0:dt:t_end;
    N = length(time_domain);
    y = zeros(1,N);
    y(1) = y0;
    Accuracy = 1e-4;
    h = 1e-6;
    num_of_iterations = 50;
%% Newton's method parameters
    
    for i=2:N
        y_temp = y(i-1);
        G2 = @(Y) Y-y_temp-((dt/2)*((7*y_temp*(1- y_temp/10))+(7*Y*(1- y_temp/10))));
        %d_G2 = @(Y) (G2(Y+h)-G2(Y-h))/(2*h);
        d_G2 = @(Y) 1 - (7*dt/2)*(1 - y_temp/10);
        y(i) = newton_method(G2,d_G2,y_temp,Accuracy,num_of_iterations);
        
        if isnan(y(i)) 
            fprintf("There is no convergence in AML2 for time step." + num2str(dt)+"\n");
            fprintf("These values shall not be considered henceforth for evaluation.\n");
            fprintf("==================================================================\n");
            return 
        end
    end 
end