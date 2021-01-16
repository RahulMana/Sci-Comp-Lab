function A = sparse_matrix_generator(Nx,Ny)
    assert(Nx>1&&Ny>1);
    kx = (Nx+1)^2;
    ky = (Ny+1)^2;
    list = zeros(1,Nx*Ny - 1);
    for i = 1:length(list)
        if(mod(i,Nx)==0) 
            list(i) = 0;
        else
            list(i) = kx;
        end
    end
    far_off = ky*ones(1,Nx*Ny-Nx);
    A = -2*(kx+ky)*eye(Nx*Ny) + diag(far_off,Nx) + ...
            diag(far_off,-Nx) + diag(list,1) + diag(list,-1);
    A = sparse(A);
end