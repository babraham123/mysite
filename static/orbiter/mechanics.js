var mechanics = (function() {

var mu = 398600.4418,  // km^3/s^2
    r_earth = 6371.0;  // km
// units = km, seconds, radians

var generateOrbit = function (p, e, i, n_long, p_arg, nu_0, steps) {
    var o_angles = degToRad([i, n_long, p_arg, nu_0]);
    var orbit = generateOrbitPerifocal(p, e, steps);
    //console.log("\n\nPerifocal Flat");
    //console.log(JSON.stringify(orbit[0]));
    orbit = rotOrbitToGeocentric(o_angles, orbit);
    //console.log("\n\n3D Rotated");
    //console.log(JSON.stringify(orbit));
    orbit = convertOrbitToLongLatSpherical(orbit);
    orbit[0] = radToDeg(orbit[0]);
    //console.log("\n\nLat Long");
    //console.log(JSON.stringify(orbit[0]));
    return orbit;
}

var generateOrbitPerifocal = function (p, e, steps) {
    var nu, r, rp, rq, vp, vq, v, c, z;
    nu = numeric.linspace(0, 2*Math.PI, steps);

    // p/(1 + e*cos(nu))
    if (Array.isArray(e)) {
        e = numeric.norm2(e);
    }
    r = numeric.cos(nu);
    r = numeric.mul(r, e);
    r = numeric.add(r, 1);
    r = numeric.div(p, r);

    console.log("\n\nMagnitude");
    console.log(JSON.stringify(r));

    rp = numeric.cos(nu);
    rp = numeric.mul(rp, r);
    rq = numeric.sin(nu);
    rq = numeric.mul(rq, r);

    c = Math.sqrt(mu / p);
    vp = numeric.sin(nu);
    vp = numeric.neg(vp);
    vq = numeric.cos(nu);
    vq = numeric.add(vq, e);
    vp = numeric.mul(vp, c);
    vq = numeric.mul(vq, c);

    z = numeric.rep([rp.length], 0);
    r = numeric.transpose( [rp, rq, z] );
    v = numeric.transpose( [vp, vq, z] );
    
    // perifocal coordinates
    return [r, v];
}

var calcOrbitalAngles = function (r, v) {
    var e = calcEccentricity(r, v);
    var h = calcMomentum(r, v);
    //var p = calcSemiLatus(h);
    var n = calcNodeV(h);
    var i = calcInclination(h);
    var n_long = calcNodeLongitude(n);
    var p_arg = calcPeriapsisArgument(n, e);
    var nu_0 = calcTrueAnomaly(e, r);
    return [i, n_long, p_arg, nu_0];
}

var calcOrbitalVectors = function (r, v) {
    var e = calcEccentricity(r, v);
    var h = calcMomentum(r, v);
    var n = calcNodeV(h);
    return [e, h, n];
}

// [i, n_long, p_arg]
var rotOrbitToGeocentric = function (o_angles, orbit) {
    var Rot, orbit_geo;
    Rot = calcRotMatrix(o_angles[0], o_angles[1], o_angles[2]);
    orbit_geo = numeric.clone(orbit);
    for (var i = 0; i < orbit_geo[0].length; i++) {
        orbit_geo[0][i] = numeric.dotMV(Rot, orbit_geo[0][i]);
        orbit_geo[1][i] = numeric.dotMV(Rot, orbit_geo[1][i]);
    }
    return orbit_geo;
}

// return [longitude/latitude, altitude, coverage]
var convertOrbitToLongLatSpherical = function (orbit) {
    var lat, lon, alt, r, rmag;
    r = orbit[0];
    rmag = r.map(numeric.norm2);
    r = numeric.transpose(r);
    lat = numeric.asin( numeric.div(r[2], rmag) );
    //lat = numeric.sub(lat, Math.PI/2);
    lon = numeric.atan2(r[1], r[0]);
    //lon = numeric.sub(lon, Math.PI);
    alt = numeric.sub(rmag, r_earth);

    // calc coverage radius based off of altitude
    coverage = numeric.rep([rmag.length], 0.1);
    return [ numeric.transpose([lon, lat]), alt, coverage ];
}

// TODO
function convertOrbitToLatLongGeodetic (orbit) {}
function calcEarthRotFromTime (t) {}
function convertTopocentricToCartesian (p, q) {}
function transTopocentricToGeocentric (r, v) {}
function convertGeocentricToLatLongAlt (r, v) {}

// From Perifocal to Geocentric-Equatorial
var calcRotMatrix = function (i, n_long, p_arg) {
    var r11, r12, r13, r21, r22, r23, r31, r32, r33;
    r11 = Math.cos(n_long)*Math.cos(p_arg) - Math.sin(n_long)*Math.sin(p_arg)*Math.cos(i);
    r12 = - Math.cos(n_long)*Math.sin(p_arg) - Math.sin(n_long)*Math.cos(p_arg)*Math.cos(i);
    r13 = Math.sin(n_long)*Math.sin(i);

    r21 = Math.sin(n_long)*Math.cos(p_arg) + Math.cos(n_long)*Math.sin(p_arg)*Math.cos(i);
    r22 = - Math.sin(n_long)*Math.sin(p_arg) + Math.cos(n_long)*Math.cos(p_arg)*Math.cos(i);
    r23 = - Math.cos(n_long)*Math.sin(i);

    r31 = Math.sin(p_arg)*Math.sin(i);
    r32 = Math.cos(p_arg)*Math.sin(i);
    r33 = Math.cos(i);
    return [[r11, r21, r31], [r12, r22, r32], [r13, r23, r33]];
}

// orbital angles

function calcInclination (h) {
    var hmag = numeric.norm2(h);
    return Math.acos(h[2] / hmag);
}

function calcNodeLongitude (n) {
    var nmag = numeric.norm2(n);
    var n_long = Math.acos(h[0] / nmag);
    if (n[1] < 0) {  // TODO: check
        n_long = 2*Math.PI - n_long;
    }
    return n_long;
}

function calcPeriapsisArgument (n, e) {
    var nmag = numeric.norm2(n);
    var emag = numeric.norm2(e);
    var p_arg = numeric.dot(n, e);
    p_arg = Math.acos(p_arg / (nmag*emag));
    if (e[2] < 0) {  // TODO: check
        p_arg = 2*Math.PI - p_arg;
    }
    return p_arg;
}

function calcTrueAnomaly (e, r) {
    var emag = numeric.norm2(e);
    var rmag = numeric.norm2(r);
    var c = numeric.dot(e, r);
    var nu_0 = Math.acos(c / (emag*rmag));
    if (c < 0) {  // TODO: check
        nu_0 = 2*Math.PI - nu_0;
    }
    return nu_0;
}

function calcEpochArgument (n, r) {
    var nmag = numeric.norm2(n);
    var rmag = numeric.norm2(r);
    var c = numeric.dot(n, r);
    var u_0 = Math.acos(c / (nmag*rmag));
    if (r[2] < 0) {  // TODO: check
        u_0 = 2*Math.PI - u_0;
    }
    return u_0;
}

// orbit related vectors

function calcEccentricity (r, v) {
    var rmag = numeric.norm2(r);
    var vmag = numeric.norm2(v);
    var c = (vmag*vmag) - (mu/rmag);
    c = numeric.mul(c, r);
    var d = numeric.dot(r, v);
    d = numeric.mul(d, v);
    var e = numeric.sub(c, d);
    return numeric.div(e, mu);
}

function calcMomentum (r, v) {
    return cross(r, v);
}

function calcNodeV (h) {
    return cross([0,0,1], h);
}

// orbit related scalar values

function calcPeriod (p, e) {
    var a = calcMajorAxis(p, e);
    return 2 * Math.PI * Math.sqrt(a*a*a / mu);
}

function calcSemiLatus (h) {
    if (Array.isArray(h)) {
        h = numeric.norm2(h);
    }
    return h*h / mu;
}

function calcMajorAxis (p, e) {
    if (Array.isArray(e)) {
        e = numeric.norm2(e);
    }
    return p / (1 - e*e);
}

function calcEnergy (r, v) {
    if (Array.isArray(r)) {
        r = numeric.norm2(r);
    }
    if (Array.isArray(v)) {
        v = numeric.norm2(v);
    }
    return (v*v / 2) - (mu/r);
}

// dim 3 cross product
function cross (u,v) {
    if (!Array.isArray(u) && !Array.isArray(v)) {
        return u*v;
    }
    if (u.length !== 3 || v.length !== 3) {
        u = [u[0], u[1], 0];
        v = [v[0], v[1], 0];
    }
    return [u[1]*v[2]-u[2]*v[1],u[2]*v[0]-u[0]*v[2],u[0]*v[1]-u[1]*v[0]];
}

function radToDeg (radians) {
    return numeric.div( numeric.mul(radians, 180.0), Math.PI);
}

function degToRad (degrees) {
    return numeric.div( numeric.mul(degrees, Math.PI), 180.0);
}

return {
    mu: mu,
    r_earth: r_earth,
    generateOrbit: generateOrbit,
    calcOrbitalAngles: calcOrbitalAngles,
    calcOrbitalVectors: calcOrbitalVectors,
    rotOrbitToGeocentric: rotOrbitToGeocentric,
    convertOrbitToLongLat: convertOrbitToLongLatSpherical
}
})();