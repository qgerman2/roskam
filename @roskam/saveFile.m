function saveFile(app, new)
    input = app.getCalculationInput();
    if new || app.file == ""
        [file, path] = uiputfile({'*.txt'});
        filename = fullfile(path,file);
        writecell(input, filename);
        [~,name,ext] = fileparts(file);
        app.filename.Text = [name ext];
        app.file = filename;
        fid = fopen('latest.txt','wt');
        fprintf(fid, '%s', filename);
        fclose(fid);
    else
        writecell(input, app.file);
    end
    fclose('all');
end