function [qMatrix] = MoveJointWithInk(DoBot,Q,newQ,ink)

% Get vertex count
inkVertexCount = size(get(ink, 'Vertices'),1);

midPoint = (sum(get(ink, 'Vertices'))/inkVertexCount);
inkVerts = (get(ink, 'Vertices') - repmat(midPoint,inkVertexCount,1))*rotx(pi);


    steps = 2;
    
    while ~isempty(find(5 < abs(diff(rad2deg(jtraj(Q,newQ,steps)))),1))
        steps = steps + 1;
    end

    qMatrix = jtraj(Q,newQ,steps);
    
    for i = 1:steps
        inkPose = DoBot.fkine(DoBot.getpos());
        
        updatedPoints = [inkPose * [inkVerts,ones(inkVertexCount,1)]']';
        
        set(ink, 'Vertices', updatedPoints(:,1:3));
        DoBot.animate(qMatrix(i,:));
    end
    
end