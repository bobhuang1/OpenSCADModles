WallThickness = 4;

BaseWidth = 16;
BaseDepth = 5.5;
BaseHoleDiameter = 3.1;

BaseToFlagDistance = 6+WallThickness;
BaseToFlagWidth = 10;

AdjustHoleInsideDiameter = 1.8;


difference() {
    cube(size=[BaseWidth, BaseDepth, WallThickness], center=false);
    translate([BaseWidth/2, BaseDepth/2, 0])
    cylinder(h=WallThickness, d=BaseHoleDiameter, center=false, $fn=15);
}

translate([BaseToFlagDistance+WallThickness/2*3, 0, 0])
difference() {
    cube(size=[WallThickness, BaseToFlagWidth, BaseToFlagDistance], center=false);
    translate([0, BaseToFlagWidth/4, BaseToFlagDistance/4*3])
    rotate([0, 90, 0])
    cylinder(h=WallThickness, d=AdjustHoleInsideDiameter, center=false, $fn=15);
    translate([0, BaseToFlagWidth/4*3, BaseToFlagDistance/4*3])
    rotate([0, 90, 0])
    cylinder(h=WallThickness, d=AdjustHoleInsideDiameter, center=false, $fn=15);
}


/*
WallThickness = 1.5;
BaseHeight = 123+WallThickness*2;
BaseWidth = 101+WallThickness*2;
BaseDepth = 30;
CornerRadius = 3;

LCDWidth = 80.5;
LCDHeight = 50.5;
LCDTopOffset = 9+WallThickness;
LCDLeftOffset = 9+WallThickness;

ResetButtonDiameter = 6;
ResetButtonBottomOffet = 8.5+WallThickness;
ResetButtonLeftOffet = 70.5+WallThickness;

RotaryEncoderDiameter = 8;
RotaryEncoderBottomOffet = 19+WallThickness;
RotaryEncoderLeftOffet = 87.5+WallThickness;

CardButtonDiameter = 6;
CardButtonBottomOffet = 44.5+WallThickness;
CardButtonLeftOffet = 78.5+WallThickness;

TFCardHeight = 2;
TFCardWidth = 14;
TFCardBottomOffset = 15+WallThickness;
TFCardFrontOffset = 19+WallThickness;

MountingHoleDiameter = 5.5;

module RoundedRectangle($Width=BaseWidth, $Depth=BaseDepth, $Radius=CornerRadius) 
{
    polygon(points = [[$Radius, 0], [$Width-$Radius, 0],[$Width, $Radius], [$Width, $Depth-$Radius], [$Width-$Radius, $Depth], [$Radius, $Depth], [0, $Depth-$Radius], [0, $Radius]], paths=[[0,1,2,3,4,5,6,7]]);
        
    translate([$Radius,$Radius,0]){
        circle(r=$Radius);
    }        
    translate([$Width-$Radius,$Radius,0]){
        circle(r=$Radius);
    }
    
    translate([$Width-$Radius,$Depth-$Radius,0]){ 
        circle(r=$Radius);
    }
   
    translate([$Radius,$Depth-$Radius,0]){ 
        circle(r=$Radius);
    }
}

module base3D($Width=BaseWidth, $Depth=BaseDepth, $Height=BaseHeight, $Radius=CornerRadius, $Thickness=WallThickness)
{
    difference()
    {
        linear_extrude(height = $Height, center = false, convexity = 0, twist = 0)
        RoundedRectangle($Width, $Depth, $Radius);
        translate([$Thickness, $Thickness, $Thickness]) {
        linear_extrude(height = $Height, center = false, convexity = 0, twist = 0)
        RoundedRectangle($Width-$Thickness*2, $Depth-$Thickness*2, $Radius);
        }
    }
}


difference()
{
    base3D(BaseWidth, BaseDepth, BaseHeight, CornerRadius, WallThickness);
    // Make back open
    translate([0, BaseDepth-WallThickness*2, 10])
        cube(size=[BaseWidth, BaseDepth, BaseHeight], center=false);

    translate([0, BaseDepth-WallThickness*2, 110])
    rotate([45, 0, 0])
        cube(size=[BaseWidth, BaseDepth, BaseHeight], center=false);

    translate([0, BaseDepth-WallThickness*2+3, 30])
    rotate([7, 0, 0])
        cube(size=[BaseWidth, BaseDepth, BaseHeight], center=false);
    
    // LCD window
    translate([LCDLeftOffset, WallThickness, BaseHeight-LCDHeight-LCDTopOffset])
    rotate([90, 0, 0])
        cube(size=[LCDWidth, LCDHeight, WallThickness], center=false);
    // Reset button
    translate([ResetButtonLeftOffet, WallThickness, ResetButtonBottomOffet])
    rotate([90, 0, 0])
        cylinder(h=WallThickness, d=ResetButtonDiameter, center=false, $fn=30);
    // Rotary Encoder
    translate([RotaryEncoderLeftOffet, WallThickness, RotaryEncoderBottomOffet])
    rotate([90, 0, 0])
        cylinder(h=WallThickness, d=RotaryEncoderDiameter, center=false, $fn=30);
    // Card-In Button
    translate([CardButtonLeftOffet, WallThickness, CardButtonBottomOffet])
    rotate([90, 0, 0])
        cylinder(h=WallThickness, d=CardButtonDiameter, center=false, $fn=30);
    // TF Card on the side
    translate([WallThickness,TFCardFrontOffset,TFCardBottomOffset])
    rotate([0, -90, 0])
        cube(size=[TFCardWidth, TFCardHeight, WallThickness], center=false);
    // Mouting holes for 2020
    translate([BaseWidth-WallThickness-MountingHoleDiameter, BaseDepth-WallThickness-MountingHoleDiameter])
        cylinder(h=WallThickness, d=MountingHoleDiameter, center=false, $fn=30);
    translate([BaseWidth/4*2, BaseDepth-WallThickness-MountingHoleDiameter])
        cylinder(h=WallThickness, d=MountingHoleDiameter, center=false, $fn=30);
    translate([WallThickness+MountingHoleDiameter, BaseDepth-WallThickness-MountingHoleDiameter])
        cylinder(h=WallThickness, d=MountingHoleDiameter, center=false, $fn=30);

    translate([BaseWidth-WallThickness-MountingHoleDiameter, WallThickness+MountingHoleDiameter])
        cylinder(h=WallThickness, d=MountingHoleDiameter, center=false, $fn=30);
    translate([BaseWidth/4*2, WallThickness+MountingHoleDiameter])
        cylinder(h=WallThickness, d=MountingHoleDiameter, center=false, $fn=30);
    translate([WallThickness+MountingHoleDiameter, WallThickness+MountingHoleDiameter])
        cylinder(h=WallThickness, d=MountingHoleDiameter, center=false, $fn=30);

}

    translate([64, 0, 52])
    rotate([90, 0, 0])
    linear_extrude(height = WallThickness/2){
        text("CARD IN", size=5, font="Arial Black");
    }

    translate([10, 0, 50])
    rotate([90, 0, 0])
    linear_extrude(height = WallThickness/2){
        text("DIY 12864", size=6, font="Arial Black");
    }

    translate([6, 0, 35])
    rotate([90, 0, 0])
    linear_extrude(height = WallThickness/2){
        text("IBE Group, Inc.", size=6, font="Arial Black");
    }
    translate([5, 0, 20])
    rotate([90, 0, 0])
    linear_extrude(height = WallThickness/2){
        text("Copyright© 2019", size=6, font="Arial Black");
    }

    translate([41.5, 0, 7.5])
    rotate([90, 0, 0])
    linear_extrude(height = WallThickness/2){
        text("RESET", size=5, font="Arial Black");
    }
*/

