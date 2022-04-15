function B1_StallTable(app)
    %% Actualizar tabla
    i = app.laststallselection;
    app.stalltable.Data(i, 1) = str2double(app.stallvs.Value);
    app.stalltable.Data(i, 2) = str2double(app.stallheight.Value);
    app.stalltable.Data(i, 3) = str2double(app.stallcl.Value);
    app.stalltable.Data(i, 5) = app.stallplot.Value;
    app.B1_StallPartialResults();

    %% Actualizar resultado en tabla
    vs = app.stalltable.Data(i,1);
    h = app.stalltable.Data(i,2);
    cl = app.stalltable.Data(i,3);
    if ~anynan([vs h cl])
        vs = vs * 1.68781; %kts a ft/s
        [~,~,~,rho] = atmosisa(h / 3.281); %m a ft
        rho = rho / 515; %kg/m3 a slug/ft3
        app.stalltable.Data(i,4) = rho * vs^2 * cl / 2;
    end

    if ishandle(5) 
        app.B_TWWSPlot();
    end
end