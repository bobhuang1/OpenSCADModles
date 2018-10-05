
PSULength = 82;
PSUWidth = 61;
PSUHeight = 30;
WallThickness = 1.25;

ButtonHolePositionY = 9.8+WallThickness;
ButtonHolePositionZ = PSUHeight-WallThickness*7-1+5;
ButtonHoleSizeY = 3;
ButtonHoleSizeZ = 3;

OutputHolePositionY = 18.5+WallThickness;
OutputHolePositionZ = PSUHeight-WallThickness*7;
OutputHoleSizeY = 14.5;
OutputHoleSizeZ = 8.0;

InputHolePositionY = 45+WallThickness;
InputHolePositionZ = PSUHeight-WallThickness*7-1.8+5;
InputHoleSizeY = 9.2;
InputHoleSizeZ = 3.8;

BatterySizeX=21;
BatterySizeY=72;
BatteryPositionX=PSUWidth-WallThickness-BatterySizeX;
BatteryPositionY=(PSULength-BatterySizeY)/2;

DisplaySizeX=16.8;
DisplaySizeY=28.2;
DisplayPositionX=13.5+WallThickness;
DisplayPositionY=16.5;


// Bottom Cover
/*
translate([0,PSULength+WallThickness,0]) {
    cube([PSUWidth-2*WallThickness-0.3, PSULength-2*WallThickness-0.3, WallThickness], center=false);
}
*/
// Shell

difference() {

        difference() {
            cube([PSUWidth, PSULength, PSUHeight], center=false);
                translate([WallThickness, WallThickness, -WallThickness]) {
                    cube([PSUWidth - 2*WallThickness, PSULength -2*WallThickness, PSUHeight
], center=false);
            }

            translate([DisplayPositionX,DisplayPositionY,PSUHeight-WallThickness]) {

                cube([DisplaySizeX, DisplaySizeY, WallThickness], center=false);
            }

            translate([BatteryPositionX,BatteryPositionY,PSUHeight-WallThickness]) {

                cube([BatterySizeX, BatterySizeY, WallThickness], center=false);
            }

            translate([0,ButtonHolePositionY,ButtonHolePositionZ]) {
                cube([WallThickness, ButtonHoleSizeY, ButtonHoleSizeZ], center=false);
            }

            translate([0,OutputHolePositionY,OutputHolePositionZ]) {
                cube([WallThickness, OutputHoleSizeY, OutputHoleSizeZ], center=false);
            }

            translate([0,InputHolePositionY,InputHolePositionZ]) {
                cube([WallThickness, InputHoleSizeY, InputHoleSizeZ], center=false);
            }
       }
}


translate([PSUWidth-0.2, 8, 18]) {
    rotate([90, 0, 90]) {
        linear_extrude(height = 1/2){
            text("5V 2A Input 2A Output", size=4, font="Arial Black");
        }
    }
}

translate([PSUWidth-0.2, 15, 8]) {
    rotate([90, 0, 90]) {
        linear_extrude(height = 1/2){
            text("2000mAh", size=7, font="Arial Black");
        }
    }
}
