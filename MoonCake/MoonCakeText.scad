use <text_on.scad>
use <HuangKangWeiBei.TTF>

TextHeight = 1;
CakeDiameter = 75;
CakeHeight = 170;

SmallBoundary = 1.5;
LargeBoundary = 3;

Arc1BeginAngle = 160;
Arc1EndAngle = 230;

Arc2BeginAngle = Arc1BeginAngle+5;
Arc2EndAngle = Arc1EndAngle-5;

Arc1ToEdge = 15;
Arc2ToArc1 = 3;

linear_extrude(height = TextHeight){
        text("邱 再 生", size=24, font="DFPWeiBei\\-B5:style=Regular");
}

translate([15, 10, 0])
linear_extrude(height=SmallBoundary, twist=0)
arc(Arc1BeginAngle, Arc1EndAngle, CakeDiameter/2, SmallBoundary);

translate([21, 10, 0])
linear_extrude(height=SmallBoundary, twist=0)
arc(Arc1BeginAngle, Arc1EndAngle, CakeDiameter/2, SmallBoundary);

translate([28, 10, 0])
linear_extrude(height=LargeBoundary, twist=0)
arc(Arc2BeginAngle, Arc2EndAngle, CakeDiameter/2, LargeBoundary);

translate([35, 10, 0])
linear_extrude(height=LargeBoundary, twist=0)
arc(Arc2BeginAngle, Arc2EndAngle, CakeDiameter/2, LargeBoundary);

translate([115, 30, 0])
rotate([0, -90, 0])
cube(size=[SmallBoundary, SmallBoundary, CakeHeight-Arc1ToEdge*2], center=false);

translate([115, 35, 0])
rotate([0, -90, 0])
cube(size=[SmallBoundary, SmallBoundary, CakeHeight-Arc1ToEdge*2], center=false);

// Left Wide Gap
translate([110, 40, 0])
rotate([0, -90, 0])
cube(size=[LargeBoundary, LargeBoundary, CakeHeight-Arc1ToEdge*2-Arc2ToArc1*2], center=false);

// Right Wide Gap
translate([110, 45, 0])
rotate([0, -90, 0])
cube(size=[LargeBoundary, LargeBoundary, CakeHeight-Arc1ToEdge*2-Arc2ToArc1*2], center=false);



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

