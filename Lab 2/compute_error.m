function error = compute_error(kind,v_c,v_e,del_t,t_end) 
    % Function takes two arrays as arguments and computes the relative
    % error between the two.
    % v_c : Computed vector solution 
    % v_e : Exact vector solution 
    
    switch kind 
        case 4
            diff = (v_c - v_e).^2;
            cumulative = (del_t/t_end)*sum(diff);
            error = sqrt(cumulative);
        case 1
            diff = (v_c - v_e(1:8:end)).^2;
            cumulative = (del_t/t_end)*sum(diff);
            error = sqrt(cumulative);
            
        case 2
            diff = (v_c - v_e(1:4:end)).^2;
            cumulative = (del_t/t_end)*sum(diff);
            error = sqrt(cumulative);
            
        case 3
            diff = (v_c - v_e(1:2:end)).^2;
            cumulative = (del_t/t_end)*sum(diff);
            error = sqrt(cumulative); 
    end
end