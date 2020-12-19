%% Newton's method for root finding 

function Y = newton_method(G,der_G,y_initial,accuracy,iterations)
    y_prev = y_initial;
    error = 100; % Arbitrarily large initial value of error
    n = 0;
    while(error>accuracy)
       if(n<=iterations && der_G(y_prev)~=0)
            y_next = y_prev - (G(y_prev)/der_G(y_prev));
            error = abs(y_next - y_prev);
            y_prev = y_next;
            n = n+1;
       else 
           y_next = NaN;
           break;
       end
    end
    Y = y_next;
end