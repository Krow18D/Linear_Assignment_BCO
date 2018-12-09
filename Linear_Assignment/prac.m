function varargout = prac(varargin)
% PRAC MATLAB code for prac.fig
%      PRAC, by itself, creates a new PRAC or raises the existing
%      singleton*.
%
%      H = PRAC returns the handle to a new PRAC or the handle to
%      the existing singleton*.
%
%      PRAC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRAC.M with the given input arguments.
%
%      PRAC('Property','Value',...) creates a new PRAC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before prac_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to prac_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help prac

% Last Modified by GUIDE v2.5 10-Dec-2018 00:06:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @prac_OpeningFcn, ...
                   'gui_OutputFcn',  @prac_OutputFcn, ...
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


% --- Executes just before prac is made visible.
function prac_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to prac (see VARARGIN)

% Choose default command line output for prac
handles.output = hObject;

% Update handles structure 
guidata(hObject, handles);
ans = handles.anstable;
set(ans,'Data',zeros([3,1]));
set(handles.submit,'Enable','off');
% UIWAIT makes prac wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = prac_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in easy.
function easy_Callback(hObject, eventdata, handles)
% hObject    handle to easy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.statusAns,'Visible','off');
[data,anss,state,longf,longs] = BCO_randomQ_GJ(2);
set(handles.questiontable,'Visible','on');
set(handles.message,'Visible','off');
set(handles.questiontable,'Data',data);
set(handles.anstable,'Data',zeros([2,1]));
set(handles.keep,'Data',anss);
set(handles.statekeep,'string',state);
set(handles.submit,'Enable','on');
set(handles.t_spk,'Visible','off');
set(handles.t_loop,'Visible','off');
set(handles.t_spk,'string',strcat(strcat('Spark : ',num2str(longs)),' s.'));
set(handles.t_loop,'string',strcat(strcat('Loop : ',num2str(longf)),' s.'));
%d = get(handles.keep,'Data');
%disp(d);

% --- Executes on button press in normal.
function normal_Callback(hObject, eventdata, handles)
% hObject    handle to normal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.statusAns,'Visible','off');
[data,anss,state,longf,longs] = BCO_randomQ_GJ(3);
set(handles.questiontable,'Visible','on');
set(handles.message,'Visible','off');
set(handles.questiontable,'Data',data);
set(handles.anstable,'Data',zeros([3,1]));
set(handles.keep,'Data',anss);
set(handles.statekeep,'string',state);
set(handles.submit,'Enable','on');
set(handles.t_spk,'Visible','off');
set(handles.t_loop,'Visible','off');
set(handles.t_spk,'string',strcat(strcat('Spark : ',num2str(longs)),' s.'));
set(handles.t_loop,'string',strcat(strcat('Loop : ',num2str(longf)),' s.'));
%d = get(handles.keep,'Data');
%disp(d);

% --- Executes on button press in hard.
function hard_Callback(hObject, eventdata, handles)
% hObject    handle to hard (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.statusAns,'Visible','off');
[data,anss,state,longf,longs] = BCO_randomQ_GJ(4);
set(handles.questiontable,'Visible','on');
set(handles.message,'Visible','off');
set(handles.questiontable,'Data',data);
set(handles.anstable,'Data',zeros([4,1]));
set(handles.keep,'Data',anss);
set(handles.statekeep,'string',state);
set(handles.submit,'Enable','on');
set(handles.t_spk,'Visible','off');
set(handles.t_loop,'Visible','off');
set(handles.t_spk,'string',strcat(strcat('Spark : ',num2str(longs)),' s.'));
set(handles.t_loop,'string',strcat(strcat('Loop : ',num2str(longf)),' s.'));
%d = get(handles.keep,'Data');
%disp(d);

% --- Executes on button press in submit.
function submit_Callback(hObject, eventdata, handles)
% hObject    handle to submit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.statusAns,'Visible','on');
set(handles.submit,'Enable','off');
if get(handles.oneso,'Value') == 1
    state = str2double(get(handles.statekeep,'string'))
    realans = get(handles.keep,'Data');
    myans = get(handles.anstable,'Data');
    disp('realans');
    disp(realans);
    %disp(myans);
    ssum = sum(myans == realans);
    %disp('ssum');
    %disp(ssum);
    [x,y] = size(myans);
    %disp(size(realans));
    %disp(size(myans));
    %disp(myans == realans);
    set(handles.t_spk,'Visible','on');
    set(handles.t_loop,'Visible','on');
    if (ssum/x) == 1 && state ==1
        set(handles.statusAns,'string','Correct');
        set(handles.statusAns,'ForegroundColor','Green');
    else
        set(handles.statusAns,'string','Incorrect');
        set(handles.statusAns,'ForegroundColor','Red');
        set(handles.anstable,'Data',realans);
    end
elseif get(handles.multino,'Value') == 1
    state = str2double(get(handles.statekeep,'string'))
    if state ~= 1
        set(handles.statusAns,'string','Correct');
        set(handles.statusAns,'ForegroundColor','Green');
    else 
        set(handles.statusAns,'string','Incorrect');
        set(handles.statusAns,'ForegroundColor','Red');
    end
    
end


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
set(handles.statusAns,'Visible','off');
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
set(handles.questiontable,'Visible','on');
set(handles.questiontable,'Data',matA);
set(handles.message,'Visible','off');
[anss,state,longf] = BCO_GJ(matA);
[anS,statS,longs] = BCO_GJ_spark(matA);
[x,y] = size(matA);
set(handles.anstable,'Data',zeros([x,1]));
set(handles.keep,'Data',anss);
set(handles.statekeep,'string',state);
set(handles.submit,'Enable','on');
set(handles.t_spk,'Visible','off');
set(handles.t_loop,'Visible','off');
set(handles.t_spk,'string',strcat(strcat('Spark : ',num2str(longs)),' s.'));
set(handles.t_loop,'string',strcat(strcat('Loop : ',num2str(longf)),' s.'));
%d = get(handles.keep,'Data');
%disp(d);


% --- Executes on button press in oneso.
function oneso_Callback(hObject, eventdata, handles)
% hObject    handle to oneso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of oneso
ans = handles.anstable;
set(ans,'Enable','on');


% --- Executes on button press in multino.
function multino_Callback(hObject, eventdata, handles)
% hObject    handle to multino (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of multino
ans = handles.anstable;
set(ans,'Enable','off');



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
set(handles.statusAns,'Visible','off');
x = str2double(get(handles.editrow,'string'));
y = str2double(get(handles.editcolumn,'string'));
set(handles.questiontable,'Data',zeros([x,y]));
set(handles.questiontable,'Visible','on');
set(handles.message,'Visible','off');
set(handles.anstable,'Data',zeros([x,1]));
set(handles.confirmdata,'Visible','on');
set(handles.questiontable,'ColumnEditable',true);
set(handles.t_spk,'Visible','off');
set(handles.t_loop,'Visible','off');


% --- Executes on button press in confirmdata.
function confirmdata_Callback(hObject, eventdata, handles)
% hObject    handle to confirmdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mat = get(handles.questiontable,'Data');
[anss,state,longf] = BCO_GJ(mat);
[ansS,stateS,longs] = BCO_GJ_spark(mat);
set(handles.keep,'Data',anss);
set(handles.statekeep,'string',state);
set(handles.submit,'Enable','on');
set(handles.questiontable,'ColumnEditable',false);
set(handles.t_spk,'Visible','off');
set(handles.t_loop,'Visible','off');
set(handles.t_spk,'string',strcat(strcat('Spark : ',num2str(longs)),' s.'));
set(handles.t_loop,'string',strcat(strcat('Loop : ',num2str(longf)),' s.'));
set(handles.confirmdata,'Visible','off');
%d = get(handles.keep,'Data');
%disp(d);


% --- Executes on button press in backmain.
function backmain_Callback(hObject, eventdata, handles)
% hObject    handle to backmain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(prac)
mainpage
