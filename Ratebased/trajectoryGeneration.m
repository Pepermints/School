

% t = 1:1:2000;
% x = cos(2*pi*13*t) + 2*randn(size(t));


t = 0:0.01:10;
x = cos(2*pi*13*t)+ 2*randn(size(t));
% x_3 = (x_3/max(abs(x_3)) + 1)/2;
% x_3 = x_3/max(x_3);

d = fdesign.lowpass('Fp,Fst,Ap,Ast',5,6,0.5,60,200);
Hd = design(d,'equiripple');

y = filter(Hd,x);
y_ = (y(185:end)/max(abs(y(185:end)))+ 1)/2;  %normalized, cut and between 0&1

figure
plot(x)
hold on
plot(y(185:end))  %235 for 200 window

figure
plot(y_)
