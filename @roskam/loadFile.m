function loadFile(app, filename)
    if filename == ""
        [file, path] = uigetfile({'*.txt'});
        filename = fullfile(path,file);
    end
    input = cell2mat(readcell(filename));
    [~,name,ext] = fileparts(filename);
    fclose('all');
    app.filename.Text = [name ext];
    app.file = filename;

    fid = fopen('latest.txt','wt');
    fprintf(fid, '%s', filename);
    fclose(fid);

    app.tipo.Value = num2str(input(1), '%d');
    app.W1TO.Value = app.zerotoempty(num2str(input(2)));
    app.W21.Value = app.zerotoempty(num2str(input(3)));
    app.W32.Value = app.zerotoempty(num2str(input(4)));
    app.W76.Value = app.zerotoempty(num2str(input(5)));
    app.W87.Value = app.zerotoempty(num2str(input(6)));
    app.W_to.Value = app.zerotoempty(num2str(input(7)));
    
    app.E_cl.Value = app.zerotoempty(num2str(input(8)));
    app.V_cl.Value = app.zerotoempty(num2str(input(9)));
    app.c_cl.Value = app.zerotoempty(num2str(input(10)));
    app.n_p_cl.Value = app.zerotoempty(num2str(input(11)));
    app.LD_cl.Value = app.zerotoempty(num2str(input(12)));
    
    app.V_cr.Value = app.zerotoempty(num2str(input(13)));
    app.R_cr.Value = app.zerotoempty(num2str(input(14)));
    app.c_cr.Value = app.zerotoempty(num2str(input(15)));
    app.n_p_cr.Value = app.zerotoempty(num2str(input(16)));
    app.LD_cr.Value = app.zerotoempty(num2str(input(17)));

    app.E_lo.Value = app.zerotoempty(num2str(input(18)));
    app.V_lo.Value = app.zerotoempty(num2str(input(19)));
    app.c_lo.Value = app.zerotoempty(num2str(input(20)));
    app.n_p_lo.Value = app.zerotoempty(num2str(input(21)));
    app.LD_lo.Value = app.zerotoempty(num2str(input(22)));

    app.Wf_res.Value = app.zerotoempty(num2str(input(23)));
    app.W98.Value = app.zerotoempty(num2str(input(24)));

    app.Wpl.Value = app.zerotoempty(num2str(input(25)));
    app.Wcrew.Value = app.zerotoempty(num2str(input(26)));

    app.updateCalculation();
end