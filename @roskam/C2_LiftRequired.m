function C2_LiftRequired(app)
    %% Limpiar
    app.liftreqCLmaxTO.Value = 0;
    app.liftreqCLmaxL.Value = 0;
    app.liftreqDeltaCLmaxTO.Value = 0;
    app.liftreqDeltaCLmaxL.Value = 0;
    app.liftreqDeltaClmaxTO.Value = 0;
    app.liftreqDeltaClmaxL.Value = 0;
    app.liftK.Value = 0;
    app.liftreqDeltaCl0TO.Value = 0;
    app.liftreqDeltaCl0L.Value = 0;
    %% Calcular
    Lambda = app.wingSweep.Value * pi/180;
    app.liftKsweep.Value = (1 - 0.08 * cos(Lambda)^2)*cos(Lambda)^(3/4);
    app.liftreqCLmaxTO.Value = str2double(app.climbtocl.Value);
    app.liftreqCLmaxL.Value = str2double(app.climblancl.Value);
    
    app.liftreqDeltaCLmaxTO.Value = (app.liftreqCLmaxTO.Value - app.liftreqCLmax.Value) * 1.05;
    app.liftreqDeltaCLmaxL.Value = (app.liftreqCLmaxL.Value - app.liftreqCLmax.Value) * 1.05;

    app.liftreqDeltaClmaxTO.Value = app.liftreqDeltaCLmaxTO.Value * (app.wingS.Value/app.wingSwf.Value) / app.liftKsweep.Value;
    app.liftreqDeltaClmaxL.Value = app.liftreqDeltaCLmaxL.Value * (app.wingS.Value/app.wingSwf.Value) / app.liftKsweep.Value;

    app.liftK.Value = ppval(K_SingleSlotted, str2double(app.cfcDropDown.Value));
    
    app.liftreqDeltaCl0TO.Value = app.liftreqDeltaClmaxTO.Value / app.liftK.Value;
    app.liftreqDeltaCl0L.Value = app.liftreqDeltaClmaxL.Value / app.liftK.Value;
    if ishandle(6)
        app.C_LiftAvailablePlot()
    end
end