function saveFile(app, new)
    input = {
        app.tipo.Value;
        app.W1TO.Value; app.W21.Value; app.W32.Value; app.W76.Value; app.W87.Value; app.W_to.Value;
        app.E_cl.Value; app.V_cl.Value; app.c_cl.Value; app.n_p_cl.Value; app.LD_cl.Value;
        app.V_cr.Value; app.R_cr.Value; app.c_cr.Value; app.n_p_cr.Value; app.LD_cr.Value;
        app.E_lo.Value; app.V_lo.Value; app.c_lo.Value; app.n_p_lo.Value; app.LD_lo.Value;
        app.Wf_res.Value; app.W98.Value; app.Wpl.Value; app.Wcrew.Value; mat2str(app.stalltable.Data);
        mat2str(app.totable.Data); mat2str(app.lantable.Data);
        app.dragcf.Value; app.drags.Value; app.draga.Value; app.drage.Value; mat2str(app.dragtable.Data);
        mat2str(app.climbinput);
        app.dragswet.Value;
        mat2str(app.cruisetable.Data);
        app.wingSweep.Value;
        app.wingTaper.Value;
        app.wingx1.Value;
        app.wingx2.Value;
        app.liftreqCLmax.Value;
        app.liftgradient.Value;

    };
    if new || app.file == ""
        [file, path] = uiputfile({'*.txt'});
        if file == 0
        else
            filename = fullfile(path,file);
            writecell(input, filename);
            [~,name,ext] = fileparts(file);
            app.filename.Text = [name ext];
            app.file = filename;
            fid = fopen('latest.txt','wt');
            fprintf(fid, '%s', filename);
            fclose(fid);
        end
    else
        writecell(input, app.file);
    end
    fclose('all');
end