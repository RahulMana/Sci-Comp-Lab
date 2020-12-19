function stability_criteria(i,method,y_computed)
global Stability
        if(any(isnan(y_computed)) || any(isinf(y_computed)) || is_oscillatory(y_computed,3))
            switch method 
                case "e_euler"
                    Stability(i,1) = "Unstable";
                case "heun"
                    Stability(i,2) = "Unstable";
                case "i_euler"
                    Stability(i,3) = "Unstable";
                case "adam"
                    Stability(i,4) = "Unstable";
                case "adam1"
                    Stability(i,5) = "Unstable";
                case"adam2"
                    Stability(i,6) = "Unstable";
            end
            
        end
end
        