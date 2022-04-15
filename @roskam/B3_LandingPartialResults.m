function B3_LandingPartialResults(app)
    h = app.lantable.Data(app.lastlanselection, 2);
    if ~anynan(h)
        [~,~,~,rho] = atmosisa(h / 3.281); % m a ft
        app.lanrho.Value = num2str(rho / 515); % kg/m3 a slug/ft3
    end
end