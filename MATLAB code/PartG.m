clc;
clear;
close all;


n = 0:199;




% ========== Generation of 1st signal ============


x = 2*cos(0.05*pi*n) + 0.5*cos(0.2*pi*n);

x_pred = [NaN, x(1:end - 1)];  

e = x - x_pred;


% plot

subplot(211);
stem(n(1:61), e(1:61), "filled", "MarkerSize", 3, "LineWidth", 1.5);
title("e1[n]");
xlabel("Sample index (n)");
ylabel("Amplitude");
ylim([-3.5, 3.5])
grid on;

% calulate Gp

N = length(x);

Px = (1/N) * sum(abs(x).^2);
Pe = (1/(N - 1)) * sum(abs(e(2:end)).^2);

Gp = Px/Pe;

Gp_db = 10 * log10(Gp);


% print result

fprintf("First Signal:\n");
fprintf("Gp = %f\n", Gp);
fprintf("Gp(dB) = %f\n", Gp_db);



% ========== Generation of 2nd signal ============

x2 = 2*cos(0.6*pi*n);

x2_pred = [NaN, x2(1:end-1)];

e2 = x2 - x2_pred;


%plot

 subplot(212);
 stem(n(1:61), e2(1:61), "filled", "MarkerSize", 3, "LineWidth",2)
 title("e2[n]");
 xlabel("Sample index (n)");
 ylabel("Amplitude");
 ylim([-3.5, 3.5])
 grid on;


 % calculate Gp

 Px2 = (1/N) * sum(abs(x2).^2);
 Pe2 = (1/(N - 1)) * sum(abs(e2(2:end)).^2);

 Gp2 = Px2/Pe2;

 Gp2_db = 10 * log10(Gp2);


 % print result

 fprintf("\nSecond Signal:\n");
 fprintf("Gp = %f\n", Gp2);
 fprintf("Gp(dB) = %f\n", Gp2_db);