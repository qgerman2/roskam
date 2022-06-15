function C1_ChordsFlaps(app)
    %% Limpiar
    app.wingS.Value = 0;
    app.wingA.Value = 0;
    app.wingb.Value = 0;
    app.wingCtip.Value = 0;
    %% Extraer de pestañas anteriores
    S = str2double(app.drags.Value);
    A = str2double(app.draga.Value);
    if ~anynan(S)
        app.wingS.Value = S;
    end
    if ~anynan(A)
        app.wingA.Value = A;
    end
    %% Calculos nuevos
    b = sqrt(A*S);
    app.wingb.Value = b;
    taper = app.wingTaper.Value;
    if nnz([b taper S]) == 3
        root = 2*S/((1+taper)*b);
        app.wingCroot.Value = root;
        app.wingCtip.Value = root * taper;
    end
    %% Dibujar
    app.C_WingPlot(); %Contiene un calculo ademas del plot asi que debe ser ejecutado
    app.C2_LiftRequired();
end