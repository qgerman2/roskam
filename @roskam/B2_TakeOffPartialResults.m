function B2_TakeoffPartialResults(app)
    Stofl = app.totable.Data(app.lasttoselection, 1);
    if ~anynan(Stofl)
        app.totop25.Value = num2str(Stofl/37.5);
    end
    h = app.totable.Data(app.lasttoselection, 2);
    if ~anynan(h)
        [~,~,~,rho] = atmosisa(h / 3.281);
        app.tosigma.Value = num2str(rho/app.rho0);
    end
end