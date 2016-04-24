% [x,fs]=audioread('yikdata.m4a');
 [x,fs]=audioread('penny2.m4a');
% fs=200;
t=0:1/fs:1;
f1=100;
f2=200;
k=3;
% x=sin(3*pi*f1*t)+k*sin(pi*f2*t)+randn(1,length(t));
% x=sin(3*pi*f1*t)+k*sin(pi*f2*t);
% x=sin(2*pi*f1*t);
pwelch(x,1940,970,[],fs,'onesided')
