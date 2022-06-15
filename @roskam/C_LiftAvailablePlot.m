function C_LiftAvailablePlot(app)
    figure(6);
    clf;
    claflap = app.liftgradient.Value;
    K = app.liftKsweep.Value;
    if nnz([claflap]) == 1
        spSLE = SectionLiftEffectiveness_SingleSlotted();
        x = 0:1:80;
        for i=1:5
            LAva{i} = ppval(spSLE{i}, x);
            if app.liftmultigradient.Value
                LAva{i} = LAva{i} * claflap;
            end
            if app.liftmultideltaflap.Value
                LAva{i} = LAva{i} .* (x*pi/180);
            end
        end
        hold on
        ppK = K_SingleSlotted;
        cfc = [0.1, 0.2, 0.25, 0.3, 0.4];
        colors = {[0 0.4470 0.7410], [0.8500 0.3250 0.0980], [0.9290 0.6940 0.1250], [0.4940 0.1840 0.5560], [0.4660 0.6740 0.1880]};
        for i=5:-1:1
            a = plot(x, LAva{i});
            set(a,'Color',colors{i});
        end
        for i=5:-1:1
            K = ppval(ppK, cfc(i));
            clto = app.liftreqDeltaClmaxTO.Value / K;
            cll = app.liftreqDeltaClmaxL.Value / K;
            a = yline(max([clto, cll]), '--');
            set(a,'Color',colors{i});
        end
        hold off
        grid on
        lgd = legend(".40", ".30", ".25", ".20", ".10");
        lgd.Title.String = 'cf/c';
        legend('Interpreter','latex')
        xlabel("Deflexion de los flap, $\delta$ [Grados]",'Interpreter','latex')
        ylabel("Sustentacion extra - $\Delta c_{l,0}$",'Interpreter','latex')
    end
end