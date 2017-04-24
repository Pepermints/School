% N_input = 100;
% 
% G = zeros(N_input, 1);
%     for i = 1:N_input
%         G(i) = gaussmf(17.5, [0.01 centers(i)]);    
%     end

% N = 2000;
% 
% delta_x = rand(N, 1)-0.5;
% x = zeros(N, 1);
% 
% for i = 2:N
%     x(i, 1) = x(i-1, 1) + delta_x(i,1);
% end
% 
% x = (x/max(abs(x)) + 1)/2;
% x = x/max(x);                   %between 0 & 1
% 
% d = fdesign.lowpass('Fp,Fst,Ap,Ast',5,6,0.5,60,200);
% Hd = design(d,'equiripple');
% output = filter(Hd,x);
% %fvtool(Hd)
% 
% % figure;
% % plot(delta_x)
% figure
% plot(x)
% hold on
% plot(output, 'r')
% hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%

% freq = 0:(2*pi)/N:pi;
% xdft = fft(x);
% ydft = fft(output);
% 
% figure
% plot(freq/pi,abs(xdft(1:length(x)/2+1)))
% hold on
% plot(freq/pi,abs(ydft(1:length(output)/2+1)))
% hold off
% 
% legend('Original Signal','Filtered Signal')
% ylabel('Magnitude')
% xlabel('Normalized Frequency (\times\pi rad/sample)')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% other example
% https://uk.mathworks.com/help/signal/ug/filtering-data-with-signal-processing-toolbox.html
rng default

Fs = 1000;
t = linspace(0,1,Fs);
x = cos(2*pi*100*t)+1.5*randn(size(t));
%x2 = cos(2*pi*50*t)+0.5*randn(size(t));
% figure
% plot(t(1:100),x(1:100));
% hold on
% plot(t(1:100), x2(1:100));

fc = 150;
Wn = (2/Fs)*fc;
b = fir1(20,Wn,'low',kaiser(21,3));

fvtool(b,1,'Fs',Fs)
y = filter(b,1,x);

plot(t,x,t,y)
xlim([0 0.1])

xlabel('Time (s)')
ylabel('Amplitude')
legend('Original Signal','Filtered Data')
