%求解积分I=S-1-1S0-根号下1-x平方 根号下1-x平-y平 dxdy 的数值
%编写一维数值积分的M文件
function INTF=smpsns_fxy(f,x,c,d,N)
%函数f(x,y)的一维积分数值
%对应的积分区域是Ry={c<=y<+d}
%当用户没有输入函数中的N参数时，默认值为100
if nargin<5
    N=100;
end
%当参数c=d或者参数N=0时，返回积分值为0
if abs(d-c)<eps||N<=0
    INTF=0;
    return;
end
%如果参数N是奇数，则将其+1，变成偶数
if mod(N,2)~=0
    N=N+1;
end
%计算单位高度数值
h=(d-c)/N;
%计算节点的Y轴坐标值
y=c+(0:N)*h;
%计算节点的积分函数数值
fxy=feval(f,x,y);
%确定积分的限制范围
fxy(fxy==inf)=realmax;
fxy(fxy==-inf)=-realmax;
%计算奇数和偶数节点的X轴坐标数值
kodd=2:2:N;
keven=3:2:N-1;
%根据积分公式得出积分数值
INTF=h/3*(fxy(1)+fxy(N+1)+4*sum(fxy(kodd))+2*sum(fxy(keven)));