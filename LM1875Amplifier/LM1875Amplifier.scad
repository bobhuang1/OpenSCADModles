// Office version as default
BaseWidth = 120;
BaseDepth = 90;
BaseHeight = 185;
CornerRadius = 3;
WallThickness = 1.5;
LCDScreenWidth = 72.5;
LCDScreenHeight = 40.5;
LCDScreenX = 0 + WallThickness + 2.75 + 26.5;
LCDScreenY=16 + WallThickness + 0.3;
VolumeHoleX = 45;
VolumeHoleY = 38;
USBHoleX = 5;
USBHoleY = 22;

VoltageDisplaySizeX = 24; // Store 23.5X11.3 - Done, Home 23.5X11.3, Office 24X15.5
VoltageDisplaySizeY = 15.5;
FanSizeX =70; // Store 75X91 - Done, Home 74X90, Office 70X84
FanSizeY =84;

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
    

    // Voltage display hole
//    rotate([90, 0, 0])
//        translate([18+WallThickness+3, 13+WallThickness, -WallThickness])
    translate([WallThickness*4, BaseDepth-VoltageDisplaySizeY-WallThickness*3, 0])
        cube(size=[VoltageDisplaySizeX, VoltageDisplaySizeY, WallThickness], center=false);
    
    
    // Button hole
    rotate([90, 0, 0]){
        translate([BaseWidth - 15, 22, -WallThickness]){
            cube(size=[8.8, 3.5, WallThickness], center=false);
        }
    }
    // USB hole 1
    rotate([90, 0, 0]){
        translate([USBHoleX+WallThickness, USBHoleY+WallThickness, -WallThickness]){
            cube(size=[6.5, 14, WallThickness], center=false);
        }
    }
    // USB hole 2
    rotate([90, 0, 0]){
        translate([USBHoleX+WallThickness, USBHoleY+WallThickness+4.5+13.5, -WallThickness]){
            cube(size=[6.5, 14, WallThickness], center=false);
        }
    }
    // USB hole 3
    rotate([90, 0, 0]){
        translate([USBHoleX+WallThickness, USBHoleY+WallThickness+2*4.5+2*13.5, -WallThickness]){
            cube(size=[6.5, 14, WallThickness], center=false);
        }
    }
    // Fan hole
    rotate([90, 0, 0]){
        translate([36, 40, -WallThickness]){
            cube(size=[FanSizeX, FanSizeY, WallThickness], center=false);
        }
    }
    
    // Volume hole
    translate([BaseWidth - VolumeHoleX, VolumeHoleY+LCDScreenHeight+2.5-2, 0]){
        cylinder(h=WallThickness, r=4.5, center=false, $fn=100);
    }
    // Stereo jack hole
    translate([BaseWidth - VolumeHoleX + 25, VolumeHoleY+1+LCDScreenHeight+4-2, 0]){
        cylinder(h=WallThickness, r=4, center=false, $fn=50);
    }
    // Earphone jack hole
    translate([BaseWidth - VolumeHoleX - 25, VolumeHoleY+1+LCDScreenHeight+4-2, 0]){
        cylinder(h=WallThickness, r=4, center=false, $fn=50);
    }
    // Vent holes on the left side
    for ( i = [0 : 7] ){
        for ( j = [0 : 3] ){
                translate([0, 12 + i*9.5, 10 + j*9.5]) {
                rotate([0, 90, 0]){
                    cylinder(h=WallThickness, r=3, center=false, $fn=30);
                }
            }
        }
    }

    // MicroUSB for NodeMCU
    translate([WallThickness*2+1, BaseDepth, BaseHeight-15-61.5+5]){
        rotate([90, 0, 0])
        cube(size=[5, 10, WallThickness], center=false);
    }
   
    // Power input hole
    translate([0, BaseDepth-23.5, BaseHeight-15]){
        rotate([0, 90, 0])
        cube(size=[28.3, 18.5, WallThickness], center=false);
    }

    // Reset hole for NodeMCU
    translate([0, BaseDepth-6, BaseHeight-15-61.5]){
        rotate([0, 90, 0])
                    cylinder(h=WallThickness, r=2.5, center=false, $fn=30);
    }

    // Power switch hole
    translate([0, 8, BaseHeight-15]){
        rotate([0, 90, 0])
        cube(size=[9.6, 14.2, WallThickness], center=false);
    }
    
    // Vent holes on the right side
    for ( i = [0 : 7] ){
        for ( j = [0 : 5] ){
                translate([BaseWidth-WallThickness, 12 + i*9.5, 10 + j*9.5]) {
                rotate([0, 90, 0]){
                    cylinder(h=WallThickness, r=3, center=false, $fn=30);
                }
            }
        }
    }
    // Speaker Output Hole
    translate([BaseWidth-WallThickness, 23 , BaseHeight-40]) {
        rotate([0, 90, 0]){
            cube(size=[20, 51.1, WallThickness], center=false);
        }
    }
}
    
translate([13+8, 0, 25+128+15]){
 rotate([90, 0, 0]){
    linear_extrude(height = WallThickness/2){
        text("IBE Group, Inc.", size=7, font="Arial Black");
    }
 }
}

translate([15+8, 0, 10+128+15]){
 rotate([90, 0, 0]){
    linear_extrude(height = WallThickness/2){
        text("Copyright© 2019", size=6, font="Arial Black");
    }
 }
}

/*
difference() {
    translate([0, BaseDepth+WallThickness*3, 0]){
        linear_extrude(height = WallThickness, center = false, convexity = 0, twist = 0)
        RoundedRectangle(BaseWidth-WallThickness*2-1, BaseDepth-WallThickness*2-1, CornerRadius);
    }
    // Vent holes
    for ( j = [0 : 7] ){
        for ( i = [0 : 11] ){
            translate([15 + i * 8, BaseDepth+WallThickness*3+15 + j*8, 0]){
                cylinder(h=WallThickness, r=3, center=false, $fn=30);
            }
        }
    }
}
*/
