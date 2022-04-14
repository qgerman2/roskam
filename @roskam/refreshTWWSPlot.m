function refreshTWWSPlot(app)
    figure(5);
    clf;
    grid on
    ylim([0 1]);
    xlim([0 200]);
    hold on
    if (app.stallplotenable.Value)
        for i=1:height(app.stalltable.Data)
            if app.stalltable.Data(i,5) == 1
                x = app.stalltable.Data(i,4);
                name = ...
                    "$V_s$ " + app.stalltable.Data(i,1) + " [kts] - " + ...
                    "$C_L$ " + app.stalltable.Data(i,3) + " - " + ...
                    "$h$ " + app.stalltable.Data(i,2) + " [ft]";
                plot([x x], [0, 1], 'DisplayName', name);
            end
        end
    end
    if (app.toplotenable.Value)
        for i=1:height(app.totable.Data)
            if app.totable.Data(i,4) == 1
                cl = app.totable.Data(i,3);
                sigma = str2double(app.tosigma.Value);
                Stofl = app.totable.Data(i,1);
                if ~anynan([cl sigma Stofl])
                    y = 75*(0:10:400)/(2*cl*sigma*Stofl);
                    name = ...
                        "$S_{TOFL}$ " + app.totable.Data(i,1) + " [ft] - " + ...
                        "$C_L$ " + app.totable.Data(i,3) + " - " + ...
                        "$h$ " + app.totable.Data(i,2) + " [ft]";
                    plot(0:10:400, y, 'DisplayName', name);
                end
            end
        end
    end
    legend('Interpreter','latex')
    xlabel("Wing Loading - $(W/S)_{TO}$ - PSF",'Interpreter','latex')
    ylabel("Thrust to Weight ratio - $(T/W)_{TO}$",'Interpreter','latex')
    hold off
end