%% Environment

clf

Environment('Environment.ply')

%% GUI



%% Dobot
disp('Loading Dobot...');
%D&H Parameters
L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
L2 = Link('alpha',0,'a',0,'d',0.138,'offset',0);
L3 = Link('alpha',-pi/2,'a',0,'d',0,'offset',0);
L4 = Link('alpha',0,'a',0.135,'d',0,'offset',0);
L5 = Link('alpha',0,'a',0.147,'d',0,'offset',0);

%Creating the Dobot
Dobot = SerialLink([L1 L2 L3 L4 L5],'name','Dobot');

%initial pose and base
q = [0 0 0 0 0];
Dobot.base = transl(0,0,0);

%Figure setup
scale = 0.4;

%Toggle environment to increase performance
workspace = [-1 1.5 -1 1.5 0 1.5];

%%

%Loading custom 3D model
for i = 0:Dobot.n - 1
    [faces,vertices,ply_data{i+1}] = plyread(['Dobot_link_',num2str(i),'.ply']);
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