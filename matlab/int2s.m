%二重积分的M文件
function INTFxy=int2s(f,a,b,c,d,M,N)
%被积函数f(x,y)的二重积分数值
%积分区域为R={(x,y)|a<=x<=b,c(x)<=y<=d(x)}
%使用的积分方法是Simpson法则
if ceil(M)~=floor(M)
    hx=M;
    M=ceil((b-a)/hx);
end
if mod(M,2)~=0
    M=M+1;
end
hx=(b-a)/M;
m=1:M+1;
x=a+(m-1)*hx;
%判断参数c是否是数值。如果c是数值，将积分限制设置为数值c；
%如果c不是数值，将积分限制设置为表达式
if isnumeric(c)
    cx(m)=c;
else
    cx(m)=feval(c,x(m));
end
%判断参数d是否是数值。如果d是数值，将积分限制设置为数值d；
%如果d不是数值，将积分限制设置为表达式
if isnumeric(d)
    dx(m)=d;
else
    dx(m)=feval(d,x(m));
end
%重复和参数M类似的操作
if ceil(N)~=floor(N)
    hy=N;
    Nx(m)=ceil((dx(m)-cx(m))/hy);
    ind=find(mod(Nx(m),2)~=0);
    Nx(ind)=Nx(ind)+1;
else
    if mod(N,2)~=0
        N=N+1;
    end
    Nx(m)=N;
end
% 根据Simpson法则计算各个节点的数值
for m=1:M+1
    sx(m)=smpsns_fxy(f,x(m),cx(m),dx(m),Nx(m));
end
kodd=2:2:M;
keven=3:2:M-1;
%计算积分数值
INTFxy=hx/3*(sx(1)+sx(M+1)+4*sum(sx(kodd))+2*sum(sx(keven)));