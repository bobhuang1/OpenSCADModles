use <text_on.scad>

CakeDiameter = 75;

SmallBoundary = 1.25;
SmallSize = 0.5;

Arc1BeginAngle = 160;
Arc1EndAngle = 230;


translate([15, 10, 0])
linear_extrude(height=SmallBoundary, twist=0)
arc(Arc1BeginAngle, Arc1EndAngle, CakeDiameter/2, SmallSize);

translate([21, 10, 0])
linear_extrude(height=SmallBoundary, twist=0)
arc(Arc1BeginAngle, Arc1EndAngle, CakeDiameter/2, SmallSize);




function arcPoints(from = 0, to = 360, radius = 1) = let(_step = (to - from) / ($fn ? $fn : 200)) [
    for(_angle = [ from : _step : to + _step / 10 ]) [ cos(_angle), sin(_angle) ] * radius
];
/**
 * Dibuja un arco entre dos ángulos.
 *
 * @param {Float} from      Ángulo inicial.
 * @param {Float} to        Ángulo final.
 * @param {Float} radius    Radio del arco.
 * @param {Float} thickness Grosor del arco.
 */
module arc(from = 0, to = 360, radius = 1, thickness = 0.1)
{
    _outer = radius + thickness / 2;
    _inner = radius - thickness / 2;
    polygon(
        points = concat(
            arcPoints(from, to,   _outer),
            arcPoints(to,   from, _inner)
        )
    );
}
/**
 * Dibuja un conjunto de arcos concéntricos entre dos radios.
 *
 * @param {Float}   from      Radio inicial.
 * @param {Float}   to        Radio final.
 * @param {Float}   thickness Grosor de cada arco.
 * @param {Float[]} angles    Valor de los ángulos inicial y final de cada arco.
 * @param {Float}   delta     Valor para el incremento del radio.
 *                            Si no se especifica se usa el mismo valor que el radio inicial.
 */
module arcs(from, to, thickness = 0.1, angles = [ 0, 360 ], delta = 0)
{
    if (from > 0)
    {
        for (_radius = [ from : delta ? delta : from : to ])
        {
            arc(angles[0], angles[1], _radius, thickness);
        }
    }
}

