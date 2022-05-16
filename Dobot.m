function Dobot
    L1 = Link('alpha',-pi/2,'a',0,'d',0.08,'offset',0,'qlim',[-2.3562,2.3562]);
    L2 = Link('alpha',0,'a',0.138,'d',0,'offset',deg2rad(-45),'qlim',[-0.0873,1.3963]);
    L3 = Link('alpha',0,'a',0.16,'d',0,'offset',deg2rad(90),'qlim',[-0.1745,1.6581]);
    L4 = Link('alpha',0,'a',0.08,'d',0,'offset',deg2rad(45));

    Dobot = SerialLink([L1 L2 L3 L4],'name','Dobot');

    defaultQ = [0 0 0 0];
    Dobot.base = transl(0,0,0.055);

    scale = 0.4;

    workspace = [-0.5 0.5 -0.5 0.5 0 0.5];

    Dobot.plotopt3d = {'wrist', 'xyz', 'arrow'};
    Dobot.plot3d(q,'workspace',workspace,'scale',scale)
    camlight
    Dobot.delay = 0;

end