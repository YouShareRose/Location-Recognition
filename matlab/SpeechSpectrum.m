%clear all;
[x,sr]=audioread('penny2.m4a');
% [x,sr]=audioread('yikdata.m4a');
%[x,sr]=audioread('matlab.wma');
if(size(x,1)>size(x,2))             %size(x,1)为x的行数，size(x,2)为x的列数
    x=x';
end
s=length(x);
w=round(44*sr/1000);    %窗长，取离 44*sr/1000 最近的整数
n=w;                    %fft 的点数
ov=w/2;                 % 50%的重叠
h=w-ov;
win=hanning(n)';        % 汉宁窗
%win=hamming(n)';  
c=1;
ncols=1+fix((s-n)/h);
d=zeros((1+n/2),ncols);
for b=0:h:(s-n)
    u=win.* x((b+1):(b+n));
    t=fft(u);
    d(:,c)=t(1:(1+n/2))';
    c=c+1;
end
tt=[0:h:(s-n)]/sr;
ff=[0:(n/2)]*sr/n;
imagesc(tt/1000,ff/1000,20*log10(abs(d)));
% colormap(gray);
axis xy;
xlabel('time/s');
ylabel('frequence/kHz');

tfu=abs(t);

% C = [0 2 4 6; 8 10 12 14; 16 18 20 22];
% imagesc(C);
% colorbar;
