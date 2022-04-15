function B2_TakeoffTable(app)
    i = app.lasttoselection;
    app.totable.Data(i, 1) = str2double(app.toStofl.Value);
    app.totable.Data(i, 2) = str2double(app.toheight.Value);
    app.totable.Data(i, 3) = str2double(app.toclmax.Value);
    app.totable.Data(i, 4) = app.toplot.Value;
    app.B2_TakeOffPartialResults();
    
    if ishandle(5) 
        app.B_TWWSPlot();
    end
end