%% Solutions to Exercise 
close all;
clear;
%% Given Parameters
%==========================================================================
f = @(t) 200*(1./(20 - 10*exp(-7*t))); 
t_end = 5;
t = 0:1/32:t_end;
p_A = f(t);
syms p;
forcing_function = @(p) 7*(1 - (p/10))*p;
deriv_forcing_function = matlabFunction(diff(forcing_function,p));
% Initial condition and other parameters 
p0 = 20;
% Time steps 
dt = [1/2,1/4,1/8,1/16,1/32];

% Stability matrix 
global Stability 
titles = ["Explicit Euler","Heun","Implicit Euler","Adams Moulton","Adams Moulton-linearlization 1","Adams Moulton-linearlization 2"];
Stability = strings(5,6);
%Stability(1,:) = titles;
Stability(:,:) = "Stable";
%% Analytical solution

% Plot function
figure
plot(t,p_A,"-k");
hold on;
xlim([0,5]);
ylim([0,20]);
legend("Exact Solution");
title("Exact Solution");

%% Explicit Euler Method

figure
plot(t,p_A);
hold on;
data_eu = [];
error_e_eu = zeros(1,length(dt));
for i=1:length(dt)
   [y,time_domain] = explicit_euler(forcing_function,p0,dt(i),t_end);
   data_eu = [data_eu y];
   error_e_eu(i) = compute_error(i,y,p_A,dt(i),t_end);
   stability_criteria(i,"e_euler",y);
   plot(time_domain,y,"--")
   hold on;
end
plot_labels("e_euler");
eu_error_reduction = error_e_eu(1:end-1)./error_e_eu(2:end);
e_eu_table = [dt;error_e_eu;[NaN eu_error_reduction]];

%% Heun Method 

figure
plot(t,p_A);
hold on;
data_e_heu = [];
error_e_heu = zeros(1,length(dt));
for i=1:length(dt)
   [y,time_domain] = heun(forcing_function,p0,dt(i),t_end);
   data_e_heu = [data_e_heu y];
   error_e_heu(i) = compute_error(i,y,p_A,dt(i),t_end);
   stability_criteria(i,"heun",y);
   plot(time_domain,y,"--")
   hold on;
end
plot_labels("heun");
e_heu_error_reduction = error_e_heu(1:end-1)./ error_e_heu(2:end);
e_heu_table = [dt;error_e_heu;[NaN e_heu_error_reduction]];

%% Implicit Euler Method 

figure
plot(t,p_A);
hold on;
data_ieu =[];
error_i_eu = zeros(1,length(dt));
for i=1:length(dt)
   [y,time_domain] = implicit_euler(forcing_function,deriv_forcing_function,p0,dt(i),t_end);
   data_ieu = [data_ieu y];
   error_i_eu(i) = compute_error(i,y,p_A,dt(i),t_end);
   stability_criteria(i,"i_euler",y)
   plot(time_domain,y,"--")
   hold on;
end
plot_labels("i_euler");
i_eu_error_reduction = error_i_eu(1:end-1)./error_i_eu(2:end);
i_eu_table = [dt;error_i_eu;[NaN i_eu_error_reduction]];

%% Adam Moulton method

figure
plot(t,p_A);
hold on;
data_am = [];
error_am = zeros(1,length(dt));
for i=1:length(dt)
   [y,time_domain] = adam_moulton(forcing_function,deriv_forcing_function,p0,dt(i),t_end);
   data_am = [ data_am y];
   error_am(i) = compute_error(i,y,p_A,dt(i),t_end);
   stability_criteria(i,"adam",y)
   plot(time_domain,y,"--")
   hold on;
end
plot_labels("adam");
am_error_reduction = error_am(1:end-1)./error_am(2:end);
am_table = [dt; error_am;[NaN am_error_reduction]];

%% Linearized AM 1 method 

figure
plot(t,p_A);
hold on;
data_am1 =[];
error_am1 = zeros(1,length(dt));
for i=1:length(dt)
   [y,time_domain] = adam_mounton_linear1(p0,dt(i),t_end);
   data_am1 = [data_am1 y];
   error_am1(i) = compute_error(i,y,p_A,dt(i),t_end);
   stability_criteria(i,"adam1",y)
   plot(time_domain,y,"--")
   hold on;
end
plot_labels("adam_1");
am_1_error_reduction = error_am1(1:end-1)./error_am1(2:end);
am_1_table = [dt; error_am1;[NaN am_1_error_reduction]];

%% Linearized AM 2 method
data_am2 = [];
figure
plot(t,p_A);
hold on;
error_am2 = zeros(1,length(dt));
for i=1:length(dt)
   [y,time_domain] = adam_mounton_linear2(p0,dt(i),t_end);
   data_am2 = [data_am2 y];
   error_am2(i) = compute_error(i,y,p_A,dt(i),t_end);
   stability_criteria(i,"adam2",y)
   plot(time_domain,y,"--")
   hold on;
end
plot_labels("adam_2");
am_2_error_reduction = error_am2(1:end-1)./error_am2(2:end);
am_2_table = [dt; error_am2;[NaN am_2_error_reduction]];

%% Tables 

titles = ["Explicit Euler","Heun","Implicit Euler","Adams Moulton","Adams Moulton-linearlization 1","Adams Moulton-linearlization 2"];
row_names = ["δt","error","error reduction"];
T1 = table(e_eu_table,'VariableNames',titles(1),'RowNames',row_names)
T2 = table(e_heu_table,'VariableNames',titles(2),'RowNames',row_names)
T3 = table(i_eu_table,'VariableNames',titles(3),'RowNames',row_names)
T4 = table(am_table,'VariableNames',titles(4),'RowNames',row_names)
T5 = table(am_1_table,'VariableNames',titles(5),'RowNames',row_names)
T6 = table(am_2_table,'VariableNames',titles(6),'RowNames',row_names)
T7 = array2table(Stability,'VariableNames',["Explicit Euler","Heun","Implicit Euler","Adams Moulton","Adams Moulton-linearlization 1","Adams Moulton-linearlization 2"],'RowNames',["δt = 0.5","δt = 0.25","δt = 0.125","δt = 0.0625","δt = 0.0325"])