function updateUIPlaneType(app)
    switch str2double(app.tipo.Value)
        case {1, 2, 3, 4, 6, 10, 11, 12}
            app.prop = true;
            app.Label.Text = "prop";
            app.W4Label_5.Text = "$c_p$";
            app.W4Label_9.Text = "$c_p$";
            app.W4Label_14.Text = "$c_p$";
            app.n_p_cl.Editable = "on";
            app.n_p_cr.Editable = "on";
            app.n_p_lo.Editable = "on";
            app.V_cl.Editable = "on";
            app.V_cr.Editable = "off";
            app.V_lo.Editable = "on";
        otherwise
            app.prop = false;
            app.Label.Text = "jet";
            app.W4Label_5.Text = "$c_j$";
            app.W4Label_9.Text = "$c_j$";
            app.W4Label_14.Text = "$c_j$";
            app.n_p_cl.Editable = "off";
            app.n_p_cr.Editable = "off";
            app.n_p_lo.Editable = "off";
            app.V_cl.Editable = "off";
            app.V_cr.Editable = "on";
            app.V_lo.Editable = "off";
    end
end