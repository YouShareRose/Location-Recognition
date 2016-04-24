function [c,mfccres] = mfccnew2(x,fs,MFCCnum,L)
  x=x(:,1);
  [c,l]=wavedec(x,3,'db4');
  ca=appcoef(c,l,'db4',3);%����ϵ��
  x=ca;
  enframex=enframe(x,L,L/2);%���ź�x��֡����ÿ֡��128�������㣬����֮֡����50%�ĵ�����
  [row,col]=size(enframex);%�����У��У�ÿһ�д���һ֡��ÿһ�б�ʾ1��128��������
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
