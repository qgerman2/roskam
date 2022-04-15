function B3_LandingTable(app)
    i = app.lastlanselection;
    app.lantable.Data(i, 1) = str2double(app.lansl.Value);
    app.lantable.Data(i, 2) = str2double(app.lanheight.Value);
    app.lantable.Data(i, 3) = str2double(app.lancl.Value);
    app.lantable.Data(i, 4) = str2double(app.lanrel.Value);
    app.lantable.Data(i, 5) = app.lanplot.Value;
    app.B3_LandingPartialResults();

    if ishandle(5) 
        app.B_TWWSPlot();
    end
end