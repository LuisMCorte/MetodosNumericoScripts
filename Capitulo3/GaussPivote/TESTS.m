clear;
%El sistema de GaussPivot no registra un valor de tolerancia o error

%===========================================================
%                      Problema 1
%===========================================================
#{
Un problema común en ingeniería eléctrica consiste en determinar las corrientes 
y voltajes en un circuito resistivo. Para su solución se usan las Leyes de
Kirchoff de voltajes y corrientes, cuya aplicación resulta en sistemas de 
ecuaciones lineales algebraicas, siendo las variables desconocidas las corrientes.
#}
 A = [55,-20,0,0 ; 
      -20,55,25,0; 
      0,-25,37,-4; 
      -25,0,-4,29];
      
 b = [0;-10;0;100];
 
try
   
  fprintf('\n') 
  fprintf('TDE P1:\n')
  tic;
  resps = GaussPivot(A,b);
  toc;
  disp(resps)
  
catch error
  fprintf('Error: %s \n',error.message);
end_try_catch

%===========================================================
%                      Problema 2
%===========================================================
#{
Luego de aplicar el metodo de nodos en un circuito electrico, se ha generado un
sistema de ecuaciones. Los coeficientes de las variables se encuentran 
en la matriz A y los valores libres estan en el vector b. Calcule los valores
de voltaje en cada nodo.
#}

A = [0.14, -0.005, 0, 0; 
    -0.005, 0.012, -0.005, 0; 
    0, -0.005, 0.007, -0.001; 
    0, 0,  -0.001, 0.002];

b = [2;0;0;0];

try
  fprintf('\n')
  fprintf('TDE P2:\n')
  tic;
  resps = GaussPivot(A,b);
  toc;
  disp(resps)
  
catch error
  fprintf('Error: %s \n',error.message);
end_try_catch


%===========================================================
%                      Problema 3
%===========================================================
#{
Las cargas trifásicas son habituales en los sistemas de CA. Cuando el sistema está equili-brado, 
el análisis puede simplificarse a un único modelo de circuito equivalente. 
Sin embargo,cuando está desequilibrado, la única solución solución práctica implica la solución 
de ecuacioneslineales simultáneas. Suponga que las corrientes pueden ser halladas luego de
resolver el siguiente sistema de ecuaciones           
#}
A = [0.7460 , -0.4516 , 0.0100 , -0.0080 , 0.0100 , -0.0080; 
     0.4516 , 0.7460 , 0.0080 , 0.0100 , 0.0080 , 0.0100; 
     0.0100 , -0.0080 , 0.7787 , -0.5205 , 0.0100 , -0.0080;
     0.0080 , 0.0100 , 0.5205 , 0.7787 , 0.0080 , 0.0100;
     0.0100 , -0.0080 , 0.0100 , -0.0080 , 0.8080 , -0.6040;
    0.0080 , 0.0100 , 0.0080 , 0.0100 , 0.6040 , 0.8080 
    ];
b = [120,0,-60,-103.9,-60,103.9];

try
  
  fprintf('\n')
  fprintf('TDE P3:\n')
  tic;
  resps = GaussPivot(A,b);
  toc;
  disp(resps)

catch error
  fprintf('Error: %s \n',error.message);
end_try_catch

%===========================================================
%                      Problema 4
%===========================================================    
#{
Resuelva el sistema de ecuaciones proveniente del siguiente
circuito: Circuito 1.
#}
A = [-111/100,1/10,1/100 ; 1/10 111/100 1/100 ; 1/100 1/100 -102/100];
b = [-3,0,1];

try

  fprintf('\n')
  fprintf('TDE P4:\n')
  tic;
  resps = GaussPivot(A,b);
  toc;
  disp(resps)

catch error
  fprintf('Error: %s \n',error.message);
end_try_catch

%===========================================================
%          Eficacia ante sistemas mal condicionados
%===========================================================    

%Sistema mal condicionado original
A = [3.02,-1.05,2.53 ; 4.33,0.56,-1.78 ; -0.83,-0.54,1.47];
b = [-1.61,7.23,-3.38];

try

  fprintf('\n')
  fprintf('TDE SMCO:\n')
  tic;
  resps = GaussPivot(A,b);
  toc;
  disp(resps)

catch error
  fprintf('Error: %s \n',error.message);
end_try_catch

%Sistema mal condicionado modificado
A = [3,-1.05,2.53 ; 4.33,0.56,-1.78 ; -0.83,-0.54,1.47];
b = [-1.61,7.23,-3.38];

try

  fprintf('\n')
  fprintf('TDE SMCM:\n')
  tic;
  resps = GaussPivot(A,b);
  toc;
  disp(resps)

catch error
  fprintf('Error: %s \n',error.message);
end_try_catch