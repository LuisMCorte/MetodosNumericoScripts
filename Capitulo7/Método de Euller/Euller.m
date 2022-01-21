
function[error_global,error_local,estabilidad,y_a,y,t] = Euller(f,f_a,h,a,b,c)
if (b == c)
msgID = 'Euller :';
msg = 'Valores de x iguales';
error(msgID,msg)
endif
t = b:h:c; #se crean los valores de t para evaluar en el método
y = [a]; #y inicial
for i=1:length(t)-1; %Bucle para sacar los resultados del método del euller
  syms x
  y(i+1)= y(i) + h*f(t(i),y(i)); #Aplicacion del método
  f_e = diff(f,x,i); #Se deriva para poder encontrar el error local
  x = t(i); #Se actualizan los x para evaluar en el error
  v = y(i); # Se actualizan los valores de v para evaluar en el error
  error_local(i)= (eval(f_e)/(factorial(1+i)))*h^(i+1); #Fórmula del error por la serie de Taylor
endfor

for i=1:length(t); #Bucle para evaluar la funcion analitica
  y_a(i) = f_a(t(i),y(i)); 
endfor
error_global = sum(error_local); #Error global, suma de los errores locales
estabilidad = (1-(error_global)*h); #Estabilidad
endfunction
plot(t,r_analitico,t,r_euller)
legend("S_Exacta","S_Euller")