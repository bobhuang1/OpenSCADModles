// Office version as default
BaseWidth = 50;
BaseDepth = 45;
BaseHeight = 80;
CornerRadius = 3;
WallThickness = 1.5;

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
    
    
    // Button hole
    rotate([90, 0, 0]){
        translate([BaseWidth/2+9, BaseHeight/2+15, -WallThickness]){
        cylinder(h=WallThickness, d=11, center=false, $fn=100);
        }
    }

    // Power switch hole
    
    rotate([90, 0, 0]){
        translate([BaseWidth/2+2, BaseHeight/2-20, -WallThickness]){
        cube(size=[14.2, 9.6, WallThickness], center=false);
        }
    }
   
    // Power input hole
    translate([BaseWidth-WallThickness, BaseDepth/2, BaseHeight/2+14-WallThickness]){
        rotate([0, 90, 0])
        cube(size=[28.3, 18.5, WallThickness], center=false);
    }

    // Power output hole
    translate([0, BaseHeight/2-8, BaseHeight-10-WallThickness]){
        rotate([0, 90, 0])
        cube(size=[9, 6, WallThickness], center=false);
    }

    // Control input hole
    translate([0, BaseHeight/2-20, 15+WallThickness]){
        rotate([0, 90, 0])
        cube(size=[9, 6, WallThickness], center=false);
    }

    // Hole in the front to see LEDs on the relay module
    translate([5, 32, 0])
        cube(size=[23, 8, WallThickness], center=false);
    
    
    // Hole for ziptie
/*
    translate([10, 10, 0])
        cube(size=[4, 4, WallThickness], center=false);
    translate([37.5, 37.5, 0])
        cube(size=[4, 4, WallThickness], center=false);
    translate([10, 37.5, 0])
        cube(size=[4, 4, WallThickness], center=false);
    translate([37.5, 10, 0])
        cube(size=[4, 4, WallThickness], center=false);
*/
    
    // Hole for ziptie
    translate([10-WallThickness, BaseDepth, BaseHeight-10]){
        rotate([90, 0, 0])
        cube(size=[4, 4, WallThickness], center=false);
    }
    translate([BaseWidth-10-2*WallThickness, BaseDepth, BaseHeight-10]){
        rotate([90, 0, 0])
        cube(size=[4, 4, WallThickness], center=false);
    }
    translate([10-WallThickness, BaseDepth, 10]){
        rotate([90, 0, 0])
        cube(size=[4, 4, WallThickness], center=false);
    }
    translate([BaseWidth-10-2*WallThickness, BaseDepth, 10]){
        rotate([90, 0, 0])
        cube(size=[4, 4, WallThickness], center=false);
    }
}
   
/*
difference() {
    translate([0, BaseDepth+WallThickness*3, 0]){
        linear_extrude(height = WallThickness, center = false, convexity = 0, twist = 0)
        RoundedRectangle(BaseWidth-WallThickness*2-1, BaseDepth-WallThickness*2-1, CornerRadius);
    }
}
*/
