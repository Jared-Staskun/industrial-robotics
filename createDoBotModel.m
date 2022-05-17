function DoBot = createDoBotModel(workspace, scale)
%Create the 3D model of the DoBot and the environment

    % %D&H Parameters
    L1 = Link('alpha',-pi/2,'a',0,'d',0.08,'offset',0,'qlim',[-2.3562,2.3562]);
    L2 = Link('alpha',0,'a',0.138,'d',0,'offset',deg2rad(-45),'qlim',[-0.0873,1.3963]);
    L3 = Link('alpha',0,'a',0.16,'d',0,'offset',deg2rad(90),'qlim',[-0.1745,1.6581]);
    L4 = Link('alpha',0,'a',0.08,'d',0,'offset',deg2rad(45));

    %Creating the Dobot
    DoBotModel = SerialLink([L1 L2 L3 L4],'name','Dobot');

    %initial pose and base
    q = [0 0 0 0];
    DoBotModel.base = transl(0,0,0.64);
    
    workspace = [-1 1 -1 1 0 1];
    scale = 0.4;

    %Loading custom 3D model
    for i = 0:DoBotModel.n
        [faces,vertices,ply_data{i+1}] = plyread(['link',num2str(i),'.ply']);
        DoBotModel.faces{i+1} = faces;
        DoBotModel.points{i+1} = vertices;
    end
    
    %Plotting Dobot
    DoBot = DoBotModel(); 
    hold on;
    DoBotModel.plotopt3d = {'wrist', 'xyz', 'arrow'};
    DoBotModel.plot3d(q,'workspace',workspace,'scale',scale);
    camlight
    DoBotModel.delay = 0;

    hold on
    PlaceObject('printer.ply',[0.1,0.3,0.58]);
    PlaceObject('red_ink.ply',[0.2,-0.2,0.58]);
    PlaceObject('green_ink.ply',[0.1,-0.2,0.58]);
    PlaceObject('blue_ink.ply',[0,-0.2,0.58]);
    PlaceObject('table.ply',[0,0,0]);
    view([-134, 26])
    
end

