function loadFile(app, filename)
    if filename == ""
        [file, path] = uigetfile({'*.txt'});
        filename = fullfile(path,file);
    end
    [~,name,ext] = fileparts(filename);
    input = readlines(filename);

    app.filename.Text = [name ext];
    app.file = filename;

    fid = fopen('latest.txt','wt');
    fprintf(fid, '%s', filename);
    fclose(fid);

    app.tipo.Value = input(1);
    app.W1TO.Value = input(2);
    app.W21.Value = input(3);
    app.W32.Value = input(4);
    app.W76.Value = input(5);
    app.W87.Value = input(6);
    app.W_to.Value = input(7);
    
    app.E_cl.Value = input(8);
    app.V_cl.Value = input(9);
    app.c_cl.Value = input(10);
    app.n_p_cl.Value = input(11);
    app.LD_cl.Value = input(12);
    
    app.V_cr.Value = input(13);
    app.R_cr.Value = input(14);
    app.c_cr.Value = input(15);
    app.n_p_cr.Value = input(16);
    app.LD_cr.Value = input(17);

    app.E_lo.Value = input(18);
    app.V_lo.Value = input(19);
    app.c_lo.Value = input(20);
    app.n_p_lo.Value = input(21);
    app.LD_lo.Value = input(22);

    app.Wf_res.Value = input(23);
    app.W98.Value = input(24);

    app.Wpl.Value = input(25);
    app.Wcrew.Value = input(26);

    app.stalltable.Data = eval(input(27));
    app.stalltableSelectionChanged(1);
    app.totable.Data = eval(input(28));
    app.totableSelectionChanged(1);
    app.lantable.Data = eval(input(29));
    app.lantableSelectionChanged(1);

    app.dragcf.Value = input(30);
    app.drags.Value = input(31);
    app.draga.Value = input(32);
    app.drage.Value = input(33);
    app.dragtable.Data = eval(input(34));

    app.updateUIPlaneType();
end