function input = getCalculationInput(app)
    input = {
        app.tipo.Value;
        app.W1TO.Value; app.W21.Value; app.W32.Value; app.W76.Value; app.W87.Value; app.W_to.Value;
        app.E_cl.Value; app.V_cl.Value; app.c_cl.Value; app.n_p_cl.Value; app.LD_cl.Value;
        app.V_cr.Value; app.R_cr.Value; app.c_cr.Value; app.n_p_cr.Value; app.LD_cr.Value;
        app.E_lo.Value; app.V_lo.Value; app.c_lo.Value; app.n_p_lo.Value; app.LD_lo.Value;
        app.Wf_res.Value; app.W98.Value; app.Wpl.Value; app.Wcrew.Value
    };
    input(cellfun(@isempty, input)) = {0};
end