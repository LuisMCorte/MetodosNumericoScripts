% Autores: Pablo Bermeo
%          Luis Corte
%          Sebastian Criollo
%
% Fecha: 20/10/2021
% Descripcion: Diferenciacion
% 

% Problema 1:
%   
#{
Use aproximaciones con diferencias finitas hacia adelante y hacia atras y
centrales y una aproximación O(h^2) para estimar la segunda derivada de:

              f(x) = 5*5*e.^(2.3*x)
#}
fprintf('Problema 1 \n')

%Datos:
f = @(x) 5*e.^(2.3*x);
f2 = @(x) 26.45*e.^(2.3*x);
x = 1.25;
h = 0.2;
valuer = 469.83;

try
  
  %Llamado de la función
  [f_f1,Forward,errorF,f_b1,Backward,errorB,f_c1,Centered,errorC] = second_diff(f,h,x,valuer)
  
  %Intervalo para graficar
  x0 = -4:0.1:2;
  
  %Grafico
  figure(1);
  plot(x0, f(x0),"linewidth",3,x0,f2(x0),"--","linewidth",3);
  title('Problema 1','FontSize',20)
  legend('Function','Second Derivative','Location','northwest','FontSize',26)
  xlabel('x','FontSize',15)
  ylabel('f(x)','FontSize',15)
  
  %Aproxicimaciones en el punto 'x'
  
  %Forward
  str1 = num2str("O Forward" ,1.25);
  text(1.25,Forward,str1 ,'Color','red','FontSize',20)
  
  %Backward
   str1 = num2str("O Backward" ,1.25);
  text(1.25,Backward,str1 ,'Color','blue','FontSize',20)
  
  %Centered
  str1 = num2str("O Centered" ,1.25);
  text(1.25,Centered,str1 ,'Color','yellow','FontSize',20)

catch err
  fprintf('Error: %s\n',err.message);
end_try_catch 


clear;
fprintf('\n')
fprintf('\n')
fprintf('Problema 2 \n')
%-----------------------------------------------------------------------------------------------------

% Problema 2:
%   
#{
Use aproximaciones con diferencias finitas nacia adelante y hacia atras y
centrales y una aproximación O(h^2) para estimar la segunda derivada de:

              f(x) = -0.1*x.^4 - 0.15*x.^3 - 0.5*x.^2 - 0.25*x + 1.2
#}

%Datos:
f = @(x) -0.1*x.^4 - 0.15*x.^3 - 0.5*x.^2 - 0.25*x + 1.2;
f2 = @(x) -1.2*x.^2 - 0.9*x - 1;
x = 0.5;
h = 0.25;
valuer = -1.70;

try
  
  %Llamado de la función
  [f_f1,Forward,errorF,f_b1,Backward,errorB,f_c1,Centered,errorC] = second_diff(f,h,x,valuer)
  
  %Intervalo para graficar
  x0 = -2:0.1:2;
  
  %Grafico
  figure(2);
  plot(x0, f(x0),"linewidth",3,x0,f2(x0),"--","linewidth",3);
  title('Problema 2','FontSize',20)
  legend('Function','Second Derivative','Location','northwest','FontSize',26)
  xlabel('x','FontSize',15)
  ylabel('f(x)','FontSize',15)
  
   %Aproxicimaciones en el punto 'x'
  
  %Forward
  str1 = num2str("O Forward" ,0.5);
  text(0.5,Forward,str1 ,'Color','red','FontSize',10)
  
  %Backward
   str1 = num2str("O Backward" ,0.5);
  text(0.5,Backward,str1 ,'Color','blue','FontSize',10)
  
  %Centered
  str1 = num2str("O Centered" ,0.5);
  text(0.5,Centered,str1 ,'Color','yellow','FontSize',10)

catch err
  fprintf('Error: %s\n',err.message);
end_try_catch 

