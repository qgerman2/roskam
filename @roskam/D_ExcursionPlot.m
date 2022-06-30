function D_ExcursionPlot(app)
    figure(11)
    clf(11)
    hold on
    grid on
    points = [];
    for s = 1:length(app.exlist)
        wtotal = table2array(app.exttable.Data(s, 2));
        x = 0;
        for cats = transpose(split(app.exlist(s), ","))
            c = str2double(cats);
            ss = app.catstart(c);
            e = 0;
            if c<length(app.catstart)
                e = app.catstart(c+1) - 1;
            else
                e = size(app.catvalues, 1);
            end
            for comp = ss:e
                w = app.catvalues(comp, 1);
                x = x + w * app.catvalues(comp, 2) / wtotal;
            end
        end
        points(end+1,:) = [x, wtotal];
        plot(x, wtotal, "o", 'DisplayName', app.exlist(s));
    end
    plot(points(:,1), points(:, 2), "k", 'HandleVisibility', 'off');
    legend();
    xlim([app.refcmac0.Value - 0.1, app.refcmac1.Value + 0.1]);
    y0 = str2double(app.WE.Value);
    y1 = str2double(app.W_to.Value);
    ylim([y0 - (y1-y0)*0.1, y1 + (y1-y0)*0.1])
    xline(app.refcmac0.Value, "Color", [.2 .2 .2], 'HandleVisibility', 'off', 'HitTest','off','PickableParts','none');
    xline(app.refcmac1.Value, "Color", [.2 .2 .2], 'HandleVisibility', 'off', 'HitTest','off','PickableParts','none');

    for catss = 1:length(app.catnames)
        plot(nan, nan, 'w', 'DisplayName', strcat(num2str(catss), " ", app.catnames(catss)));
    end
end