clear all
pkg load symbolic;
warning('off','all');
syms x y
f1 = (1/2)*(x^2)+ y^2+ x+(1/2)*y+3;
gradiente = gradient(f1)
x = 1
y = 1
s = eval(gradiente)