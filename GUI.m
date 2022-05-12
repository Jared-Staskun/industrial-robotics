classdef GUI < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                       matlab.ui.Figure
        Lamp_redInv                    matlab.ui.control.Lamp
        Lamp_greenInv                  matlab.ui.control.Lamp
        Lamp_blueInv                   matlab.ui.control.Lamp
        Lamp_blueCap                   matlab.ui.control.Lamp
        Lamp_greenCap                  matlab.ui.control.Lamp
        Lamp_redCap                    matlab.ui.control.Lamp
        ARMSwitch                      matlab.ui.control.ToggleSwitch
        ARMSwitchLabel                 matlab.ui.control.Label
        PowerButton                    matlab.ui.control.StateButton
        EmergencyStopButton            matlab.ui.control.StateButton
        BlueCapacityGauge              matlab.ui.control.LinearGauge
        BlueCapacityGaugeLabel         matlab.ui.control.Label
        GreenCapacityGauge             matlab.ui.control.LinearGauge
        GreenCapacityGaugeLabel        matlab.ui.control.Label
        RedCapacityGauge               matlab.ui.control.LinearGauge
        RedCapacityGaugeLabel          matlab.ui.control.Label
        BlueButton                     matlab.ui.control.Button
        BlueInventoryGauge             matlab.ui.control.LinearGauge
        BlueInventoryGaugeLabel        matlab.ui.control.Label
        GreenButton                    matlab.ui.control.Button
        GreenInventoryGauge            matlab.ui.control.LinearGauge
        GreenInventoryGaugeLabel       matlab.ui.control.Label
        RedInventoryGauge              matlab.ui.control.LinearGauge
        RedInventoryGaugeLabel         matlab.ui.control.Label
        SelectInkCartridgeChangeLabel  matlab.ui.control.Label
        RedButton                      matlab.ui.control.Button
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create RedButton
            app.RedButton = uibutton(app.UIFigure, 'push');
            app.RedButton.BackgroundColor = [1 1 1];
            app.RedButton.Position = [62 388 100 23];
            app.RedButton.Text = 'Red';

            % Create SelectInkCartridgeChangeLabel
            app.SelectInkCartridgeChangeLabel = uilabel(app.UIFigure);
            app.SelectInkCartridgeChangeLabel.HorizontalAlignment = 'center';
            app.SelectInkCartridgeChangeLabel.FontWeight = 'bold';
            app.SelectInkCartridgeChangeLabel.Position = [53 419 118 28];
            app.SelectInkCartridgeChangeLabel.Text = {'Select Ink Cartridge'; 'Change'};

            % Create RedInventoryGaugeLabel
            app.RedInventoryGaugeLabel = uilabel(app.UIFigure);
            app.RedInventoryGaugeLabel.HorizontalAlignment = 'center';
            app.RedInventoryGaugeLabel.FontWeight = 'bold';
            app.RedInventoryGaugeLabel.Position = [313 386 86 22];
            app.RedInventoryGaugeLabel.Text = 'Red Inventory';

            % Create RedInventoryGauge
            app.RedInventoryGauge = uigauge(app.UIFigure, 'linear');
            app.RedInventoryGauge.Limits = [0 10];
            app.RedInventoryGauge.MinorTicks = [0 1 2 3 4 5 6 7 8 9 10];
            app.RedInventoryGauge.Position = [296 407 119 40];

            % Create GreenInventoryGaugeLabel
            app.GreenInventoryGaugeLabel = uilabel(app.UIFigure);
            app.GreenInventoryGaugeLabel.HorizontalAlignment = 'center';
            app.GreenInventoryGaugeLabel.FontWeight = 'bold';
            app.GreenInventoryGaugeLabel.Position = [308 305 98 22];
            app.GreenInventoryGaugeLabel.Text = 'Green Inventory';

            % Create GreenInventoryGauge
            app.GreenInventoryGauge = uigauge(app.UIFigure, 'linear');
            app.GreenInventoryGauge.Limits = [0 10];
            app.GreenInventoryGauge.MinorTicks = [0 1 2 3 4 5 6 7 8 9 10];
            app.GreenInventoryGauge.Position = [296 326 119 40];

            % Create GreenButton
            app.GreenButton = uibutton(app.UIFigure, 'push');
            app.GreenButton.BackgroundColor = [1 1 1];
            app.GreenButton.Position = [62 316 100 23];
            app.GreenButton.Text = 'Green';

            % Create BlueInventoryGaugeLabel
            app.BlueInventoryGaugeLabel = uilabel(app.UIFigure);
            app.BlueInventoryGaugeLabel.HorizontalAlignment = 'center';
            app.BlueInventoryGaugeLabel.FontWeight = 'bold';
            app.BlueInventoryGaugeLabel.Position = [312 224 89 22];
            app.BlueInventoryGaugeLabel.Text = 'Blue Inventory';

            % Create BlueInventoryGauge
            app.BlueInventoryGauge = uigauge(app.UIFigure, 'linear');
            app.BlueInventoryGauge.Limits = [0 10];
            app.BlueInventoryGauge.MinorTicks = [0 1 2 3 4 5 6 7 8 9 10];
            app.BlueInventoryGauge.Position = [296 245 119 40];

            % Create BlueButton
            app.BlueButton = uibutton(app.UIFigure, 'push');
            app.BlueButton.BackgroundColor = [1 1 1];
            app.BlueButton.Position = [62 244 100 23];
            app.BlueButton.Text = 'Blue';

            % Create RedCapacityGaugeLabel
            app.RedCapacityGaugeLabel = uilabel(app.UIFigure);
            app.RedCapacityGaugeLabel.HorizontalAlignment = 'center';
            app.RedCapacityGaugeLabel.FontWeight = 'bold';
            app.RedCapacityGaugeLabel.Position = [507 386 82 22];
            app.RedCapacityGaugeLabel.Text = 'Red Capacity';

            % Create RedCapacityGauge
            app.RedCapacityGauge = uigauge(app.UIFigure, 'linear');
            app.RedCapacityGauge.Position = [488 407 119 40];

            % Create GreenCapacityGaugeLabel
            app.GreenCapacityGaugeLabel = uilabel(app.UIFigure);
            app.GreenCapacityGaugeLabel.HorizontalAlignment = 'center';
            app.GreenCapacityGaugeLabel.FontWeight = 'bold';
            app.GreenCapacityGaugeLabel.Position = [505 305 94 22];
            app.GreenCapacityGaugeLabel.Text = 'Green Capacity';

            % Create GreenCapacityGauge
            app.GreenCapacityGauge = uigauge(app.UIFigure, 'linear');
            app.GreenCapacityGauge.Position = [488 326 119 40];

            % Create BlueCapacityGaugeLabel
            app.BlueCapacityGaugeLabel = uilabel(app.UIFigure);
            app.BlueCapacityGaugeLabel.HorizontalAlignment = 'center';
            app.BlueCapacityGaugeLabel.FontWeight = 'bold';
            app.BlueCapacityGaugeLabel.Position = [506 224 85 22];
            app.BlueCapacityGaugeLabel.Text = 'Blue Capacity';

            % Create BlueCapacityGauge
            app.BlueCapacityGauge = uigauge(app.UIFigure, 'linear');
            app.BlueCapacityGauge.Position = [488 245 119 40];

            % Create EmergencyStopButton
            app.EmergencyStopButton = uibutton(app.UIFigure, 'state');
            app.EmergencyStopButton.Text = 'Emergency Stop';
            app.EmergencyStopButton.BackgroundColor = [1 1 0];
            app.EmergencyStopButton.FontWeight = 'bold';
            app.EmergencyStopButton.FontColor = [1 0 0];
            app.EmergencyStopButton.Position = [54 54 115 78];

            % Create PowerButton
            app.PowerButton = uibutton(app.UIFigure, 'state');
            app.PowerButton.Text = 'Power';
            app.PowerButton.BackgroundColor = [0.3922 0.8314 0.0745];
            app.PowerButton.FontWeight = 'bold';
            app.PowerButton.FontColor = [1 1 1];
            app.PowerButton.Position = [505 61 86 65];

            % Create ARMSwitchLabel
            app.ARMSwitchLabel = uilabel(app.UIFigure);
            app.ARMSwitchLabel.HorizontalAlignment = 'center';
            app.ARMSwitchLabel.FontWeight = 'bold';
            app.ARMSwitchLabel.Position = [336 21 40 22];
            app.ARMSwitchLabel.Text = 'ARM';

            % Create ARMSwitch
            app.ARMSwitch = uiswitch(app.UIFigure, 'toggle');
            app.ARMSwitch.Position = [342 79 29 65];

            % Create Lamp_redCap
            app.Lamp_redCap = uilamp(app.UIFigure);
            app.Lamp_redCap.Position = [452 407 20 20];

            % Create Lamp_greenCap
            app.Lamp_greenCap = uilamp(app.UIFigure);
            app.Lamp_greenCap.Position = [452 326 20 20];

            % Create Lamp_blueCap
            app.Lamp_blueCap = uilamp(app.UIFigure);
            app.Lamp_blueCap.Position = [452 245 20 20];

            % Create Lamp_blueInv
            app.Lamp_blueInv = uilamp(app.UIFigure);
            app.Lamp_blueInv.Position = [260 245 20 20];

            % Create Lamp_greenInv
            app.Lamp_greenInv = uilamp(app.UIFigure);
            app.Lamp_greenInv.Position = [260 326 20 20];

            % Create Lamp_redInv
            app.Lamp_redInv = uilamp(app.UIFigure);
            app.Lamp_redInv.Position = [260 407 20 20];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = GUI

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end