function D_AxesPlot(app)
    figure(9)
    clf(9)

    img = imread("avion.png");
    imgw = size(img, 2);
    imgh = size(img, 1);
    x0of = app.refx0.Value;
    x1of = app.refx1.Value;
    h = imgh / (imgw*(1-x0of-x1of));
    yof = app.refy0.Value;
    image('CData', img, 'XData', [0-x0of, 1+x1of], 'YData', [h/2+yof, -h/2+yof]);

    hold on
    yline(0)
    xline(0)
    xline(1)
    daspect([1 1 1])
    xlim([0-x0of-0.05, 1+x1of+0.05]);
    ylim([-h/2+yof-0.05, h/2+yof+0.05]);
    xline(app.refcmac0.Value);
    xline(app.refcmac1.Value);
end