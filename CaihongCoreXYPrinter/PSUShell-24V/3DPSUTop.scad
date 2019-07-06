
BaseWidth = 116;
BaseDepth = 51;
BaseHeightTop = 50;

WallThickness = 2;

AnchorWidth = 20;
AnchorHeight = 20;
AhcnorHoleDiameter = 5.5;

PowerInputHoleWidth = 28.3;
PowerInputHoleHeight= 18.5;

ButtonHoleDiameter = 20.5;

PowerSwithLength = 14.2;
PowerSwithWidth = 9.6;

BackWindowWidth  = 110;
BackWindowHeight = 15;


// Top main body
difference() {
    cube(size=[BaseWidth+2*WallThickness, BaseDepth+2*WallThickness, BaseHeightTop+WallThickness], center=false);
    translate([WallThickness, WallThickness, 0])
    cube(size=[BaseWidth, BaseDepth, BaseHeightTop], center=false);

    // Power Input Hole
    translate([BaseWidth-WallThickness-PowerInputHoleWidth, BaseDepth+WallThickness, BaseHeightTop-PowerInputHoleWidth+8])
    cube(size=[PowerInputHoleWidth, WallThickness, PowerInputHoleHeight], center=false);

    // Button hole
    translate([BaseWidth/2+10-7, BaseDepth/2+WallThickness-10+20, BaseHeightTop])
    cylinder(h=WallThickness, d=ButtonHoleDiameter, center=false, $fn=30);

    // Power switch hole
    translate([BaseWidth - 40, BaseDepth/2-PowerSwithLength/2+WallThickness-10+20, BaseHeightTop])
    cube(size=[PowerSwithWidth, PowerSwithLength, WallThickness], center=false);

    // Small Window for Replay LEDs
    translate([6, BaseDepth+WallThickness, 33])
    cube(size=[15, WallThickness, 15], center=false);

    // Back Window
    translate([5, 5, BaseHeightTop])
    cube(size=[BackWindowWidth, BackWindowHeight, WallThickness], center=false);

}





// Inside anchor 1
translate([WallThickness, BaseDepth/2-AnchorWidth/2+WallThickness-13, BaseHeightTop/2-15])
cube(size=[AnchorHeight/2, AnchorWidth, WallThickness], center=false);

// Inside anchor 2
translate([BaseWidth-AnchorWidth/2+WallThickness, BaseDepth/2-AnchorWidth/2+WallThickness+13, BaseHeightTop/2-15])
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
    

// Side anchor 3
translate([BaseWidth+WallThickness*2, 0, (BaseHeightTop+WallThickness-AnchorWidth)/2])
    difference() {
        cube(size=[AnchorHeight, WallThickness, AnchorWidth], center=false);
        translate([AnchorHeight/2, 0, AnchorWidth/2])
        rotate([-90, 0, 0])
        cylinder(h=WallThickness, d=AhcnorHoleDiameter, center=false, $fn=20);
    }
    

    