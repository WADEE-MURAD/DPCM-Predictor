clc;
clear;
close all;


n = 0:199;

x = 2*cos(0.05*pi*n) + 0.5*cos(0.2*pi*n);

N = length(x);

%======= a = a_opt  =======

a_opt = sum(x(2:end) .* x(1:end-1)) / sum(x(1:end-1).^2);

x_pred = a_opt * [NaN, x(1:end - 1)];

 e = x - x_pred;

 MSE_opt = (1/(N - 1)) * sum(abs(e(2:end)).^2);

 %========== a = 1 ===========

x_pred1 = [NaN, x(1:end - 1)];

e_1 = x - x_pred1;

MSE_1 = (1/(N - 1)) * sum(abs(e_1(2:end)).^2);


%========= print the values ============


 fprintf ("\nMSE(a_opt) = %f\n", MSE_opt);
 fprintf ("\nMSE(1) = %f\n", MSE_1)
 fprintf("\nDifference = %f\n", abs(MSE_1 - MSE_opt));




