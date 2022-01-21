
pkg load symbolic;
warning('off','all');
syms x;
f = @(x) -2*x^3+12*x^2-20*x+8.5
deriv = diff(f(x))
  
  