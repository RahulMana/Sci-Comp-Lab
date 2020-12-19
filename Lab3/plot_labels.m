function plot_labels(key) 
    xlim([0,5]);
    ylim([0,20]);
    legend("Exact Solution",['\deltat=',num2str(1/2),' '],['\deltat=',num2str(1/4),' '],...
        ['\deltat=',num2str(1/8),' '],['\deltat=',num2str(1/16),' '],['\deltat=',num2str(1/32),' ']);
    switch key 
        case "e_euler"
            title("Explicit Euler Method");
        case "heun"
            title("Heun's Method");
        case "i_euler"
            title("Implicit Euler Method");
        case "adam"
            title("Adam Moulton Method");
        case "adam_1"
            title("Adam Moulton Method with linearization 1");
        case "adam_2" 
            title("Adam Moulton Method with linearization 2");
    end
end