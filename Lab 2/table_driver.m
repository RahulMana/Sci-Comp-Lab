function table_driver()
    clear;
    methods = ["euler","heun","runge"];
    titles = ["Euler's explicit method (q=1)","Heun's method (q=2)","Runge-Kutta method (q=4)"];
    for i=1:length(methods) 
        results = ODE_tests(methods(i));
        row_names = ["δt";"error";"error red.";"error appx."];
        row_names = cellstr(row_names);
        T = table(results,'VariableNames',titles(i),'RowNames',row_names)
    end
end