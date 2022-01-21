clear;
% Autores: Pablo Bermeo
%          Luis Cortez
%          Pablo Cardenas
%          Sebastian Criollo
%
% Fecha: 17/11/2021
% Descripcion: Emplear la diferenciacion numerica para 
%resolver los siguientes problemas.


% Problema 1:
   
#{
Determine la corriente que atraviesa a un elemento sabiendo que la carga que se le
suministra esta dada por:
                              q(t) = 3e^(-t) - 5e^(-2t)nC  
#}

f = @(x) 3*e^(-1*x) - 5*e^(-2*x);
dom = -1:0.1:6;
dt = 0.1;

try

  [dadelante,dtras,dcentro] = FirstDer(f,dom,dt)

  %==============================================
  %                Zona de ploteo
  %==============================================

  %Plot de la funcion original
  h = figure(1);
  plot(dom,arrayfun(f,dom),'k','linewidth',2);

  hold on;

    %Plotear la derivada exacta
    plot(dom,arrayfun(df,dom),'c','linewidth',1);

    %Ploteo de la aproximacion hacia adelante
    plot(dom, dadelante,'b--', 'linewidth',1.5);

    %Ploteo de la derivada hacia atras
    plot(dom, dtras,'r--', 'linewidth',1.5);

    %Ploteo de la derivada centrada
    plot(dom, dcentro,'y--', 'linewidth',1.5);

    %Edicion de la grafica
    title('Problema 1')
    axis([0 5 -2 7]);
    l = legend('Q(t)');
    xlab = xlabel('t');
    set(l,'FontSize',14);
    set(xlab,'fontsize',14,'fontweight','bold');
    grid on;

  hold off;

catch error
  fprintf('Error: %s\n',error.message);
end_try_catch


% Problema 2:
   
#{
Determine la corriente que atraviesa a un elemento sabiendo que la carga que se le
suministra esta dada por:
                              q(t) = 20e^(-4t)cos(50t) uC  
#}

f = @(t) 20*e^(-4*t) * cos(50*t);
df = @(t) -80*e^(-4*t)*cos(50*t) - 1000*e^(-4*t)*sin(50*t);
dom = 0:0.001:2;
dt = 0.01;

try

  [dadelante,dtras,dcentro] = FirstDer(f,dom,dt)

  %==============================================
  %                Zona de ploteo
  %==============================================

  %Plot de la funcion original
  figure(2);
  plot(dom,arrayfun(f,dom),'k','linewidth',2);

  hold on;

    %Plotear la derivada exacta
    plot(dom,arrayfun(df,dom),'c','linewidth',1);

    %Ploteo de la aproximacion hacia adelante
    plot(dom, dadelante,'b--', 'linewidth',1.5);

    %Ploteo de la derivada hacia atras
    plot(dom, dtras,'r--', 'linewidth',1.5);

    %Ploteo de la derivada centrada
    plot(dom, dcentro,'y--', 'linewidth',1.5);

    %Edicion de la grafica
    title('Problema 2')
    axis([0 0.5 -25 25]);
    l = legend('Q(t)','I(t) exacta','Dadelante','Datrás','Dcentro');
    xlab = xlabel('t')
    set(l,'FontSize',14);
    set(xlab,'fontsize',14,'fontweight','bold');
    grid on;

  hold off;

catch error
  fprintf('Error: %s\n',err.message);
end_try_catch
#}