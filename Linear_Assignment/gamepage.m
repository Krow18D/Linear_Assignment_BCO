function varargout = gamepage(varargin)
% GAMEPAGE MATLAB code for gamepage.fig
%      GAMEPAGE, by itself, creates a new GAMEPAGE or raises the existing
%      singleton*.
%
%      H = GAMEPAGE returns the handle to a new GAMEPAGE or the handle to
%      the existing singleton*.
%
%      GAMEPAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAMEPAGE.M with the given input arguments.
%
%      GAMEPAGE('Property','Value',...) creates a new GAMEPAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gamepage_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gamepage_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gamepage

% Last Modified by GUIDE v2.5 09-Dec-2018 21:12:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gamepage_OpeningFcn, ...
                   'gui_OutputFcn',  @gamepage_OutputFcn, ...
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


% --- Executes just before gamepage is made visible.
function gamepage_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gamepage (see VARARGIN)

% Choose default command line output for gamepage
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
set(handles.inputnum,'String','')
set(handles.inputnum,'Enable','off');
set(handles.realtimes,'String','00');
set(handles.start,'Enable','on');
set(handles.confirmbutt,'Enable','off');
set(handles.backbutt,'Enable','on');
set(handles.text6,'String','Let''s start the game!');
set(handles.text6,'ForegroundColor','Green');
global randd
global count
% UIWAIT makes gamepage wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gamepage_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.inputnum,'String','')
global randd
global count
randd = randi([-1000,1000],1,1);
count = 10;
disp(randd);
disp(count);
set(handles.inputnum,'Enable','on');
set(handles.realtimes,'String',num2str(count));
set(handles.text6,'FontSize',20);
set(handles.text6,'String','Guess the number ...');
set(handles.text6,'ForegroundColor','White');
% set(handles.start,'Enable','off');
set(handles.confirmbutt,'Enable','on');
set(handles.uipanel2,'Title','Previous number');
set(handles.prevnum,'String','');
% --- Executes on button press in restartbutt.
function restartbutt_Callback(hObject, eventdata, handles)
% hObject    handle to restartbutt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function inputnum_Callback(hObject, eventdata, handles)
%     confirmbutt_Callback(hObject, eventdata, handles)
% hObject    handle to inputnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputnum as text
%        str2double(get(hObject,'String')) returns contents of inputnum as a double


% --- Executes during object creation, after setting all properties.
function inputnum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in confirmbutt.
function confirmbutt_Callback(hObject, eventdata, handles)
% hObject    handle to confirmbutt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global randd
global count
num = str2num(get(handles.inputnum,'String'));
disp(num)
if isempty(num)
    set(handles.text6,'FontSize',20);
    set(handles.text6,'ForegroundColor','White');
    set(handles.text6,'String','Please enter the number');
    disp('hi')
elseif num > 1000 || num < -1000
    set(handles.text6,'FontSize',18);
    set(handles.text6,'ForegroundColor','White');
    set(handles.text6,'String','Please enter the number again');
    disp('hello')
elseif num <= 1000 && num >= -1000
    disp('wow')
    count = count - 1;
    disp(count);
    set(handles.realtimes,'String',num2str(count));
    if count == 0
        set(handles.text6,'FontSize',28);
        set(handles.text6,'ForegroundColor',[0 0.2 0]);
        set(handles.text6,'String','You LOST!');
        set(handles.uipanel2,'Title','Answer!');
        set(handles.prevnum,'String',num2str(randd));
        set(handles.confirmbutt,'Enable','off'); 
        randd2 = randi([0,1],1,1);
        if randd2 == 0
            prac;
        elseif randd2 == 1
            inverse;
        end
        close(gamepage);
    elseif num > randd
        set(handles.text6,'FontSize',20);
        set(handles.text6,'ForegroundColor',[1 0 1]);
        set(handles.text6,'String','Your number is HIGHER!');
        set(handles.prevnum,'String',num2str(num));
    elseif num < randd
        set(handles.text6,'FontSize',20);
        set(handles.text6,'ForegroundColor','Cyan');
        set(handles.text6,'String','Your number is LOWER!');
        set(handles.prevnum,'String',num);   
    else
        set(handles.text6,'FontSize',28);
        set(handles.text6,'ForegroundColor','Yellow');
        set(handles.text6,'String','YOU WIN!!!!');
        set(handles.prevnum,'String',num); 
        set(handles.confirmbutt,'Enable','off');
    end
end
% --- Executes on button press in backbutt.
function backbutt_Callback(hObject, eventdata, handles)
% hObject    handle to backbutt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gamepage);
mainpage;


function prevnum_Callback(hObject, eventdata, handles)
% hObject    handle to prevnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of prevnum as text
%        str2double(get(hObject,'String')) returns contents of prevnum as a double


% --- Executes during object creation, after setting all properties.
function prevnum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to prevnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
