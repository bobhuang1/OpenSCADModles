
BaseWidth = 116;
BaseDepth = 51;
BaseHeightBottom = 20;

WallThickness = 2;

AnchorWidth = 20;
AnchorHeight = 20;
AhcnorHoleDiameter = 5.5;



// Bottom main body
difference() {
    cube(size=[BaseWidth+2*WallThickness, BaseDepth+2*WallThickness, BaseHeightBottom+WallThickness], center=false);
    translate([WallThickness, WallThickness, WallThickness])
    cube(size=[BaseWidth, BaseDepth, BaseHeightBottom], center=false);

    translate([WallThickness*2, WallThickness*2, WallThickness])
    cube(size=[BaseWidth-WallThickness*2, BaseDepth, BaseHeightBottom], center=false);

}

// Bottom anchor 1
translate([0, 0, -AnchorHeight])
    difference() {
        cube(size=[AnchorWidth, WallThickness, AnchorHeight], center=false);
        translate([AnchorWidth/2, 0, AnchorHeight/2])
        rotate([-90, 0, 0])
        cylinder(h=WallThickness, d=AhcnorHoleDiameter, center=false, $fn=50);
    }

// Bottom anchor 2
translate([BaseWidth+2*WallThickness-AnchorWidth, 0, -AnchorHeight])
    difference() {
        cube(size=[AnchorWidth, WallThickness, AnchorHeight], center=false);
        translate([AnchorWidth/2, 0, AnchorHeight/2])
        rotate([-90, 0, 0])
        cylinder(h=WallThickness, d=AhcnorHoleDiameter, center=false, $fn=50);
    }

// Side anchor
translate([BaseWidth+WallThickness*2, 0, 0])
    difference() {
        cube(size=[AnchorHeight, WallThickness, AnchorWidth], center=false);
        translate([AnchorHeight/2, 0, AnchorWidth/2])
        rotate([-90, 0, 0])
        cylinder(h=WallThickness, d=AhcnorHoleDiameter, center=false, $fn=50);
    }
 


