%求解积分S0-piS0-2pi (ysin(x)+x(cos(y))dxdy 的数值
integrnd = @(x,y)y*sin(x)+x*cos(y);
xmin=pi;
xmax=2*pi;
ymin=0;
ymax=pi;
result=dblquad(integrnd,xmin,xmax,ymin,ymax)

x=[-1:0.05:1];
y=[0:0.05:1];
[X,Y]=meshgrid(x,y);
f510=inline('sqrt(max(1-x.*x-y.*y,0))','x','y');
z=f510(X,Y);
d=inline('sqrt(max(1-x.*x,0))','x');
b=1;a=-1;c=0;
Vs1=int2s(f510,a,b,c,d,100,100);
error1=Vs1-pi/3;
Vs2=int2s(f510,a,b,c,d,0.01,0.01);
error2=Vs2-pi/3;
surf(X,Y,z)