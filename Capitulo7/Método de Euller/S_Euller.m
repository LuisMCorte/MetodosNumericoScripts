function[error_global,error_local,y_1,y_2,t] = Euller(f_1,f_2,h,a_1,a_2,b,c)
if (b == c)
msgID = 'Euller :';
msg = 'Valores de x iguales';
error(msgID,msg)
endif
t = b:h:c; #se crean los valores de t para evaluar en el método
y_1 = [a_1]; #y1 inicial
y_2 = [a_2]; #y2 inicial
for i=1:length(t)-1; %Bucle para sacar los resultados del método del euller
  syms x
  y_1(i+1)= y_1(i) + h*f_1(y_1(i),y_2(i)); #Aplicacion del método
  y_2(i+1)= y_2(i) + h*f_2(y_1(i),y_2(i));
  f_e_1= diff(f_1,x,i); #Se deriva para poder encontrar el error local
  f_e_2= diff(f_2,x,i); #Se deriva para poder encontrar el error local
  x = y_1(i); #Se actualizan los x para evaluar en el error
  v = y_2(i); # Se actualizan los valores de v para evaluar en el error
  error_local(i)= eval(f_e_1)/(factorial(1+i))*h^(i+1) + eval(f_e_2)/(factorial(1+i))*h^(i+1); #Fórmula del error por la serie de Taylor
endfor
error_global = sum(error_local);
