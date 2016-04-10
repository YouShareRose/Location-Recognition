%求解积分S0-piS0-2pi (ysin(x)+x(cos(y))dxdy 的数值
integrnd = @(x,y)y*sin(x)+x*cos(y);
xmin=pi;
xmax=2*pi;
ymin=0;
ymax=pi;
result=dblquad(integrnd,xmin,xmax,ymin,ymax)