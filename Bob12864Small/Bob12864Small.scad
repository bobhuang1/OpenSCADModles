
BaseWidth = 123;
BaseDepth = 84;
BaseHeight = 60;
CornerRadius = 3;
WallThickness = 1.5;
LCDScreenWidth=82;
LCDScreenHeight=49;
LCDScreenX=20;
LCDScreenY=21;

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
    translate([126, 12, 15]) {
        rotate([0, -90, 0]){
            cube(size=[5, 5, WallThickness], center=false);
        }
    }


//    translate([LEDX, LEDY, 0]){
//        cylinder(h=WallThickness, r1=LEDRadius, r2=LEDRadius, center=false);
//    }
    translate([0, 200+28, 125+30]){
        rotate([135, 0, 0]){
            cube(size=[200, 200, 200], center=false);
        }
    }
}


translate([13, 0, 35]){
 rotate([90, 0, 0]){
    linear_extrude(height = WallThickness){
        text("IBE Group, Inc.", size=9, font="Arial Black");
    }
 }
}

translate([8, 0, 15]){
 rotate([90, 0, 0]){
    linear_extrude(height = WallThickness){
        text("Copyright© 2018", size=9, font="Arial Black");
    }
 }
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
