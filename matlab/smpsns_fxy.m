%������I=S-1-1S0-������1-xƽ�� ������1-xƽ-yƽ dxdy ����ֵ
%��дһά��ֵ���ֵ�M�ļ�
function INTF=smpsns_fxy(f,x,c,d,N)
%����f(x,y)��һά������ֵ
%��Ӧ�Ļ���������Ry={c<=y<+d}
%���û�û�����뺯���е�N����ʱ��Ĭ��ֵΪ100
if nargin<5
    N=100;
end
%������c=d���߲���N=0ʱ�����ػ���ֵΪ0
if abs(d-c)<eps||N<=0
    INTF=0;
    return;
end
%�������N������������+1�����ż��
if mod(N,2)~=0
    N=N+1;
end
%���㵥λ�߶���ֵ
h=(d-c)/N;
%����ڵ��Y������ֵ
y=c+(0:N)*h;
%����ڵ�Ļ��ֺ�����ֵ
fxy=feval(f,x,y);
%ȷ�����ֵ����Ʒ�Χ
fxy(fxy==inf)=realmax;
fxy(fxy==-inf)=-realmax;
%����������ż���ڵ��X��������ֵ
kodd=2:2:N;
keven=3:2:N-1;
%���ݻ��ֹ�ʽ�ó�������ֵ
INTF=h/3*(fxy(1)+fxy(N+1)+4*sum(fxy(kodd))+2*sum(fxy(keven)));