WallThickness = 4;

BaseWidth = 25;
BaseDepth = 16;
BaseHoleDiameter = 4.3;

Arm1Length = 20;
Arm1Width = 25;

Arm2Length = 80;
Arm2Width = 25;

PlatformLength = 60;
PlatformWidth = 25;

ZiptieHoleDiameter = 2.5;


difference() {
    cube(size=[BaseWidth, BaseDepth, WallThickness], center=false);

    translate([BaseWidth/4, BaseDepth/2, 0])
    cylinder(h=WallThickness, d=BaseHoleDiameter, center=false, $fn=30);

    translate([BaseWidth/4*3, BaseDepth/2, 0])
    cylinder(h=WallThickness, d=BaseHoleDiameter, center=false, $fn=30);
}

translate([BaseWidth/2-Arm1Width/2, -Arm1Length, 0])
cube(size=[Arm1Width, Arm1Length, WallThickness], center=false);

translate([BaseWidth/2-Arm2Width/2, -Arm1Length, 0])
cube(size=[Arm1Width, WallThickness, Arm2Length], center=false);

translate([BaseWidth/2-PlatformWidth/2, -Arm1Length-PlatformLength/2, Arm2Length])
difference() {
    cube(size=[PlatformWidth, PlatformLength, WallThickness], center=false);

    translate([PlatformWidth/8, PlatformLength/8, 0])
    cylinder(h=WallThickness, d=ZiptieHoleDiameter, center=false, $fn=15);
    translate([PlatformWidth/8*7, PlatformLength/8, 0])
    cylinder(h=WallThickness, d=ZiptieHoleDiameter, center=false, $fn=15);
    translate([PlatformWidth/8, PlatformLength/8*7, 0])
    cylinder(h=WallThickness, d=ZiptieHoleDiameter, center=false, $fn=15);
    translate([PlatformWidth/8*7, PlatformLength/8*7, 0])
    cylinder(h=WallThickness, d=ZiptieHoleDiameter, center=false, $fn=15);
}

