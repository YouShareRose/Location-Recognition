%clear all;
[x,sr]=audioread('sherry1.m4a');
%[x,sr]=audioread('matlab.wma');
if(size(x,1)>size(x,2))             %size(x,1)Ϊx��������size(x,2)Ϊx������
    x=x';
end
% f=x(1,34000:38000);
f=x(1,:);
s=length(f);
figure(5);
subplot(121);
plot(f);							%����ԭʼ�źŵĲ���ͼ
ylabel('��ֵ');
xlabel('ʱ��');
title('ԭʼ�ź�');
r=fft(f,sr);
r1=abs(r);
subplot(122);
plot(r1);
