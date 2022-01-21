%  Autores: Pablo Bermeo
%           Luis Cortez
%           Pablo Cardenas
%           Sebastian Criollo
%
% Fecha: 10/11/2021
% Descripcion: Emplear el metodo de regresión polinomial para aproximar
%una curva a datos medidos


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

x = 0:5;
y = [2.1,7.7,13.6,27.2,40.9,61.1];

try
  
  [coefs,e] = RegrePol(x,y,2);
  dom = 0:5;    
  fprintf('Aproximación con un error estándar de %5.2f\n',e);

  %Ploteo
  h = figure(1);
    
    %Ploteo de la aproximacion
     plot( dom, polyval(coefs,dom') );  
    
    hold on;

      %Ploteo de los datos
      plot(x,y,'+', 'linewidth',2);

      %Edicion del grafico
      set(gca, "xaxislocation", "origin", "xlim", [0 5]);
      set(gca, "yaxislocation", "origin", "ylim", [0 70]);
      title('Problema 1')
      legend (polyout(coefs,'V'),"Q(V) medido");
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
  
  [coefs,e] = RegrePol(x,y,3);
  dom = 0:80;
  fprintf('Aproximación con un error estándar de %5.2f\n',e);
  %Ploteo
  h = figure(2);
  
    %Ploteo de la aproximacion
    plot( dom, polyval(coefs,dom') );
    
    hold on;

      %Ploteo de los datos
      plot(x,y,'+', 'linewidth',2);

      %Edicion del grafico
      set(gca, "xaxislocation", "origin", "xlim", [0 80]);
      set(gca, "yaxislocation", "origin", "ylim", [0 14]);
      title('Problema 2')  
      legend ( polyout(coefs,'t'), "Vr(t) medido");
      xlabel ("t");
      ylabel ("Vr(t)");

    hold off;

catch err
  fprintf('Error: %s\n',err.message);
end_try_catch