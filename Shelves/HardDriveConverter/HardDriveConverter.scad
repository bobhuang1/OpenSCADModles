
OuterLength = 80;
OuterWidth = 115;
InnerLength = 77;
InnerWidth = 62;
Margin = 10;
HoleDiameter = 3.25;
WallThickness = 3;
UpperWallHeight = 20;
UpperWallHoleHeight = 5;
UpperWallToBottomHoleDistance = 5.6;
SmallHardDriveWidth = 70.5;
$fn = 15;

// Main surface
difference() {
    cube([OuterLength+Margin, OuterWidth+Margin, WallThickness], center=false);
    translate([Margin+(OuterLength-InnerLength)/2, Margin+(OuterWidth-InnerWidth)/2, 0])
    cube([InnerLength-Margin, InnerWidth-Margin, WallThickness], center=false);
    
    // Holes for 2.5 hard drive on the bottom
    translate([(OuterLength-InnerLength)/2+Margin/2, (OuterWidth-InnerWidth)/2+Margin/2, 0])
    cylinder(h = WallThickness, d = HoleDiameter, center = false);
    
    translate([(OuterLength-InnerLength)/2+InnerLength+Margin/2, (OuterWidth-InnerWidth)/2+Margin/2, 0])
    cylinder(h = WallThickness, d = HoleDiameter, center = false);
    
    translate([(OuterLength-InnerLength)/2+Margin/2, (OuterWidth-InnerWidth)/2+InnerWidth+Margin/2, 0])
    cylinder(h = WallThickness, d = HoleDiameter, center = false);
    
    translate([(OuterLength-InnerLength)/2+InnerLength+Margin/2, (OuterWidth-InnerWidth)/2+InnerWidth+Margin/2, 0])
    cylinder(h = WallThickness, d = HoleDiameter, center = false);
    
    // Holes for 3.5 hard drive
    translate([Margin/2, Margin/2, 0])
    cylinder(h = WallThickness, d = HoleDiameter, center = false);
    translate([Margin/2+OuterLength, Margin/2, 0])
    cylinder(h = WallThickness, d = HoleDiameter, center = false);
    translate([Margin/2, Margin/2+OuterWidth, 0])
    cylinder(h = WallThickness, d = HoleDiameter, center = false);
    translate([Margin/2+OuterLength, Margin/2+OuterWidth, 0])
    cylinder(h = WallThickness, d = HoleDiameter, center = false);
}

difference() {
    translate([0, (OuterWidth-InnerWidth)/2+Margin/2-UpperWallToBottomHoleDistance, WallThickness])
    cube([OuterLength+Margin, WallThickness, UpperWallHeight], center=false);

    // Holes for 2.5 hard drive on the topleft
    translate([(OuterLength-InnerLength)/2+Margin/2, (OuterWidth-InnerWidth)/2+Margin/2-UpperWallToBottomHoleDistance+WallThickness, UpperWallToBottomHoleDistance+WallThickness])
    rotate([90, 0, 0])
    cylinder(h = WallThickness, d = HoleDiameter, center = false);

    translate([(OuterLength-InnerLength)/2+Margin/2, (OuterWidth-InnerWidth)/2+Margin/2-UpperWallToBottomHoleDistance+WallThickness, UpperWallToBottomHoleDistance+WallThickness+10])
    rotate([90, 0, 0])
    cylinder(h = WallThickness, d = HoleDiameter, center = false);


    translate([(OuterLength-InnerLength)/2+Margin/2+InnerLength, (OuterWidth-InnerWidth)/2+Margin/2-UpperWallToBottomHoleDistance+WallThickness, UpperWallToBottomHoleDistance+WallThickness])
    rotate([90, 0, 0])
    cylinder(h = WallThickness, d = HoleDiameter, center = false);

    translate([(OuterLength-InnerLength)/2+Margin/2+InnerLength, (OuterWidth-InnerWidth)/2+Margin/2-UpperWallToBottomHoleDistance+WallThickness, UpperWallToBottomHoleDistance+WallThickness+10])
    rotate([90, 0, 0])
    cylinder(h = WallThickness, d = HoleDiameter, center = false);

}

difference() {
    translate([0, (OuterWidth-InnerWidth)/2+Margin/2-UpperWallToBottomHoleDistance + SmallHardDriveWidth, WallThickness])
    cube([OuterLength+Margin, WallThickness, UpperWallHeight], center=false);

    // Holes for 2.5 hard drive on the topright
    translate([(OuterLength-InnerLength)/2+Margin/2, (OuterWidth-InnerWidth)/2+Margin/2+UpperWallToBottomHoleDistance+InnerWidth+0.3, UpperWallToBottomHoleDistance+WallThickness])
    rotate([90, 0, 0])
    cylinder(h = WallThickness, d = HoleDiameter, center = false);

    translate([(OuterLength-InnerLength)/2+Margin/2, (OuterWidth-InnerWidth)/2+Margin/2+UpperWallToBottomHoleDistance+InnerWidth+0.3, UpperWallToBottomHoleDistance+WallThickness+10])
    rotate([90, 0, 0])
    cylinder(h = WallThickness, d = HoleDiameter, center = false);

    translate([(OuterLength-InnerLength)/2+Margin/2+InnerLength, (OuterWidth-InnerWidth)/2+Margin/2+UpperWallToBottomHoleDistance+InnerWidth+0.3, UpperWallToBottomHoleDistance+WallThickness])
    rotate([90, 0, 0])
    cylinder(h = WallThickness, d = HoleDiameter, center = false);

    translate([(OuterLength-InnerLength)/2+Margin/2+InnerLength, (OuterWidth-InnerWidth)/2+Margin/2+UpperWallToBottomHoleDistance+InnerWidth+0.3, UpperWallToBottomHoleDistance+WallThickness+10])
    rotate([90, 0, 0])
    cylinder(h = WallThickness, d = HoleDiameter, center = false);

}


