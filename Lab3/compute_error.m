function error = compute_error(kind,v_c,v_e,del_t,t_end) 
    % Function takes two arrays as arguments and computes the relative
    % error between the two.
    % v_c : Computed vector solution 
    % v_e : Exact vector solution 
    
    switch kind
        case 1
            if(any(isnan(v_c)) || any(isinf(v_c)))
                error = "undefined";
            else
                diff = (v_c - v_e(1:16:end)).^2;
                cumulative = (del_t/t_end)*sum(diff);
                error = sqrt(cumulative);
            end 
            
        case 2
            if(any(isnan(v_c)) || any(isinf(v_c)))
                error = "undefined";
            else
                diff = (v_c - v_e(1:8:end)).^2;
                cumulative = (del_t/t_end)*sum(diff);
                error = sqrt(cumulative);
            end
            
        case 3
            if(any(isnan(v_c))|| any(isinf(v_c)))
                error = "undefined";
            else
                diff = (v_c - v_e(1:4:end)).^2;
                cumulative = (del_t/t_end)*sum(diff);
                error = sqrt(cumulative);
            end

        case 4
            if(any(isnan(v_c))|| any(isinf(v_c)))
                error = "undefined";
            else
                diff = (v_c - v_e(1:2:end)).^2;
                cumulative = (del_t/t_end)*sum(diff);
                error = sqrt(cumulative);
            end

        case 5
            if(any(isnan(v_c))|| any(isinf(v_c)))
                error = "undefined";
            else
                diff = (v_c - v_e).^2;
                cumulative = (del_t/t_end)*sum(diff);
                error = sqrt(cumulative);
            end
    end
end