%% GUI

UI = GUI();

powerButton = UI.PowerButton;

%Lamp Control
lampOff = [0,0,0];
lampRed = [1,0,0];
lampGreen = [0,1,0];

power_lamp = UI.Lamp_power;
ARM_lamp = UI.Lamp_ARM;
blueCap_lamp = UI.Lamp_blueCap;
blueInv_lamp = UI.Lamp_blueInv;
redCap_lamp = UI.Lamp_redCap;
redInv_lamp = UI.Lamp_redInv;
greenCap_lamp = UI.Lamp_greenCap;
greenInv_lamp = UI.Lamp_greenInv;

%Meters
redCap_meter = UI.RedCapacityGauge;
redInv_meter = UI.RedInventoryGauge;
greenCap_meter = UI.GreenCapacityGauge;
greenInv_meter = UI.GreenInventoryGauge;
blueCap_meter = UI.BlueCapacityGauge;
blueInv_meter = UI.BlueInventoryGauge;

pause(5)

power_lamp.Color = lampGreen;
redCap_lamp.Color = lampGreen;
redInv_lamp.Color = lampRed;
greenCap_lamp.Color = lampGreen;
greenInv_lamp.Color = lampGreen;
blueCap_lamp.Color = lampGreen;
blueInv_lamp.Color = lampRed;

red_cap = 55;
green_cap = 78;
blue_cap = 34;

redInv_meter.Value = 0;
greenInv_meter.Value = 1;
blueInv_meter.Value = 0;

%For demo purposes only - no practical use
for i = 0:1:78
    if redCap_meter.Value < red_cap
        redCap_meter.Value = redCap_meter.Value + 1;
    end

    if greenCap_meter.Value < green_cap
            greenCap_meter.Value = greenCap_meter.Value + 1;
    end

    if blueCap_meter.Value < blue_cap
        blueCap_meter.Value = blueCap_meter.Value + 1;
    end
    pause(0.03)
end

%% Dobot
disp('Loading Dobot...');

% %D&H Parameters
L1 = Link('alpha',-pi/2,'a',0,'d',0.08,'offset',0,'qlim',[-2.3562,2.3562]);
L2 = Link('alpha',0,'a',0.138,'d',0,'offset',deg2rad(-45),'qlim',[-0.0873,1.3963]);
L3 = Link('alpha',0,'a',0.16,'d',0,'offset',deg2rad(90),'qlim',[-0.1745,1.6581]);
L4 = Link('alpha',0,'a',0.08,'d',0,'offset',deg2rad(45));

%Creating the Dobot
Dobot = SerialLink([L1 L2 L3 L4],'name','Dobot');

%initial pose and base
defaultQ = [0 0 0 0];
Dobot.base = transl(0,0,0.055);

%Figure setup
scale = 0.4;

%Toggle environment to increase performance
workspace = [-0.5 0.5 -0.5 0.5 0 0.5];

%Loading custom 3D model
for i = 0:Dobot.n
    [faces,vertices,ply_data{i+1}] = plyread(['link',num2str(i),'.ply']);
    Dobot.faces{i+1} = faces;
    Dobot.points{i+1} = vertices;
end

%Plotting Dobot
Dobot.plotopt3d = {'wrist', 'xyz', 'arrow'};
Dobot.plot3d(q,'workspace',workspace,'scale',scale)
camlight
Dobot.delay = 0;


disp('Done');

%% Environment

clf

Environment('Environment.ply')

%% Movement

newQ = [1.0367, -0.0873, -0.1195, 0.1885];

Dobot.plot3d(move_joint_position(defaultQ,newQ));

%% Functions

function [qMatrix] = move_joint_position(Q,newQ)
% Move to new joint position
    steps = 2;
    
    while ~isempty(find(1 < abs(diff(rad2deg(jtraj(Q,newQ,steps)))),1))
        steps = steps + 1;
    end

    qMatrix = jtraj(Q,newQ,steps);
end

