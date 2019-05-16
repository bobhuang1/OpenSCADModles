
BaseWidth = 120;
BaseDepth = 90;
BaseHeight = 175;
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
VoltageDisplaySizeX = 23.5;
VoltageDisplaySizeY = 11.3;

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

/*
difference() {
    base3D(BaseWidth, BaseDepth, BaseHeight, CornerRadius, WallThickness);
    translate([LCDScreenX, LCDScreenY, 0]) {
        cube(size=[LCDScreenWidth, LCDScreenHeight, WallThickness], center=false);
    }
    // Button hole
    rotate([90, 0, 0]){
        translate([BaseWidth - 20, 12, -WallThickness]){
            cube(size=[7, 7, WallThickness], center=false);
        }
    }
    // Voltage display hole
    rotate([90, 0, 0]){
        translate([30+WallThickness, 10+WallThickness, -WallThickness]){
            cube(size=[VoltageDisplaySizeX, VoltageDisplaySizeY, WallThickness], center=false);
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
        translate([38, 40, -WallThickness]){
            cube(size=[71, 86, WallThickness], center=false);
        }
    }
    // Volume hole
    translate([BaseWidth - VolumeHoleX, VolumeHoleY+LCDScreenHeight, 0]){
        cylinder(h=WallThickness, r=4.5, center=false);
    }
    // Stereo jack hole
    translate([BaseWidth - VolumeHoleX + 25, VolumeHoleY+1+LCDScreenHeight, 0]){
        cylinder(h=WallThickness, r=3, center=false);
    }
    // Earphone jack hole
    translate([BaseWidth - VolumeHoleX - 25, VolumeHoleY+1+LCDScreenHeight, 0]){
        cylinder(h=WallThickness, r=3, center=false);
    }
    // Vent holes on the left side
    for ( i = [0 : 7] ){
        for ( j = [0 : 3] ){
                translate([0, 12 + i*9.5, 10 + j*9.5]) {
                rotate([0, 90, 0]){
                    cylinder(h=WallThickness, r=2, center=false);
                }
            }
        }
    }
    // Vent holes on the right side
    for ( i = [0 : 7] ){
        for ( j = [0 : 5] ){
                translate([BaseWidth-WallThickness, 12 + i*9.5, 10 + j*9.5]) {
                rotate([0, 90, 0]){
                    cylinder(h=WallThickness, r=2, center=false);
                }
            }
        }
    }

}
    
translate([13+8, 0, 25+128]){
 rotate([90, 0, 0]){
    linear_extrude(height = WallThickness/2){
        text("IBE Group, Inc.", size=7, font="Arial Black");
    }
 }
}

translate([15+8, 0, 10+128]){
 rotate([90, 0, 0]){
    linear_extrude(height = WallThickness/2){
        text("Copyright© 2019", size=6, font="Arial Black");
    }
 }
}
*/

difference() {
    translate([0, BaseDepth+WallThickness*3, 0]){
        linear_extrude(height = WallThickness, center = false, convexity = 0, twist = 0)
        RoundedRectangle(BaseWidth-WallThickness*2-1, BaseDepth-WallThickness*2-1, CornerRadius);
    }
    // Power cord hole
    translate([3+WallThickness, BaseDepth+WallThickness*3+6, 0]){
        cube(size=[5, 5, WallThickness], center=false);
    }
    // Transformer hole
    translate([BaseWidth/2+7, BaseDepth*1.5+WallThickness*2-0.5, 0]){
        cylinder(h=WallThickness, r=5, center=false);
    }
    // Vent holes
    for ( j = [0 : 7] ){
        for ( i = [0 : 11] ){
            if (!((i == 6 || i == 7) && (j == 3 || j == 4))) // Avoid power cord hole
            {
                translate([15 + i * 8, BaseDepth+WallThickness*3+15 + j*8, 0]){
                    cylinder(h=WallThickness, r=3, center=false);
                }
            }
        }
    }
}

