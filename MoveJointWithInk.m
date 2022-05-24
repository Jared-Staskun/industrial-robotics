function [qMatrix] = MoveJointWithInk(DoBot,Q,newQ,ink_cart)

    inkVertexCount = size(get(ink_cart, 'Vertices'),1); % Get vertex count for the specific ink cartridge to be moved

    centroid = (sum(get(ink_cart, 'Vertices'))/inkVertexCount); % Get the average coordinates of the ink cartridge to find the centroid
    inkVerts = (get(ink_cart, 'Vertices') - repmat(centroid,inkVertexCount,1))*rotx(pi); % Find difference between each point and centroid

    steps = 2; % Initial guess at number of steps in the move
    
    while ~isempty(find(5 < abs(diff(rad2deg(jtraj(Q,newQ,steps)))),1)) % Increase number of steps for the move until each move results in less than 5 degrees
        steps = steps + 1;
    end

    qMatrix = jtraj(Q,newQ,steps); % Matrix of joint angles for each step in movement
    
    for i = 1:steps
        inkPose = DoBot.fkine(DoBot.getpos()); % Get end effector position for each step
        pathPoints = [inkPose * [inkVerts,ones(inkVertexCount,1)]']'; % Calculate new position of cartridge based on end effector
        set(ink_cart, 'Vertices', pathPoints(:,1:3)); % Set new vertices positions of the cartridge
        DoBot.animate(qMatrix(i,:)); % animate next position of the DoBot
    end
    
end