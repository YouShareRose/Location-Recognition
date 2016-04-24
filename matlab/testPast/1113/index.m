clf,close all;clear all;

figure(1);
set(gcf,'menubar','none');

H=uimenu(gcf,'label','环境录音');
H1=uimenu(H,'label','环境录音波形');
H10=uimenu(H1,'label','baseroom','Callback','getwav(1)');
H11=uimenu(H1,'label','classroom','Callback','getwav(2)');
H12=uimenu(H1,'label','stairs','Callback','getwav(3)');
H13=uimenu(H1,'label','subway','Callback','getwav(4)');
% 
% H2=uimenu(H,'label','语谱图');
% H20=uimenu(H2,'label','地铁','Callback','getspecgram(1)');
% H21=uimenu(H2,'label','公交车','Callback','getspecgram(2)');
% H22=uimenu(H2,'label','长途车','Callback','getspecgram(3)');
% H23=uimenu(H2,'label','超市','Callback','getspecgram(4)');
% H24=uimenu(H2,'label','食堂','Callback','getspecgram(5)');
% H25=uimenu(H2,'label','宿舍','Callback','getspecgram(6)');

S=uimenu(gcf,'label','特征提取');
S1=uimenu(S,'label','baseroom','Callback','getmfcc0(1)');
S2=uimenu(S,'label','classroom','Callback','getmfcc0(2)');
S3=uimenu(S,'label','stairs','Callback','getmfcc0(3)');
S4=uimenu(S,'label','subway','Callback','getmfcc0(4)');
% S2=uimenu(S,'label','与文本无关特征提取','Callback','getmfcc');


R=uimenu(gcf,'label','训练与识别');
R1=uimenu(R,'label','BP神经网络','Callback','BP');
% R1=uimenu(R,'label','BP神经网络（与文本有关）','Callback','devicebp1');
% R2=uimenu(R,'label','BP神经网络（与文本无关）','Callback','devicebp2');

filename = 'title.jpg';
imgRgb = imread(filename); % 读入一幅彩色图像
imshow(imgRgb); % 显示彩色图像