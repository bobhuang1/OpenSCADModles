WallThickness = 4;

BaseWidth = 34;
BaseDepth = 12;
BaseHoleDiameter = 3.3;
BaseHoleDistance = 29;

SensorToBaseHeight = 0;

SensorHoleDistance = 18.8;
SensorHoleDiameter = 3.3;
SensorWidth = 25;
SensorDepth = 16;


difference() {
    cube(size=[BaseWidth, BaseDepth, WallThickness], center=false);
    translate([(BaseWidth-BaseHoleDistance)/2, BaseDepth/2, 0])
    cylinder(h=WallThickness, d=BaseHoleDiameter, center=false, $fn=30);
    translate([(BaseWidth-BaseHoleDistance)/2+BaseHoleDistance, BaseDepth/2, 0])
    cylinder(h=WallThickness, d=BaseHoleDiameter, center=false, $fn=30);
}

translate([0, BaseDepth, 0])
cube(size=[BaseWidth, WallThickness, WallThickness], center=false);

translate([(BaseWidth-SensorWidth)/2, BaseDepth, WallThickness])
difference() {
    cube(size=[SensorWidth, WallThickness, SensorDepth], center=false);
    translate([(SensorWidth-SensorHoleDistance)/2, WallThickness, SensorDepth/2])
    rotate([90, 0, 0])
    cylinder(h=WallThickness, d=SensorHoleDiameter, center=false, $fn=30);
    translate([(SensorWidth-SensorHoleDistance)/2+SensorHoleDistance, WallThickness, SensorDepth/2])
    rotate([90, 0, 0])
    cylinder(h=WallThickness, d=SensorHoleDiameter, center=false, $fn=30);
}


/*
difference() {
cube(size=[BaseWidth, BaseDepth, WallThickness], center=false);
translate([(BaseWidth-BaseHoleDistance)/2, BaseDepth/2, 0])
cylinder(h=WallThickness, d=BaseHoleDiameter, center=false, $fn=30);
translate([(BaseWidth-BaseHoleDistance)/2+BaseHoleDistance, BaseDepth/2, 0])
cylinder(h=WallThickness, d=BaseHoleDiameter, center=false, $fn=30);
}

translate([0, -WallThickness, 0])
cube(size=[BaseWidth, WallThickness, SensorToBaseHeight+WallThickness], center=false);


translate([0, 0, SensorToBaseHeight])
difference() {
cube(size=[SensorWidth, SensorDepth, WallThickness], center=false);
translate([(SensorWidth-SensorHoleDistance)/2, SensorDepth/2, 0])
cylinder(h=WallThickness, d=SensorHoleDiameter, center=false, $fn=30);
translate([(SensorWidth-SensorHoleDistance)/2+SensorHoleDistance, SensorDepth/2, 0])
cylinder(h=WallThickness, d=SensorHoleDiameter, center=false, $fn=30);
}
*/
