function init(app)
    [~,~,~,app.rho0] = atmosisa(0);
    %Tablas
    app.stalltable.Data = [
        [0, 0, 1.1, 0, 1];
    ];
    app.totable.Data = [
        [0, 0, 1.1, 1];
    ];
    app.lantable.Data = [
        [0, 0, 1.1, 0.85, 1];
    ];
    app.cruisetable.Data = [
        [0, 0, 0, 0, 0, 1];
    ];
    app.stalltable.Selection = 1;
    app.totable.Selection = 1;
    app.lantable.Selection = 1;
    app.cruisetable.Selection = 1;
    app.cruisetableSelectionChanged(1);
    app.dragtable.Data = [
       [0, 0];
       [0, 0];
       [0, nan]
    ];
    app.climbtable.Data = [
        [nan, nan, nan, nan, 1];
        [nan, nan, nan, nan, 1];
        [nan, nan, nan, nan, 1];
        [nan, nan, nan, nan, 1];
        [nan, nan, nan, nan, 1];
        [nan, nan, nan, nan, 1];
    ];
    app.updateUIPlaneType();
    %Cargar dimensiones de imagen para cg
    img = imread("avion.png");
    app.refx0.Value = 0;
    app.refx1.Value = size(img, 2);
    app.refy0.Value = size(img, 1) / 2;
    %Cargar ultimo archivo
    fid = fopen('latest.txt','rt');
    if fid ~= -1
        filename = fgetl(fid);
        app.loadFile(filename);
    end
    fclose("all");

end