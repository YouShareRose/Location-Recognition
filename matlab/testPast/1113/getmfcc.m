clear all;
clear all;
dec={'地铁','公交车','长途车','超市','食堂','宿舍'};
fid0=fopen('20130524-1.txt','w'); %训练数据文件
fid1=fopen('20130524-2.txt','w'); %测试数据文件
for k=1:6
        tmp=char(dec(k));
        %获取该设备所有音频参数
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
        L=512;
        MFCCnum=24;
        [MFCC0,mfccres0]=mfccnew2(c0,fs0,MFCCnum,L);
        [MFCC1,mfccres1]=mfccnew2(c1,fs1,MFCCnum,L);
        [MFCC2,mfccres2]=mfccnew2(c2,fs2,MFCCnum,L);
        [MFCC3,mfccres3]=mfccnew2(c3,fs3,MFCCnum,L); 
        for i=1:MFCCnum
            m0(i)=sum(MFCC0(:,i))/length(MFCC0(:,i));
            m1(i)=sum(MFCC1(:,i))/length(MFCC1(:,i));
            m2(i)=sum(MFCC2(:,i))/length(MFCC2(:,i));
            m3(i)=sum(MFCC3(:,i))/length(MFCC3(:,i));
            v0(i)=var(MFCC0(:,i));
            v1(i)=var(MFCC1(:,i));
            v2(i)=var(MFCC2(:,i));
            v3(i)=var(MFCC3(:,i));  
        end
        fprintf(fid0,'%d\t',k);     
        for i=1:MFCCnum   
            fprintf(fid0,'%f\t',m0(i));   
        end
        fprintf(fid0,'\r\n');
        
        fprintf(fid0,'%d\t',k);
        for i=1:MFCCnum   
            fprintf(fid0,'%f\t',m1(i));   
        end    
        
      
        %fprintf(fid0,'%d\t',k);
        %for i=1:MFCCnum   
        %    fprintf(fid0,'%f\t',v0(i));   
        %end
        %fprintf(fid0,'\r\n');
        
        %fprintf(fid0,'%d\t',k);
        %for i=1:MFCCnum   
        %    fprintf(fid0,'%f\t',v1(i));   
        %end
        %fprintf(fid0,'\r\n');      
       
        
        fprintf(fid1,'%d\t',k);     
        for i=1:MFCCnum   
            fprintf(fid1,'%f\t',m2(i));   
        end
        fprintf(fid1,'\r\n');
        
        fprintf(fid1,'%d\t',k);
        for i=1:MFCCnum   
            fprintf(fid1,'%f\t',m3(i));   
        end 
end
fclose(fid0); 
fclose(fid1);                          %写入到记事本中
msgbox('六个环境录音信号特征提取结束', '与文本无关');
