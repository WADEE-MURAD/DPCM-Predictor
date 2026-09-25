clear all
clc
x = [10 12 15 17 18 20 21 23];
N = length(x);
sum1 = 0;
sum2 = 0;
for n = 2:N
    sum1 = sum1 + x(n)*x(n-1);
    sum2 = sum2 + x(n-1)^2;
end
a_opt = sum1/sum2;
xhat1 = zeros(1,N-1);
e1 = zeros(1,N-1);
for n = 2:N
    xhat1(n-1) = a_opt*x(n-1);
    e1(n-1) = x(n) - xhat1(n-1);
end
MSE1_full = mean(e1.^2);
disp('a_opt for first order predictor:')
disp(a_opt)
s11 = 0; s22 = 0; s12 = 0; s1 = 0; s2 = 0;
for n = 3:N
    s11 = s11 + x(n-1)^2;
    s22 = s22 + x(n-2)^2;
    s12 = s12 + x(n-1)*x(n-2);
    s1  = s1  + x(n)*x(n-1);
    s2  = s2  + x(n)*x(n-2);
end
A = [s11 s12; s12 s22];
B = [s1; s2];
coeff = A\B;
a1 = coeff(1);
a2 = coeff(2);
fprintf('a1 = %.4f , a2 = %.4f \n', a1, a2)
xhat2 = zeros(1,N-2);
e2 = zeros(1,N-2);
for n = 3:N
    xhat2(n-2) = a1*x(n-1) + a2*x(n-2);
    e2(n-2) = x(n) - xhat2(n-2);
end
MSE2 = mean(e2.^2);
xhat1_same = zeros(1,N-2);
e1_same = zeros(1,N-2);
for n = 3:N
    xhat1_same(n-2) = a_opt*x(n-1);
    e1_same(n-2) = x(n) - xhat1_same(n-2);
end
MSE1_same = mean(e1_same.^2);
fprintf('MSE first order (n=3:N) = %.4f \n', MSE1_same)
fprintf('MSE second order = %.4f \n', MSE2)
n2 = 3:N;
figure(1)
plot(n2,x(3:N),'k-o')
hold on
plot(n2,xhat1_same,'b--')
plot(n2,xhat2,'r-.')
legend('original x[n]','1st order pred','2nd order pred')
xlabel('n')
ylabel('x[n]')
title('Original vs Predicted Signal')
grid on
figure(2)
bar([MSE1_same MSE2])
set(gca,'xticklabel',{'1st order','2nd order'})
ylabel('MSE')
title('MSE Comparison')
grid on