%clear all;
[x,sr]=audioread('sherry1.m4a');
%[x,sr]=audioread('matlab.wma');
if(size(x,1)>size(x,2))             %size(x,1)为x的行数，size(x,2)为x的列数
    x=x';
end
% f=x(1,34000:38000);
f=x(1,:);
s=length(f);
figure(5);
subplot(121);
plot(f);							%画出原始信号的波形图
ylabel('幅值');
xlabel('时间');
title('原始信号');
r=fft(f,sr);
r1=abs(r);
subplot(122);
plot(r1);
