function B5_Cruise(app)
    %% Limpiar resultados
    app.cruiseq.Value = "";
    app.cruisecd01.Value = "";
    app.cruisecd02.Value = "";
    app.cruisev1.Value = "";
    app.cruisev2.Value = "";
    %% Actualizar entrada
    sel = app.lastcruiseselection;
    if ~anynan(str2double(app.cruisem.Value))
        app.cruisetable.Data(sel,1) = str2double(app.cruisem.Value);
    else
        app.cruisetable.Data(sel,1) = 0;
    end
    if ~anynan(str2double(app.cruiseh.Value))
        app.cruisetable.Data(sel,2) = str2double(app.cruiseh.Value);
    else
        app.cruisetable.Data(sel,2) = 0;
    end
    if ~anynan(str2double(app.cruisedcd0.Value))
        app.cruisetable.Data(sel,3) = str2double(app.cruisedcd0.Value);
    else
        app.cruisetable.Data(sel,3) = 0;
    end
    if ~anynan(str2double(app.cruisek.Value))
        app.cruisetable.Data(sel,4) = str2double(app.cruisek.Value);
    else
        app.cruisetable.Data(sel,4) = 0;
    end
    if ~anynan(str2double(app.cruiset.Value))
        app.cruisetable.Data(sel,5) = str2double(app.cruiset.Value);
    else
        app.cruisetable.Data(sel,5) = 0;
    end
    app.cruisetable.Data(sel,6) = app.cruiseplot.Value;
    %% Calcular
    app.cruiseoutput = zeros(size(app.cruisetable.Data, 1), 4) * nan;
    for i=1:size(app.cruisetable.Data,1)
        m = app.cruisetable.Data(i,1);
        h = app.cruisetable.Data(i,2);
        q = nan;
        if ~anynan([m h])
            [~,v,~,rho] = atmosisa(h / 3.281); %ft a m
            rho = rho / 515; %kg/m3 a slug/ft3
            v = m * v * 3.281; %m/s a ft/s
            q = rho/2*v^2;
            if i==sel
                app.cruiseq.Value = num2str(q);
            end
        end
        cd0 = str2double(app.dragcd0.Value);
        if ~anynan(cd0)
            app.cruisecd01.Value = num2str(cd0);
        end
        dcd0 = str2double(app.cruisedcd0.Value);
        cd01 = nan;
        if ~anynan([cd0 dcd0])
            cd01 = cd0 + dcd0;
            app.cruisecd02.Value = num2str(cd01);
        end
        v1 = nan;
        if ~anynan([cd01 q])
            v1 = cd01 * q;
            app.cruisev1.Value = num2str(v1);
        end
        e = str2double(app.drage.Value);
        a = str2double(app.draga.Value);
        v2 = nan;
        if ~anynan([e a q])
            v2 = 1/(pi*e*a*q);
            app.cruisev2.Value = num2str(v2);
        end
        k = app.cruisetable.Data(i,4);
        t = app.cruisetable.Data(i,5);
        app.cruiseoutput(i, :) = [v1 v2 k t];
    end

    if ishandle(5)
        app.B_TWWSPlot()
    end
end