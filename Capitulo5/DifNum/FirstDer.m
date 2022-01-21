function[dadelante,datras,dcentro] = FirstDer(f,dom,dt)

if (dt == 0)
  msgID = 'FirstDer:Valor invalido de delta';
  msg = 'No es posible usar un delta igual a 0.';
  error(msgID,msg)
endif

ran = arrayfun(f,dom);

%==============================================
%      Calculo de derivadas aproximadas
%==============================================

%Derivada hacia adelante  
dadelante = ( arrayfun(f,dom + dt) - ran ) / (dt);

%Derivada hacia atras
datras = ( ran - arrayfun(f,dom - dt) ) / (dt);

%Derivada hacia el centro
dcentro = ( arrayfun(f,dom + dt) - arrayfun(f,dom - dt) ) / (2*dt);

return
endfunction