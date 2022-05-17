classdef eStopButton < handle
    % Class for e-stop button
    
    events
        eStop
    end
    
    methods
        function eStopEvent(obj)
            % Notifies listeners that the event has occured
            notify(obj, 'eStop');
        end
    end
end

