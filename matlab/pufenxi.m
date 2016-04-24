[x,fs]=audioread('yikdata.m4a');
% fs=2000;
% t=0:1/fs:1;
% f1=30;
% f2=40;
% k=5;
% x=k*cos(pi*f1*t)+sin(3*pi*f2*t)+randn(1,length(t));
% x=k*cos(pi*f1*t)+sin(3*pi*f2*t);
[p,f]=psd(x,1024,fs/2,[],512);
figure(2);
plot(f,10*log10(p/(2048/2)));
xlabel('freq Hz');
ylabel('PSD');
xlabel('freq(Hz)');
grid on
