WallThickness = 4;

BaseWidth = 25;
BaseDepth = 16;
BaseHoleDiameter = 4.3;

SensorToBaseHeight = 13;

SensorHoleDistance = 18.8;
SensorHoleDiameter = 3.3;
SensorWidth = 25;
SensorDepth = 11;


translate([0, -WallThickness, 0])
cube(size=[SensorWidth, WallThickness, WallThickness], center=false);



difference() {
    cube(size=[BaseWidth, BaseDepth, WallThickness], center=false);
    translate([BaseWidth/7, BaseDepth/2, 0])
    cylinder(h=WallThickness, d=BaseHoleDiameter, center=false, $fn=15);
    translate([BaseWidth/7*6, BaseDepth/2, 0])
    cylinder(h=WallThickness, d=BaseHoleDiameter, center=false, $fn=15);
    
}

translate([0, 0, WallThickness])
rotate([90, 0, 0])
difference() {
    cube(size=[SensorWidth, SensorDepth, WallThickness], center=false);
    translate([(SensorWidth-SensorHoleDistance)/2, SensorDepth/2, 0])
    cylinder(h=WallThickness, d=SensorHoleDiameter, center=false, $fn=15);
    translate([(SensorWidth-SensorHoleDistance)/2+SensorHoleDistance, SensorDepth/2, 0])
    cylinder(h=WallThickness, d=SensorHoleDiameter, center=false, $fn=15);
}


