function facile_plot(x,y,y1,y2,y3,y4,Nx,Ny,kind)
[R1,R2] = meshgrid(x,y);

switch kind
    case "surface"
        figure("Name",["Temperature distribution Surface Plot - Simulation" + num2str(1)],"Units","normalized","PaperSize",[500,500])
        subplot(2,2,1);
        surf(R1,R2,y1); title(["Gauss Seidel for Nx=" + num2str(Nx) + " Ny=" + num2str(Ny)]); xlabel("x");ylabel("y");zlabel("T");zlim([0,1]);hold on;
        subplot(2,2,2);
        surf(R1,R2,y2); title(["Sparse matrix for Nx=" + num2str(Nx) + " Ny=" + num2str(Ny)]); xlabel("x");ylabel("y");zlabel("T");zlim([0,1]);hold on;
        subplot(2,2,3);
        surf(R1,R2,y3); title(["Dense Matrix for Nx=" + num2str(Nx) + " Ny=" + num2str(Ny)]); xlabel("x");ylabel("y");zlabel("T");zlim([0,1]);hold on;
        subplot(2,2,4);
        surf(R1,R2,y4);title(["Analytical for Nx=" + num2str(Nx) + " Ny=" + num2str(Ny)]); xlabel("x");ylabel("y");zlabel("T");zlim([0,1]); hold on;
    case "contour"
        figure("Name",["Temperature distribution Contour Plot - Simulation" + num2str(1)],"Units","normalized","PaperSize",[100,100])
        subplot(2,2,1);
        contour(R1,R2,y1); title(["Gauss Seidel for Nx=" + num2str(Nx) + " Ny=" + num2str(Ny)]); xlabel("x");ylabel("y");zlabel("T");zlim([0,1]);hold on;
        subplot(2,2,2);
        contour(R1,R2,y2); title(["Sparse matrix for Nx=" + num2str(Nx) + " Ny=" + num2str(Ny)]); xlabel("x");ylabel("y");zlabel("T");zlim([0,1]);hold on;
        subplot(2,2,3);
        contour(R1,R2,y3); title(["Dense Matrix for Nx=" + num2str(Nx) + " Ny=" + num2str(Ny)]); xlabel("x");ylabel("y");zlabel("T");zlim([0,1]);hold on;
        subplot(2,2,4);
        contour(R1,R2,y4);title(["Analytical for Nx=" + num2str(Nx) + " Ny=" + num2str(Ny)]); xlabel("x");ylabel("y");zlabel("T");zlim([0,1]); hold on;
        
end
end