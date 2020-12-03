function T = ODE_tests(method)

    f = forcing_function();
    f_sol = actual_solution();
    t_end = 7;
    y0 = 1;
    
    dt = [1,1/2,1/4,1/8];
    errors = zeros(1,length(dt));
    error_appx = zeros(1,length(dt));
    
    switch method 
        case "euler"
            y_best = explicit_euler(f,y0,dt(end),t_end); 
            for i=1:length(dt)
                % Our solutions 
                [y,time] = explicit_euler(f,y0,dt(i),t_end);
                y_actual = f_sol(time);
                errors(i) = compute_error(4,y,y_actual,dt(i),t_end);
                error_appx(i) = compute_error(i,y,y_best,dt(i),t_end);
                
                % Comparison plot 
                fig = subplot(4,1,i);
                plot(time,y_actual,'r');
                hold on;
                plot(time,y,"b");
                grid on;
                legend("analytical","euler");
                title(['\deltat = ',num2str(dt(i)),'']);
            end
            suptitle("Explicit Euler Method");
            saveas(fig,method+".png");
 
           case "heun"
            y_best = heun(f,y0,dt(end),t_end);
            for i=1:length(dt)
                % Our solutions 
                [y,time] = heun(f,y0,dt(i),t_end);
                y_actual = f_sol(time); 
                errors(i) = compute_error(4,y,y_actual,dt(i),t_end);
                error_appx(i) = compute_error(i,y,y_best,dt(i),t_end);
                % Comparison plot 
                fig = subplot(4,1,i);
                plot(time,y_actual,'r');
                hold on;
                plot(time,y,"b");
                grid on;
                legend("analytical","heun");
                title(['\deltat = ',num2str(dt(i)),'']);
            end
            suptitle("Heun's Method");
            saveas(fig, method+".png");
            
            case "runge"
            y_best = explicit_runge(f,y0,dt(end),t_end);
            for i=1:length(dt)
                % Our solutions 
                [y,time] = explicit_runge(f,y0,dt(i),t_end);
                y_actual = f_sol(time); 
                errors(i) = compute_error(4,y,y_actual,dt(i),t_end);
                error_appx(i) = compute_error(i,y,y_best,dt(i),t_end);
                % Comparison plot 
                fig = subplot(4,1,i);
                plot(time,y_actual,'r');
                hold on;
                plot(time,y,"b");
                grid on;
                legend("analytical","runge");
                title(['\deltat = ',num2str(dt(i)),'']);
            end
            suptitle("Explicit Runge Kutta Method");
            saveas(fig, method+".png");
    end
    reduced_fraction = errors./(errors(1));
    T = [dt;errors;reduced_fraction;error_appx];
end