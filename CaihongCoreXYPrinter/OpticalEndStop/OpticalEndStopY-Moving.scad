WallThickness = 1.5;

BaseWidth = 23;
BaseDepth = 10;

SensorHoleDiameter = 3.3;
SensorHoleTopOffset = 2.5;

FlagHoleWidth = 0.75;

difference() {
    cube(size=[BaseWidth, BaseDepth, WallThickness], center=false);
    translate([SensorHoleTopOffset, BaseDepth/2, 0])
    cylinder(h=WallThickness, d=SensorHoleTopOffset, center=false, $fn=30);
translate([BaseWidth/2, BaseDepth/2-FlagHoleWidth/2, 0])
cube(size=[BaseWidth/2, FlagHoleWidth, WallThickness], center=false);
}
