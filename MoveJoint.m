function [qMatrix] = MoveJoint(Q,newQ)

    steps = 2;
    
    while ~isempty(find(5 < abs(diff(rad2deg(jtraj(Q,newQ,steps)))),1))
        steps = steps + 1;
    end

    qMatrix = jtraj(Q,newQ,steps);

end