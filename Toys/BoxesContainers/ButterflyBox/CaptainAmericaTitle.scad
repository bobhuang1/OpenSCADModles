WallThickness = 2;
BaseDiameter = 16;
PentagramSize = 3;
BottomRemovalRatio = 6;


include <shape_pentagram.scad>;


module CaptainAmericaShield() {
translate([0, 0, WallThickness/2])    
linear_extrude(height = WallThickness/2, center = false, convexity = 10, twist = 0)
polygon(shape_pentagram(PentagramSize));


difference() {
    cylinder(h=WallThickness, d=BaseDiameter, center=false, $fn=30);
    
    translate([0, 0, WallThickness/2])
    difference() {
        cylinder(h=WallThickness, d=BaseDiameter/5*4+1, center=false, $fn=30);
        cylinder(h=WallThickness, d=BaseDiameter/5*4, center=false, $fn=30);
    }    

    translate([0, 0, WallThickness/2])
    difference() {
        cylinder(h=WallThickness, d=BaseDiameter/5*3+1, center=false, $fn=30);
        cylinder(h=WallThickness, d=BaseDiameter/5*3, center=false, $fn=30);
    }    

    translate([0, 0, WallThickness/2])
        cylinder(h=WallThickness, d=BaseDiameter/5*2, center=false, $fn=30);

    translate([0, BaseDiameter/2, -BaseDiameter*BottomRemovalRatio/2+WallThickness/2-0.4])
    rotate([90, 0, 0])
    cylinder(h=BaseDiameter, d=BottomRemovalRatio*BaseDiameter, center=false, $fn=300);

    }


}


CaptainAmericaShield();

