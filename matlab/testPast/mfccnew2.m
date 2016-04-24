function [c,mfccres] = mfccnew2(x,fs,MFCCnum,L)
  x=x(:,1);
  [c,l]=wavedec(x,3,'db4');
  ca=appcoef(c,l,'db4',3);%近似系数
  x=ca;
  enframex=enframe(x,L,L/2);%对信号x分帧处理，每帧有128个采样点，相邻帧之间有50%的叠加率
  [row,col]=size(enframex);%返回行，列，每一行代表一帧，每一列表示1到128个采样点
  maxk=row;
  c=melcepst(x,fs,'M',MFCCnum);
  [row,col]=size(c);
  mfcc=zeros(1,12);
  for i=1:col
      for j=1:row  
        mfcc(1,i)=mean(c(j,i));
      end
  end
mfccres=mfcc();
