clear;clc;
f = @(x) x^3 + 5*(x^2) + 4*x + 6;          #Funcion a optimizar
x = -2:0.1:2;
xm = -0.4621;
fm = 5.1206;
plot( x, arrayfun(f,x),'k','linewidth',1.1 );
hold on;
    plot(xm,fm,'r+','linewidth',2);
hold off;