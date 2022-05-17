function varargout = Assignment__2(varargin)
% ASSIGNMENT__2 MATLAB code for Assignment__2.fig
%      ASSIGNMENT__2, by itself, creates a new ASSIGNMENT__2 or raises the existing
%      singleton*.
%
%      H = ASSIGNMENT__2 returns the handle to a new ASSIGNMENT__2 or the handle to
%      the existing singleton*.
%
%      ASSIGNMENT__2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASSIGNMENT__2.M with the given input arguments.
%
%      ASSIGNMENT__2('Property','Value',...) creates a new ASSIGNMENT__2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Assignment__2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Assignment__2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Assignment__2

% Last Modified by GUIDE v2.5 17-May-2022 17:20:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Assignment__2_OpeningFcn, ...
                   'gui_OutputFcn',  @Assignment__2_OutputFcn, ...
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


% --- Executes just before Assignment__2 is made visible.
function Assignment__2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Assignment__2 (see VARARGIN)
handles.Dobot = createDoBotModel([-1 1 -1 1 0 1],0.4);
% Choose default command line output for Assignment__2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Assignment__2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Assignment__2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function Joint1_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to Joint1_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
S1_Pos = get(hObject, 'Value') 
S1_Pos_Max = get(hObject, 'Max') 
S1_Pos_Min = get(hObject, 'Min') 
J_Pos = handles.Dobot.getpos
J_Pos(1) = S1_Pos;
handles.Dobot.animate(J_Pos);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Joint1_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Joint1_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Joint2_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to Joint2_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
S2_Pos = get(hObject, 'Value')
S2_Pos_Max = get(hObject, 'Max')
S2_Pos_Min = get(hObject, 'Min') 
J_Pos = handles.Dobot.getpos
J_Pos(2) = S2_Pos;
handles.Dobot.animate(J_Pos);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Joint2_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Joint2_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Joint3_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to Joint3_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
S3_Pos = get(hObject, 'Value')
S3_Pos_Max = get(hObject, 'Max')
S3_Pos_Min = get(hObject, 'Min') 
J_Pos = handles.Dobot.getpos
J_Pos(3) = S3_Pos;
handles.Dobot.animate(J_Pos);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Joint3_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Joint3_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Joint4_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to Joint4_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
S4_Pos = get(hObject, 'Value')
S4_Pos_Max = get(hObject, 'Max')
S4_Pos_Min = get(hObject, 'Min') 
J_Pos = handles.Dobot.getpos
J_Pos(4) = S4_Pos;
handles.Dobot.animate(J_Pos);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Joint4_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Joint4_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
