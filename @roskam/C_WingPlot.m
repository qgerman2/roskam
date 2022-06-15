function C_WingPlot(app)
    app.wingSwf.Value = 0;
    S = app.wingS.Value;
    A = app.wingA.Value;
    b = app.wingb.Value;
    sweep = app.wingSweep.Value * pi/180;
    c_root = app.wingCroot.Value;
    c_tip = app.wingCtip.Value;
    if nnz([S A b c_root c_tip]) == 5
        x_tip = b/2;
        y_tip = c_root/4 + b/2 * tan(sweep) - c_tip/4;
        ps = polyshape([-x_tip, 0, x_tip, x_tip, 0, -x_tip], [-y_tip, 0, -y_tip, -y_tip-c_tip, -c_root, -y_tip-c_tip]);
        plot(app.wingPlot, ps);
        s1 = app.wingx1.Value;
        s2 = app.wingx2.Value;
        if nnz([s1 s2]) == 2 && s2 > s1
            hold(app.wingPlot, "on");
            s1_c = c_root*(1-s1) + c_tip*s1;
            s2_c = c_root*(1-s2) + c_tip*s2;
            s1_x = b/2*s1;
            s1_y = c_root/4 + s1_x * tan(sweep) - s1_c/4;
            s2_x = b/2*s2;
            s2_y = c_root/4 + s2_x * tan(sweep) - s2_c/4;
            psf1 = polyshape([s1_x, s2_x, s2_x, s1_x], [-s1_y, -s2_y, -s2_y-s2_c, -s1_y-s1_c]);
            psf2 = polyshape([-s1_x, -s2_x, -s2_x, -s1_x], [-s1_y, -s2_y, -s2_y-s2_c, -s1_y-s1_c]);
            plot(app.wingPlot, psf1);
            plot(app.wingPlot, psf2);
            hold(app.wingPlot, "off");
            app.wingSwf.Value = area(psf1) + area(psf2);
        end
    end
end