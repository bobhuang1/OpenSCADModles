WallThickness = 4;

BaseWidth = 40;
BaseHeight = 16;
BaseHoleDiameter = 5.5;
BaseSlotWidth = 6;

SupportLength = 34;
SupportHoleDiameter = 3.5;

difference() {

union() {
difference() {
union() {    
    cube(size=[BaseWidth, BaseHeight, WallThickness], center=false);
    translate([0, BaseHeight/2-BaseSlotWidth/2, -WallThickness/4])
    cube(size=[BaseWidth, BaseSlotWidth, WallThickness/4], center=false);
}    
    translate([BaseWidth/2, BaseHeight/2, -WallThickness/4])
    cylinder(h=WallThickness*2, d=BaseHoleDiameter, center=false, $fn=30);
}



translate([0, -WallThickness, 0])
difference() {
    cube(size=[BaseWidth, WallThickness, SupportLength], center=false);
    translate([BaseWidth/2, 0, SupportLength/2+WallThickness/2])
    rotate([270, 0, 0])
    cylinder(h=WallThickness, d=SupportHoleDiameter, center=false, $fn=30);
}


translate([BaseWidth-WallThickness, 0, 0])
    cube(size=[WallThickness, BaseHeight, SupportLength], center=false);
    cube(size=[WallThickness, BaseHeight, SupportLength], center=false);
}

translate([0, BaseHeight, 6])
rotate([30, 0, 0])
    cube(size=[BaseWidth, sqrt(BaseHeight*BaseHeight+SupportLength*SupportLength), SupportLength], center=false);

}
