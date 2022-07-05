n = '21704280';
asdf = DTMFTRA(n) 
   dt = 1/16384; 
   t = 0:dt:(length(n)*0.25)-dt; 
X = FT(asdf);
omega=linspace(-16384*pi,16384*pi,16384*2+1);
omega=omega(1:end-1);
%plot(asdf)
%plot(omega/(2*pi),abs(X));

y1 = @(t)(asdf.*((0<=t) & ( t<0.25))+ 0);
X1 = FT(y1(t))

y2 = @(t)(asdf.*((0.25<=t) & ( t<0.5))+ 0);
X2 = FT(y2(t))

y3 = @(t)(asdf.*((0.5<=t) & ( t<0.75))+ 0);
X3 = FT(y3(t))

y4 = @(t)(asdf.*((0.75<=t) & ( t<1))+ 0);
X4 = FT(y4(t))

y5 = @(t)(asdf.*((1<=t) & ( t<1.25))+ 0);
X5 = FT(y5(t))

y6 = @(t)(asdf.*((1.25<=t) & ( t<1.5))+ 0);
X6 = FT(y6(t))

y7 = @(t)(asdf.*((1.5<=t) & ( t<1.75))+ 0);
X7 = FT(y7(t))

y8 = @(t)(asdf.*((1.75<=t) & ( t<2))+ 0);
X8 = FT(y8(t))

figure
subplot(1,4,1)
plot(omega/(2*pi),abs(X5))
xlabel('w')
ylabel('X(w)')
title('Spectrum of the fifth digit')
grid on
subplot(1,4,2)
plot(omega/(2*pi),abs(X6))
xlabel('w')
ylabel('X(w)')
title('Spectrum of the sixth digit')
grid on
subplot(1,4,3)
plot(omega/(2*pi),abs(X7))
xlabel('w')
ylabel('X(w)')
title('Spectrum of the seventh digit')
grid on
subplot(1,4,4)
plot(omega/(2*pi),abs(X8))
xlabel('w')
ylabel('X(w)')
title('Spectrum of the eighth digit')
grid on

