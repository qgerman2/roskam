function init(app)
    app.StallReqs.Data = [
        [0.0024, 0, 0, 0];
        [0.0024, 0, 0, 0];
        [0.0024, 0, 0, 0]
    ];
    fid = fopen('latest.txt','rt');
    if fid ~= -1
        filename = fgetl(fid);
        app.loadFile(filename);
    end
    fclose("all");
    app.updateCalculation();
end