% Autores: Pablo Bermeo
%          Luis Corte
%          Pablo Cardenas
%          Sebastian Criollo
%
% Fecha: 20/10/2021
% Descripcion: Emplear el metodo de Gauss para la solucion de
% sistemas de ecuacioneslineales.


% Problema 1:
%   
#{
Un problema común en ingeniería eléctrica consiste en determinar las corrientes 
y voltajes en un circuito resistivo. Para su solución se usan las Leyes de
Kirchoff de voltajes y corrientes, cuya aplicación resulta en sistemas de 
ecuaciones lineales algebraicas, siendo las variables desconocidas las corrientes
Para el presente trabajo, solucionar el circuito de la figura 3.1:
#}


%Datos:
%Matriz de Coeficientes y vector independiente

fprintf('Matriz y vector a resolver(Matriz Aumentada)\n')
A = [0.7460, -0.4516, 0.0100, -0.0080, 0.0100, -0.0080;
    0.4516, 0.7460, 0.0080, 0.0100, 0.0080, 0.0100;
    0.0100, -0.0080, 0.7787, -0.5205, 0.0100, -0.0080;
    0.0080, 0.0100, 0.5205, 0.7787, 0.0080, 0.0100;
    0.0100, -0.0080, 0.0100, -0.0080, 0.8080, -0.6040;
    0.0080, 0.0100, 0.0080, 0.0100, 0.6040, 0.8080]
b = [120;0.00;-60.00;-103.9;-60.00;103.9]

%LLamado de la funcion eliminacion para obtener la matriz triangular inferior
fprintf('Matriz triangular inferior\n')

try
  [A,b] = gausspivote(A,b)

  %Matriz triangular inferior y vector independiente
  An = A;
  bn = b;

  %LLamado de la funcion sustitucion para obtener los valores de respuesta
  fprintf('Los valores de [I1 I2 ... I6] respectivamente son:\n')
  [x] = sustitucion(An,bn)
  
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch 

  
  









 

  