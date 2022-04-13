function init(app)
    fid = fopen('latest.txt','rt');
    if fid ~= -1
        filename = fgetl(fid);
        app.loadFile(filename);
    end
    fclose("all");
    app.updateCalculation();
end