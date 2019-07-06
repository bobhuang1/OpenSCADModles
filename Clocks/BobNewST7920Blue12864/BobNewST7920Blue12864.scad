
WallThickness = 1.5;
BaseWidth = 93.5+2*WallThickness + 1.5;
BaseDepth = 71.5 + 2*WallThickness + 1.5;
BaseHeight = 60;
CornerRadius = 3;
LCDScreenWidth = 72.5;
LCDScreenHeight = 40.5;
LCDScreenX = 10.5 + WallThickness;
LCDScreenY=15.3 + WallThickness;
USBInputHoleWidth=9;
USBInputHoleHeight=4;
USBInputHoleY = 19+WallThickness+1.8 + 3.5;
USBInputHoleZ = 15+8-5 + 15;
AirSensorHoleRadius = 4.2;

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
    // Hole for air quality sensor
    translate([BaseWidth - WallThickness - 10, 0, 14+WallThickness+27]) {
        rotate([-90, 0, 0]){
            cylinder(h=WallThickness+1, r=AirSensorHoleRadius, center=false);
        }
    }    
    // Hole for input touch button
    translate([BaseWidth - WallThickness - 15, 0, 16+WallThickness+0]) {
        rotate([-90, 0, 0]){
            cube(size=[10, 4, WallThickness], center=false);
        }
    }
    // Hole for light sensor
    translate([(BaseWidth - 2*WallThickness)/2 + 18, 0, (BaseHeight+2*WallThickness)/2]) {
        rotate([-90, 0, 0]){
            cube(size=[5, 5, WallThickness], center=false);
        }
    }
    // Hole for MicroUSB power input
    translate([0, USBInputHoleY-USBInputHoleWidth, USBInputHoleZ-USBInputHoleHeight]) {
        rotate([0, 90, 0]){
            cube(size=[USBInputHoleHeight, USBInputHoleWidth, WallThickness], center=false);
        }
    }
    // Cut off part of bottom to form slope
    translate([0, 200+14, 125+34]){
        rotate([138, 0, 0]){
            cube(size=[200, 200, 200], center=false);
        }
    }
}


translate([14, 0, 42]){
 rotate([90, 0, 0]){
    linear_extrude(height = WallThickness/2){
        text("IBE Group, Inc.", size=5, font="Arial Black");
    }
 }
}

translate([11, 0, 13]){
 rotate([90, 0, 0]){
    linear_extrude(height = WallThickness/2){
        text("Copyright© 2019", size=5, font="Arial Black");
    }
 }
}
