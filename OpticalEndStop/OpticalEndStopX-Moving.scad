WallThickness = 1.5;

BaseWidth = 80;
BaseDepth = 10;

SensorHoleDiameter = 3.3;
SensorHoleTopOffset = 2.5;

FlagHoleWidth = 0.75;
FlagHoleLength = 20;

difference() {
    cube(size=[BaseWidth, BaseDepth, WallThickness], center=false);
    translate([BaseWidth-FlagHoleLength, BaseDepth/2-FlagHoleWidth/2, 0])
    cube(size=[FlagHoleLength, FlagHoleWidth, WallThickness], center=false);
}
cube(size=[BaseDepth*2, BaseDepth, WallThickness*3], center=false);
