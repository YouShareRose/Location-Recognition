function  getmfcc0(k)
dec={'baseroom','classroom','stairs','subway'};
tmp=char(dec(k));
%��ȡ���豸������Ƶ����
[X1,fs]=audioread([tmp,'.wav']);
c0=X1(19000:100000,1); % ��ֵ��һ��
c0=c0/max(abs(c0));
wlen=400;                       % ֡��
inc=160;                         % ֡��
num=24;
mfcout=mfcc_m(c0,fs,num,wlen,inc); % ��ȡMel�˲�������
switch k
    case 1
        c1=mfcc_m(c0,fs,num,wlen,inc); % ��ȡMel�˲�������
        c1(:,25)=0;
        c1(:,2:25)=c1(:,1:24);
        c1(:,1)=1;
save ('data1.mat','c1');
    case 2
        c2=mfcc_m(c0,fs,num,wlen,inc); % ��ȡMel�˲�������
        c2(:,25)=0;
        c2(:,2:25)=c2(:,1:24);
        c2(:,1)=2;
        save ('data2.mat','c2');
    case 3
        c3=mfcc_m(c0,fs,num,wlen,inc); % ��ȡMel�˲�������
        c3(:,25)=0;
        c3(:,2:25)=c3(:,1:24);
        c3(:,1)=3;
        save ('data3.mat','c3');
    case 4
        c4=mfcc_m(c0,fs,num,wlen,inc); % ��ȡMel�˲�������
        c4(:,25)=0;
        c4(:,2:25)=c4(:,1:24);
        c4(:,1)=4;
        save ('data4.mat','c4');
end

figure(2);
plot(mfcout),title([tmp,'��MFCC��������']);


% fid0=fopen('20130523-1.txt','w'); %ѵ�������ļ�
% fid1=fopen('20130523-2.txt','w'); %���������ļ�
% for k=1:6
%         tmp=char(dec(k));
%         %��ȡ���豸������Ƶ����
%         [x0,fs0]=audioread([tmp,'1.wav']);
%         c0=x0(:,1);
%         c0=c0/max(abs(c0));
%         [x1,fs1]=audioread([tmp,'2.wav']);
%         c1=x1(:,1);
%         c1=c1/max(abs(c1));
%         [x2,fs2]=audioread([tmp,'3.wav']);
%         c2=x2(:,1);
%         c2=c2/max(abs(c2));
%         [x3,fs3]=audioread([tmp,'4.wav']);
%         c3=x3(:,1);
%         c3=c3/max(abs(c3)); 
%         L=512;
%         MFCCnum=24;
%         [MFCC0,mfccres0]=mfccnew2(c0,fs0,MFCCnum,L);
%         [MFCC1,mfccres1]=mfccnew2(c1,fs1,MFCCnum,L);
%         [MFCC2,mfccres2]=mfccnew2(c2,fs2,MFCCnum,L);
%         [MFCC3,mfccres3]=mfccnew2(c3,fs3,MFCCnum,L); 
%         for i=1:MFCCnum
%             m0(i)=sum(MFCC0(:,i))/length(MFCC0(:,i));
%             m1(i)=sum(MFCC1(:,i))/length(MFCC1(:,i));
%             m2(i)=sum(MFCC2(:,i))/length(MFCC2(:,i));
%             m3(i)=sum(MFCC3(:,i))/length(MFCC3(:,i));
%             v0(i)=var(MFCC0(:,i));
%             v1(i)=var(MFCC1(:,i));
%             v2(i)=var(MFCC2(:,i));
%             v3(i)=var(MFCC3(:,i));  
%         end
%         fprintf(fid0,'%d\t',k);     
%         for i=1:MFCCnum   
%             fprintf(fid0,'%f\t',m0(i));   
%         end
%         fprintf(fid0,'\r\n');
%         
%         fprintf(fid0,'%d\t',k);
%         for i=1:MFCCnum   
%             fprintf(fid0,'%f\t',m1(i));   
%         end
%         fprintf(fid0,'\r\n');
%         
%         fprintf(fid0,'%d\t',k);     
%         for i=1:MFCCnum   
%             fprintf(fid0,'%f\t',m2(i));   
%         end
%         fprintf(fid0,'\r\n');
%         
%         fprintf(fid0,'%d\t',k);
%         for i=1:MFCCnum   
%             fprintf(fid0,'%f\t',m3(i));   
%         end
%         fprintf(fid0,'\r\n');
%         %fprintf(fid0,'%d\t',k);
%         %for i=1:MFCCnum   
%         %    fprintf(fid0,'%f\t',v0(i));   
%         %end
%         %fprintf(fid0,'\r\n');
%         
%         %fprintf(fid0,'%d\t',k);
%         %for i=1:MFCCnum   
%         %    fprintf(fid0,'%f\t',v1(i));   
%         %end
%         %fprintf(fid0,'\r\n');      
%        
%         
%         fprintf(fid1,'%d\t',k);     
%         for i=1:MFCCnum   
%             fprintf(fid1,'%f\t',m2(i));   
%         end
%         fprintf(fid1,'\r\n');
%         
%         fprintf(fid1,'%d\t',k);
%         for i=1:MFCCnum   
%             fprintf(fid1,'%f\t',m3(i));   
%         end
%         fprintf(fid1,'\r\n');
% end
% fclose(fid0); 
% fclose(fid1);                          %д�뵽���±���
% msgbox('��������¼���ź�������ȡ����', '���ı��й�');
