%getmfcc;
MFCCs=textread('20130523-1.txt');
P=MFCCs;
P(:,1)=[];
P=P';
TT=MFCCs(:,1);
T=[];
for i=1:length(TT)
   tmp=zeros(1,6);
   for k=1:6
        if TT(i)==k
            tmp(k)=1;
        end
   end
   T=[T;tmp];    
end
T=T';
threshold=minmax(P);
net=newff(threshold,[31,6],{'tansig','logsig'},'trainlm');
net.trainParam.epochs=1000;
net.trainParam.goal=0.001;
LP.lr=0.1;
net=train(net,P,T);



MFCCs=textread('20130523-2.txt');
P_test=MFCCs;
P_test(:,1)=[];
P_test=P_test';
TT_test=MFCCs(:,1);
T_test=[];
for i=1:length(TT_test)
   tmp=zeros(1,6);
   for k=1:6
        if TT_test(i)==k
            tmp(k)=1;
        end
   end
   T_test=[T_test;tmp];    
end
T_test=T_test';
Y=sim(net,P_test);
correct=0;
for i=1:size(Y,2)
   [a b1]=max(Y(:,i));
   [a b2]=max(T_test(:,i));
   if b1==b2
      correct=correct+1; 
   end
end
cratio=correct*100/size(Y,2);
msgbox(['六类环境录音信号正确识别率为',int2str(cratio),'%'], '与文本有关的环境录音识别');