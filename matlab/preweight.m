clear all;
[FileName,PathName] = uigetfile('*.wav','Select the MATLAB code file');
[signal,Fs] = audioread(FileName);
tn=length(signal);
t=(1:tn)/Fs;%xlabel('time/s');
signal1=signal(:,1);
x=signal1/max(abs(signal1));
x1=filter([1,-0.9375],1,x);
% plot(signal(:,1));
subplot(2,1,1);
% figure('preWeight');
plot(t,signal(:,1));
xlabel('time/s');
title('原始时间信号');
subplot(2,1,2);
plot(t,x);
title('预加重语音信号');
xlabel('time/s');

