clc;
clear;
close all;

n = 0:199;

x = 2*cos(0.05*pi*n) + 0.5*cos(0.2*pi*n);

N = length(x);

%====  Calculate MSE for each value of a ========

a = [0, 0.5, 0.8, 1, 1.2];

MSE = [0, 0, 0, 0, 0];


for i = 1:length(a)

    x_pred = a(i) * [NaN, x(1:end-1)];

    e = x - x_pred;

    MSE(i) = (1/(N - 1)) * sum(abs(e(2:end)).^2);

end

% ===== plotting MSE vs a ===========

figure;
stem(a, MSE, "filled", "MarkerSize", 3, "LineWidth", 2);
title("MSE vs a");
xlabel("a");
ylabel("MSE");
grid on;


%========== print values of MSE ==========

for i = 1:length(a)

   fprintf("\nMSE(%g) = %f\n", a(i), MSE(i));
end