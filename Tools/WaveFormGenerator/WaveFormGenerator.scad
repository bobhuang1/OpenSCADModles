// Default is the working fine version/no sticker on screen

WallThickness = 1.75;
BaseHeight = 20+2*WallThickness;
BaseDepth = 52+2*WallThickness;;
BaseWidth = 114+2*WallThickness;
CornerRadius = 2;
ScreenWidth = 28;
ScreenHeight = 16;
ScreenX = 9.2+WallThickness;
ScreenY = 10.2+WallThickness;
FirstButtonX = 33.5+WallThickness;
FirstButtonY = 6.2+WallThickness;
ButtonYOffset=1.5;
ButtonSize = 4.3;
ButtonStep = 2.54;

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
    
    union() {
    translate([ScreenX-WallThickness, ScreenY-WallThickness-1.5*ButtonStep])
        cube(size=[ScreenHeight+WallThickness*2, ScreenWidth+WallThickness*2, WallThickness*2], center=false);

        base3D(BaseWidth, BaseDepth, BaseHeight, CornerRadius, WallThickness);
    }

    translate([ScreenX, ScreenY-1.5*ButtonStep])
        cube(size=[ScreenHeight, ScreenWidth, WallThickness*2], center=false);
    
    // First Button - lower right most button
    translate([BaseWidth-WallThickness-FirstButtonX, FirstButtonY+ButtonYOffset, 0])
        cylinder(h=WallThickness*2, d=ButtonSize, center=true , $fn=20);
    // Button to the left of the First button
    translate([BaseWidth-WallThickness-FirstButtonX, FirstButtonY+ButtonStep*3+ButtonYOffset])
        cylinder(h=WallThickness*2, d=ButtonSize, center=true , $fn=20);
    // Button to the upper of the First button
    translate([BaseWidth-WallThickness-FirstButtonX-ButtonStep*4, FirstButtonY+ButtonYOffset])
        cylinder(h=WallThickness*2, d=ButtonSize, center=true , $fn=20);
    // Button to the upper/left of the First button
    translate([BaseWidth-WallThickness-FirstButtonX-ButtonStep*4, FirstButtonY+ButtonStep*3+ButtonYOffset])
        cylinder(h=WallThickness*2, d=ButtonSize, center=true , $fn=20);
    // Step Button
    translate([BaseWidth-WallThickness-FirstButtonX-ButtonStep*8, FirstButtonY+ButtonYOffset])
        cylinder(h=WallThickness*2, d=ButtonSize, center=true , $fn=20);
    
    // Timer pins
    translate([BaseWidth-WallThickness-FirstButtonX-ButtonStep*10-2.54, FirstButtonY+2*ButtonStep+ButtonYOffset])
        cube(size=[ButtonStep*2, ButtonStep*2, WallThickness*2], center=true);
    
    
    // Adjustable Resistor blule/white
    translate([BaseWidth-WallThickness-FirstButtonX-ButtonStep*4, FirstButtonY+ButtonStep*7.5])
        cylinder(h=WallThickness*2, d=7, center=true , $fn=30);
    // Ground PINs
    translate([BaseWidth-WallThickness-FirstButtonX-ButtonStep+1, FirstButtonY+ButtonStep*6.5])
        cube(size=[ButtonStep*4, ButtonStep, WallThickness*2], center=true);
    // Amplified PINs
    translate([BaseWidth-WallThickness-FirstButtonX+ButtonStep, FirstButtonY+ButtonStep*10.5])
        cube(size=[ButtonStep*3, ButtonStep*2, WallThickness*2], center=true);
    // Amplifier power voltage adjust pin and big capacitor
    translate([BaseWidth-WallThickness-FirstButtonX+ButtonStep+15+4, FirstButtonY+ButtonStep*10.5-5-2])
        cube(size=[15, 12, WallThickness*2], center=true);
    // Normal and Buffered PINs
    translate([BaseWidth-WallThickness-FirstButtonX-3*ButtonStep, FirstButtonY+ButtonStep*15])
        cube(size=[ButtonStep*2, ButtonStep*2, WallThickness*2], center=true);
    // Nano onboard pins
    translate([36.5+WallThickness+4-1, ScreenY+ScreenWidth+WallThickness+1+1])
        cube(size=[8, 5, WallThickness*2], center=true);
    // Mini USB Hole
    translate([36.5+WallThickness, WallThickness, WallThickness])
        rotate([90, 0, 0])
            cube(size=[8.2, 4.4, WallThickness*2], center=false);
}

/*
translate([18+7, BaseDepth, BaseHeight/2-4])
 rotate([270, 0, 0])
    linear_extrude(height = WallThickness/2){
        text("IBE Group, Inc.", size=5, font="Arial Black");
}

translate([15+8, BaseDepth, BaseHeight-4])
rotate([270, 0, 0])
    linear_extrude(height = WallThickness/2){
        text("Copyright© 2019", size=5, font="Arial Black");
}
*/
