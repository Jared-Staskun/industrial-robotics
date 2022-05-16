classdef GUI < matlab.apps.AppBase
    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        Lamp_power                      matlab.ui.control.Lamp
        StatusLampLabel                 matlab.ui.control.Label
        Lamp_redInv                     matlab.ui.control.Lamp
        Lamp_greenInv                   matlab.ui.control.Lamp
        Lamp_blueInv                    matlab.ui.control.Lamp
        Lamp_blueCap                    matlab.ui.control.Lamp
        Lamp_greenCap                   matlab.ui.control.Lamp
        Lamp_redCap                     matlab.ui.control.Lamp
        PowerButton                     matlab.ui.control.StateButton
        EmergencyStopButton             matlab.ui.control.StateButton
        BlueInkLevelGauge               matlab.ui.control.LinearGauge
        BlueInkLevelGaugeLabel          matlab.ui.control.Label
        GreenInkLevelGauge              matlab.ui.control.LinearGauge
        GreenInkLevelGaugeLabel         matlab.ui.control.Label
        RedInkLevelGauge                matlab.ui.control.LinearGauge
        RedInkLevelGaugeLabel           matlab.ui.control.Label
        BlueButton                      matlab.ui.control.Button
        BlueCartridgesinInventoryGauge  matlab.ui.control.LinearGauge
        BlueCartridgesinInventoryGaugeLabel  matlab.ui.control.Label
        GreenButton                     matlab.ui.control.Button
        GreenCartridgesinInventoryGauge  matlab.ui.control.LinearGauge
        GreenCartridgesinInventoryGaugeLabel  matlab.ui.control.Label
        RedCartridgesinInventoryGauge   matlab.ui.control.LinearGauge
        RedCartridgesinInventoryGaugeLabel  matlab.ui.control.Label
        SelectInkCartridgetoChangeLabel  matlab.ui.control.Label
        RedButton                       matlab.ui.control.Button

    end

    % Callbacks that handle component events
%     methods (Access = private)
% 
%         % Button pushed function: BlueButton
%         function BlueButtonPushed(app, event)
%             
%         end
%     end

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

            % Create SelectInkCartridgetoChangeLabel
            app.SelectInkCartridgetoChangeLabel = uilabel(app.UIFigure);
            app.SelectInkCartridgetoChangeLabel.HorizontalAlignment = 'center';
            app.SelectInkCartridgetoChangeLabel.FontWeight = 'bold';
            app.SelectInkCartridgetoChangeLabel.Position = [53 419 118 28];
            app.SelectInkCartridgetoChangeLabel.Text = {'Select Ink Cartridge'; 'to Change'};

            % Create RedCartridgesinInventoryGaugeLabel
            app.RedCartridgesinInventoryGaugeLabel = uilabel(app.UIFigure);
            app.RedCartridgesinInventoryGaugeLabel.HorizontalAlignment = 'center';
            app.RedCartridgesinInventoryGaugeLabel.FontWeight = 'bold';
            app.RedCartridgesinInventoryGaugeLabel.Position = [310 380 92 28];
            app.RedCartridgesinInventoryGaugeLabel.Text = {'Red Cartridges'; 'in Inventory'};

            % Create RedCartridgesinInventoryGauge
            app.RedCartridgesinInventoryGauge = uigauge(app.UIFigure, 'linear');
            app.RedCartridgesinInventoryGauge.Limits = [0 10];
            app.RedCartridgesinInventoryGauge.MinorTicks = [0 1 2 3 4 5 6 7 8 9 10];
            app.RedCartridgesinInventoryGauge.Position = [296 407 119 40];

            % Create GreenCartridgesinInventoryGaugeLabel
            app.GreenCartridgesinInventoryGaugeLabel = uilabel(app.UIFigure);
            app.GreenCartridgesinInventoryGaugeLabel.HorizontalAlignment = 'center';
            app.GreenCartridgesinInventoryGaugeLabel.FontWeight = 'bold';
            app.GreenCartridgesinInventoryGaugeLabel.Position = [305 299 104 28];
            app.GreenCartridgesinInventoryGaugeLabel.Text = {'Green Cartridges'; 'in Inventory'};

            % Create GreenCartridgesinInventoryGauge
            app.GreenCartridgesinInventoryGauge = uigauge(app.UIFigure, 'linear');
            app.GreenCartridgesinInventoryGauge.Limits = [0 10];
            app.GreenCartridgesinInventoryGauge.MinorTicks = [0 1 2 3 4 5 6 7 8 9 10];
            app.GreenCartridgesinInventoryGauge.Position = [296 326 119 40];

            % Create GreenButton
            app.GreenButton = uibutton(app.UIFigure, 'push');
            app.GreenButton.BackgroundColor = [1 1 1];
            app.GreenButton.Position = [62 316 100 23];
            app.GreenButton.Text = 'Green';

            % Create BlueCartridgesinInventoryGaugeLabel
            app.BlueCartridgesinInventoryGaugeLabel = uilabel(app.UIFigure);
            app.BlueCartridgesinInventoryGaugeLabel.HorizontalAlignment = 'center';
            app.BlueCartridgesinInventoryGaugeLabel.FontWeight = 'bold';
            app.BlueCartridgesinInventoryGaugeLabel.Position = [309 218 95 28];
            app.BlueCartridgesinInventoryGaugeLabel.Text = {'Blue Cartridges'; 'in Inventory'};

            % Create BlueCartridgesinInventoryGauge
            app.BlueCartridgesinInventoryGauge = uigauge(app.UIFigure, 'linear');
            app.BlueCartridgesinInventoryGauge.Limits = [0 10];
            app.BlueCartridgesinInventoryGauge.MinorTicks = [0 1 2 3 4 5 6 7 8 9 10];
            app.BlueCartridgesinInventoryGauge.Position = [296 245 119 40];

            % Create BlueButton
            app.BlueButton = uibutton(app.UIFigure, 'push');
            app.BlueButton.ButtonPushedFcn = createCallbackFcn(app, @BlueButtonPushed, true);
            app.BlueButton.BackgroundColor = [1 1 1];
            app.BlueButton.Position = [62 244 100 23];
            app.BlueButton.Text = 'Blue';

            % Create RedInkLevelGaugeLabel
            app.RedInkLevelGaugeLabel = uilabel(app.UIFigure);
            app.RedInkLevelGaugeLabel.HorizontalAlignment = 'center';
            app.RedInkLevelGaugeLabel.FontWeight = 'bold';
            app.RedInkLevelGaugeLabel.Position = [497 386 105 22];
            app.RedInkLevelGaugeLabel.Text = 'Red Ink Level (%)';

            % Create RedInkLevelGauge
            app.RedInkLevelGauge = uigauge(app.UIFigure, 'linear');
            app.RedInkLevelGauge.Position = [488 407 119 40];

            % Create GreenInkLevelGaugeLabel
            app.GreenInkLevelGaugeLabel = uilabel(app.UIFigure);
            app.GreenInkLevelGaugeLabel.HorizontalAlignment = 'center';
            app.GreenInkLevelGaugeLabel.FontWeight = 'bold';
            app.GreenInkLevelGaugeLabel.Position = [494 305 117 22];
            app.GreenInkLevelGaugeLabel.Text = 'Green Ink Level (%)';

            % Create GreenInkLevelGauge
            app.GreenInkLevelGauge = uigauge(app.UIFigure, 'linear');
            app.GreenInkLevelGauge.Position = [488 326 119 40];

            % Create BlueInkLevelGaugeLabel
            app.BlueInkLevelGaugeLabel = uilabel(app.UIFigure);
            app.BlueInkLevelGaugeLabel.HorizontalAlignment = 'center';
            app.BlueInkLevelGaugeLabel.FontWeight = 'bold';
            app.BlueInkLevelGaugeLabel.Position = [495 224 108 22];
            app.BlueInkLevelGaugeLabel.Text = 'Blue Ink Level (%)';

            % Create BlueInkLevelGauge
            app.BlueInkLevelGauge = uigauge(app.UIFigure, 'linear');
            app.BlueInkLevelGauge.Position = [488 245 119 40];

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

            % Create Lamp_redCap
            app.Lamp_redCap = uilamp(app.UIFigure);
            app.Lamp_redCap.Position = [452 407 20 20];
            app.Lamp_redCap.Color = [0.502 0.502 0.502];

            % Create Lamp_greenCap
            app.Lamp_greenCap = uilamp(app.UIFigure);
            app.Lamp_greenCap.Position = [452 326 20 20];
            app.Lamp_greenCap.Color = [0.502 0.502 0.502];

            % Create Lamp_blueCap
            app.Lamp_blueCap = uilamp(app.UIFigure);
            app.Lamp_blueCap.Position = [452 245 20 20];
            app.Lamp_blueCap.Color = [0.502 0.502 0.502];

            % Create Lamp_blueInv
            app.Lamp_blueInv = uilamp(app.UIFigure);
            app.Lamp_blueInv.Position = [260 245 20 20];
            app.Lamp_blueInv.Color = [0.502 0.502 0.502];

            % Create Lamp_greenInv
            app.Lamp_greenInv = uilamp(app.UIFigure);
            app.Lamp_greenInv.Position = [260 326 20 20];
            app.Lamp_greenInv.Color = [0.502 0.502 0.502];

            % Create Lamp_redInv
            app.Lamp_redInv = uilamp(app.UIFigure);
            app.Lamp_redInv.Position = [260 407 20 20];
            app.Lamp_redInv.Color = [0.502 0.502 0.502];

            % Create StatusLampLabel
            app.StatusLampLabel = uilabel(app.UIFigure);
            app.StatusLampLabel.HorizontalAlignment = 'right';
            app.StatusLampLabel.FontWeight = 'bold';
            app.StatusLampLabel.Position = [502 131 46 22];
            app.StatusLampLabel.Text = 'Status:';

            % Create Lamp_power
            app.Lamp_power = uilamp(app.UIFigure);
            app.Lamp_power.Position = [563 131 20 20];
            app.Lamp_power.Color = [0.502 0.502 0.502];

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