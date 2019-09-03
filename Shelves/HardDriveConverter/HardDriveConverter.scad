
OuterLength = 120;
OuterWidth = 105;
InnerLength = 76.5;
InnerWidth = 61.5;
Margin = 10;
HoleDiameter = 3.25;
WallThickness = 3;
$fn = 15;

// Main surface
difference() {
    cube([OuterLength+Margin, OuterWidth+Margin, WallThickness], center=false);
    translate([Margin+(OuterLength-InnerLength)/2, Margin+(OuterWidth-InnerWidth)/2, 0])
    cube([InnerLength-Margin, InnerWidth-Margin, WallThickness], center=false);
    
    // Holes for 2.5 hard drive
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

