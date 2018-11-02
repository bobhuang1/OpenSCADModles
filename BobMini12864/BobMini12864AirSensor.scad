
BaseWidth = 100+14;
BaseDepth = 74;
BaseHeight = 50;
CornerRadius = 3;
WallThickness = 1.5;
LCDScreenWidth = 69.5;
LCDScreenHeight = 40;
LCDScreenX = 11 + WallThickness + 2.75;
LCDScreenY=15 + WallThickness + 0.3;

USBInputHoleWidth=9;
USBInputHoleHeight=4;
USBInputHoleY = 19+WallThickness+1.8 + 5;
USBInputHoleZ = 15+8-5 + 2.5;

AirSensorHoldRadius = 4.8;
AirSensorX = BaseWidth - 12 - WallThickness;
AirSensorY = 35 + WallThickness;

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
    translate([BaseWidth - 12 - 30, 0, 15+11]) {
        rotate([-90, 0, 0]){
            cube(size=[7, 7, WallThickness], center=false);
        }
    }

translate([AirSensorX, AirSensorY, 0]) {
    cylinder(h=WallThickness, r=AirSensorHoldRadius, center=false);
}

    translate([0, USBInputHoleY-USBInputHoleWidth, USBInputHoleZ-USBInputHoleHeight]) {
        rotate([0, 90, 0]){
            cube(size=[USBInputHoleHeight, USBInputHoleWidth, WallThickness], center=false);
        }
    }

//    translate([LEDX, LEDY, 0]){
//        cylinder(h=WallThickness, r1=LEDRadius, r2=LEDRadius, center=false);
//    }

    translate([0, 200+18, 125+25]){
        rotate([138, 0, 0]){
            cube(size=[200, 200, 200], center=false);
        }
    }
}


translate([11, 0, 30]){
 rotate([90, 0, 0]){
    linear_extrude(height = WallThickness/2){
        text("IBE Group, Inc.", size=8, font="Arial Black");
    }
 }
}

translate([7, 0, 10]){
 rotate([90, 0, 0]){
    linear_extrude(height = WallThickness/2){
        text("Copyright© 2018", size=8, font="Arial Black");
    }
 }
}

/*
translate([6, 0, 25]){
 rotate([90, 0, 0]){
    linear_extrude(height = WallThickness/2){
        text("小帝小薇古诗词练习", size=9, font="SimHei");
    }
 }
}
*/

/*
difference() {
    translate([0, 0, 33]){
        rotate([45, 0, 0]){
            cube(size=[BaseWidth, BaseDepth/1.42, 200], center=false);
        }
    }

    translate([0, -2, 35]){
        rotate([45, 0, 0]){
            cube(size=[BaseWidth+2, BaseDepth/1.42+2, 200+2], center=false);
        }
    }
}
*/
