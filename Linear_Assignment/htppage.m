function varargout = htppage(varargin)
% HTPPAGE MATLAB code for htppage.fig
%      HTPPAGE, by itself, creates a new HTPPAGE or raises the existing
%      singleton*.
%
%      H = HTPPAGE returns the handle to a new HTPPAGE or the handle to
%      the existing singleton*.
%
%      HTPPAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HTPPAGE.M with the given input arguments.
%
%      HTPPAGE('Property','Value',...) creates a new HTPPAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before htppage_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to htppage_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help htppage

% Last Modified by GUIDE v2.5 09-Dec-2018 23:29:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @htppage_OpeningFcn, ...
                   'gui_OutputFcn',  @htppage_OutputFcn, ...
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


% --- Executes just before htppage is made visible.
function htppage_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to htppage (see VARARGIN)

% Choose default command line output for htppage
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes htppage wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = htppage_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in backbutt.
function backbutt_Callback(hObject, eventdata, handles)
% hObject    handle to backbutt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(htppage);
mainpage;
