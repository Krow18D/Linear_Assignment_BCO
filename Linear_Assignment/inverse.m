function varargout = inverse(varargin)
% INVERSE MATLAB code for inverse.fig
%      INVERSE, by itself, creates a new INVERSE or raises the existing
%      singleton*.
%
%      H = INVERSE returns the handle to a new INVERSE or the handle to
%      the existing singleton*.
%
%      INVERSE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INVERSE.M with the given input arguments.
%
%      INVERSE('Property','Value',...) creates a new INVERSE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before inverse_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to inverse_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help inverse

% Last Modified by GUIDE v2.5 09-Dec-2018 23:31:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @inverse_OpeningFcn, ...
                   'gui_OutputFcn',  @inverse_OutputFcn, ...
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


% --- Executes just before inverse is made visible.
function inverse_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to inverse (see VARARGIN)

% Choose default command line output for inverse
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.question,'ColumnEditable',false);
set(handles.ans,'ColumnEditable',true);
set(handles.submit,'Enable','off');
% UIWAIT makes inverse wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = inverse_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in submit.
function submit_Callback(hObject, eventdata, handles)
% hObject    handle to submit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.question,'columnEditable',false);
set(handles.ansstatus,'Visible','on');
set(handles.submit,'Enable','off');
if get(handles.noans,'Value') == 0
    state = str2double(get(handles.statekeep,'string'))
    realans = get(handles.keep,'Data');
    myans = get(handles.ans,'Data');
    disp('realans');
    disp(realans);
    ssum = sum(round(myans,4) == round(realans,4));
%     ssum = isequal(round(myans,4),round(realans,4));
%     myans
%     realans
    ssum = sum(ssum);
    disp(ssum)
    [x,y] = size(myans);
    set(handles.t_spk,'Visible','on');
    set(handles.t_loop,'Visible','on');
    if (ssum/(x*y)) == 1 && state ==1
        set(handles.ansstatus,'string','Correct');
        set(handles.ansstatus,'ForegroundColor','Green');
    else
        set(handles.ansstatus,'string','Incorrect');
        set(handles.ansstatus,'ForegroundColor','Red');
        set(handles.ans,'Data',realans);
    end
else
    state = str2double(get(handles.statekeep,'string'))
    if state == 1
        set(handles.ansstatus,'string','Incorrect');
        set(handles.ansstatus,'ForegroundColor','Red');
        
    else
        set(handles.ansstatus,'string','Correct');
        set(handles.ansstatus,'ForegroundColor','Green');
        
    end
end

% --- Executes on button press in easy.
function easy_Callback(hObject, eventdata, handles)
% hObject    handle to easy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.question,'Visible','on');
set(handles.select,'Visible','off');
set(handles.ans,'Visible','on');
[Q, Ans ,state ,long_f,long_s ] = BCO_randomQ_INV(2);
set(handles.question,'Data',Q);
set(handles.ans,'Data',zeros([2,2]))
set(handles.keep,'Data',Ans);
set(handles.statekeep,'string',state);
set(handles.submit,'Enable','on');
set(handles.t_spk,'Visible','off');
set(handles.t_loop,'Visible','off');
set(handles.t_spk,'string',strcat(strcat('Spark : ',num2str(long_s)),' s.'));
set(handles.t_loop,'string',strcat(strcat('Loop : ',num2str(long_f)),' s.'));
set(handles.ansstatus,'Visible','off');


% --- Executes on button press in normal.
function normal_Callback(hObject, eventdata, handles)
% hObject    handle to normal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.question,'Visible','on')
set(handles.select,'Visible','off')
set(handles.ans,'Visible','on')
[Q, Ans ,state ,long_f,long_s ] = BCO_randomQ_INV(3);
set(handles.question,'Data',Q);
set(handles.ans,'Data',zeros([3,3]))
set(handles.keep,'Data',Ans);
set(handles.statekeep,'string',state);
set(handles.submit,'Enable','on');
set(handles.t_spk,'Visible','off');
set(handles.t_loop,'Visible','off');
set(handles.t_spk,'string',strcat(strcat('Spark : ',num2str(long_s)),' s.'));
set(handles.t_loop,'string',strcat(strcat('Loop : ',num2str(long_f)),' s.'));
set(handles.ansstatus,'Visible','off');


% --- Executes on button press in hard.
function hard_Callback(hObject, eventdata, handles)
% hObject    handle to hard (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.question,'Visible','on')
set(handles.select,'Visible','off')
set(handles.ans,'Visible','on')
[Q, Ans ,state ,long_f,long_s ] = BCO_randomQ_INV(4);
set(handles.question,'Data',Q);
set(handles.ans,'Data',zeros([4,4]))
set(handles.keep,'Data',Ans);
set(handles.statekeep,'string',state);
set(handles.submit,'Enable','on');
set(handles.t_spk,'Visible','off');
set(handles.t_loop,'Visible','off');
set(handles.t_spk,'string',strcat(strcat('Spark : ',num2str(long_s)),' s.'));
set(handles.t_loop,'string',strcat(strcat('Loop : ',num2str(long_f)),' s.'));
set(handles.ansstatus,'Visible','off');




function editrow_Callback(hObject, eventdata, handles)
% hObject    handle to editrow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editrow as text
%        str2double(get(hObject,'String')) returns contents of editrow as a double


% --- Executes during object creation, after setting all properties.
function editrow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editrow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editcolumn_Callback(hObject, eventdata, handles)
% hObject    handle to editcolumn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editcolumn as text
%        str2double(get(hObject,'String')) returns contents of editcolumn as a double


% --- Executes during object creation, after setting all properties.
function editcolumn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editcolumn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in custom.
function custom_Callback(hObject, eventdata, handles)
% hObject    handle to custom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = str2double(get(handles.editrow,'string'));
y = str2double(get(handles.editcolumn,'string'));
set(handles.question,'Data',zeros([x,y]));
set(handles.question,'Visible','on');
set(handles.select,'Visible','off');
set(handles.ans,'Data',zeros([x,y]));
set(handles.ans,'Visible','on');
set(handles.confirm,'Visible','on');
set(handles.question,'ColumnEditable',true);
set(handles.t_spk,'Visible','off');
set(handles.t_loop,'Visible','off');
set(handles.ansstatus,'Visible','off');


function importtext_Callback(hObject, eventdata, handles)
% hObject    handle to importtext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of importtext as text
%        str2double(get(hObject,'String')) returns contents of importtext as a double


% --- Executes during object creation, after setting all properties.
function importtext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to importtext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.ansstatus,'Visible','off');
[file,path] = uigetfile('*');
selectedfile = fullfile(path,file);
% run(selectedfile);
k = strfind(file,'.');
a = length(file);
nam = file(k:a);
tf1 = strcmp(nam,'.txt');
tf2 = strcmp(nam,'.xlsx');

if tf1
    matA = dlmread(selectedfile);
elseif tf2
    matA = xlsread(selectedfile);
else
    disp('Error to find file');
    
end
set(handles.importtext,'String',selectedfile);
set(handles.question,'Visible','on');
set(handles.question,'Data',matA);
set(handles.select,'Visible','off');
[anss,state,longf] = BCO_INV(matA);
[anS,statS,longs] = BCO_INV_spark(matA);
[x,y] = size(matA);
set(handles.ans,'Data',zeros([x,y]));
set(handles.ans,'Visible','on');
set(handles.keep,'Data',anss);
set(handles.statekeep,'string',state);
set(handles.submit,'Enable','on');
set(handles.t_spk,'Visible','off');
set(handles.t_loop,'Visible','off');
set(handles.t_spk,'string',strcat(strcat('Spark : ',num2str(longs)),' s.'));
set(handles.t_loop,'string',strcat(strcat('Loop : ',num2str(longf)),' s.'));


%d = get(handles.keep,'Data');
%disp(d);


% --- Executes on button press in noans.
function noans_Callback(hObject, eventdata, handles)
% hObject    handle to noans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of noans
if get(handles.noans,'Value')==1
    set(handles.ans,'Enable','off');
else
    set(handles.ans,'Enable','on');
end


% --- Executes on button press in confirm.
function confirm_Callback(hObject, eventdata, handles)
% hObject    handle to confirm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mat = get(handles.question,'Data');
[anss,state,longf] = BCO_INV(mat);
[ansS,stateS,longs] = BCO_INV_spark(mat);
set(handles.keep,'Data',anss);
set(handles.statekeep,'string',state);
set(handles.submit,'Enable','on');
set(handles.question,'ColumnEditable',false);
set(handles.t_spk,'Visible','off');
set(handles.t_loop,'Visible','off');
set(handles.t_spk,'string',strcat(strcat('Spark : ',num2str(longs)),' s.'));
set(handles.t_loop,'string',strcat(strcat('Loop : ',num2str(longf)),' s.'));
set(handles.confirm,'Visible','off');


% --- Executes on button press in backmain.
function backmain_Callback(hObject, eventdata, handles)
% hObject    handle to backmain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(inverse)
mainpage
