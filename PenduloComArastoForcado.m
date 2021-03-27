clc
clear all
%================dados========================
    m=0.1;                                      %massa do objeto
    G = 9.81;                                   %gravidade
    L = 1;                                      %tamanho do pendulo
    w2=G/L;                                     %frequencia natural
    w=w2;                               %Frequencia forçada
    f0=w;                                       %Amplitude máxima da força
    raio = 0.05 ;                               %raio da esfera em metros
    rho = 0.00017;                              %viscosidade do ar
    b = 6*pi*rho*raio;                          %contante de amortecimento esfera
    beta= b/(2*m);
    A=f0/m;
    w1=sqrt(w2 - beta^2);                       %frequencia de amortecimento
    
%============Os que importam estão na função g=


h=0.1;
tf = 25;
n= tf/h;
t0=0;
y0=1;                                       %por ser forçado pode começar na origem
v0=0;

t(1)=t0;
y(1)=y0;
v(1)=v0;



for i=1:n 
    tn = t(i);            %autalizando os valores para o loop
    yn = y(i);            %autalizando os valores para o loop
    vn = v(i);            %autalizando os valores para o loop
    
     k1 = h*f(tn,yn,vn);
     l1 = h*g(tn,yn,vn);
     k2 = h*f(tn + h/2, yn + k1/2, vn + l1/2);
     l2 = h*g(tn + h/2, yn + k1/2, vn + l1/2);
     k3 = h*f(tn + h/2, yn + k2/2, vn + l2/2);
     l3 = h*g(tn + h/2, yn + k2/2, vn + l2/2);
     k4 = h*f(tn + h,yn + k3, vn + l3);
     l4 = h*g(tn + h,yn + k3, vn + l3);
    
     k  = (k1 + 2*k2 + 2*k3 + k4)/6;
     l  = (l1 + 2*l2 + 2*l3 + l4)/6;
    
     t(i+1) = t(i) + h;
     y(i+1) = y(i) + k;
     v(i+1) = v(i) + l;
  
endfor

del =(tan (2*w*beta/(w2 -w^2)))^-1 ;

yc=@(t) exp(-beta.*t).*( exp(sqrt(beta.^2 - w2 ).*t) + exp(-sqrt(beta.^2 - w2 ).*t));
yp=@(t) (A.* cos(w.*t - del) ./(sqrt((w2 - w.^2).^2 +4.*(w.^2).*beta.^2)));

yt = yc(t) + yp(t);


hold on
figure(1)
grid on
plot(t,y,'m')
plot(t,yt,'b')
xlabel('Tempo de oscilação')
ylabel('Amplitude de Oscilação')
title('Pendulo com atrito')
hold off
figure(2)
plot(y,v,'y')
xlabel('Posição')
ylabel('Velocidade Angular')
title('Diagrama de fase')