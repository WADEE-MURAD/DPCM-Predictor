clear;
clc;
close all;

n = 0:199;

x = 2*cos(0.05*pi*n) + 0.5*cos(0.2*pi*n);

%========= D1 =============

figure;
stem(n(1:61), x(1:61), "filled", "MarkerSize", 3, "LineWidth", 2);
title("First 60 samples of x[n]");
xlabel("Sample index (n)");
ylabel("Amplitude");
grid on;

%========= D2 =============

x_pred = [NaN, x(1:end - 1)];  
% we set the first prediction blank (NaN) because x[-1] is undefined

figure;
stem(n(1:61), x(1:61), "filled", "LineWidth", 1.5, "MarkerSize",3);
hold on
stem(n(1:61), x_pred(1:61), "filled", "LineWidth", 1.5, "MarkerSize",3);

title("x[n] and x_pred[n]")
xlabel("Sample index (n)");
ylabel("Amplitude");
legend("x[n]", "x_pred[n]")
grid on;



% error generation 
e = x - x_pred;

figure;
stem(n(1:61), e(1:61), "filled", "MarkerSize", 3, "LineWidth", 1.5);
title("error[n]");
xlabel("Sample index (n)");
ylabel("Amplitude");
grid on;


%========= D3 =============

N = length(x);

Px = (1/N) * sum(abs(x).^2);
Pe = (1/(N - 1)) * sum(abs(e(2:end)).^2);

Gp = Px/Pe;

Gp_db = 10 * log10(Gp);


%print the results


fprintf("Px = %f\n", Px);
fprintf("Pe = %f\n", Pe);
fprintf("Gp = %f\n", Gp);
fprintf("Gp(db) = %f\n", Gp_db);

