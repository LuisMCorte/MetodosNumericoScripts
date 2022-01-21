% Autores: Pablo Bermeo
%          Luis Corte
%          Sebastian Criollo
%
% Fecha: 2021/12/02
% Descripcion: Integración
% Gauss Chebyshev

% Problema 1:
%   
#{
La visión humana tiene la notable capacidad de inferir formas 3D a partir de 
imágenes 2D. La pregunta intrigante pregunta es: ¿podemos reproducir algunas 
de estas capacidades en un ordenador? Sí, se puede hacer y para ello, se 
requiere la integración de campos vectoriales. Es necesario integrar la 
siguiente integral. 

            f = (1-(x^2))^(3/2)
            n = 2

#}
fprintf('Problema 1 \n')

%Datos 
f = @(x) (1-(x^2))^2;
n = 2;
v_analitico = 1.18;

try
  
  %Llamado de la funcion
  [I] = chebyshev(f,n)
  %Calculo del error
  error = abs((v_analitico - I)/v_analitico)*100
  
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
Todos los componentes eléctricos, especialmente los que se venden en el mercado,
 no coinciden con su valor nominal. Las variaciones en los materiales y la 
 fabricación, así como las condiciones de funcionamiento, pueden afectarsu 
 valor. Supongamos que se diseña un circuito que requiere un valor de componente
 específico,¿Cómo podemos estar seguros de que la variación del valor del 
 componente dará lugar a un comportamiento aceptable del circuito?
Para resolver este problema se necesita una función de densidad de probabilidad 
que seintegrada para determinar el intervalo de confianza. Para que un oscilador
 tenga su frecuencia dentro de 5% del objetivo de 1 kHz, la probabilidad de que 
 esto ocurra puede determinarse hallando el área total bajo la distribución 
 normal para el rango en cuestión: 


                  f = (x^2)/sqrt(1-(x^2))

#}

%Datos 
f = @(x) (x^2);
n = 3;
v_analitico = 1.5707;

try
  
  %Llamado de la funcion
  [I] = chebyshev(f,n)
  %Calculo del error
  error = abs((v_analitico - I)/v_analitico)*100
  
catch err
  fprintf('Error: %s\n',err.message);
end_try_catch