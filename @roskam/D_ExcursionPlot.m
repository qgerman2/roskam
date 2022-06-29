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
    xlim([0, 1]);
    ylim([0, str2double(app.W_to.Value)])

    for catss = 1:length(app.catnames)
        plot(nan, nan, 'w', 'DisplayName', strcat(num2str(catss), " ", app.catnames(catss)));
    end
end