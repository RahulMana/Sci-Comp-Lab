function [y,time_domain] = adam_mounton_linear1(y0,dt,t_end) 
    
%% Initialization
    time_domain = 0:dt:t_end;
    N = length(time_domain);
    y = zeros(1,N);
    y(1) = y0;
    Accuracy = 1e-5;
    num_of_iterations = 50;
    h = 1e-6;
%% Newton's method parameters
    
    for i=2:N
       y_temp = y(i-1);
        G1 = @(Y) Y - y_temp - ((dt/2)*((7*(1-(y_temp/10))*y_temp)+(7*(1-(Y/10))*y_temp))); 
        
        %d_G1 = @(Y) (G1(Y+h)-G1(Y-h))/(2*h);
        d_G1 = @(Y) 1 + ((7*dt/20)*(y_temp));
        y(i) = newton_method(G1,d_G1,y_temp,Accuracy,num_of_iterations);
    
%         R = (7*dt*y(i-1) - (7*dt*y(i-1)*y(i-1)/20) + 1)/(1 + ((7/20)*dt*y(i-1) + 1));
%         y(i) = y(i-1) * R;
        
        if isnan(y(i)) 
            fprintf("There is no convergence in AML1 for time step." + num2str(dt)+"\n");
            fprintf("These values shall not be considered henceforth for evaluation.\n");
            fprintf("==================================================================\n");
            return 
        end
    end 
end