function resultado = g(t,y,v);
    m=0.1;                                      %massa do objeto
    G = 9.81;                                   %gravidade
    L = 1;                                      %tamanho do pendulo
    w2=G/L;                                     %frequencia natural
    raio = 0.05 ;                               %raio da esfera em metros
    rho = 0.00017;                              %viscosidade do ar
    b = 6*pi*rho*raio;                          %contante de amortecimento esfera
    beta= b/(2*m);
    w1=sqrt(w2 - beta^2);                        %Frequencia de amortecimento
    w=w2;                                      %Frequencia forçada
    f0=w;                                      %Amplitude máxima da força
    
    resultado = - (w2* (sin(y)) + (b*v/m)) + (m\ (f0 * cos(w*t))) ;
endfunction
