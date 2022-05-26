function DoBot_estop(state)
% DoBot E-stop

    if state == 0
        e_stop = 4; % operating
    else state == 1
        e_stop = 3;
    end

    [safetyStatePublisher,safetyStateMsg] = rospublisher('/dobot_magician/target_safety_status');
    safetyStateMsg.Data = e_stop;
    send(safetyStatePublisher,safetyStateMsg);

end

