function B41_DragPolar(app)
    Wto = str2double(app.W_to.Value);
    Swet = nan;
    if ~anynan(Wto)
        c = 0.0199;
        d = 0.7531;
        Swet = exp(log(Wto)*d+log(10)*c);
        app.dragswet.Value = num2str(Swet);
    end
    f = nan;
    if ~anynan(Swet)
        cfsel = str2double(app.dragcf.Value);
        a = app.tablecf(cfsel, 2);
        b = app.tablecf(cfsel, 3);
        f = exp(log(Swet)*b+log(10)*a);
        app.dragf.Value = num2str(f);
    end
    S = str2double(app.drags.Value);
    if ~anynan([f S])
        cd0 = f/S;
        app.dragcd0.Value = num2str(cd0);
        app.dragv11.Value = num2str(cd0);

        toFlapsDelta = app.dragtable.Data(1, 1);
        lanFlapsDelta = app.dragtable.Data(2, 1);
        lanGearDelta = app.dragtable.Data(3, 1);

        app.dragv21.Value = num2str(cd0 + toFlapsDelta);
        app.dragv31.Value = num2str(cd0 + toFlapsDelta + lanGearDelta);

        app.dragv41.Value = num2str(cd0 + lanFlapsDelta);
        app.dragv51.Value = num2str(cd0 + lanFlapsDelta + lanGearDelta);
    end
    A = str2double(app.draga.Value);
    e = str2double(app.drage.Value);
    if ~anynan([A e])
        v2 = 1/(pi*A*e);
        app.dragv12.Value = num2str(v2);  
    end
    if ~anynan(A)
        toe = app.dragtable.Data(1, 2);
        lane = app.dragtable.Data(2, 2);
        
        app.dragv22.Value = num2str(1/(pi*A*toe));
        app.dragv32.Value = num2str(1/(pi*A*toe));

        app.dragv42.Value = num2str(1/(pi*A*lane));
        app.dragv52.Value = num2str(1/(pi*A*lane));
    end
end