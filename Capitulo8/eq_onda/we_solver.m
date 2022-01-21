%we_solver   Funcion que resulve la ecuacion de onda de la forma
%            fx2_t=alpha*fx2_u. La ecuacion tiene la forma 'forma'
%            
%   we_solver(ALPHA,L,DX,DT,POS_INI,POS_FIN,VIN,FORMA)
%       [u_vals] = we_solver(alpha,L,dx,dt,pos_ini,pos_fin,Vin,forma)
%       u_vals = Valores distintos de u para cada t
%       dx,dt = saltos en la longitud de la onda y su tiempo
%       pos_ini, pos_fin = valores de u en los que inicia y acaba la onda
%       Vin = velocidad inicial de la onda 
%       forma = froma de la onda 
%   See also Metodo de diferencias finitas aplicado a problemas 
%            especificos
%   Copyleft 2021-2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2022/2/1 23:06 $
%   Built-in function.
function [u_vals] = we_solver(alpha,L,dx,dt,pos_ini,pos_fin,Vin,forma)

#====================================================
#             Reconocimiento de errores
#====================================================
if ( L<=0 || alpha==0 || dx<=0 || dt<=0 )
  msgID = 'we_solver: No pueden existir valores iguales a 0 en alpha,L,dx o dt';
  msg = 'alpha,L,dx o dt es igual a cero';
  error(msgID,msg)
endif

#====================================================
#             Configuraciones iniciales
#====================================================

#Calcular lambda
lambda = sqrt(alpha) * (dt/dx);

#Calculo de la cantidad de intervalos i
intervalos = L/dx + 1;

#Definicion del dominio que abarca la cuerda
dom = pos_ini : dx : L;

#Definir la matriz para los valores y aniadir los valores iniciales y finales
u_vals = zeros(length(dom),length(dom) - 1);
u_vals(1,:) = pos_ini * ones(1,length(dom) - 1);
u_vals(size(u_vals,1),:) = pos_fin * ones(1,length(dom) - 1);

#====================================================
#       Calculo de los valores u_i(x_i,t_j)
#====================================================

for j = 1 : length(dom) - 1
    
    if ( j == 1 ) #En t de j1, la forma de la onda obedece a la funcion forma
        
        for i = 2:length(dom) - 1
            u_vals(i,j) = forma( dom( i ) );
        endfor
        
    elseif ( j == 2 ) #En t de j2, la onda obedece a la relacion u_vals(i,j) = u_vals(i,1) + Vin*dt;
        
        for i = 2:length(dom) - 1
            u_vals(i,j) = u_vals(i,1) + Vin*dt;
        endfor
        
    else #Para valores superiores a 
        
        for i = 2:length(dom) - 1
            u_vals(i,j) = 2*(1 - lambda**2)*u_vals(i,j-1) + (lambda**2)*u_vals(i+1,j-1) + (lambda**2)*u_vals(i-1,j-1) - u_vals(i,j-2);        
        endfor
        
    endif

endfor

return
endfunction