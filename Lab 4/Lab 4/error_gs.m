function error = error_gs(y_computed,y_actual,Nx,Ny)
    error = 0;
    for i=1:Ny+2
        for j=1:Nx+2
            error = error + (y_computed(i,j)-y_actual(i,j))^2;
        end
    end
    error = sqrt(error/(Nx*Ny));
end