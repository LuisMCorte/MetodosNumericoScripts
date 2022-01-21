% Autores: Pablo Bermeo
%          Luis Corte
%          Pablo Cardenas
%          Sebastian Criollo
%
% Fecha: 23/10/2021
% Descripcion: Emplear el metodo de descomposicion LU para la solucion de
% sistemas de ecuaciones lineales.


% Problema 1:
%   
#{
Un problema común en ingeniería eléctrica consiste en determinar las corrientes 
y voltajes en un circuito resistivo. Para su solución se usan las Leyes de
Kirchoff de voltajes y corrientes, cuya aplicación resulta en sistemas de 
ecuaciones lineales algebraicas, siendo las variables desconocidas las corrientes.
#}
matrix = [55,-20,0,0;
          -20,55,25,0;
          0,-25,37,-4;
         -25,0,-4,29];

b = [0;-10;0;100];

try

  [L,U,vals_aux,resps] = DLU(matrix,b);

  %************* Mostrar resultados*********************

  fprintf('Dada la matriz:\n');
  disp(matrix);

  fprintf('Con coeficientes:\n');
  disp(b);

  fprintf('Es obtenida la matriz U:\n');
  disp(U);

  fprintf('y la matriz L:\n')
  disp(L);

  fprintf('Luego de resolver L|b, los valores auxiliares son:\n');
  disp(vals_aux);

  fprintf('Luego de resolver U|vals_aux, son obtenidas las respuestas:\n');
  disp(resps);
  
catch error
  fprintf('Error: %s\n',err.message);
end_try_catch


fprintf('-------------------------------------------------------------------\n')
% Problema 2:
%   
#{
Luego de aplicar el metodo de nodos en un circuito electrico, se ha generado un
sistema de ecuaciones. Los coeficientes de las variables se encuentran 
en la matriz A y los valores libres estan en el vector b. Calcule los valores
de voltaje en cada nodo.
#}


%Datos:
%Matriz de Coeficientes y vector independiente
matrix = [0.14, -0.005, 0, 0;
     -0.005, 0.012, -0.005, 0;
     0, -0.005, 0.007, -0.001;
     0, 0,  -0.001, 0.002
      ];

b = [2;0;0;0];

try

  [L,U,vals_aux,resps] = DLU(matrix,b);

  %************* Mostrar resultados*********************

  fprintf('Dada la matriz:\n');
  disp(matrix);

  fprintf('Con coeficientes:\n');
  disp(b);

  fprintf('Es obtenida la matriz U:\n');
  disp(U);

  fprintf('y la matriz L:\n')
  disp(L);

  fprintf('Luego de resolver L|b, los valores auxiliares son:\n');
  disp(vals_aux);

  fprintf('Luego de resolver U|vals_aux, son obtenidas las respuestas:\n');
  disp(resps);
  
catch error
  fprintf('Error: %s\n',err.message);
end_try_catch