n = 5;
x = [0 1/2 1 3/2 2]';
y = [3 -4 5 -6 7]';
plot(x,y,'o', 'MarkerSize', 10);
xlim([-0.5 2.5]);
ylim([-7.5 8.5]);

% calculate the difference
dx = x(2:n)-x(1:(n-1)); % This is h
dy = y(2:n)-y(1:(n-1));

% marix A
A = zeros(n,n);
A(1,1) = 1;
A(n,n) = 1;

% vector b
b = zeros(n,1);

% assign values
for i = 2:(n-1)
  A(i,i-1) = dx(i-1);
  A(i,i) = 2*(dx(i-1)+dx(i));
  A(i,i+1) = dx(i);
  b(i) = 3*(dy(i)/dx(i)-dy(i-1)/dx(i-1));
end

% solve linear equation
c = A\b;
%c = linsolve(A,b);

% calculate the polynomial coefficients
pa = y;
pc = c;
pb = dy./dx-dx.*(pc(2:n)+2*pc(1:(n-1)))/3;
pd = (pc(2:n)-pc(1:(n-1)))./(3*dx);

% plot the spline function
% s(x) = a+b(x-xi)+c(x-xi)^2+d(x-xi)^3
hold on;
for i = 1:(n-1)
  xx = linspace(x(i),x(i+1),100);
  yy = pa(i)+pb(i)*(xx-x(i))+pc(i)*(xx-x(i)).^2+pd(i)*(xx-x(i)).^3;
  plot(xx,yy);
end
