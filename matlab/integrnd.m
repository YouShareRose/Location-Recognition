%������S0-piS0-2pi (ysin(x)+x(cos(y))dxdy ����ֵ
integrnd = @(x,y)y*sin(x)+x*cos(y);
xmin=pi;
xmax=2*pi;
ymin=0;
ymax=pi;
result=dblquad(integrnd,xmin,xmax,ymin,ymax)