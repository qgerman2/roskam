function updateTakeoffSizing(app)
    i = app.lasttoselection;
    app.totable.Data(i, 1) = str2double(app.toStofl.Value);
    app.totable.Data(i, 2) = str2double(app.toheight.Value);
    app.totable.Data(i, 3) = str2double(app.toclmax.Value);
    app.totable.Data(i, 4) = app.toplot.Value;
    Stofl = app.totable.Data(i, 1);
    if ~anynan(Stofl)
        app.totop25.Value = num2str(Stofl/37.5);
    end
    h = app.totable.Data(i, 2);
    if ~anynan(h)
        [~,~,~,rho] = atmosisa(h / 3.281);
        app.tosigma.Value = num2str(rho/app.rho0);
    end
    if ishandle(5) 
        app.refreshTWWSPlot();
    end
end