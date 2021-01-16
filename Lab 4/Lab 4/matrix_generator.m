function A = matrix_generator(Nx,Ny)
%---------------------------------------------
% Generates coeffiecient matrix for 2D steady state heat equation. 
% Nx : Number of internal points in x direction
% Ny : Number of internal points in y direction 
%---------------------------------------------
    assert(Nx>1&&Ny>1);
    dimension = Nx*Ny;
    kx = (Nx+1)^2;
    ky = (Ny+1)^2;
    A = zeros(dimension);
    for i=1:dimension
       A(i,i) = -2*(kx + ky);
       if(mod(i,Nx)==1)
          A(i,i+1) = kx; 
       elseif(mod(i,Nx)==0)
           A(i,i-1) = kx;
       else
           A(i,i+1) = kx;
           A(i,i-1) = kx;
       end
       for j=1:dimension-Nx
          A(j,j+Nx) = ky;
          A(j+Nx,j) = ky;
       end
    end
end