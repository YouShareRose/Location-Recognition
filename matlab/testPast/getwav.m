function  getwav(k)
dec={'baseroom','classroom','stairs','subway'};

tmp=char(dec(k));
%获取该设备所有音频参数
[X1]=audioread([tmp,'.wav']);
% [x0,fs0]=audioread([tmp,'.wav']);

c0=X1(19000:100000,1); % 幅值归一化
c0=c0/max(abs(c0));
switch k
    case 1
        c1=c0;
        save ('data01.mat','c1');
    case 2
        c2=c0;
        save ('data02.mat','c2');
    case 3
        c3=c0;
        save ('data03.mat','c3');
    case 4
        c4=c0;
        save ('data04.mat','c4');
end

figure(2);
plot(c0),title([tmp,'的录音波形']);
