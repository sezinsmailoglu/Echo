%% DTMF Receiver
n = '22222222';
   dt = 1/16384; 
asdf = DTMFTRA(n) 
   dt = 1/16384; 
   t = 0:dt:(length(n)*0.25)-dt; 
X = FT(asdf);
omega=linspace(-16384*pi,16384*pi,16384*2+1);
omega=omega(1:length(X));
%plot(asdf)
plot(omega,abs(X));


