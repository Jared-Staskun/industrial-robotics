classdef GUI_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                   matlab.ui.Figure
        YellowCapacityGauge        matlab.ui.control.LinearGauge
        YellowCapacityGaugeLabel   matlab.ui.control.Label
        GreenCapacityGauge         matlab.ui.control.LinearGauge
        GreenCapacityGaugeLabel    matlab.ui.control.Label
        RedCapacityGauge           matlab.ui.control.LinearGauge
        RedCapacityGaugeLabel      matlab.ui.control.Label
        YellowButton               matlab.ui.control.Button
        YellowInventoryGauge       matlab.ui.control.LinearGauge
        YellowInventoryGaugeLabel  matlab.ui.control.Label
        GreenButton                matlab.ui.control.Button
        GreenInventoryGauge        matlab.ui.control.LinearGauge
        GreenInventoryGaugeLabel   matlab.ui.control.Label
        RedInventoryGauge          matlab.ui.control.LinearGauge
        RedInventoryGaugeLabel     matlab.ui.control.Label
        SelectAColourLabel         matlab.ui.control.Label
        RedButton                  matlab.ui.control.Button
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
            app.RedButton.Position = [69 425 100 23];
            app.RedButton.Text = 'Red';

            % Create SelectAColourLabel
            app.SelectAColourLabel = uilabel(app.UIFigure);
            app.SelectAColourLabel.Position = [75 459 87 22];
            app.SelectAColourLabel.Text = 'Select A Colour';

            % Create RedInventoryGaugeLabel
            app.RedInventoryGaugeLabel = uilabel(app.UIFigure);
            app.RedInventoryGaugeLabel.HorizontalAlignment = 'center';
            app.RedInventoryGaugeLabel.Position = [329 398 80 22];
            app.RedInventoryGaugeLabel.Text = 'Red Inventory';

            % Create RedInventoryGauge
            app.RedInventoryGauge = uigauge(app.UIFigure, 'linear');
            app.RedInventoryGauge.Limits = [0 10];
            app.RedInventoryGauge.MinorTicks = [0 1 2 3 4 5 6 7 8 9 10];
            app.RedInventoryGauge.Position = [308 435 119 40];
            app.RedInventoryGauge.Value = 9;

            % Create GreenInventoryGaugeLabel
            app.GreenInventoryGaugeLabel = uilabel(app.UIFigure);
            app.GreenInventoryGaugeLabel.HorizontalAlignment = 'center';
            app.GreenInventoryGaugeLabel.Position = [324 312 91 22];
            app.GreenInventoryGaugeLabel.Text = 'Green Inventory';

            % Create GreenInventoryGauge
            app.GreenInventoryGauge = uigauge(app.UIFigure, 'linear');
            app.GreenInventoryGauge.Limits = [0 10];
            app.GreenInventoryGauge.MinorTicks = [0 1 2 3 4 5 6 7 8 9 10];
            app.GreenInventoryGauge.Position = [308 349 119 40];
            app.GreenInventoryGauge.Value = 9;

            % Create GreenButton
            app.GreenButton = uibutton(app.UIFigure, 'push');
            app.GreenButton.Position = [61 357 100 23];
            app.GreenButton.Text = 'Green';

            % Create YellowInventoryGaugeLabel
            app.YellowInventoryGaugeLabel = uilabel(app.UIFigure);
            app.YellowInventoryGaugeLabel.HorizontalAlignment = 'center';
            app.YellowInventoryGaugeLabel.Position = [322 236 92 22];
            app.YellowInventoryGaugeLabel.Text = 'Yellow Inventory';

            % Create YellowInventoryGauge
            app.YellowInventoryGauge = uigauge(app.UIFigure, 'linear');
            app.YellowInventoryGauge.Limits = [0 10];
            app.YellowInventoryGauge.MinorTicks = [0 1 2 3 4 5 6 7 8 9 10];
            app.YellowInventoryGauge.Position = [307 273 119 40];
            app.YellowInventoryGauge.Value = 7;

            % Create YellowButton
            app.YellowButton = uibutton(app.UIFigure, 'push');
            app.YellowButton.Position = [69 281 100 23];
            app.YellowButton.Text = 'Yellow';

            % Create RedCapacityGaugeLabel
            app.RedCapacityGaugeLabel = uilabel(app.UIFigure);
            app.RedCapacityGaugeLabel.HorizontalAlignment = 'center';
            app.RedCapacityGaugeLabel.Position = [521 398 78 22];
            app.RedCapacityGaugeLabel.Text = 'Red Capacity';
            

            % Create RedCapacityGauge
            app.RedCapacityGauge = uigauge(app.UIFigure, 'linear');
            app.RedCapacityGauge.Position = [499 435 119 40];
            app.RedCapacityGauge.Value = 74;

            % Create GreenCapacityGaugeLabel
            app.GreenCapacityGaugeLabel = uilabel(app.UIFigure);
            app.GreenCapacityGaugeLabel.HorizontalAlignment = 'center';
            app.GreenCapacityGaugeLabel.Position = [514 312 89 22];
            app.GreenCapacityGaugeLabel.Text = 'Green Capacity';

            % Create GreenCapacityGauge
            app.GreenCapacityGauge = uigauge(app.UIFigure, 'linear');
            app.GreenCapacityGauge.Position = [497 349 119 40];
            app.GreenCapacityGauge.Value = 40;

            % Create YellowCapacityGaugeLabel
            app.YellowCapacityGaugeLabel = uilabel(app.UIFigure);
            app.YellowCapacityGaugeLabel.HorizontalAlignment = 'center';
            app.YellowCapacityGaugeLabel.Position = [512 236 90 22];
            app.YellowCapacityGaugeLabel.Text = 'Yellow Capacity';

            % Create YellowCapacityGauge
            app.YellowCapacityGauge = uigauge(app.UIFigure, 'linear');
            app.YellowCapacityGauge.Position = [496 273 119 40];
            app.YellowCapacityGauge.Value = 15;

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = GUI_exported

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