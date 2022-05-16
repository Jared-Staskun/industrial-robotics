function DoBot = createDoBotModel(workspace, scale)
%Create the 3D model of the DoBot and the environment

    % %D&H Parameters
    L1 = Link('alpha',-pi/2,'a',0,'d',0.08,'offset',0,'qlim',[-2.3562,2.3562]);
    L2 = Link('alpha',0,'a',0.138,'d',0,'offset',deg2rad(-45),'qlim',[-0.0873,1.3963]);
    L3 = Link('alpha',0,'a',0.16,'d',0,'offset',deg2rad(90),'qlim',[-0.1745,1.6581]);
    L4 = Link('alpha',0,'a',0.08,'d',0,'offset',deg2rad(45));

    %Creating the Dobot
    DoBot = SerialLink([L1 L2 L3 L4],'name','Dobot');

    %initial pose and base
    q = [0 0 0 0];
    DoBot.base = transl(0,0,0.055);

    %Loading custom 3D model
    for i = 0:DoBot.n
        [faces,vertices,ply_data{i+1}] = plyread(['link',num2str(i),'.ply']);
        DoBot.faces{i+1} = faces;
        DoBot.points{i+1} = vertices;
    end
    
    %Plotting Dobot
    DoBot.plotopt3d = {'wrist', 'xyz', 'arrow'};
    DoBot.plot3d(q,'workspace',workspace,'scale',scale);
    camlight
    DoBot.delay = 0;

    hold on
    PlaceObject('printer.ply',[0,0,0]);
    
end

