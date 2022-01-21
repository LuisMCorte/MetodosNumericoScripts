clear all
% Autores: Pablo Bermeo
%          Luis Corte
%          Sebastian Criollo
%
% Fecha: 18/11/2021
% Descripcion: Emplear los splines cuadraticos


% Problema 1:
%   
#{
Los termistores se utilizan para medir la temperatura de los cuerpos. Los termistores se basan en
cambio de resistencia de los materiales con la temperatura. Para medir la temperatura, los fabricantes
proporcionarle una curva de calibración de temperatura frente a resistencia. Si mide la resistencia,
puedes encontrar la temperatura. Un fabricante de termistores hace varias observaciones con
un termistor
#}


%Datos:
%Matriz de coeficientes y vector independiente
 
 x=[0.1,0.2,0.5,1,2,5,10];
 y=[10,5,2,1,0.5,0.2,0.1];
try
  [Splines,n,h] = SplineCubico(x,y);
  Splines
  figure(1)
  for i=1:n-1
    t(i,:)=x(i):0.01*h(i):x(i+1);
    p(i,:)=Splines(i,1).*(t(i,:).^3)+Splines(i,2).*(t(i,:).^2)+Splines(i,3).*t(i,:)+Splines(i,4);
    plot(t(i,:),p(i,:),'k')
    grid on 
    hold on
  end
plot(x,y,'o')
end_try_catch

fprintf('-------------------------------------------------------------------\n')
% Problema 2:
%   
#{
Los termistores se utilizan para medir la temperatura de los cuerpos. Los termistores se basan en
cambio de resistencia de los materiales con la temperatura. Para medir la temperatura, los fabricantes
proporcionarle una curva de calibración de temperatura frente a resistencia. Si mide la resistencia,
puedes encontrar la temperatura. Un fabricante de termistores hace varias observaciones con
un termistor
#}


%Datos:
%Matriz de coeficientes y vector independiente
 x=[0,1,2,2.5,3,4];
 y=[1.4,0.6,1,0.65,0.6,1];
try
  [Splines,n,h] = SplineCubico(x,y);
  Splines
  figure(2)
  for i=1:n-1
    t(i,:)=x(i):0.01*h(i):x(i+1);
    p(i,:)=Splines(i,1).*(t(i,:).^3)+Splines(i,2).*(t(i,:).^2)+Splines(i,3).*t(i,:)+Splines(i,4);
    plot(t(i,:),p(i,:),'k')
    grid on 
    hold on
  end
plot(x,y,'o')
end_try_catch