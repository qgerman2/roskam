function updateWeights(app)
    m_ff = str2double(app.m_ff.Value);
    W_to = str2double(app.W_to.Value);
    if ~anynan(W_to)
        app.WEtarget.Value = num2str( 10^((log10(W_to) - 0.0833)/1.0383) );
    end
    if ~anynan([m_ff W_to])
        app.Wf_used.Value = num2str((1-m_ff)*W_to);
    end
    Wf_used = str2double(app.Wf_used.Value);
    if ~anynan([Wf_used])
        app.Wf_res.Value = num2str(0.1 * Wf_used);
    end
    Wf_res = str2double(app.Wf_res.Value);
    if ~anynan([Wf_used Wf_res])
        app.Wf.Value = num2str(Wf_used + Wf_res);
    end
    Wf = str2double(app.Wf.Value);
    if ~anynan([Wf])
        app.Wtfo.Value = num2str(0.005 * Wf);
    end
    Wtfo = str2double(app.Wtfo.Value);
    Wpl = str2double(app.Wpl.Value);
    Wcrew = str2double(app.Wcrew.Value);
    if ~anynan([W_to Wf Wtfo Wpl Wcrew])
        app.WE.Value = num2str(W_to - Wf - Wtfo - Wpl - Wcrew);
    end
    WE = str2double(app.WE.Value);
    WEtarget = str2double(app.WEtarget.Value);
    if ~anynan([W_to WE WEtarget])
        err = (abs(WEtarget - WE) / WEtarget) * 100;
        app.WError.Value = [num2str(err, 4) '%'];
        if ishandle(2) 
            app.refreshWeightPlot();
            hold on
            loglog(W_to, WEtarget, 'ob');
            loglog(W_to, WE, 'or');
            hold off
        end
    end
end