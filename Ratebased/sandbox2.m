% x = 0:0.1:10;
% y = gaussmf(x,[2 5]);
% plot(x,y)
% xlabel('gaussmf, P=[2 5]')
% 
% 

N_input = 3000;
std = 0.0005;

centers = -0.5 + (0:1:(N_input-1))*(1.5+0.5)/(N_input-1);

center_i = 1;
center_f = 5;

x = (centers(center_i)-(5*std)):0.00005:(centers(center_f)+(5*std));

% y = gaussmf(x, [std centers(center_i:center_f)]);
% y2 = gaussmf(x, [std centers(10)])
y = zeros(size(center_i:1:center_f,2), size(x,2));
for i=center_i:1:center_f
  y(i, :) = gaussmf(x, [std centers(i)]);
end

figure
plot(x,y);
