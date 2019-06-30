WallThickness = 4;

BaseWidth = 25;
BaseDepth = 16;
BaseHoleDiameter = 4.3;

SensorToBaseDistance = 4;

SensorHoleDistance = 18.8;
SensorHoleDiameter = 3.3;
SensorWidth = 25;
SensorDepth = 11;


difference() {
    cube(size=[BaseWidth, BaseDepth, WallThickness], center=false);

    translate([BaseWidth/4, BaseDepth/2, 0])
    cylinder(h=WallThickness, d=BaseHoleDiameter, center=false, $fn=30);


    translate([BaseWidth/4*3, BaseDepth/2, 0])
    cylinder(h=WallThickness, d=BaseHoleDiameter, center=false, $fn=30);
    
}


translate([BaseWidth/2+SensorDepth/2, -SensorWidth-SensorToBaseDistance, 0])
rotate([0, 0, 90])
difference() {
    cube(size=[SensorWidth, SensorDepth, WallThickness], center=false);
    translate([(SensorWidth-SensorHoleDistance)/2, SensorDepth/2, 0])
    cylinder(h=WallThickness, d=SensorHoleDiameter, center=false, $fn=30);
    translate([(SensorWidth-SensorHoleDistance)/2+SensorHoleDistance, SensorDepth/2, 0])
    cylinder(h=WallThickness, d=SensorHoleDiameter, center=false, $fn=30);
}

translate([BaseWidth/2-SensorDepth/2, -SensorToBaseDistance, 0])
cube([SensorDepth, SensorToBaseDistance, WallThickness]);

