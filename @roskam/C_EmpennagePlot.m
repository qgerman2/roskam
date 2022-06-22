function C_EmpennagePlot(app)
    I_VT = app.empVerIVT.Value;
    I_HT = app.empHorIHT.Value;
    H_VT = app.empVerHVT.Value;
    H_HT = app.empHorHHT.Value;
    wingAR = app.wingA.Value;
    wingArea = app.wingS.Value;
    wingTaper = app.wingTaper.Value;
    wingSweep = deg2rad(app.wingSweep.Value);
    empHorAR = app.empHorA.Value;
    empHorTaper = app.empHorTaper.Value;
    empHorSweep = deg2rad(app.empHorSweep.Value);
    empVerAR = app.empVerA.Value;
    empVerTaper = app.empVerTaper.Value;
    empVerSweep = deg2rad(app.empVerSweep.Value);
    %% Ala
    % Calculos
    wingSpan = sqrt(wingAR * wingArea);
    % Cuerdas
    wingCRoot = 2 * wingArea/((1 + wingTaper) * wingSpan);
    wingCTip = wingCRoot * wingTaper;
    % Posición de centro aerodinámico
    wingCmac = 2 * wingCRoot / 3 * (1 + wingTaper + wingTaper^2) / (1 + wingTaper);
    wingXPosmac = 1 / 6 * (1 + 2 * wingTaper) / (1 + wingTaper) * wingSpan;
    wingYPos14mac = wingCRoot/4 + wingXPosmac * tan(wingSweep);
    % Posición borde de ataque de cuerda punta
    wingXPosTip = wingSpan/2;
    wingYPosTip = wingCRoot/4 + wingSpan/2 * tan(wingSweep) - wingCTip/4;
    
    %% Estabilizador horizontal
    % Calculos
    empHorArea = 1 * wingCmac * wingArea / I_HT;
    empHorSpan = sqrt(empHorAR * empHorArea);
    % Cuerdas
    empHorCRoot = 2 * empHorArea/((1 + empHorTaper) * empHorSpan);
    empHorCTip = empHorCRoot * empHorTaper;
    empHorCmac = 2 * empHorCRoot / 3 * (1 + empHorTaper + empHorTaper^2) / (1 + empHorTaper);
    % Posición de centro aerodinámico
    empHorXPosmac = 1 / 6 * (1 + 2 * empHorTaper) / (1 + empHorTaper) * empHorSpan;
    empHorYPos14mac = empHorCRoot/4 + empHorXPosmac * tan(empHorSweep);
    % Posición borde de ataque de cuerda punta
    empHorXPosTip = empHorSpan / 2;
    empHorYPosTip = empHorCRoot/4 + empHorSpan/2 * tan(empHorSweep) - empHorCTip/4;
    
    
    %% Estabilizador vertical
    % Calculos
    empVerArea = 0.09 * wingSpan * wingArea / I_VT;
    empVerSpan = sqrt(empVerAR * empVerArea);
    % Cuerdas
    empVerCRoot = 2 * empVerArea/((1 + empVerTaper) * empVerSpan);
    empVerCTip = empVerCRoot * empVerTaper;
    empVerCmac = 2 * empVerCRoot / 3 * (1 + empVerTaper + empVerTaper^2) / (1 + empVerTaper);
    % Posición de centro aerodinámico
    empVerXPosmac = 1 / 6 * (1 + 2 * empVerTaper) / (1 + empVerTaper) * empVerSpan;
    empVerYPos14mac = empVerCRoot/4 + empVerXPosmac * tan(empVerSweep);
    % Posición borde de ataque de cuerda punta
    empVerXPosTip = empVerSpan / 2;
    empVerYPosTip = empVerCRoot/4 + empVerSpan/2 * tan(empVerSweep) - empVerCTip/4;
    
    %% Dibujar
    figure(7);
    clf(7);
    hold on
    axis equal
    grid on
    wingShape = polyshape( ...
        [-wingXPosTip, 0, wingXPosTip, wingXPosTip, 0, -wingXPosTip], ...
        [-wingYPosTip, 0, -wingYPosTip, -wingYPosTip-wingCTip, -wingCRoot, -wingYPosTip-wingCTip]);
    wingShape = translate(wingShape, [0, wingYPos14mac - empHorYPos14mac + I_HT]);
    empHorShape = polyshape( ...
        [-empHorXPosTip, 0, empHorXPosTip, empHorXPosTip, 0, -empHorXPosTip], ...
        [-empHorYPosTip, 0, -empHorYPosTip, -empHorYPosTip-empHorCTip, -empHorCRoot, -empHorYPosTip-empHorCTip]);
    plot(empHorShape, "FaceColor", 'b');
    plot(wingShape, "FaceColor", 'r');
    
    plot([wingXPosmac, wingXPosmac], [-empHorYPos14mac + I_HT + 1/4 * wingCmac, -empHorYPos14mac + I_HT - 3/4 * wingCmac]);
    plot([empHorXPosmac, empHorXPosmac], [-empHorYPos14mac + 1/4 * empHorCmac, -empHorYPos14mac - 3/4 * empHorCmac]);

    plot(wingXPosmac, -empHorYPos14mac + I_HT, 'x');
    plot(empHorXPosmac, -empHorYPos14mac, 'x');

    
    figure(8)
    clf(8);
    hold on
    axis equal
    grid on
    empVerShape = polyshape( ...
        [0, empVerXPosTip, empVerXPosTip, 0], ...
        [0, -empVerYPosTip, -empVerYPosTip-empVerCTip, -empVerCRoot]);
    empVerShape = rotate(empVerShape, 90);
    empVerShape = translate(empVerShape, [empHorYPos14mac - I_HT - empVerYPos14mac + I_VT, -empVerXPosmac - H_HT + H_VT]);
    
    plot([0, empHorYPosTip + empHorCTip], [0, 0], "Color", 'b');
    plot(empHorYPos14mac, 0, 'x');
    plot([-wingYPos14mac + empHorYPos14mac - I_HT, -wingYPos14mac + empHorYPos14mac - I_HT + wingYPosTip + wingCTip], [-H_HT, -H_HT], "Color", 'r');
    plot(empHorYPos14mac - I_HT, -H_HT, 'x');
    plot(empVerShape, "FaceColor", 'm');
    
    plot([empHorYPos14mac - I_HT + I_VT - 1/4*empVerCmac, empHorYPos14mac - I_HT + I_VT + 3/4 * empVerCmac], [-H_HT + H_VT, -H_HT + H_VT]);
    plot(empHorYPos14mac - I_HT + I_VT, -H_HT + H_VT, 'x');
end