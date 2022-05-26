function varargout = Assignment_2_real_DoBot(varargin)
% Assignment_2_real_DoBot MATLAB code for Assignment_2_real_DoBot.fig
%      Assignment_2_real_DoBot, by itself, creates a new Assignment_2_real_DoBot or raises the existing
%      singleton*.
%
%      H = Assignment_2_real_DoBot returns the handle to a new Assignment_2_real_DoBot or the handle to
%      the existing singleton*.
%
%      Assignment_2_real_DoBot('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Assignment_2_real_DoBot.M with the given input arguments.
%
%      Assignment_2_real_DoBot('Property','Value',...) creates a new Assignment_2_real_DoBot or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Assignment_2_real_DoBot_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Assignment_2_real_DoBot_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Assignment_2_real_DoBot

% Last Modified by GUIDE v2.5 26-May-2022 15:51:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Assignment_2_real_DoBot_OpeningFcn, ...
                   'gui_OutputFcn',  @Assignment_2_real_DoBot_OutputFcn, ...
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


% --- Executes just before Assignment_2_real_DoBot is made visible.
function Assignment_2_real_DoBot_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Assignment_2_real_DoBot (see VARARGIN)

% Create DoBot and environment
[handles.Dobot, handles.inks] = createDoBotModel([-1 1 -1 1 0 1],0.4);

% E-Stop set up
handles.eStop = eStopButton; % Create an object of the eStopButton class
eStopListener = addlistener(handles.eStop,'eStop',@eStopFunction);

% DoBot Status
set(handles.text3, 'string', "DoBot Ready.")

% Choose default command line output for Assignment_2_real_DoBot
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Assignment_2_real_DoBot wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Assignment_2_real_DoBot_OutputFcn(hObject, eventdata, handles) 
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
S1_Pos = get(hObject, 'Value');
J_Pos = handles.Dobot.getpos;
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
S2_Pos = get(hObject, 'Value');
J_Pos = handles.Dobot.getpos;
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
S3_Pos = get(hObject, 'Value');
J_Pos = handles.Dobot.getpos;
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
S4_Pos = get(hObject, 'Value');
J_Pos = handles.Dobot.getpos;
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


% --- Executes on button press in E_stop_toggle.
function E_stop_toggle_Callback(hObject, eventdata, handles)
% hObject    handle to E_stop_toggle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if get(hObject, 'Value') == 1
    % Set value of resume button to 1 and disable button
    set(handles.resume_button, 'Value', 1);
    set(handles.resume_button, 'Enable', 'off');
    set(handles.text3, 'string', "WARNING: E-Stop Active")
    
    % Disable push buttons
    set(handles.Red_PushButton, 'Enable', 'off');
    set(handles.Blue_PushButton, 'Enable', 'off');
    set(handles.Green_PushButton, 'Enable', 'off');
    set(handles.get_pose_button, 'Enable', 'off');
    set(handles.return_home, 'Enable', 'off');
    
    % Disable sliders
    set(handles.Joint1_Slider, 'Enable', 'off');
    set(handles.Joint2_Slider, 'Enable', 'off');
    set(handles.Joint3_Slider, 'Enable', 'off');
    set(handles.Joint4_Slider, 'Enable', 'off');
    
    waitfor(hObject, 'Value', 0); % wait till E-Stop is turned off
    while(1)
        set(handles.text3, 'string', "Press RESUME to continue")
        set(handles.resume_button, 'Enable', 'on') % Enable resume button
        waitfor(handles.resume_button, 'Value', 0) % Wait for resume button to be pushed
        break
    end
    
    % Enable buttons again
    set(handles.Red_PushButton, 'Enable', 'on');
    set(handles.Blue_PushButton, 'Enable', 'on');
    set(handles.Green_PushButton, 'Enable', 'on');
    set(handles.get_pose_button, 'Enable', 'on');
    set(handles.return_home, 'Enable', 'on');
    
    % Enable sliders again
    set(handles.Joint1_Slider, 'Enable', 'on');
    set(handles.Joint2_Slider, 'Enable', 'on');
    set(handles.Joint3_Slider, 'Enable', 'on');
    set(handles.Joint4_Slider, 'Enable', 'on');
    set(handles.text3, 'string', "DoBot Ready.")
end



% --- Executes during object creation, after setting all properties.
function E_stop_toggle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to E_stop_toggle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Red_PushButton.
function Red_PushButton_Callback(hObject, eventdata, handles)
% hObject    handle to Red_PushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if get(hObject, 'Value') == 1
    set(handles.text3, 'string', "Loading red ink cartridge...")
    set(handles.Red_PushButton, 'Enable', 'off');
    
    newQ = [-0.75398, 0.29505, -0.34207, 0]; % Pose to pick up red block
    Q = handles.Dobot.getpos; % Initial pose
    handles.Dobot.plot3d(MoveJoint(Q, newQ)); % Move to block
    
    dobot_q = [0.1569, -0.2430, 0.0473]; % move above ink
    Move_End_Effector(dobot_q);
    
    pause(2)
    
    dobot_q = [0.1569, -0.2430, -0.0117]; % Move to ink and pick up
    Move_End_Effector(dobot_q);
    tool_state(1);
    
    pause(2)
    
    default_pos = [0.2589,0,0.0482]; % move to mid
    Move_End_Effector(default_pos);
    
    pause(2)
    
    dobot_q = [0.0063, 0.2668, 0.1150]; % move to drop off point
    Move_End_Effector(dobot_q);
    
    pause(5)
    tool_state(0); % release
    
    printerHighQ = [1.5551, -0.36314, -0.40678, 0.72];
    MoveJointWithInk(handles.Dobot,newQ, printerHighQ,handles.inks{1}); % Move to above printer
    printerQ = [1.5551, 0.18157, -0.35131, 0.16];
    MoveJointWithInk(handles.Dobot,printerHighQ,printerQ,handles.inks{1}); % Insert ink cartridge
    
    set(handles.text3, 'string', "Done!")
end





% --- Executes on button press in Blue_PushButton.
function Blue_PushButton_Callback(hObject, eventdata, handles)
% hObject    handle to Blue_PushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if get(hObject, 'Value') == 1
    set(handles.text3, 'string', "Loading blue ink cartridge...")
    set(handles.Blue_PushButton, 'Enable', 'off');
    
    newQ = [-1.5551, -0.024966, 0.40609, -0.2]; % Pose to pick up red block
    Q = handles.Dobot.getpos; % Initial pose
    handles.Dobot.plot3d(MoveJoint(Q, newQ)); % Move to block
    
    dobot_q = [-0.0030, -0.2491, 0.0473]; % move above ink
    Move_End_Effector(dobot_q);
    
    pause(2)
    
    dobot_q = [-0.0030, -0.2491, -0.0113]; % Move to ink and pick up
    Move_End_Effector(dobot_q);
    tool_state(1);
    
    pause(2)
    
    default_pos = [0.2589,0,0.0482]; % move to mid
    Move_End_Effector(default_pos);
    
    pause(2)
    
    dobot_q = [0.0063, 0.2668, 0.1150]; % move to drop off point
    Move_End_Effector(dobot_q);
    
    pause(8)
    tool_state(0); % release
    
    printerHighQ = [1.5551, -0.36314, -0.40678, 0.72];
    MoveJointWithInk(handles.Dobot,newQ, printerHighQ,handles.inks{3}); % Move to above printer
    printerQ = [1.5551, 0.18157, -0.35131, 0.16];
    MoveJointWithInk(handles.Dobot,printerHighQ,printerQ,handles.inks{3}); % Insert ink cartridge
    
    set(handles.text3, 'string', "Done!")
end



% --- Executes on button press in Green_PushButton.
function Green_PushButton_Callback(hObject, eventdata, handles)
% hObject    handle to Green_PushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if get(hObject, 'Value') == 1
    set(handles.text3, 'string', "Loading green ink cartridge...")
    set(handles.Green_PushButton, 'Enable', 'off');
    
    newQ = [-1.0839, -0.090786, 0.24892, -0.18]; % Pose to pick up red block
    Q = handles.Dobot.getpos; % Initial pose
    handles.Dobot.plot3d(MoveJoint(Q, newQ)); % Move to block
    
    dobot_q = [0.0731, -0.2496, 0.0473]; % move above ink
    Move_End_Effector(dobot_q);
    
    pause(2)
    
    dobot_q = [0.0731, -0.2496, -0.0134]; % Move to ink and pick up
    Move_End_Effector(dobot_q);
    tool_state(1);
    
    pause(2)
    
    default_pos = [0.2589,0,0.0482]; % move to mid
    Move_End_Effector(default_pos);
    
    pause(2)
    
    dobot_q = [0.0063, 0.2668, 0.1150]; % move to drop off point
    Move_End_Effector(dobot_q);
    
    pause(5)
    tool_state(0); % release
    
    printerHighQ = [1.5551, -0.36314, -0.40678, 0.72];
    MoveJointWithInk(handles.Dobot,newQ, printerHighQ,handles.inks{2}); % Move to above printer
    printerQ = [1.5551, 0.18157, -0.35131, 0.16];
    MoveJointWithInk(handles.Dobot,printerHighQ,printerQ,handles.inks{2}); % Insert ink cartridge
    
    set(handles.text3, 'string', "Done!")
end


% --- Executes on button press in Start_PushButtonWrong.
function Start_PushButtonWrong_Callback(hObject, eventdata, handles)
% hObject    handle to Start_PushButtonWrong (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Start_PushButton.
function Start_PushButton_Callback(hObject, eventdata, handles)
% hObject    handle to Start_PushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if get(hObject, 'Value') == 1
    % Initialise Dobot -------------------------------------
    rosshutdown
    rosinit;

    fprintf('Intialising...\n');

    [safetyStatePublisher,safetyStateMsg] = rospublisher('/dobot_magician/target_safety_status');
    safetyStateMsg.Data = 2;
    send(safetyStatePublisher,safetyStateMsg);

    [toolStatePub, toolStateMsg] = rospublisher('/dobot_magician/target_tool_state');
    [targetEndEffectorPub,targetEndEffectorMsg] = rospublisher('/dobot_magician/target_end_effector_pose');
    endEffectorPoseSubscriber = rossubscriber('/dobot_magician/end_effector_poses');

    default_pos = [0.2589,0,0.0482];
    ground_level = -0.0589;

    currentSafetyStatus = 0;

    safetyStatusSubscriber = rossubscriber('/dobot_magician/safety_status');
    pause(2); %Allow some time for MATLAB to start the subscriber
    while(currentSafetyStatus ~=4)
        currentSafetyStatus = safetyStatusSubscriber.LatestMessage.Data;
    end

    fprintf('Safety Loop Done.\n');

    % End initialisation --------------------------------
end


% --- Executes on button press in get_pose_button.
function get_pose_button_Callback(hObject, eventdata, handles)
% hObject    handle to get_pose_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if get(hObject, 'Value') == 1
    coordinates = handles.Dobot.fkine(handles.Dobot.getpos);
    coordinates = coordinates(1:3,4);
    set(handles.text3, 'string', num2str(coordinates))
end


% --- Executes on button press in resume_button.
function resume_button_Callback(hObject, eventdata, handles)
% hObject    handle to resume_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in return_home.
function return_home_Callback(hObject, eventdata, handles)
% hObject    handle to return_home (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    Q = handles.Dobot.getpos; % Initial pose
    newQ = [0,0,0,0]; % Home pose
    handles.Dobot.plot3d(MoveJoint(Q, newQ)); % Move to block

    default_pos = [0.2589,0,0.0482]; % move to mid
    Move_End_Effector(default_pos);

    pause(2)

    set(handles.text3, 'string', "DoBot Ready.")
