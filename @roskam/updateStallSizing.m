function updateStallSizing(app)
    i = app.laststallselection;
    app.stalltable.Data(i, 1) = str2double(app.stallvs.Value);
    app.stalltable.Data(i, 2) = str2double(app.stallheight.Value);
    app.stalltable.Data(i, 3) = str2double(app.stallcl.Value);
    app.stalltable.Data(i, 5) = app.stallplot.Value;
    h = app.stalltable.Data(i, 2);
    if ~anynan(h)
        [~,~,~,rho] = atmosisa(h / 3.281); %m a ft
        app.stallrho.Value = num2str(rho / 515); %kg/m3 a slug/ft3
    end
    for i=1:height(app.stalltable.Data)
        h = app.stalltable.Data(i,2);
        [~,~,~,r] = atmosisa(h / 3.281); %m a ft
        r = r / 515;
        Vs = app.stalltable.Data(i,1) * 1.68781; % ktas a ft/s
        CL = app.stalltable.Data(i,3);
        if ~anynan([r Vs CL])
            app.stalltable.Data(i,4) = r * Vs^2 * CL / 2;
        end
    end
    if ishandle(5) 
        app.refreshTWWSPlot();
    end
end