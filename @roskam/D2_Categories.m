function D2_Categories(app)
    for i = 1:length(app.catnames)
        app.cgdrop.Items{i} = char(app.catnames(i));
    end
    app.cgdrop.Value = app.catnames(app.cgsel);
    s = app.catstart(app.cgsel);
    if app.cgsel<length(app.catstart)
        e = app.catstart(app.cgsel+1) - 1;
    else
        e = size(app.catvalues, 1);
    end
    app.cgtable.Data = table(transpose(app.compnames(s:e)), app.catvalues(s:e, 1), app.catvalues(s:e, 2), app.catvalues(s:e, 3));
    app.cgname.Value = app.catnames(app.cgsel);


    app.cgtotal.Value = sum(app.catvalues(s:e, 1));
    if ishandle(10)
        app.D_ComponentPlot();
    end
    app.D3_Stages();
end