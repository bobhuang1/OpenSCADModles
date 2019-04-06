
BaseWidth = 150;
BaseDepth = 74;
BaseHeight = 40;
CornerRadius = 3;
WallThickness = 1.5;
LCDScreenWidth = 69.5;
LCDScreenHeight = 40;
LCDScreenX = 11 + WallThickness + 2.75;
LCDScreenY=15 + WallThickness + 0.3;

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

    translate([0, 35, 14]){
        cube(size=[WallThickness, 12, 9.5], center=false);
    }

    translate([0, 23, 14]){
        cube(size=[WallThickness, 5, 3], center=false);
    }
    translate([BaseWidth - 20, (BaseDepth-WallThickness*2)/2, 0]){
        cube(size=[7, 7, WallThickness], center=false);
    }
}
    
translate([35, 0, 25]){
 rotate([90, 0, 0]){
    linear_extrude(height = WallThickness/2){
        text("IBE Group, Inc.", size=7, font="Arial Black");
    }
 }
}

translate([35, 0, 10]){
 rotate([90, 0, 0]){
    linear_extrude(height = WallThickness/2){
        text("Copyright© 2019", size=6, font="Arial Black");
    }
 }
}

difference() {
    translate([0, BaseDepth+WallThickness*3, 0]){
        linear_extrude(height = WallThickness, center = false, convexity = 0, twist = 0)
        RoundedRectangle(BaseWidth-WallThickness*2-1, BaseDepth-WallThickness*2-1, CornerRadius);
    }

    translate([11+WallThickness, BaseDepth+WallThickness*3+8, 0]){
        cube(size=[85, 10, WallThickness], center=false);
    }
}

