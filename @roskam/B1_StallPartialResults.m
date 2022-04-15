function B1_StallPartialResults(app)
    h = app.stalltable.Data(app.laststallselection, 2);
    if ~anynan(h)
        [~,~,~,rho] = atmosisa(h / 3.281); % m a ft
        app.stallrho.Value = num2str(rho / 515); % kg/m3 a slug/ft3
    end
end