clf,close all;clear all;

figure(1);
set(gcf,'menubar','none');

H=uimenu(gcf,'label','����¼��');
H1=uimenu(H,'label','����¼������');
H10=uimenu(H1,'label','baseroom','Callback','getwav(1)');
H11=uimenu(H1,'label','classroom','Callback','getwav(2)');
H12=uimenu(H1,'label','stairs','Callback','getwav(3)');
H13=uimenu(H1,'label','subway','Callback','getwav(4)');
% 
% H2=uimenu(H,'label','����ͼ');
% H20=uimenu(H2,'label','����','Callback','getspecgram(1)');
% H21=uimenu(H2,'label','������','Callback','getspecgram(2)');
% H22=uimenu(H2,'label','��;��','Callback','getspecgram(3)');
% H23=uimenu(H2,'label','����','Callback','getspecgram(4)');
% H24=uimenu(H2,'label','ʳ��','Callback','getspecgram(5)');
% H25=uimenu(H2,'label','����','Callback','getspecgram(6)');

S=uimenu(gcf,'label','������ȡ');
S1=uimenu(S,'label','baseroom','Callback','getmfcc0(1)');
S2=uimenu(S,'label','classroom','Callback','getmfcc0(2)');
S3=uimenu(S,'label','stairs','Callback','getmfcc0(3)');
S4=uimenu(S,'label','subway','Callback','getmfcc0(4)');
% S2=uimenu(S,'label','���ı��޹�������ȡ','Callback','getmfcc');


R=uimenu(gcf,'label','ѵ����ʶ��');
R1=uimenu(R,'label','BP������','Callback','BP');
% R1=uimenu(R,'label','BP�����磨���ı��йأ�','Callback','devicebp1');
% R2=uimenu(R,'label','BP�����磨���ı��޹أ�','Callback','devicebp2');

filename = 'title.jpg';
imgRgb = imread(filename); % ����һ����ɫͼ��
imshow(imgRgb); % ��ʾ��ɫͼ��