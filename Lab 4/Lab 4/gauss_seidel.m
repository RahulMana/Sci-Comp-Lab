function x = gauss_seidel(b,Nx,Ny)
% We implement a solver that takes in no input coeff matrix. 
    xdim = Ny+2;
    ydim = Nx+2;
    x = zeros(xdim,ydim);
% Since the BC are homogenous and constant we do not iterate over them. 
% Precomputing coefficients 
    kx = (Nx+1)^2;
    ky = (Ny+1)^2;
    accuracy = 1e-5;
    residual = 0.1;
    iterations = 1e5;
% We iterate over the internal nodes
    while(residual>accuracy && iterations~=0)
        for i=2:Ny+1
            for j=2:Nx+1
                x(i,j) = (-1/(2*(kx+ky)))*(b(i,j) - x(i+1,j)*ky - x(i-1,j)*ky - ...
                            x(i,j+1)*kx - x(i,j-1)*kx);
            end
        end
        for i = 2:Ny+1
            for j = 2:Nx+1
                residual = residual + (b(i,j) - kx*x(i+1,j) - kx*x(i-1,j) +...
                             2*(kx+ky)*x(i,j) - ky*x(i,j+1) - ky*x(i,j-1))^2;
            end
        end
        residual = sqrt(residual/(Nx*Ny));
        iterations = iterations - 1;
    end
    x = x(2:end-1,2:end-1);
end
