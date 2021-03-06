function loadFile(app, filename)
    if filename == ""
        [file, path] = uigetfile({'*.txt'});
        if file==0
            return
        end
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

    app.climbinput = eval(input(35));
    len = size(app.climbinput,1);
    app.climbselect.Items = string(1:len);
    for i=1:len
        app.climboutput(:,:,i) = [zeros(6, 4) * nan, [1;1;1;1;1;1]];
    end
    app.dragswet.Value = input(36);
    app.cruisetable.Data = eval(input(37));
    app.cruisetableSelectionChanged(1);

    app.wingSweep.Value = eval(input(38));
    app.wingTaper.Value = eval(input(39));
    app.wingx1.Value = eval(input(40));
    app.wingx2.Value = eval(input(41));

    app.liftreqCLmax.Value = eval(input(42));
    app.liftgradient.Value = eval(input(43));

    app.empHorA.Value = eval(input(44));
    app.empVerA.Value = eval(input(45));
    app.empHorTaper.Value = eval(input(46));
    app.empVerTaper.Value = eval(input(47));
    app.empHorSweep.Value = eval(input(48));
    app.empVerSweep.Value = eval(input(49));
    app.empHorIHT.Value = eval(input(50));
    app.empHorHHT.Value = eval(input(51));
    app.empVerIVT.Value = eval(input(52));
    app.empVerHVT.Value = eval(input(53));

    app.catvalues = eval(input(54));
    app.catstart = eval(input(55));
    app.catnames = eval(eval(input(56)));
    app.compnames = eval(eval(input(57)));
    app.exlist = eval(eval(input(58)));

    app.refx0.Value = eval(input(59));
    app.refx1.Value = eval(input(60));
    app.refy0.Value = eval(input(61));
    app.refcmac0.Value = eval(input(62));
    app.refcmac1.Value = eval(input(63));
    

    app.updateUIPlaneType();
    app.A1_FuelFraction();
    app.B41_DragPolar();
    app.D2_Categories();
end