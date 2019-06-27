
BaseWidth = 111;
BaseDepth = 50.5;
BaseHeightTop = 50;

WallThickness = 2;

AnchorWidth = 20;
AnchorHeight = 10;
AhcnorHoleDiameter = 5.5;

PowerInputHoleWidth = 28.3;
PowerInputHoleHeight= 18.5;

ButtonHoleDiameter = 11;

PowerSwithLength = 14.2;
PowerSwithWidth = 9.6;

BackWindowWidth  = 90;
BackWindowHeight = 15;

// Top main body
difference() {
    cube(size=[BaseWidth+2*WallThickness, BaseDepth+2*WallThickness, BaseHeightTop+WallThickness], center=false);
    translate([WallThickness, WallThickness, 0])
    cube(size=[BaseWidth, BaseDepth, BaseHeightTop], center=false);

    // Power Input Hole
    translate([0, BaseDepth/2-PowerInputHoleWidth/2+WallThickness, BaseHeightTop-WallThickness-PowerInputHoleHeight])
    cube(size=[WallThickness, PowerInputHoleWidth, PowerInputHoleHeight], center=false);

    // Button hole
    translate([BaseWidth/2, BaseDepth/2+WallThickness-10, BaseHeightTop])
    cylinder(h=WallThickness, d=ButtonHoleDiameter, center=false, $fn=30);

    // Power switch hole
    translate([BaseWidth - 30, BaseDepth/2-PowerSwithLength/2+WallThickness-10, BaseHeightTop])
    cube(size=[PowerSwithWidth, PowerSwithLength, WallThickness], center=false);

    // Back Window
    translate([12, BaseDepth+WallThickness, 7])
    cube(size=[BackWindowWidth, WallThickness, BackWindowHeight], center=false);

    // Small Window for Replay LEDs
    translate([75, BaseDepth+WallThickness, 38])
    cube(size=[10, WallThickness, 8], center=false);

}




// Inside anchor 1
translate([0, BaseDepth/2-AnchorWidth/2+WallThickness, BaseHeightTop/2-12])
cube(size=[AnchorHeight/2, AnchorWidth, WallThickness], center=false);

// Inside anchor 2
translate([BaseWidth-AnchorHeight/2-WallThickness, BaseDepth/2-AnchorWidth/2+WallThickness, BaseHeightTop/2])
cube(size=[AnchorHeight/2, AnchorWidth, WallThickness], center=false);

// Side anchor 1
translate([BaseWidth+WallThickness*2, 0, 0])
    difference() {
        cube(size=[AnchorHeight, WallThickness, AnchorWidth], center=false);
        translate([AnchorHeight/2, 0, AnchorWidth/2])
        rotate([-90, 0, 0])
        cylinder(h=WallThickness, d=AhcnorHoleDiameter, center=false, $fn=20);
    }
   
// Side anchor 2
translate([BaseWidth+WallThickness*2, 0, BaseHeightTop+WallThickness-AnchorWidth])
    difference() {
        cube(size=[AnchorHeight, WallThickness, AnchorWidth], center=false);
        translate([AnchorHeight/2, 0, AnchorWidth/2])
        rotate([-90, 0, 0])
        cylinder(h=WallThickness, d=AhcnorHoleDiameter, center=false, $fn=20);
    }
    


    