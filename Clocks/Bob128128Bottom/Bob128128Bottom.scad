
BaseWidth = 110;
BaseDepth = 64;
BaseHeight = 60;
CornerRadius = 0;
WallThickness = 1.8;
LCDScreenWidth=3;
LCDScreenHeight=7;
LCDScreenX=9;
LCDScreenY=12;
SmokeSensorRadius = 0;
SmokeSensorX=BaseWidth-WallThickness*2-1-SmokeSensorRadius;
SmokeSensorY=BaseDepth/2;
LEDRadius=1.6;
LEDX=SmokeSensorX;
LEDY=SmokeSensorY+35;

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
    
    rotate([0, -90, 0]) {
    translate([LCDScreenX, LCDScreenY, -WallThickness]) {
        cube(size=[LCDScreenWidth, LCDScreenHeight, WallThickness], center=false);
    }
    }

    rotate([0, -90, 0]) {
    translate([WallThickness, 30, -WallThickness]) {
        cube(size=[2, 12, WallThickness], center=false);
    }
    }

    rotate([0, -90, 0]) {
    translate([40, 50, -WallThickness]) {
        cube(size=[7, 7, WallThickness], center=false);
    }
    }
    
    translate([SmokeSensorX, SmokeSensorY, 0]){
        cylinder(h=WallThickness, r1=SmokeSensorRadius, r2=SmokeSensorRadius, center=false);
    }
//    translate([LEDX, LEDY, 0]){
//        cylinder(h=WallThickness, r1=LEDRadius, r2=LEDRadius, center=false);
//    }
//    translate([0, 200+28, 142+30]){
//        rotate([135, 0, 0]){
//            cube(size=[200, 200, 200], center=false);
//        }
//    }
/*    
    translate([0, 0, 33]){
        rotate([45, 0, 0]){
            cube(size=[BaseWidth, BaseDepth/1.42, 200], center=false);
        }
    }
*/
}

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
