classdef roskam_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                     matlab.ui.Figure
        save_new                     matlab.ui.control.Button
        filename                     matlab.ui.control.Label
        load                         matlab.ui.control.Button
        save                         matlab.ui.control.Button
        TabGroup                     matlab.ui.container.TabGroup
        resumen                      matlab.ui.container.Tab
        Label                        matlab.ui.control.Label
        tipo                         matlab.ui.control.DropDown
        TipodeaeronaveDropDownLabel  matlab.ui.control.Label
        fc                           matlab.ui.container.Tab
        Tabla21Button                matlab.ui.control.Button
        W98                          matlab.ui.control.EditField
        W8Label_2                    matlab.ui.control.Label
        TabGroup2                    matlab.ui.container.TabGroup
        AscensoTab                   matlab.ui.container.Tab
        n_p_cl                       matlab.ui.control.EditField
        W4Label_7                    matlab.ui.control.Label
        c_cl                         matlab.ui.control.EditField
        W4Label_5                    matlab.ui.control.Label
        W4Label_4                    matlab.ui.control.Label
        V_cl                         matlab.ui.control.EditField
        LD_cl                        matlab.ui.control.EditField
        W4Label_3                    matlab.ui.control.Label
        E_cl                         matlab.ui.control.EditField
        W4Label_2                    matlab.ui.control.Label
        CruceroTab                   matlab.ui.container.Tab
        V_cr                         matlab.ui.control.EditField
        W4Label_12                   matlab.ui.control.Label
        LD_cr                        matlab.ui.control.EditField
        W4Label_11                   matlab.ui.control.Label
        n_p_cr                       matlab.ui.control.EditField
        W4Label_10                   matlab.ui.control.Label
        c_cr                         matlab.ui.control.EditField
        W4Label_9                    matlab.ui.control.Label
        R_cr                         matlab.ui.control.EditField
        W4Label_8                    matlab.ui.control.Label
        LoiterTab                    matlab.ui.container.Tab
        E_lo                         matlab.ui.control.EditField
        W4Label_17                   matlab.ui.control.Label
        V_lo                         matlab.ui.control.EditField
        W4Label_16                   matlab.ui.control.Label
        n_p_lo                       matlab.ui.control.EditField
        W4Label_15                   matlab.ui.control.Label
        c_lo                         matlab.ui.control.EditField
        W4Label_14                   matlab.ui.control.Label
        LD_lo                        matlab.ui.control.EditField
        W4Label_13                   matlab.ui.control.Label
        m_ff                         matlab.ui.control.EditField
        M_ffEditFieldLabel           matlab.ui.control.Label
        W87                          matlab.ui.control.EditField
        W8Label                      matlab.ui.control.Label
        W76                          matlab.ui.control.EditField
        W7Label                      matlab.ui.control.Label
        W65                          matlab.ui.control.EditField
        W6Label                      matlab.ui.control.Label
        W54                          matlab.ui.control.EditField
        W5Label                      matlab.ui.control.Label
        W43                          matlab.ui.control.EditField
        W4Label                      matlab.ui.control.Label
        W32                          matlab.ui.control.EditField
        W3Label                      matlab.ui.control.Label
        W21                          matlab.ui.control.EditField
        W2Label                      matlab.ui.control.Label
        W1TO                         matlab.ui.control.EditField
        W_1Label                     matlab.ui.control.Label
        emptyweight                  matlab.ui.container.Tab
        eqerror                      matlab.ui.control.Label
        WEtarget                     matlab.ui.control.EditField
        W5Label_13                   matlab.ui.control.Label
        WError                       matlab.ui.control.EditField
        W5Label_12                   matlab.ui.control.Label
        WPlotButton                  matlab.ui.control.Button
        W_to                         matlab.ui.control.EditField
        W5Label_11                   matlab.ui.control.Label
        we_eq                        matlab.ui.control.Label
        WE                           matlab.ui.control.EditField
        W5Label_10                   matlab.ui.control.Label
        Wcrew                        matlab.ui.control.EditField
        W5Label_9                    matlab.ui.control.Label
        Wpl                          matlab.ui.control.EditField
        W5Label_8                    matlab.ui.control.Label
        Wtfo                         matlab.ui.control.EditField
        W5Label_7                    matlab.ui.control.Label
        Wf_res                       matlab.ui.control.EditField
        W5Label_6                    matlab.ui.control.Label
        Wf_used                      matlab.ui.control.EditField
        W5Label_5                    matlab.ui.control.Label
        Wf                           matlab.ui.control.EditField
        W5Label_4                    matlab.ui.control.Label
    end

    
    properties (Access = private)
        table21 = [
            [0.998, 0.998, 0.998, 0.995, 0.995];
            [0.995, 0.997, 0.998, 0.993, 0.993];
            [0.992, 0.996, 0.996, 0.992, 0.992];
            [0.996, 0.995, 0.996, 0.999, 0.998];
            [0.990, 0.995, 0.995, 0.990, 0.992];
            [0.990, 0.995, 0.995, 0.985, 0.995];
            [0.990, 0.990, 0.995, 0.990, 0.992];
            [0.990, 0.990, 0.990, 0.990, 0.995];
            [0.990, 0.990, 0.990, 0.990, 0.995];
            [0.990, 0.990, 0.995, 0.990, 0.992];
            [0.992, 0.990, 0.996, 0.990, 0.990];
            [0.990, 0.995, 0.995, 0.985, 0.992]
        ];
        table29 = transpose([
            % BOEING
            [184800, 100000];
            [112500, 61630];
            [124500, 69930];
            [775000, 380000];
            [630000, 325000];
            [220000, 130420];
            [300000, 179082];
            % McDONNELL-DOUGLAS
            [325000, 162700];
            [121000, 57190];
            [140000, 79757];
            [455000, 244903];
            [555000, 271062];
            [510000, 245500];
            [73000, 38683];
            [99650, 53762];
            [44000, 26850];
            [89500, 48500];
            % AIRBUS
            [363760, 195109];
            [291000, 168910];
            [357150, 153000];
            [198416, 95900]
        ]);
        table29regression;
        prop = true;
        file = "";
    end
    
    methods (Access = private)
        function r = zerotoempty(app, v)
            if v == '0'
                r = '';
            else
                r = v;
            end
        end
        function clearCalculation(app)
            app.W43.Value = "";
            app.W54.Value = "";
            app.W65.Value = "";
            app.m_ff.Value = "";
            app.Wf_used.Value = "";
            app.Wf.Value = "";
            app.Wtfo.Value = "";
            app.WE.Value = "";
            app.WError.Value = "";
        end
        function updateUI(app)
            switch str2double(app.tipo.Value)
                case {1, 2, 3, 4, 6, 10, 11, 12}
                    app.prop = true;
                    app.Label.Text = "prop";
                    app.W4Label_5.Text = "$c_p$";
                    app.W4Label_9.Text = "$c_p$";
                    app.W4Label_14.Text = "$c_p$";
                    app.n_p_cl.Editable = "on";
                    app.n_p_cr.Editable = "on";
                    app.n_p_lo.Editable = "on";
                    app.V_cl.Editable = "on";
                    app.V_cr.Editable = "off";
                    app.V_lo.Editable = "on";
                otherwise
                    app.prop = false;
                    app.Label.Text = "jet";
                    app.W4Label_5.Text = "$c_j$";
                    app.W4Label_9.Text = "$c_j$";
                    app.W4Label_14.Text = "$c_j$";
                    app.n_p_cl.Editable = "off";
                    app.n_p_cr.Editable = "off";
                    app.n_p_lo.Editable = "off";
                    app.V_cl.Editable = "off";
                    app.V_cr.Editable = "on";
                    app.V_lo.Editable = "off";
            end
        end
        function updateCalculation(app)
            app.clearCalculation()
            app.updateUI()
            app.updateFuelFraction()
            app.updateWeights()
        end
        function updateFuelFraction(app)
            %% Ascenso
            E_cl = str2double(app.E_cl.Value);
            V_cl = str2double(app.V_cl.Value);
            LD_cl = str2double(app.LD_cl.Value);
            c_cl = str2double(app.c_cl.Value);
            n_p_cl = str2double(app.n_p_cl.Value);
            if app.prop & ~anynan([E_cl V_cl LD_cl c_cl n_p_cl])
                app.W43.Value = num2str(exp(-( (E_cl*V_cl*c_cl)/(375*LD_cl*n_p_cl) )));
            elseif ~app.prop & ~anynan([E_cl LD_cl c_cl])
                app.W43.Value = num2str(exp(-( (E_cl*c_cl) / (LD_cl) )));
            end
            %% Crucero
            V_cr = str2double(app.V_cr.Value);
            R_cr = str2double(app.R_cr.Value);
            LD_cr = str2double(app.LD_cr.Value);
            c_cr = str2double(app.c_cr.Value);
            n_p_cr = str2double(app.n_p_cr.Value);
            if app.prop & ~anynan([R_cr LD_cr c_cr n_p_cr])
                app.W54.Value = num2str(exp(-( (R_cr*c_cr)/(375*LD_cr*n_p_cr) )));
            elseif ~app.prop & ~anynan([R_cr LD_cr c_cr V_cr])
                app.W54.Value = num2str(exp(-( (R_cr*c_cr)/(LD_cr*V_cr) )));
            end
            %% Loiter
            E_lo = str2double(app.E_lo.Value);
            V_lo = str2double(app.V_lo.Value);
            LD_lo = str2double(app.LD_lo.Value);
            c_lo = str2double(app.c_lo.Value);
            n_p_lo = str2double(app.n_p_lo.Value);
            if app.prop & ~anynan([E_lo V_lo c_lo LD_lo n_p_lo])
                app.W65.Value = num2str(exp(-( (E_lo*V_lo*c_lo)/(375*LD_lo*n_p_lo) )));
            elseif ~app.prop & ~anynan([E_lo c_lo LD_lo])
                app.W65.Value = num2str(exp(-( (E_lo*c_lo)/(LD_lo) )));
            end
            %% Fracción final
            W1TO = str2double(app.W1TO.Value);
            W21 = str2double(app.W21.Value);
            W32 = str2double(app.W32.Value);
            W43 = str2double(app.W43.Value);
            W54 = str2double(app.W54.Value);
            W65 = str2double(app.W65.Value);
            W76 = str2double(app.W76.Value);
            W87 = str2double(app.W87.Value);
            W98 = str2double(app.W98.Value);
            if ~anynan([W1TO W21 W32 W65 W76 W87 W98]) 
                app.m_ff.Value = num2str(W1TO * W21 * W32 * W43 * W54 * W65 * W76 * W87 * W98);
            end
        end
        function updateWeights(app)
            m_ff = str2double(app.m_ff.Value);
            W_to = str2double(app.W_to.Value);
            if ~anynan([W_to])
                app.WEtarget.Value = num2str(10^(polyval(app.table29regression, log10(W_to))));
            end
            if ~anynan([m_ff W_to])
                app.Wf_used.Value = num2str((1-m_ff)*W_to);
            end
            Wf_used = str2double(app.Wf_used.Value);
            Wf_res = str2double(app.Wf_res.Value);
            if ~anynan([Wf_used Wf_res])
                app.Wf.Value = num2str(Wf_used + Wf_res);
            end
            Wf = str2double(app.Wf.Value);
            if ~anynan([Wf])
                app.Wtfo.Value = num2str(0.05 * Wf);
            end
            Wtfo = str2double(app.Wtfo.Value);
            Wpl = str2double(app.Wpl.Value);
            Wcrew = str2double(app.Wcrew.Value);
            if ~anynan([W_to Wf Wtfo Wpl Wcrew])
                app.WE.Value = num2str(W_to - Wf - Wtfo - Wpl - Wcrew);
            end
            WE = str2double(app.WE.Value);
            WEtarget = str2double(app.WEtarget.Value);
            if ~anynan([W_to WE WEtarget])
                err = (abs(WEtarget - WE) / WEtarget) * 100;
                app.WError.Value = [num2str(err, 4) '%'];
                if ishandle(2) 
                    app.refreshWeightPlot();
                    hold on
                    loglog(W_to, WEtarget, 'ob');
                    loglog(W_to, WE, 'or');
                    hold off
                end
            end
        end
        function refreshWeightPlot(app)
            figure(2);
            loglog(app.table29(1,:), app.table29(2,:), '.');
            grid on
            limits = [10^4 10^6];
            ylim(limits);
            xlim(limits);
            hold on
            x = linspace(10^4, 10^6, 1000);
            loglog(x, 10.^(polyval(app.table29regression, log10(x))));
            text(app.table29(1,:), app.table29(2,:), num2str(transpose(1:21)), 'Color', [0.8 0.8 0.8]);
            hold off
        end
        %function save(app, filename)
        %    
        %end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            app.tipoValueChanged(1);
            app.table29regression = polyfit(log10(app.table29(1,:)), log10(app.table29(2,:)),1);
        end

        % Value changed function: tipo
        function tipoValueChanged(app, event)
            value = app.tipo.Value;
            app.W1TO.Value = num2str(app.table21(str2double(value), 1));
            app.W21.Value = num2str(app.table21(str2double(value), 2));
            app.W32.Value = num2str(app.table21(str2double(value), 3));
            app.W76.Value = num2str(app.table21(str2double(value), 4));
            app.W87.Value = num2str(app.table21(str2double(value), 5));
            app.updateCalculation();
        end

        % Value changed function: W1TO
        function W1TOValueChanged(app, event)
            app.updateCalculation();
        end

        % Value changed function: W21
        function W21ValueChanged(app, event)
            app.updateCalculation();
        end

        % Value changed function: W32
        function W32ValueChanged(app, event)
            app.updateCalculation();
        end

        % Value changed function: W76
        function W76ValueChanged(app, event)
            app.updateCalculation();
        end

        % Value changed function: W87
        function W87ValueChanged(app, event)
            app.updateCalculation();
        end

        % Value changed function: E_cl
        function E_clValueChanged(app, event)
            app.updateCalculation();
        end

        % Value changed function: V_cl
        function V_clValueChanged(app, event)
            app.updateCalculation();
        end

        % Value changed function: R_cr
        function R_crValueChanged(app, event)
            app.updateCalculation();
        end

        % Value changed function: c_cl
        function c_clValueChanged(app, event)
            app.updateCalculation();
        end

        % Value changed function: n_p_cl
        function n_p_clValueChanged(app, event)
            app.updateCalculation();
        end

        % Value changed function: LD_cl
        function LD_clValueChanged(app, event)
            app.updateCalculation();
        end

        % Value changed function: V_cr
        function V_crValueChanged(app, event)
            app.updateCalculation();
        end

        % Value changed function: c_cr
        function c_crValueChanged(app, event)
            app.updateCalculation();
        end

        % Value changed function: n_p_cr
        function n_p_crValueChanged(app, event)
            app.updateCalculation();
        end

        % Value changed function: LD_cr
        function LD_crValueChanged(app, event)
            app.updateCalculation();
        end

        % Value changed function: V_lo
        function V_loValueChanged(app, event)
            app.updateCalculation();
        end

        % Value changed function: c_lo
        function c_loValueChanged(app, event)
            app.updateCalculation();
        end

        % Value changed function: n_p_lo
        function n_p_loValueChanged(app, event)
            app.updateCalculation();
        end

        % Value changed function: LD_lo
        function LD_loValueChanged(app, event)
            app.updateCalculation();
        end

        % Value changed function: E_lo
        function E_loValueChanged(app, event)
            app.updateCalculation();
        end

        % Value changed function: W_to
        function W_toValueChanged(app, event)
            app.updateCalculation();
        end

        % Button pushed function: save_new
        function save_newButtonPushed(app, event)
            input = {
                app.tipo.Value;
                app.W1TO.Value; app.W21.Value; app.W32.Value; app.W76.Value; app.W87.Value; app.W_to.Value;
                app.E_cl.Value; app.V_cl.Value; app.c_cl.Value; app.n_p_cl.Value; app.LD_cl.Value;
                app.V_cr.Value; app.R_cr.Value; app.c_cr.Value; app.n_p_cr.Value; app.LD_cr.Value;
                app.E_lo.Value; app.V_lo.Value; app.c_lo.Value; app.n_p_lo.Value; app.LD_lo.Value;
                app.Wf_res.Value; app.W98.Value; app.Wpl.Value; app.Wcrew.Value
            };
            input(cellfun(@isempty, input)) = {0};
            [file, path] = uiputfile({'*.txt'});
            filename = fullfile(path,file);
            writecell(input, filename);
            [~,name,ext] = fileparts(file);
            fclose('all');
            app.filename.Text = [name ext];
            app.file = filename;
        end

        % Button pushed function: load
        function loadButtonPushed(app, event)
            [file, path] = uigetfile({'*.txt'});
            filename = fullfile(path,file);
            input = cell2mat(readcell(filename));
            [~,name,ext] = fileparts(file);
            fclose('all');
            app.filename.Text = [name ext];
            app.file = filename;

            app.tipo.Value = num2str(input(1), '%d');
            app.W1TO.Value = app.zerotoempty(num2str(input(2)));
            app.W21.Value = app.zerotoempty(num2str(input(3)));
            app.W32.Value = app.zerotoempty(num2str(input(4)));
            app.W76.Value = app.zerotoempty(num2str(input(5)));
            app.W87.Value = app.zerotoempty(num2str(input(6)));
            app.W_to.Value = app.zerotoempty(num2str(input(7)));
            
            app.E_cl.Value = app.zerotoempty(num2str(input(8)));
            app.V_cl.Value = app.zerotoempty(num2str(input(9)));
            app.c_cl.Value = app.zerotoempty(num2str(input(10)));
            app.n_p_cl.Value = app.zerotoempty(num2str(input(11)));
            app.LD_cl.Value = app.zerotoempty(num2str(input(12)));
            
            app.V_cr.Value = app.zerotoempty(num2str(input(13)));
            app.R_cr.Value = app.zerotoempty(num2str(input(14)));
            app.c_cr.Value = app.zerotoempty(num2str(input(15)));
            app.n_p_cr.Value = app.zerotoempty(num2str(input(16)));
            app.LD_cr.Value = app.zerotoempty(num2str(input(17)));

            app.E_lo.Value = app.zerotoempty(num2str(input(18)));
            app.V_lo.Value = app.zerotoempty(num2str(input(19)));
            app.c_lo.Value = app.zerotoempty(num2str(input(20)));
            app.n_p_lo.Value = app.zerotoempty(num2str(input(21)));
            app.LD_lo.Value = app.zerotoempty(num2str(input(22)));

            app.Wf_res.Value = app.zerotoempty(num2str(input(23)));
            app.W98.Value = app.zerotoempty(num2str(input(24)));

            app.Wpl.Value = app.zerotoempty(num2str(input(25)));
            app.Wcrew.Value = app.zerotoempty(num2str(input(26)));

            app.updateCalculation();
        end

        % Button pushed function: save
        function saveButtonPushed(app, event)
            if app.file ~= ""
                input = {
                    app.tipo.Value;
                    app.W1TO.Value; app.W21.Value; app.W32.Value; app.W76.Value; app.W87.Value; app.W_to.Value;
                    app.E_cl.Value; app.V_cl.Value; app.c_cl.Value; app.n_p_cl.Value; app.LD_cl.Value;
                    app.V_cr.Value; app.R_cr.Value; app.c_cr.Value; app.n_p_cr.Value; app.LD_cr.Value;
                    app.E_lo.Value; app.V_lo.Value; app.c_lo.Value; app.n_p_lo.Value; app.LD_lo.Value;
                    app.Wf_res.Value; app.W98.Value; app.Wpl.Value; app.Wcrew.Value
                };
                input(cellfun(@isempty, input)) = {0};
                writecell(input, app.file);
                fclose('all');
            else
                app.save_newButtonPushed(1);
            end
        end

        % Value changed function: Wf_res
        function Wf_resValueChanged(app, event)
            app.updateCalculation();
        end

        % Value changed function: Wpl
        function WplValueChanged(app, event)
            app.updateCalculation();
        end

        % Value changed function: Wcrew
        function WcrewValueChanged(app, event)
            app.updateCalculation();
        end

        % Value changed function: W98
        function W98ValueChanged(app, event)
            app.updateCalculation();
        end

        % Button pushed function: Tabla21Button
        function Tabla21ButtonPushed(app, event)
            f = figure(1);
            f.MenuBar = 'none';
            f.Name = 'Tabla 2.1';
            imshow('tabla21.png');
            set(gca,'units','pixels');
            x = get(gca,'position');
            set(gcf,'units','pixels');
            y = get(gcf,'position');
            set(gcf,'position',[y(1) y(2) x(3) x(4)]);
            set(gca,'units','normalized','position',[0 0 1 1]);
        end

        % Button pushed function: WPlotButton
        function WPlotButtonPushed(app, event)
            app.refreshWeightPlot();
            app.updateCalculation();
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 400 326];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.Resize = 'off';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.HandleVisibility = 'off';
            app.TabGroup.Position = [1 27 400 300];

            % Create resumen
            app.resumen = uitab(app.TabGroup);
            app.resumen.Title = 'Resumen';

            % Create TipodeaeronaveDropDownLabel
            app.TipodeaeronaveDropDownLabel = uilabel(app.resumen);
            app.TipodeaeronaveDropDownLabel.HorizontalAlignment = 'right';
            app.TipodeaeronaveDropDownLabel.Position = [0 251 98 22];
            app.TipodeaeronaveDropDownLabel.Text = 'Tipo de aeronave';

            % Create tipo
            app.tipo = uidropdown(app.resumen);
            app.tipo.Items = {'Homebuilt Propeller Driven Airplanes', 'Single Engine Propeller Airplanes', 'Twin Engine Propeller Airplanes', 'Agricultural Airplanes', 'Business Jets', 'Regional Turbopropeller Driven Airplanes', 'Transport Jets', 'Military Trainers', 'Fighters', 'Military Patrol, Bomb and Transport Airplanes', 'Flying Boats, Amphibious and Float Airplanes', 'Supersonic Cruise Airplanes'};
            app.tipo.ItemsData = {'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'};
            app.tipo.ValueChangedFcn = createCallbackFcn(app, @tipoValueChanged, true);
            app.tipo.Enable = 'off';
            app.tipo.Position = [113 251 285 22];
            app.tipo.Value = '7';

            % Create Label
            app.Label = uilabel(app.resumen);
            app.Label.Position = [7 177 120 40];

            % Create fc
            app.fc = uitab(app.TabGroup);
            app.fc.Title = 'Fracción de combustible';

            % Create W_1Label
            app.W_1Label = uilabel(app.fc);
            app.W_1Label.Interpreter = 'latex';
            app.W_1Label.HorizontalAlignment = 'right';
            app.W_1Label.Position = [-4 245 52 22];
            app.W_1Label.Text = '$W_{1/TO}$';

            % Create W1TO
            app.W1TO = uieditfield(app.fc, 'text');
            app.W1TO.ValueChangedFcn = createCallbackFcn(app, @W1TOValueChanged, true);
            app.W1TO.Position = [55 239 63 31];

            % Create W2Label
            app.W2Label = uilabel(app.fc);
            app.W2Label.Interpreter = 'latex';
            app.W2Label.HorizontalAlignment = 'right';
            app.W2Label.Position = [16 211 32 22];
            app.W2Label.Text = '$W_{2/1}$';

            % Create W21
            app.W21 = uieditfield(app.fc, 'text');
            app.W21.ValueChangedFcn = createCallbackFcn(app, @W21ValueChanged, true);
            app.W21.Position = [55 205 63 31];

            % Create W3Label
            app.W3Label = uilabel(app.fc);
            app.W3Label.Interpreter = 'latex';
            app.W3Label.HorizontalAlignment = 'right';
            app.W3Label.Position = [16 177 32 22];
            app.W3Label.Text = '$W_{3/2}$';

            % Create W32
            app.W32 = uieditfield(app.fc, 'text');
            app.W32.ValueChangedFcn = createCallbackFcn(app, @W32ValueChanged, true);
            app.W32.Position = [55 171 63 31];

            % Create W4Label
            app.W4Label = uilabel(app.fc);
            app.W4Label.Interpreter = 'latex';
            app.W4Label.HorizontalAlignment = 'right';
            app.W4Label.Position = [16 143 32 22];
            app.W4Label.Text = '$W_{4/3}$';

            % Create W43
            app.W43 = uieditfield(app.fc, 'text');
            app.W43.Editable = 'off';
            app.W43.Position = [56 137 63 31];

            % Create W5Label
            app.W5Label = uilabel(app.fc);
            app.W5Label.Interpreter = 'latex';
            app.W5Label.HorizontalAlignment = 'right';
            app.W5Label.Position = [143 245 32 22];
            app.W5Label.Text = '$W_{5/4}$';

            % Create W54
            app.W54 = uieditfield(app.fc, 'text');
            app.W54.Editable = 'off';
            app.W54.Position = [182 239 63 31];

            % Create W6Label
            app.W6Label = uilabel(app.fc);
            app.W6Label.Interpreter = 'latex';
            app.W6Label.HorizontalAlignment = 'right';
            app.W6Label.Position = [143 211 32 22];
            app.W6Label.Text = '$W_{6/5}$';

            % Create W65
            app.W65 = uieditfield(app.fc, 'text');
            app.W65.Editable = 'off';
            app.W65.Position = [182 205 63 31];

            % Create W7Label
            app.W7Label = uilabel(app.fc);
            app.W7Label.Interpreter = 'latex';
            app.W7Label.HorizontalAlignment = 'right';
            app.W7Label.Position = [143 177 32 22];
            app.W7Label.Text = '$W_{7/6}$';

            % Create W76
            app.W76 = uieditfield(app.fc, 'text');
            app.W76.ValueChangedFcn = createCallbackFcn(app, @W76ValueChanged, true);
            app.W76.Position = [182 171 63 31];

            % Create W8Label
            app.W8Label = uilabel(app.fc);
            app.W8Label.Interpreter = 'latex';
            app.W8Label.HorizontalAlignment = 'right';
            app.W8Label.Position = [143 143 32 22];
            app.W8Label.Text = '$W_{8/7}$';

            % Create W87
            app.W87 = uieditfield(app.fc, 'text');
            app.W87.ValueChangedFcn = createCallbackFcn(app, @W87ValueChanged, true);
            app.W87.Position = [183 137 63 31];

            % Create M_ffEditFieldLabel
            app.M_ffEditFieldLabel = uilabel(app.fc);
            app.M_ffEditFieldLabel.Interpreter = 'latex';
            app.M_ffEditFieldLabel.HorizontalAlignment = 'right';
            app.M_ffEditFieldLabel.Position = [272 177 29 22];
            app.M_ffEditFieldLabel.Text = '$M_{ff}$';

            % Create m_ff
            app.m_ff = uieditfield(app.fc, 'text');
            app.m_ff.Editable = 'off';
            app.m_ff.Position = [306 171 64 31];

            % Create TabGroup2
            app.TabGroup2 = uitabgroup(app.fc);
            app.TabGroup2.Position = [0 0 400 134];

            % Create AscensoTab
            app.AscensoTab = uitab(app.TabGroup2);
            app.AscensoTab.Title = 'Ascenso';

            % Create W4Label_2
            app.W4Label_2 = uilabel(app.AscensoTab);
            app.W4Label_2.Interpreter = 'latex';
            app.W4Label_2.HorizontalAlignment = 'right';
            app.W4Label_2.Position = [18 82 25 22];
            app.W4Label_2.Text = '$E$';

            % Create E_cl
            app.E_cl = uieditfield(app.AscensoTab, 'text');
            app.E_cl.ValueChangedFcn = createCallbackFcn(app, @E_clValueChanged, true);
            app.E_cl.Tooltip = {'hr'};
            app.E_cl.Position = [50 76 63 31];

            % Create W4Label_3
            app.W4Label_3 = uilabel(app.AscensoTab);
            app.W4Label_3.Interpreter = 'latex';
            app.W4Label_3.HorizontalAlignment = 'right';
            app.W4Label_3.Position = [144 2 25 34];
            app.W4Label_3.Text = '$\frac{L}{D}$';

            % Create LD_cl
            app.LD_cl = uieditfield(app.AscensoTab, 'text');
            app.LD_cl.ValueChangedFcn = createCallbackFcn(app, @LD_clValueChanged, true);
            app.LD_cl.Position = [176 8 63 31];

            % Create V_cl
            app.V_cl = uieditfield(app.AscensoTab, 'text');
            app.V_cl.ValueChangedFcn = createCallbackFcn(app, @V_clValueChanged, true);
            app.V_cl.Tooltip = {''};
            app.V_cl.Position = [50 42 63 31];

            % Create W4Label_4
            app.W4Label_4 = uilabel(app.AscensoTab);
            app.W4Label_4.Interpreter = 'latex';
            app.W4Label_4.HorizontalAlignment = 'right';
            app.W4Label_4.Position = [18 48 25 22];
            app.W4Label_4.Text = '$V$';

            % Create W4Label_5
            app.W4Label_5 = uilabel(app.AscensoTab);
            app.W4Label_5.Interpreter = 'latex';
            app.W4Label_5.HorizontalAlignment = 'right';
            app.W4Label_5.Position = [144 82 25 22];
            app.W4Label_5.Text = '$c$';

            % Create c_cl
            app.c_cl = uieditfield(app.AscensoTab, 'text');
            app.c_cl.ValueChangedFcn = createCallbackFcn(app, @c_clValueChanged, true);
            app.c_cl.Position = [176 76 63 31];

            % Create W4Label_7
            app.W4Label_7 = uilabel(app.AscensoTab);
            app.W4Label_7.Interpreter = 'latex';
            app.W4Label_7.HorizontalAlignment = 'right';
            app.W4Label_7.Position = [144 48 25 22];
            app.W4Label_7.Text = '$\eta_p$';

            % Create n_p_cl
            app.n_p_cl = uieditfield(app.AscensoTab, 'text');
            app.n_p_cl.ValueChangedFcn = createCallbackFcn(app, @n_p_clValueChanged, true);
            app.n_p_cl.Position = [176 42 63 31];

            % Create CruceroTab
            app.CruceroTab = uitab(app.TabGroup2);
            app.CruceroTab.Title = 'Crucero';

            % Create W4Label_8
            app.W4Label_8 = uilabel(app.CruceroTab);
            app.W4Label_8.Interpreter = 'latex';
            app.W4Label_8.HorizontalAlignment = 'right';
            app.W4Label_8.Position = [18 14 25 22];
            app.W4Label_8.Text = '$R$';

            % Create R_cr
            app.R_cr = uieditfield(app.CruceroTab, 'text');
            app.R_cr.ValueChangedFcn = createCallbackFcn(app, @R_crValueChanged, true);
            app.R_cr.Tooltip = {'nm'};
            app.R_cr.Position = [50 8 63 31];

            % Create W4Label_9
            app.W4Label_9 = uilabel(app.CruceroTab);
            app.W4Label_9.Interpreter = 'latex';
            app.W4Label_9.HorizontalAlignment = 'right';
            app.W4Label_9.Position = [144 82 25 22];
            app.W4Label_9.Text = '$c$';

            % Create c_cr
            app.c_cr = uieditfield(app.CruceroTab, 'text');
            app.c_cr.ValueChangedFcn = createCallbackFcn(app, @c_crValueChanged, true);
            app.c_cr.Position = [176 76 63 31];

            % Create W4Label_10
            app.W4Label_10 = uilabel(app.CruceroTab);
            app.W4Label_10.Interpreter = 'latex';
            app.W4Label_10.HorizontalAlignment = 'right';
            app.W4Label_10.Position = [144 48 25 22];
            app.W4Label_10.Text = '$\eta_p$';

            % Create n_p_cr
            app.n_p_cr = uieditfield(app.CruceroTab, 'text');
            app.n_p_cr.ValueChangedFcn = createCallbackFcn(app, @n_p_crValueChanged, true);
            app.n_p_cr.Position = [176 42 63 31];

            % Create W4Label_11
            app.W4Label_11 = uilabel(app.CruceroTab);
            app.W4Label_11.Interpreter = 'latex';
            app.W4Label_11.HorizontalAlignment = 'right';
            app.W4Label_11.Position = [144 2 25 34];
            app.W4Label_11.Text = '$\frac{L}{D}$';

            % Create LD_cr
            app.LD_cr = uieditfield(app.CruceroTab, 'text');
            app.LD_cr.ValueChangedFcn = createCallbackFcn(app, @LD_crValueChanged, true);
            app.LD_cr.Position = [176 8 63 31];

            % Create W4Label_12
            app.W4Label_12 = uilabel(app.CruceroTab);
            app.W4Label_12.Interpreter = 'latex';
            app.W4Label_12.HorizontalAlignment = 'right';
            app.W4Label_12.Position = [18 48 25 22];
            app.W4Label_12.Text = '$V$';

            % Create V_cr
            app.V_cr = uieditfield(app.CruceroTab, 'text');
            app.V_cr.ValueChangedFcn = createCallbackFcn(app, @V_crValueChanged, true);
            app.V_cr.Tooltip = {''};
            app.V_cr.Position = [50 42 63 31];

            % Create LoiterTab
            app.LoiterTab = uitab(app.TabGroup2);
            app.LoiterTab.Title = 'Loiter';

            % Create W4Label_13
            app.W4Label_13 = uilabel(app.LoiterTab);
            app.W4Label_13.Interpreter = 'latex';
            app.W4Label_13.HorizontalAlignment = 'right';
            app.W4Label_13.Position = [144 2 25 34];
            app.W4Label_13.Text = '$\frac{L}{D}$';

            % Create LD_lo
            app.LD_lo = uieditfield(app.LoiterTab, 'text');
            app.LD_lo.ValueChangedFcn = createCallbackFcn(app, @LD_loValueChanged, true);
            app.LD_lo.Position = [176 8 63 31];

            % Create W4Label_14
            app.W4Label_14 = uilabel(app.LoiterTab);
            app.W4Label_14.Interpreter = 'latex';
            app.W4Label_14.HorizontalAlignment = 'right';
            app.W4Label_14.Position = [144 82 25 22];
            app.W4Label_14.Text = '$c$';

            % Create c_lo
            app.c_lo = uieditfield(app.LoiterTab, 'text');
            app.c_lo.ValueChangedFcn = createCallbackFcn(app, @c_loValueChanged, true);
            app.c_lo.Position = [176 76 63 31];

            % Create W4Label_15
            app.W4Label_15 = uilabel(app.LoiterTab);
            app.W4Label_15.Interpreter = 'latex';
            app.W4Label_15.HorizontalAlignment = 'right';
            app.W4Label_15.Position = [144 48 25 22];
            app.W4Label_15.Text = '$\eta_p$';

            % Create n_p_lo
            app.n_p_lo = uieditfield(app.LoiterTab, 'text');
            app.n_p_lo.ValueChangedFcn = createCallbackFcn(app, @n_p_loValueChanged, true);
            app.n_p_lo.Position = [176 42 63 31];

            % Create W4Label_16
            app.W4Label_16 = uilabel(app.LoiterTab);
            app.W4Label_16.Interpreter = 'latex';
            app.W4Label_16.HorizontalAlignment = 'right';
            app.W4Label_16.Position = [18 48 25 22];
            app.W4Label_16.Text = '$V$';

            % Create V_lo
            app.V_lo = uieditfield(app.LoiterTab, 'text');
            app.V_lo.ValueChangedFcn = createCallbackFcn(app, @V_loValueChanged, true);
            app.V_lo.Tooltip = {'S'};
            app.V_lo.Position = [50 42 63 31];

            % Create W4Label_17
            app.W4Label_17 = uilabel(app.LoiterTab);
            app.W4Label_17.Interpreter = 'latex';
            app.W4Label_17.HorizontalAlignment = 'right';
            app.W4Label_17.Position = [18 82 25 22];
            app.W4Label_17.Text = '$E$';

            % Create E_lo
            app.E_lo = uieditfield(app.LoiterTab, 'text');
            app.E_lo.ValueChangedFcn = createCallbackFcn(app, @E_loValueChanged, true);
            app.E_lo.Tooltip = {'hr'};
            app.E_lo.Position = [50 76 63 31];

            % Create W8Label_2
            app.W8Label_2 = uilabel(app.fc);
            app.W8Label_2.Interpreter = 'latex';
            app.W8Label_2.HorizontalAlignment = 'right';
            app.W8Label_2.Position = [268 245 32 22];
            app.W8Label_2.Text = '$W_{9/8}$';

            % Create W98
            app.W98 = uieditfield(app.fc, 'text');
            app.W98.ValueChangedFcn = createCallbackFcn(app, @W98ValueChanged, true);
            app.W98.Position = [307 239 63 31];

            % Create Tabla21Button
            app.Tabla21Button = uibutton(app.fc, 'push');
            app.Tabla21Button.ButtonPushedFcn = createCallbackFcn(app, @Tabla21ButtonPushed, true);
            app.Tabla21Button.Position = [275 141 100 22];
            app.Tabla21Button.Text = 'Tabla 2.1';

            % Create emptyweight
            app.emptyweight = uitab(app.TabGroup);
            app.emptyweight.Title = 'Peso en vacío';

            % Create W5Label_4
            app.W5Label_4 = uilabel(app.emptyweight);
            app.W5Label_4.Interpreter = 'latex';
            app.W5Label_4.HorizontalAlignment = 'right';
            app.W5Label_4.Position = [15 197 27 22];
            app.W5Label_4.Text = '$W_F$';

            % Create Wf
            app.Wf = uieditfield(app.emptyweight, 'text');
            app.Wf.Editable = 'off';
            app.Wf.Position = [49 191 63 31];

            % Create W5Label_5
            app.W5Label_5 = uilabel(app.emptyweight);
            app.W5Label_5.Interpreter = 'latex';
            app.W5Label_5.HorizontalAlignment = 'right';
            app.W5Label_5.Position = [115 197 61 22];
            app.W5Label_5.Text = '$=W_{f,used}$';

            % Create Wf_used
            app.Wf_used = uieditfield(app.emptyweight, 'text');
            app.Wf_used.Editable = 'off';
            app.Wf_used.Position = [183 191 63 31];

            % Create W5Label_6
            app.W5Label_6 = uilabel(app.emptyweight);
            app.W5Label_6.Interpreter = 'latex';
            app.W5Label_6.HorizontalAlignment = 'right';
            app.W5Label_6.Position = [249 197 50 22];
            app.W5Label_6.Text = '$+W_{f,res}$';

            % Create Wf_res
            app.Wf_res = uieditfield(app.emptyweight, 'text');
            app.Wf_res.ValueChangedFcn = createCallbackFcn(app, @Wf_resValueChanged, true);
            app.Wf_res.Position = [306 191 63 31];

            % Create W5Label_7
            app.W5Label_7 = uilabel(app.emptyweight);
            app.W5Label_7.Interpreter = 'latex';
            app.W5Label_7.HorizontalAlignment = 'right';
            app.W5Label_7.Position = [13 163 30 22];
            app.W5Label_7.Text = '$W_{tfo}$';

            % Create Wtfo
            app.Wtfo = uieditfield(app.emptyweight, 'text');
            app.Wtfo.Editable = 'off';
            app.Wtfo.Position = [50 157 63 31];

            % Create W5Label_8
            app.W5Label_8 = uilabel(app.emptyweight);
            app.W5Label_8.Interpreter = 'latex';
            app.W5Label_8.HorizontalAlignment = 'right';
            app.W5Label_8.Position = [11 129 32 22];
            app.W5Label_8.Text = '$W_{PL}$';

            % Create Wpl
            app.Wpl = uieditfield(app.emptyweight, 'text');
            app.Wpl.ValueChangedFcn = createCallbackFcn(app, @WplValueChanged, true);
            app.Wpl.Position = [50 123 63 31];

            % Create W5Label_9
            app.W5Label_9 = uilabel(app.emptyweight);
            app.W5Label_9.Interpreter = 'latex';
            app.W5Label_9.HorizontalAlignment = 'right';
            app.W5Label_9.Position = [4 95 39 22];
            app.W5Label_9.Text = '$W_{crew}$';

            % Create Wcrew
            app.Wcrew = uieditfield(app.emptyweight, 'text');
            app.Wcrew.ValueChangedFcn = createCallbackFcn(app, @WcrewValueChanged, true);
            app.Wcrew.Position = [50 89 63 31];

            % Create W5Label_10
            app.W5Label_10 = uilabel(app.emptyweight);
            app.W5Label_10.Interpreter = 'latex';
            app.W5Label_10.HorizontalAlignment = 'right';
            app.W5Label_10.Position = [16 44 27 22];
            app.W5Label_10.Text = '$W_E$';

            % Create WE
            app.WE = uieditfield(app.emptyweight, 'text');
            app.WE.Editable = 'off';
            app.WE.Position = [50 38 63 31];

            % Create we_eq
            app.we_eq = uilabel(app.emptyweight);
            app.we_eq.Interpreter = 'latex';
            app.we_eq.Position = [119 44 200 22];
            app.we_eq.Text = '$=W_{to}-W_F-W_{PL}-W_{tfo}-W_{crew}$';

            % Create W5Label_11
            app.W5Label_11 = uilabel(app.emptyweight);
            app.W5Label_11.Interpreter = 'latex';
            app.W5Label_11.HorizontalAlignment = 'right';
            app.W5Label_11.Position = [15 231 27 22];
            app.W5Label_11.Text = '$W_{to}$';

            % Create W_to
            app.W_to = uieditfield(app.emptyweight, 'text');
            app.W_to.ValueChangedFcn = createCallbackFcn(app, @W_toValueChanged, true);
            app.W_to.Tooltip = {''};
            app.W_to.Position = [49 225 63 31];

            % Create WPlotButton
            app.WPlotButton = uibutton(app.emptyweight, 'push');
            app.WPlotButton.ButtonPushedFcn = createCallbackFcn(app, @WPlotButtonPushed, true);
            app.WPlotButton.Position = [18 9 100 22];
            app.WPlotButton.Text = 'Plot';

            % Create W5Label_12
            app.W5Label_12 = uilabel(app.emptyweight);
            app.W5Label_12.Interpreter = 'latex';
            app.W5Label_12.HorizontalAlignment = 'right';
            app.W5Label_12.Position = [148 10 28 22];
            app.W5Label_12.Text = '$Err$';

            % Create WError
            app.WError = uieditfield(app.emptyweight, 'text');
            app.WError.Editable = 'off';
            app.WError.Position = [183 4 63 31];

            % Create W5Label_13
            app.W5Label_13 = uilabel(app.emptyweight);
            app.W5Label_13.Interpreter = 'latex';
            app.W5Label_13.HorizontalAlignment = 'right';
            app.W5Label_13.Position = [107 231 69 22];
            app.W5Label_13.Text = '$\rightarrow W_{E, target}$';

            % Create WEtarget
            app.WEtarget = uieditfield(app.emptyweight, 'text');
            app.WEtarget.Editable = 'off';
            app.WEtarget.Tooltip = {''};
            app.WEtarget.Position = [183 225 63 31];

            % Create eqerror
            app.eqerror = uilabel(app.emptyweight);
            app.eqerror.Interpreter = 'latex';
            app.eqerror.Position = [249 2 139 36];
            app.eqerror.Text = '$=\frac{|W_E-W_{E,target}|}{W_{E,target}}\cdot 100$';

            % Create save
            app.save = uibutton(app.UIFigure, 'push');
            app.save.ButtonPushedFcn = createCallbackFcn(app, @saveButtonPushed, true);
            app.save.Position = [150 3 55 22];
            app.save.Text = 'Guardar';

            % Create load
            app.load = uibutton(app.UIFigure, 'push');
            app.load.ButtonPushedFcn = createCallbackFcn(app, @loadButtonPushed, true);
            app.load.Position = [3 3 55 22];
            app.load.Text = 'Cargar';

            % Create filename
            app.filename = uilabel(app.UIFigure);
            app.filename.HorizontalAlignment = 'right';
            app.filename.Position = [213 0 181 28];
            app.filename.Text = 'Ningún archivo cargado';

            % Create save_new
            app.save_new = uibutton(app.UIFigure, 'push');
            app.save_new.ButtonPushedFcn = createCallbackFcn(app, @save_newButtonPushed, true);
            app.save_new.Position = [59 3 90 22];
            app.save_new.Text = 'Guardar nuevo';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = roskam_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

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