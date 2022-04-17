function B42_Climb(app)
    sel = str2double(app.climbselect.Value);
    %% Cargar entrada
    app.climbtocl.Value = num2str(app.climbinput(sel, 1));
    app.climbercl.Value = num2str(app.climbinput(sel, 2));
    app.climblancl.Value = num2str(app.climbinput(sel, 3));
    app.climbwlwto.Value = num2str(app.climbinput(sel, 4));
    app.climbappcl.Value = num2str(app.climbinput(sel, 5));
    app.climbvs2.Value = num2str(app.climbinput(sel, 6));
    app.climbplot.Value = app.climbinput(sel, 7);
    %% Limpiar resultados
    app.climboutput(:,1:4,:) = nan;
    %% Calcular cl
    for i=1:size(app.climbinput,1)
        maxtocl = app.climbinput(i, 1);
        vs2 = app.climbinput(i, 6);
        cl1 = nan;
        cl2 = nan;
        cl3 = nan;
        if ~anynan(maxtocl)
            cl1 = maxtocl/1.2^2;
            app.climboutput(1,1,i) = cl1;
            if ~anynan(vs2)
                cl2 = maxtocl/vs2^2;
                app.climboutput(2,1,i) = cl2;
            end
            cl3 = maxtocl/1.2^2;
            app.climboutput(3,1,i) = cl3;
        end
        maxercl = app.climbinput(i, 2);
        cl4 = nan;
        if ~anynan(maxercl)
            cl4 = maxercl/1.25^2;
            app.climboutput(4,1,i) = cl4;
        end
        maxlancl = app.climbinput(i, 3);
        cl5 = nan;
        if ~anynan(maxlancl)
            cl5 = maxlancl/1.3^2;
            app.climboutput(5,1,i) = cl5;
        end
        maxappcl = app.climbinput(i, 5);
        cl6 = nan;
        if ~anynan(maxappcl)
            cl6 = maxappcl/1.5^2;
            app.climboutput(6,1,i) = cl6;
        end
        %% Calcular cd, LD, TW
        % Take-off flaps, gear up
        dv21 = str2double(app.dragv21.Value);
        dv22 = str2double(app.dragv22.Value);
        if ~anynan([dv21 dv22 cl1])
            % 1
            cd1 = dv21 + cl1^2 * dv22;
            app.climboutput(1,2,i) = cd1;
            ld1 = cl1 / cd1;
            app.climboutput(1,3,i) = ld1;
            app.climboutput(1,4,i) = 2*(1/ld1 + 0.012)/0.8;
        end
        if ~anynan([dv21 dv22 cl3])
            % 3
            cd3 = dv21 + cl3^2 * dv22;
            app.climboutput(3,2,i) = cd3;
            ld3 = cl3 / cd3;
            app.climboutput(3,3,i) = ld3;
            app.climboutput(3,4,i) = 2*(1/ld3 + 0.024)/0.8;
        end
        dv31 = str2double(app.dragv31.Value);
        dv32 = str2double(app.dragv32.Value);
        if ~anynan([dv31 dv32 cl2])
            % 2
            cd2 = dv31 + cl2^2 * dv32;
            app.climboutput(2,2,i) = cd2;
            ld2 = cl2/cd2;
            app.climboutput(2,3,i) = ld2;
            app.climboutput(2,4,i) = 2*(1/ld2 + 0)/0.8;
        end
        dv11 = str2double(app.dragv11.Value);
        dv12 = str2double(app.dragv12.Value);
        if ~anynan([dv11 dv12 cl4])
            % 4
            cd4 = dv11 + cl4^2 * dv12;
            app.climboutput(4,2,i) = cd4;
            ld4 = cl4/cd4;
            app.climboutput(4,3,i) = ld4;
            app.climboutput(4,4,i) = 2*(1/ld4 + 0.012)/0.8/0.94;
        end
        dv51 = str2double(app.dragv51.Value);
        dv52 = str2double(app.dragv52.Value);
        wlwto = app.climbinput(i, 4);
        if ~anynan([dv51 dv52 cl5])
            % 5
            cd5 = dv51 + cl5^2 * dv52;
            app.climboutput(5,2,i) = cd5;
            ld5 = cl5/cd5;
            app.climboutput(5,3,i) = ld5;
            if ~anynan(wlwto)
                app.climboutput(5,4,i) = (1/ld5 + 0.032)*wlwto/0.8;
            end
        end
        if ~anynan([dv31 dv51 dv52 cl6])
            % 6
            v1 = (dv31+dv51)/2;
            cd6 = v1 + cl6^2 * dv52;
            app.climboutput(6,2,i) = cd6;
            ld6 = cl6/cd6;
            app.climboutput(6,3,i) = ld6;
            if ~anynan(wlwto)
                app.climboutput(6,4,i) = 2*(1/ld6 + 0.021)*wlwto/0.8;
            end
        end
    end
    app.climbtable.Data = app.climboutput(:,:,sel);
    if ishandle(5)
        app.B_TWWSPlot();
    end
end