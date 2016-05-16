function varargout = detectpoint(varargin)
% DETECTPOINT MATLAB code for detectpoint.fig
%      DETECTPOINT, by itself, creates a new DETECTPOINT or raises the existing
%      singleton*.
%
%      H = DETECTPOINT returns the handle to a new DETECTPOINT or the handle to
%      the existing singleton*.
%
%      DETECTPOINT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DETECTPOINT.M with the given input arguments.
%
%      DETECTPOINT('Property','Value',...) creates a new DETECTPOINT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before detectpoint_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to detectpoint_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help detectpoint

% Last Modified by GUIDE v2.5 16-May-2016 09:37:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @detectpoint_OpeningFcn, ...
                   'gui_OutputFcn',  @detectpoint_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before detectpoint is made visible.
function detectpoint_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to detectpoint (see VARARGIN)

% Choose default command line output for detectpoint
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes detectpoint wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = detectpoint_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in openbutton.
function openbutton_Callback(hObject, eventdata, handles)
% hObject    handle to openbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
axes(handles.wavaxes);cla reset;box on;set(gca,'XTickLabel',[],'YTickLabel',[]);
axes(handles.Energeaxes);cla reset;box on;set(gca,'XTickLabel',[],'YTickLabel',[]);
axes(handles.Zerorateaxes);cla reset;box on;set(gca,'XTickLabel',[],'YTickLabel',[]);
set(handles.T1edit,'string',0);
set(handles.T2edit,'string',0);
set(handles.T3edit,'string',0);
[filename,pathname] = uigetfile({'*.m4a';'*.wav';'*.mp3';'*.flac'},'选择语音文件');
if filename == 0
    return;
end
file=fullfile(pathname,filename);
[signal,fs]=audioread(file);
axes(handles.wavaxes);
plot(signal);
handles.wavsignal=signal;
guidata(hObject,handles);




% --- Executes on button press in prebutton.
function prebutton_Callback(hObject, eventdata, handles)
% hObject    handle to prebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
signal=handles.wavsignal;
signal=filter([1,-0.9375],1,signal);
axes(handles.wavaxes);
plot(signal);
title('预加重后语音波形');
handles.wavsignal=signal;
framelength=256;
framenumber=fix(length(signal)/framelength);
for i=1:framenumber;
    framesignal(i,1:framelength)=signal((i-1)*framelength+1:i*framelength);
end
handles.framesignal=framesignal;
guidata(hObject,handles);


% --- Executes on button press in Energebutton.
function Energebutton_Callback(hObject, eventdata, handles)
% hObject    handle to Energebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
framesignal=handles.framesignal;
framenumber=size(framesignal,1);
for i=1:framenumber;
    E(i)=0;
    E(i)=sum(framesignal(i,:).^2);
end
axes(handles.Energeaxes);
plot(E);
handles.E=E;
guidata(hObject,handles);


% --- Executes on button press in Zeroratebutton.
function Zeroratebutton_Callback(hObject, eventdata, handles)
% hObject    handle to Zeroratebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
framesignal=handles.framesignal;
framenumber=size(framesignal,1);
framelength=size(framesignal,2);

for i=1:framenumber;
    Z(i)=0;
    for j=2:framelength-1;
        Z(i)=Z(i)+abs(sin(framesignal(i,j))-sign(framesignal(j,j-1)));
    end
end
axes(handles.Zerorateaxes);
plot(Z);
handles.Z=Z;
handles.framelength=framelength;
guidata(hObject,handles);


% --- Executes on button press in Detectpointbutton.
function Detectpointbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Detectpointbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
TL=handles.TL;
TH=handles.TH;
ZT=handles.ZT;
E=handles.E;
Z=handles.Z;
startflag=1;
startframe=11;
i=11;
while(startflag)
    if(E(i)>TL&E(i+1)>TH)
        startfrme=i;
        startflag=0;
    else
        i=i+1;
    end
end
accustartflag=1;
accustartframe=startframe-15;
i=accustartframe;
if i<3
    i=3;
end
k=0;
while(accustartflag)
    if(Z(i)>ZT)
        k=k+1;
        if(k==3)
            accustartflag=0;
            accustartflat=i-3;
            startframe=accustartframe;
        end
    else
        k=0;
    end
    i=i+1;
end
endflag=1;
endframe=length(E);
i=endframe;
while(endflag)
    if(i==1)
        break;
    end
    if(E(i)>TL&E(i-1)>TH)
        endframe=i;
        endflag=0;
    else
        i=i-1;
    end
end
accuendflag=1;
accuendframe=endframe+15;
i=accuendframe;
k=0;
while(accuendflag)
    if(i>length(Z))
        break;
    end
    if(Z(i)>ZT)
        k=k+1;
        if(k==3)
            accuendflag=0;
            accuendframe=i;
            andframe=accuendframe;
        end
    else
        k=0;
    end
    i=i+1;
end
mins=min(handles.wavsignal);
maxs=max(handles.wavsignal);
axes(handles.wavaxes);
plot(handles.wavsignal);
hold on;

framelength=256;
line([startframe*framelength startframe*framelength],...
    [maxs mins],'color','b');
hold on;
line([endframe*framelength endframe*framelength],...
    [maxs mins],'color','b');

    


function T1edit_Callback(hObject, eventdata, handles)
% hObject    handle to T1edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of T1edit as text
%        str2double(get(hObject,'String')) returns contents of T1edit as a double


% --- Executes during object creation, after setting all properties.
function T1edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to T1edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function T2edit_Callback(hObject, eventdata, handles)
% hObject    handle to T2edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of T2edit as text
%        str2double(get(hObject,'String')) returns contents of T2edit as a double
clc;
axes(handles.Energeaxes); cla reset;box on;
set(gca,'XTickLabel',[],'YTickLabel',[]);
a=get(handles.T1edit,'string');
b=get(handles.T2edit,'string');
a=str2num(a);
b=str2num(b);
E=handles.E;
MeanE=mean(E(1:10));
MINE=min(E);
MAXE=max(E);
I1=a*(MAXE-MINE)+MINE;
I2=b*MINE;
TL=min(I1,I2);
TH=5*TL;
axes(handles.Energeaxes);
plot(E);
hold on;
line([1 length(E)],[TL TL],'color','b');
hold on;
line([1 length(E)],[TH TH],'color','r');
handles.TL=TL;
handles.TH=TH;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function T2edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to T2edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function T3edit_Callback(hObject, eventdata, handles)
% hObject    handle to T3edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of T3edit as text
%        str2double(get(hObject,'String')) returns contents of T3edit as a double
clc;
axes(handles.Zerorateaxes); cla reset;box on;
set(gca,'XTickLabel',[],'YTickLabel',[]);
v=get(handles.T3edit,'string');
v=str2num(v);
Z=handles.Z;
MeanZ=mean(Z(1:10));
VarZ=std(Z(1:10));
ZT=min(v,MeanZ+VarZ);
axes(handles.Zerorateaxes);
plot(Z);
hold on;
line([1 length(Z)],[ZT ZT],'color','b');
handles.ZT=ZT;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function T3edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to T3edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
