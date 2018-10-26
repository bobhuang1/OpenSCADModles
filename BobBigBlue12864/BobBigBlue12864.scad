
BaseWidth = 93;
BaseDepth = 57;
BaseHeight = 38;
CornerRadius = 3;
WallThickness = 1.5;
LCDScreenWidth = 72;
LCDScreenHeight = 40.5;
LCDScreenX = 8.5 + WallThickness;
LCDScreenY=4 + WallThickness;
USBInputHoleWidth=9;
USBInputHoleHeight=4;
USBInputHoleY = 19+WallThickness;
USBInputHoleZ = 15;

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
    
difference() {
    base3D(BaseWidth, BaseDepth, BaseHeight, CornerRadius, WallThickness);
    translate([LCDScreenX, LCDScreenY, 0]) {
        cube(size=[LCDScreenWidth, LCDScreenHeight, WallThickness], center=false);
    }
    
    translate([55+WallThickness, 0, 14+WallThickness+7]) {
        rotate([-90, 0, 0]){
            cube(size=[7, 7, WallThickness], center=false);
        }
    }

    translate([0, USBInputHoleY-USBInputHoleWidth, USBInputHoleZ-USBInputHoleHeight]) {
        rotate([0, 90, 0]){
            cube(size=[USBInputHoleHeight, USBInputHoleWidth, WallThickness], center=false);
        }
    }

    translate([0, 200+14, 125+12]){
        rotate([138, 0, 0]){
            cube(size=[200, 200, 200], center=false);
        }
    }
}


translate([18, 0, 27]){
 rotate([90, 0, 0]){
    linear_extrude(height = WallThickness/2){
        text("IBE Group, Inc.", size=5, font="Arial Black");
    }
 }
}

translate([15, 0, 7]){
 rotate([90, 0, 0]){
    linear_extrude(height = WallThickness/2){
        text("Copyright© 2018", size=5, font="Arial Black");
    }
 }
}
