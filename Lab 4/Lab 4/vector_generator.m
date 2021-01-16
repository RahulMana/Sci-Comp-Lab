function [b_vector,b] = vector_generator(Nx,Ny,f,x,y)
    b = zeros(Ny+2,Nx+2);
    for i=1:Ny+2
        for j = 1:Nx+2
            b(i,j) = f(x(j),y(i));
        end
    end 
    % Now we have to vectorize the matrix entries in "b"
    b_vector = zeros(Nx*Ny,1);
    for i=1:Ny
        for j = 1:Nx
            b_vector((i-1)*Nx + j) = b(i+1,j+1);
        end
    end 
end