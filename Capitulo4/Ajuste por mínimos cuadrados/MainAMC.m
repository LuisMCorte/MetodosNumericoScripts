%  Autores: Pablo Bermeo
%          Luis Cortez
%          Pablo Cardenas
%          Sebastian Criollo
%
% Fecha: 6/11/2021
% Descripcion: Emplear el metodo de regresión con mínimos cuadrados para aproximar
%una recta a datos medidos


% Problema 1:
%   
#{
En sus inicios, todo el Electromagnetismo estaba sustentado en mediciones
experimentales. Luego, fue introducida la matemática. Suponga que un antiguo
científico experimentaba con dos placas metálicas puestas en paralelo. 
El científico aplicaba una voltaje entre las placas y registraba la carga que poseían
como consecuencia de la diferencia de potencial. Dadas sus mediciones, demuestre que la
relación entre voltaje y carga es lineal.  
#}

x = [0, 2.5, 3.5, 5, 7.2];
y = [0, 2.479e-4, 3.4e-4, 4e-4, 7.1e-4];

try
  
  %Calculo de A y B
  [A,B] = MinCua(x,y);
  f = @(x) A*x + B;
  
  %Muestra del resultado:
  fprintf('La aproximacion es Q = %5.4f V + (%5.4f)\n', A,B);
  
  %Ploteo
  h = figure(1);
  plot(x,y,'+', 'linewidth',2);
  title('Problema 1')

  hold on;

    plot([0,8], f([0,8]), 'linewidth', 2)

    set(gca, "xaxislocation", "origin", "xlim", [0 8]);
    set(gca, "yaxislocation", "origin", "ylim", [0 0.0008]);

    legend ("Q(V) medido", "Aproximación");
    xlabel ("V");
    ylabel ("Q(V)");

  hold off;

catch err
  fprintf('Error: %s\n',err.message);
end_try_catch

% Problema 2:
%   
#{
En un circuito se ecuentran conenctados una resistencia y un capacitor en serie. Se sabe que, con el
pasar del tiempo, el capacitor se abre y la magnitud de su voltaje es semenjante al de la fuente. En tanto,
el voltaje en el capacitor disminuye continuamente. Realice una aproximación lineal con los datos de tiempo
y magnitud del voltaje en el capacitor. 
#}

x = [0,7.50,15.40,22.61,31.02,39.20,45.81,54.22,61.00,70.20,76.10];
y = [12,7.80,4.72,3.00,1.72,1.10,0.87,0.46,0.35,0.12,0.06];

try
  
  %Calculo de A y B
  [A,B] = MinCua(x,y);
  f = @(x) A*x + B;
  
  %Muestra del resultado:
  fprintf('La aproximacion es Vr = %5.4f t + (%5.4f)\n', A,B);

  %Ploteo
  h = figure(2);
  plot(x,y,'+', 'linewidth',2);
  title('Problema 2')

  hold on;

    plot([0,80], f([0,80]), 'linewidth', 2)

    set(gca, "xaxislocation", "origin", "xlim", [0 80]);
    set(gca, "yaxislocation", "origin", "ylim", [0 14]);

    legend ("Vr(t) medido", "Aproximación");
    xlabel ("t");
    ylabel ("Vr(t)");

  hold off;

catch err
  fprintf('Error: %s\n',err.message);
end_try_catch