% GUI


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
Dobot.plot3d(defaultQ,'workspace',workspace,'scale',scale)
camlight
Dobot.delay = 0;


disp('Done');



%% Movement
pause(3)
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

