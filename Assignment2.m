%% Environment

clf

Environment('Environment.ply')

%% GUI



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
q = [0 0 0 0];
Dobot.base = transl(0,0,0.055);

%Figure setup
scale = 0.4;

%Toggle environment to increase performance
workspace = [-0.5 0.5 -0.5 0.5 0 0.5];

%%

%Loading custom 3D model
for i = 0:Dobot.n
    [faces,vertices,ply_data{i+1}] = plyread(['link',num2str(i),'.ply']);
    Dobot.faces{i+1} = faces;
    Dobot.points{i+1} = vertices;
end

%%

%Plotting Dobot
Dobot.plotopt3d = {'wrist', 'xyz', 'arrow'};
Dobot.plot3d(q,'workspace',workspace,'scale',scale)
camlight
Dobot.delay = 0;


disp('Done');

%% Movement

