function tmp = getspecgram(k)
dec={'����','������','��;��','����','ʳ��','����'};
tmp=char(dec(k));
%��ȡ���豸������Ƶ����
[x0,fs0,bits0]=wavread([tmp,'1.wav']);
c0=x0(:,1);
c0=c0/max(abs(c0));
[x1,fs1,bits1]=wavread([tmp,'2.wav']);
c1=x1(:,1);
c1=c1/max(abs(c1));
[x2,fs2,bits2]=wavread([tmp,'3.wav']);
c2=x2(:,1);
c2=c2/max(abs(c2));
[x3,fs3,bits3]=wavread([tmp,'4.wav']);
c3=x3(:,1);
c3=c3/max(abs(c3));


figure(2);
subplot(4,1,1),specgram(c0),title([tmp,'ʱ��1¼��Ƶ��']);
subplot(4,1,2),specgram(c1),title([tmp,'ʱ��2¼��Ƶ��']);
subplot(4,1,3),specgram(c2),title([tmp,'ʱ��3¼��Ƶ��']);
subplot(4,1,4),specgram(c3),title([tmp,'ʱ��4¼��Ƶ��']);
