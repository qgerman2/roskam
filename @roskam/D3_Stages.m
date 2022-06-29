function D3_Stages(app)
    app.exw = [];
    for s = 1:length(app.exlist)
        w = 0;
        for ii = transpose(split(app.exlist(s), ","))
            i = str2double(ii);
            if anynan(i)
                break
            end
            if i > length(app.catnames)
                break
            end
            ss = app.catstart(i);
            if i<length(app.catstart)
                ee = app.catstart(i+1) - 1;
            else
                ee = size(app.catvalues, 1);
            end
            w = w + sum(app.catvalues(ss:ee, 1));
        end
        app.exw(s) = w;
    end
    app.exttable.Data = table(transpose(app.exlist), transpose(app.exw));
    if ishandle(11)
        app.D_ExcursionPlot();
    end
end