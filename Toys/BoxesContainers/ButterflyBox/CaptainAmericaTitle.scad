WallThickness = 2;
BaseDiameter = 16;
PentagramSize = 3;

import("C:/Users/Administrator/Desktop/OpenSCADModles/Toys/BoxesContainers/ButterflyBox/BLANK-TITLE_ASSY_repaired.3mf");


include <shape_pentagram.scad>;


module CaptainAmericaShield() {
translate([0, 0, 30])    
rotate([0, 90, 0])    
difference() {
cylinder(h=WallThickness, d=BaseDiameter, center=false, $fn=30);

difference() {
    cylinder(h=WallThickness, d=BaseDiameter/5*4+1, center=false, $fn=30);
    cylinder(h=WallThickness, d=BaseDiameter/5*4, center=false, $fn=30);
}    

difference() {
    cylinder(h=WallThickness, d=BaseDiameter/5*3+1, center=false, $fn=30);
    cylinder(h=WallThickness, d=BaseDiameter/5*3, center=false, $fn=30);
}    

difference() {
    cylinder(h=WallThickness, d=BaseDiameter/5*2+1, center=false, $fn=30);
    cylinder(h=WallThickness, d=BaseDiameter/5*2, center=false, $fn=30);
}    

linear_extrude(height = WallThickness, center = false, convexity = 10, twist = 0)
polygon(shape_pentagram(PentagramSize));
}
}

CaptainAmericaShield();

