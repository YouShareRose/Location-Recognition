%���ػ��ֵ�M�ļ�
function INTFxy=int2s(f,a,b,c,d,M,N)
%��������f(x,y)�Ķ��ػ�����ֵ
%��������ΪR={(x,y)|a<=x<=b,c(x)<=y<=d(x)}
%ʹ�õĻ��ַ�����Simpson����
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
%�жϲ���c�Ƿ�����ֵ�����c����ֵ����������������Ϊ��ֵc��
%���c������ֵ����������������Ϊ���ʽ
if isnumeric(c)
    cx(m)=c;
else
    cx(m)=feval(c,x(m));
end
%�жϲ���d�Ƿ�����ֵ�����d����ֵ����������������Ϊ��ֵd��
%���d������ֵ����������������Ϊ���ʽ
if isnumeric(d)
    dx(m)=d;
else
    dx(m)=feval(d,x(m));
end
%�ظ��Ͳ���M���ƵĲ���
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
% ����Simpson�����������ڵ����ֵ
for m=1:M+1
    sx(m)=smpsns_fxy(f,x(m),cx(m),dx(m),Nx(m));
end
kodd=2:2:M;
keven=3:2:M-1;
%���������ֵ
INTFxy=hx/3*(sx(1)+sx(M+1)+4*sum(sx(kodd))+2*sum(sx(keven)));