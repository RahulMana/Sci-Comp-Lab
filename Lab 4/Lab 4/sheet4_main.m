clear;
clc;
close all;
%% Forcing Function
f = @(x,y) -2*pi^2*sin(pi*x)*sin(pi*y);
%% Parameters 
% Nx and Ny denote the number of sub intervals 
Nx = [7,15,31,63,127];
Ny = [7,15,31,63,127];
runtime_gauss = zeros(1,5);
runtime_direct = zeros(1,5);
runtime_sparse = zeros(1,5);
storage_gauss = zeros(1,5);
storage_direct = zeros(1,5);
storage_sparse = zeros(1,5);
gauss_error = zeros(1,5);
%% Experiments 
for i=1:length(Nx)
    hx = 1/(Nx(i)+1);
    hy = 1/(Ny(i)+1);
    %% Domain of Interest 
    x = 0:hx:1;
    y = 0:hy:1;
    %% Analytical solution of 2D Steady state HE 
    f_solution = @(x,y) sin(pi*x)*sin(pi*y);
    y_analytical = zeros(length(x),length(y));
    for j=1:length(y)
        for k=1:length(x)
            y_analytical(j,k) = f_solution(x(k),y(j));
        end
    end
    %% Linear System for Direct Solver 
    tic;
    A = matrix_generator(Nx(i),Ny(i));
    b_vector = vector_generator(Nx(i),Ny(i),f,x,y);
    y_direct = A\b_vector;
    y_direct = make_plottable(Nx(i),Ny(i),y_direct,"v->m");
    runtime_direct(i) = toc;
    storage_direct(i) = storage(A,b_vector,y_direct);
    %% Linear System for Sparse Solver 
    tic;
    A_sparse = sparse_matrix_generator(Nx(i),Ny(i));
    bs_vector = vector_generator(Nx(i),Ny(i),f,x,y);
    y_sparse = A_sparse\bs_vector;
    y_sparse = make_plottable(Nx(i),Ny(i),y_sparse,"v->m");
    runtime_sparse(i) = toc;
    storage_sparse(i) = storage(A_sparse,bs_vector,y_sparse);
    %% Gauss Seidel Solver
    tic;
    [bg_vector,b_g] = vector_generator(Nx(i),Ny(i),f,x,y);
    y_gauss = gauss_seidel(b_g,Nx(i),Ny(i));
    y_gauss = make_plottable(Nx(i),Ny(i),y_gauss,"m->m");
    runtime_gauss(i) = toc;
    storage_gauss(i) = storage(bg_vector,b_g,y_gauss);
    gauss_error(i) = error_gs(y_gauss,y_analytical,Nx(i),Ny(i));
    %% Plot Solutions     
    facile_plot(x,y,y_gauss,y_sparse,y_direct,y_analytical,Nx(i),Ny(i),"surface");
    facile_plot(x,y,y_gauss,y_sparse,y_direct,y_analytical,Nx(i),Ny(i),"contour");
end

%% Error Analysis and Tables 
reduction_factor = [nan gauss_error(1:end-1)./gauss_error(2:end)];
T1 = [Nx;runtime_gauss;storage_gauss];
T2 = [Nx;runtime_direct;storage_direct];
T3 = [Nx;runtime_sparse;storage_sparse];
T4 = [Nx;gauss_error;reduction_factor];
table(T1,'RowNames',["Nx Ny","runtime","storage"],'VariableNames',"Gauss Seidel")
table(T2,'RowNames',["Nx Ny","runtime","storage"],'VariableNames',"Direct Solver")
table(T3,'RowNames',["Nx Ny","runtime","storage"],'VariableNames',"Sparse Solver")
table(T4,'RowNames',["Nx Ny","error","error red."],'VariableNames',"Error Analysis")