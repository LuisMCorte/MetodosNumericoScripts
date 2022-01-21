function[X,x0,evaluado]=Steepest(f1,x,y,max,tol)
if (max<=0 || tol<=0)
  msgID = 'Steepest:Datos';
  msg = 'Usted ha ingresado datos erroneos';
  error(msgID,msg)
endif
gradiente = gradient(f1); % Se calcula la gradiente para la aplicación del método
H1 = hessian(f1); %Se calcula la matriz Hessian para la aplicacion del metodo
i = 0; %Contador
X = []; %Matriz Vacia donde se almacenaran los resultados del método
x0 = [x y]; %Valores Iniciales, tambien mostrará el resultado final del método
x = x;% Variable utilzada para actualizar x
y = y;% Variable utilzada para actualizar y
while norm(eval(gradiente)) > tol && i< max % Bucle while
  X =[X;x0]; %Se crea una matriz con los valores de X y x0
  S = -eval(gradiente); %Se calcular S para la aplicacion del método
  H = eval(H1);%Se calcular H para la aplicacion del método
  lambda = S'*S./(S'*H*S); 
  xn= x0+lambda.*S';%Aplicacion del metodo
  x0 = xn; % Se actualizan los valores de x0 
  x = x0(1); % Se actualizan las variables para poder evaluar en S y H
  y = x0(2);
  i= i+1;
end
evaluado = eval(f1); %Evaluacion de la funcion en sus puntos minimos
return
endfunction
