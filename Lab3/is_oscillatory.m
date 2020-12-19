function out = is_oscillatory(y,threshold)
    out = false;
    for i=1:length(y)-2
       if (sign(y(i)) ~= sign(y(i+1))) && (sign(y(i+1)) ~= sign(y(i+2)) && abs(y(i+1)-y(i))>threshold)
           out = true;
       end
    end
end