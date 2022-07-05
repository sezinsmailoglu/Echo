%% Recording
 recObj = audiorecorder(16384,8,1);
 disp('Start speaking.')
 recordblocking(recObj, 5);
 disp('End of Recording.');
 x = getaudiodata(recObj);
 %soundsc(x,16384);
 %% generating echo
 dt = 1/16384;
 t=0:1/16384:(5)-1/16384;
 x1 = x';
 echo = [x1 zeros(1,4/dt)] + 0.75*[zeros(1,0.5/dt) x1 zeros(1,3.5/dt)] + 0.5*[zeros(1,1/dt) x1 zeros(1,3/dt)] + 0.4*[zeros(1,1.5/dt) x1 zeros(1,2.5/dt)]+ 0.25*[zeros(1,2/dt) x1 zeros(1,2/dt)] + 0.2*[zeros(1,3/dt) x1 zeros(1,1/dt)]+ 0.1*[zeros(1,4/dt) x1];
soundsc(echo, 16384);
%% plots
figure
subplot(1,2,1)
plot(t(1:5/dt),x)
title('Plot of the recor ded sound')
xlabel('t')
ylabel('x(t)')
grid on
subplot(1,2,2)
plot(echo)
title('Plot of the Sound&Echo')
xlabel('t')
ylabel('echo(t)')
grid on
omega=linspace(-16384*pi,16384*pi,16384*5+1);
omega=omega(1:end-1);
Y = FT(echo);
X = FT(x1);
H = 1 + 0.75*exp(-1i*0.5.*omega) + 0.50*exp(-1i.*omega) + 0.25*exp(-1i*2.*omega) + 0.1*exp(-1i*3.*omega);
h = IFT(H);
H = Y(1:length(omega))./X;
soundsc(h,16384)
figure
subplot(1,2,1)
plot(omega,X)
xlabel('w')
ylabel('X(w)')
title('Spectrum of the Sound ')
grid on
subplot(1,2,2)
% plot(omega,abs(Y(1:length(omega))))
plot(omega,abs(Y(1:length(omega))))
xlabel('w')
ylabel('Y(w)')
title('Spectrum of the Signal&Echo')
grid on
%% Impulse & Frequency Response Plots
figure
subplot(1,2,1)
plot(t(1:5/dt),h);
title('Impulse Response')
xlabel('t')
ylabel('h(t)')
grid on
subplot(1,2,2)
plot(omega,abs(H));
title('Frequency Response')
xlabel('w')
ylabel('H(w)')
grid on
