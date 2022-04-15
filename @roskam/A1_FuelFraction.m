function A1_FuelFraction(app)
    %% Borrar resultados parciales
    app.W43.Value = "";
    app.W54.Value = "";
    app.W65.Value = "";
    app.m_ff.Value = "";
    %% Tabla 21
    app.W1TO.Value = num2str(app.table21(str2double(app.tipo.Value), 1));
    app.W21.Value = num2str(app.table21(str2double(app.tipo.Value), 2));
    app.W32.Value = num2str(app.table21(str2double(app.tipo.Value), 3));
    app.W76.Value = num2str(app.table21(str2double(app.tipo.Value), 4));
    app.W87.Value = num2str(app.table21(str2double(app.tipo.Value), 5));
    %% Ascenso
    E_cl = str2double(app.E_cl.Value);
    V_cl = str2double(app.V_cl.Value);
    LD_cl = str2double(app.LD_cl.Value);
    c_cl = str2double(app.c_cl.Value);
    n_p_cl = str2double(app.n_p_cl.Value);
    if app.prop & ~anynan([E_cl V_cl LD_cl c_cl n_p_cl])
        app.W43.Value = num2str(exp(-( (E_cl*V_cl*c_cl)/(375*LD_cl*n_p_cl) )));
    elseif ~app.prop & ~anynan([E_cl LD_cl c_cl])
        app.W43.Value = num2str(exp(-( (E_cl*c_cl) / (LD_cl) )));
    end
    %% Crucero
    V_cr = str2double(app.V_cr.Value);
    R_cr = str2double(app.R_cr.Value);
    LD_cr = str2double(app.LD_cr.Value);
    c_cr = str2double(app.c_cr.Value);
    n_p_cr = str2double(app.n_p_cr.Value);
    if app.prop & ~anynan([R_cr LD_cr c_cr n_p_cr])
        app.W54.Value = num2str(exp(-( (R_cr*c_cr)/(375*LD_cr*n_p_cr) )));
    elseif ~app.prop & ~anynan([R_cr LD_cr c_cr V_cr])
        app.W54.Value = num2str(exp(-( (R_cr*c_cr)/(LD_cr*V_cr) )));
    end
    %% Loiter
    E_lo = str2double(app.E_lo.Value);
    V_lo = str2double(app.V_lo.Value);
    LD_lo = str2double(app.LD_lo.Value);
    c_lo = str2double(app.c_lo.Value);
    n_p_lo = str2double(app.n_p_lo.Value);
    if app.prop & ~anynan([E_lo V_lo c_lo LD_lo n_p_lo])
        app.W65.Value = num2str(exp(-( (E_lo*V_lo*c_lo)/(375*LD_lo*n_p_lo) )));
    elseif ~app.prop & ~anynan([E_lo c_lo LD_lo])
        app.W65.Value = num2str(exp(-( (E_lo*c_lo)/(LD_lo) )));
    end
    %% Fracción final
    W1TO = str2double(app.W1TO.Value);
    W21 = str2double(app.W21.Value);
    W32 = str2double(app.W32.Value);
    W43 = str2double(app.W43.Value);
    W54 = str2double(app.W54.Value);
    W65 = str2double(app.W65.Value);
    W76 = str2double(app.W76.Value);
    W87 = str2double(app.W87.Value);
    W98 = str2double(app.W98.Value);
    if ~anynan([W1TO W21 W32 W65 W76 W87 W98]) 
        app.m_ff.Value = num2str(W1TO * W21 * W32 * W43 * W54 * W65 * W76 * W87 * W98);
    end
    app.A2_TakeOffWeight();
end