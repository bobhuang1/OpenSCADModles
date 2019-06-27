WallThickness = 4;

BaseWidth = 25;
BaseDepth = 16;
BaseHoleDiameter = 4.3;

BaseToFlagDistance = 18+WallThickness;
BaseToFlagWidth = 10;

FlagHoleWidth = 0.75;

difference() {
    cube(size=[BaseWidth, BaseDepth, WallThickness], center=false);
    translate([BaseWidth/7, BaseDepth/2, 0])
    cylinder(h=WallThickness, d=BaseHoleDiameter, center=false, $fn=15);
    translate([BaseWidth/7*6, BaseDepth/2, 0])
    cylinder(h=WallThickness, d=BaseHoleDiameter, center=false, $fn=15);
    
}

translate([(BaseWidth-BaseToFlagWidth)/2, 0, 0])
difference() {
    cube(size=[BaseToFlagWidth, WallThickness, BaseToFlagDistance], center=false);
    translate([BaseToFlagWidth/2-FlagHoleWidth/2, 0, BaseToFlagDistance/2])
    cube(size=[FlagHoleWidth, WallThickness, BaseToFlagDistance/2], center=false);
}

