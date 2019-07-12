WallThickness = 3;
BaseDiameter = 50;
PentagramSize = 10;


import("C:/Users/Administrator/Desktop/OpenSCADModles/Toys/BoxesContainers/ButterflyBox/BLANK-TOP_repaired.3mf");


include <shape_pentagram.scad>;

translate([0, 11, 37])
rotate([90, 0, 0])
difference() {
cylinder(h=WallThickness, d=BaseDiameter, center=false, $fn=300);

difference() {
    cylinder(h=WallThickness, d=BaseDiameter/5*4+5, center=false, $fn=300);
    cylinder(h=WallThickness, d=BaseDiameter/5*4, center=false, $fn=300);
}    

difference() {
    cylinder(h=WallThickness, d=BaseDiameter/5*3+5, center=false, $fn=300);
    cylinder(h=WallThickness, d=BaseDiameter/5*3, center=false, $fn=300);
}    

difference() {
    cylinder(h=WallThickness, d=BaseDiameter/5*2+5, center=false, $fn=300);
    cylinder(h=WallThickness, d=BaseDiameter/5*2, center=false, $fn=300);
}    

linear_extrude(height = WallThickness, center = false, convexity = 10, twist = 0)
polygon(shape_pentagram(PentagramSize));

}


translate([30, 8, 69])
rotate([90, 0, 180])
    linear_extrude(height = WallThickness/2){
        text("黄帝杰专用", size=9, font="SimHei");
    }


/*
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
*/

