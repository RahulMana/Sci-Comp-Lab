function y = make_plottable(Nx,Ny,x,kind)
    y = zeros(Ny+2,Nx+2);
    y(1,:) = 0; y(Ny+2,:)=0;
    y(:,1) = 0; y(:,Nx+2) = 0;
    switch kind
        case "v->m"
            for i=2:Ny+1
                for j=2:Nx+1
                    y(i,j) = x((i-2)*Nx+(j-1));
                end
            end
        case "m->m"
            y(2:end-1,2:end-1) = x;
    end
end