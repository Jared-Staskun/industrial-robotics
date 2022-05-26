classdef eStopButton < handle
    % Class for e-stop button
    
    % Events
    events
        eStop
    end
    
    % Properties
    properties
    end
    
    % Methods
    methods
        function eStopEvent(obj)
            % Notifies listeners that the event has occured
            notify(obj, 'eStop');
        end
    end
end

