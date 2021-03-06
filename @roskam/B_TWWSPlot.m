function B_TWWSPlot(app)
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
                h = app.totable.Data(i,2);
                Stofl = app.totable.Data(i,1);
                if ~anynan([cl h Stofl])
                    [~,~,~,rho] = atmosisa(h / 3.281);
                    sigma = rho/app.rho0;
                    y = 75*(0:10:400)/(2*cl*sigma*Stofl);
                    name = ...
                        "TO $S_{TOFL}$ " + app.totable.Data(i,1) + " [ft] - " + ...
                        "$C_L$ " + app.totable.Data(i,3) + " - " + ...
                        "$h$ " + app.totable.Data(i,2) + " [ft]";
                    plot(0:10:400, y, 'DisplayName', name);
                end
            end
        end
    end
    if (app.lanplotenable.Value)
        for i=1:height(app.lantable.Data)
            if app.lantable.Data(i,5) == 1
                sl = app.lantable.Data(i, 1);
                h = app.lantable.Data(i,2);
                cl = app.lantable.Data(i,3);
                rel = app.lantable.Data(i,4);
                if ~anynan([sl h cl rel])
                    [~,~,~,rho] = atmosisa(h / 3.281);
                    rho = rho / 515;
                    x = 178084*cl*sl*rho/(63375*rel);
                    name = ...
                        "L " + "$S_{TOFL}$ " + app.lantable.Data(i, 1) + " [ft] - " + ...
                        "$C_L$ " + app.lantable.Data(i,3) + " - " + ...
                        "$h$ " + app.lantable.Data(i,2) + " [ft] - " + ...
                        "$W_L=W_{TO}\cdot $ " + app.lantable.Data(i, 4);
                    plot([x x], [0 1], "DisplayName", name);
                end
            end
        end
    end
    if (app.climbplotenable.Value)
        for i=1:size(app.climboutput,3)
            if app.climbinput(i,7)
                label = [
                    i + ". OEI CGR$>$0.012";
                    i + ". OEI CGR$>$0";
                    i + ". OEI CGR$>$0.024";
                    i + ". OEI CGR$>$0.012";
                    i + ". AEO CGR$>$0.032";
                    i + ". OEI CGR$>$0.021";
                ];
                if app.climbplotenable2.Value == 1
                    worst = nan;
                    worstindex = nan;
                    for j=1:6
                         tw = app.climboutput(j,4,i);
                         if anynan(worst) | tw>worst
                            worst = tw;
                            worstindex = j;
                         end
                    end
                    if ~anynan([worst worstindex])
                        plot([0, 200], [worst worst], "DisplayName", label(worstindex));
                    end
                else
                    for j=1:6
                        if app.climboutput(j,5,i) == 1
                            tw = app.climboutput(j,4,i);
                            if ~anynan(tw)
                                plot([0, 200], [tw tw], "DisplayName", label(j));
                            end
                        end
                    end
                end
            end
        end
    end
    if (app.cruiseplotenable.Value)
        for i=1:size(app.cruisetable.Data,1)
            if app.cruisetable.Data(i,6) == 1
                v1 = app.cruiseoutput(i,1);
                v2 = app.cruiseoutput(i,2);
                k = app.cruiseoutput(i,3);
                t = app.cruiseoutput(i,4);
                if ~anynan([v1 v2 k t])
                    x = 1:200;
                    for j=x
                        y(j) = (v1/x(j) + v2*x(j))*k/t;
                    end
                    name = ...
                        "$M$ " + app.cruisetable.Data(i,1) + " - " + ...
                        "$h$ " + app.cruisetable.Data(i,2) + " [ft]";
                    
                    plot(x,y,"DisplayName", name);
                end
            end
        end
    end
    legend('Interpreter','latex')
    xlabel("Wing Loading - $(W/S)_{TO}$ - PSF",'Interpreter','latex')
    ylabel("Thrust to Weight ratio - $(T/W)_{TO}$",'Interpreter','latex')
    hold off
end