(function() {

var width = 960,
    height = 480;
var projection_types = ['equirectangular', 'orthographic', 'airy', 'aitoff', 'stereographic'];

function _init ()
{
    var orbit_btn = $('#generateOrbit');
    var example_btn = $('#example');
    var rot_slider = $('#rotation');

    orbit_btn.click(function() {
        var p, e, i, n_long, p_arg, nu, steps;
        p = getValue('semilatusrectum');
        p = mechanics.r_earth * p;
        e = getValue('eccentricity');
        i = getValue('inclination');
        nlong = getValue('longitudenode');
        parg = getValue('periapsis');
        nu = getValue('trueanomaly');
        steps = getValue('steps');

        var orbit = mechanics.generateOrbit(p, e, i, nlong, parg, nu, steps);
        graphics.line(orbit[0]);
    });
    example_btn.click(function() {
        graphics.exampleLine();
    });

    rot_slider.on("input change", function() {
        graphics.rotateLong(this.value);
    });

    graphics.setupMap(width, height, projection_types);

    
}

function getValue (fieldId) {
    var val = $('#' + fieldId).val();
    if (val === null || val === "" || isNaN(val)) {
        return 0.0;
    }
    val = parseFloat(val);
    if (isNaN(val)) {
        return 0.0;
    }
    return val;
}


_init();
})();