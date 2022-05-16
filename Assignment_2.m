function varargout = Assignment_2(varargin)
% ASSIGNMENT_2 MATLAB code for Assignment_2.fig
%      ASSIGNMENT_2, by itself, creates a new ASSIGNMENT_2 or raises the existing
%      singleton*.
%
%      H = ASSIGNMENT_2 returns the handle to a new ASSIGNMENT_2 or the handle to
%      the existing singleton*.
%
%      ASSIGNMENT_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASSIGNMENT_2.M with the given input arguments.
%
%      ASSIGNMENT_2('Property','Value',...) creates a new ASSIGNMENT_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Assignment_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Assignment_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Assignment_2

% Last Modified by GUIDE v2.5 16-May-2022 23:41:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Assignment_2_OpeningFcn, ...
                   'gui_OutputFcn',  @Assignment_2_OutputFcn, ...
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


% --- Executes just before Assignment_2 is made visible.
function Assignment_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Assignment_2 (see VARARGIN)

% Choose default command line output for Assignment_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Assignment_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Assignment_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.DoBot = createDoBotModel([-1 1 -1 1 0 1],0.4);

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Start_PushButton.
function Start_PushButton_Callback(hObject, eventdata, handles)
% hObject    handle to Start_PushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Stop_PushButton.
function Stop_PushButton_Callback(hObject, eventdata, handles)
% hObject    handle to Stop_PushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Red_PushButton.
function Red_PushButton_Callback(hObject, eventdata, handles)
% hObject    handle to Red_PushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Yellow_PushButton.
function Yellow_PushButton_Callback(hObject, eventdata, handles)
% hObject    handle to Yellow_PushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Blue_PushButton.
function Blue_PushButton_Callback(hObject, eventdata, handles)
% hObject    handle to Blue_PushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
