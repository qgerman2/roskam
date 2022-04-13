function updateStallSizing(app)
    for i=1:3
        rho = app.StallReqs.Data(i,1);
        Vs = app.StallReqs.Data(i,2) * 1.68781; % ktas a ft/s
        CL = app.StallReqs.Data(i,3);
        app.StallReqs.Data(i,4) = rho * Vs^2 * CL / 2;
    end
end