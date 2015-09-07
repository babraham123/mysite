var graphics = (function() {

var svgs = [];
var paths = [];
var projections = [];

var setupMap = function (width, height, projection_types) {    
    for (var j = 0; j < projection_types.length; j++) {
        var projection;
        switch(projection_types[j]) {
            case ("equirectangular"):
                projection = d3.geo.equirectangular()
                    .translate([width / 2, height / 2])
                    .scale(150)
                    .precision(.1);
                break;
            case ("orthographic"):
                projection = d3.geo.orthographic()
                    .translate([width / 2, height / 2])
                    .scale(200)
                    .clipAngle(90)
                    .rotate([60, 0, 0])
                    .precision(.1);
                break;
            case ("airy"):
                projection = d3.geo.airy()
                    .rotate([90, -40])
                    .scale(170)
                    .translate([width / 2, height / 2])
                    .clipAngle(90)
                    //.radius(90)
                    .precision(.1);
                break;
            case ("aitoff"):
                projection = d3.geo.aitoff()
                    .translate([width / 2, height / 2])
                    .scale(150)
                    .precision(.1);
                break;
            case ("stereographic"):
                projection = d3.geo.stereographic()
                    .scale(150)
                    .translate([width / 2, height / 2])
                    .rotate([-20, 0])
                    .clipAngle(180 - 1e-4)
                    .clipExtent([[0, 0], [width, height]])
                    .precision(.1);
                break;
            default:
                return;
        }

        var path = d3.geo.path()
            .projection(projection);
        var graticule = d3.geo.graticule();

        var svg = d3.select("#" + projection_types[j]).append("svg")
            .attr("width", width)
            .attr("height", height);

        svg.append("path")
            .datum(graticule)
            .attr("class", "graticule")
            .attr("d", path);
        svgs.push(svg);
        paths.push(path);
        projections.push(projection);
    }

    d3.json("world-50m.json", function(error, world) {
        if (error) { throw error; }
        for (var i = 0; i < svgs.length; i++) {
            svgs[i].insert("path", ".graticule")
                .datum(topojson.feature(world, world.objects.land))
                .attr("class", "land")
                .attr("d", paths[i]);

            svgs[i].insert("path", ".graticule")
                .datum(topojson.mesh(world, world.objects.countries, function(a, b) { return a !== b; }))
                .attr("class", "boundary")
                .attr("d", paths[i]);
        }
    });

    d3.select(self.frameElement).style("height", height + "px");
}

var line = function (coors) {
    var line_data = {"type": "LineString", "coordinates": coors };
    for (var i = 0; i < svgs.length; i++) {
        var svg = svgs[i];
        svg.selectAll(".geojson").data([line_data])
            .enter()
            .append("path")
            .attr("class","orbit")
            .attr("d", paths[i]);
    }
}

var polygon = function (coors) {
    var poly_data = {"type": "Polygon", "coordinates": coors };
    for (var i = 0; i < svgs.length; i++) {
        var svg = svgs[i];
        svg.selectAll(".geojson").data([poly_data])
            .enter()
            .append("path")
            .attr("class","orbit")
            .attr("d", paths[i]);
    }
}

var exampleLine = function () {
    var line = {"type": "LineString", "coordinates": [[-4.1397, 50.3706], [-43.2436, -22.9083] , [-67.2717, -55.9797] , [-149.4500, -17.6667], [172.1936, -41.4395] ,[151.1667, -34] , [147.70, -18.3] ,[106.7, -6], [18.4719, -34.3], [-5,-15], [-25.6, 37.7],[-4.1397, 50.3706]] }
    for (var i = 0; i < svgs.length; i++) {
        var svg = svgs[i];
        svg.selectAll(".geojson").data([line])
            .enter()
            .append("path")
            .attr("class","example")
            .attr("d", paths[i]);
    }
}

var rotateLong = function (rot) {
    for (var i = 0; i < projections.length; i++) {
        var projection = projections[i];
        projection.rotate([rot, 0, 0]);
        var svg = svgs[i];
        svg.selectAll(".graticule,.land,.boundary,.orbit,.example")
            .attr("d", paths[i]);
    }
}

return {
    exampleLine: exampleLine,
    setupMap: setupMap,
    line: line,
    polygon: polygon,
    rotateLong: rotateLong
}
})();
