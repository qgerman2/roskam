function D_ComponentPlot(app)
    figure(10)
    clf(10)
    hold on

    yline(0, 'HandleVisibility', 'off', 'HitTest','off','PickableParts','none');
    xline(0, 'HandleVisibility', 'off', 'HitTest','off','PickableParts','none');
    xline(1, 'HandleVisibility', 'off', 'HitTest','off','PickableParts','none');

    img = imread("avion.png");
    imgw = size(img, 2);
    imgh = size(img, 1);
    x0of = app.refx0.Value;
    x1of = app.refx1.Value;
    h = imgh / (imgw*(1-x0of-x1of));
    yof = app.refy0.Value;
    iii = image('CData', img, 'XData', [0-x0of, 1+x1of], 'YData', [h/2+yof, -h/2+yof], 'HitTest','off','PickableParts','none');
    alpha(iii, 0.3);

    grid on
    daspect([1 1 1])
    xlim([0-x0of-0.05, 1+x1of+0.05]);
    ylim([-h/2+yof-0.05, h/2+yof+0.05]);

    if ~app.cgsum.Value
        s = 1;
        e = size(app.catvalues, 1);
        if ~app.cgall.Value
            s = app.catstart(app.cgsel);
            if app.cgsel<length(app.catstart)
                e = app.catstart(app.cgsel+1) - 1;
            end
        end
        for i = s:e
            x = app.catvalues(i, 2);
            y = app.catvalues(i, 3);
            plot(x, y, "o");
            %text(x, y+0.01, app.compnames(i),'VerticalAlignment','bottom','HorizontalAlignment','center','FontName','times');
        end
        legend(app.compnames(s:e));
    else
        for c = 1:length(app.catnames)
            if ~app.cgall.Value && c ~= app.cgsel
                continue
            end
            x = 0;
            y = 0;
            s = app.catstart(c);
            e = 0;
            if c<length(app.catstart)
                e = app.catstart(c+1) - 1;
            else
                e = size(app.catvalues, 1);
            end
            wtotal = 0;
            for i = s:e
                wtotal = wtotal + app.catvalues(i, 1);
            end
            for i = s:e
                w = app.catvalues(i, 1);
                x = x + w * app.catvalues(i, 2) / wtotal;
                y = y + w * app.catvalues(i, 3) / wtotal;
            end
            plot(x, y, "o");
        end
        if app.cgall.Value
            legend(app.catnames);
        else
            legend(app.catnames(app.cgsel));
        end
    end
    %cg takeoff
    wtotal = 0;
    for i=1:size(app.catvalues,1)
        wtotal = wtotal + app.catvalues(i, 1);
    end
    x = 0;
    y = 0;
    for i=1:size(app.catvalues)
        w = app.catvalues(i, 1);
        x = x + w * app.catvalues(i, 2) / wtotal;
        y = y + w * app.catvalues(i, 3) / wtotal;
    end
    plot(x, y, "x", 'DisplayName', "CG Takeoff");    
    hold off
end