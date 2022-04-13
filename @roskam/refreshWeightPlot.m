function refreshWeightPlot(app)
    figure(2);
    loglog(app.table29(1,:), app.table29(2,:), '.');
    grid on
    limits = [10^4 10^6];
    ylim(limits);
    xlim(limits);
    hold on
    x = linspace(10^4, 10^6, 1000);
    loglog(x, 10.^((log10(x) - 0.0833)/1.0383));
    text(app.table29(1,:), app.table29(2,:), num2str(transpose(1:21)), 'Color', [0.8 0.8 0.8]);
    hold off
end