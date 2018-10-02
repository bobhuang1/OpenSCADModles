
BaseWidth = 101;
BaseDepth = 93.5;
BaseHeight = 60;
CornerRadius = 3;
WallThickness = 1.5;
LCDScreenWidth = 73;
LCDScreenHeight = 41.5;
LCDScreenX = 14;
LCDScreenY = 16;

LEDX = BaseWidth - 8;
LEDY = BaseDepth - 5;
LEDRadius = 1.75;

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
    translate([BaseWidth - 15, 0, 15]) {
        rotate([-90, 0, 0]){
            cube(size=[7, 7, WallThickness], center=false);
        }
    }


    translate([LEDX, LEDY, 0]){
        cylinder(h=WallThickness, r1=LEDRadius, r2=LEDRadius, center=false);
    }
    translate([0, 200+38, 125+25]){
        rotate([135, 0, 0]){
            cube(size=[200, 200, 200], center=false);
        }
    }
}


translate([WallThickness, 8, 30]){
 rotate([90, 0, 90]){
    linear_extrude(height = WallThickness/2){
        text("IBE Group, Inc.", size=5, font="Arial Black");
    }
 }
}

translate([WallThickness, 8, 12]){
 rotate([90, 0, 90]){
    linear_extrude(height = WallThickness/2){
        text("Copyright© 2018", size=5, font="Arial Black");
    }
 }
}

translate([12, 0, 35]){
 rotate([90, 0, 0]){
    linear_extrude(height = WallThickness/2){
        text("WIFI多功能时钟", size=8, font="SimHei");
    }
 }
}

translate([12, 0, 22]){
 rotate([90, 0, 0]){
    linear_extrude(height = WallThickness/2){
        text("WIFI Multi Function Clock", size=4, font="Arial Black");
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
