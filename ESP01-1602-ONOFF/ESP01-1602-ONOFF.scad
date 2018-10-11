
PSULength = 120;
PSUWidth = 110;
PSUHeight = 40;
WallThickness = 1.25;

ButtonHolePositionY = 10.3+WallThickness;
ButtonHolePositionZ = PSUHeight-WallThickness*7-1+4;
ButtonHoleSizeY = 6;
ButtonHoleSizeZ = 2.5;

OutputHolePositionY = 18.5+WallThickness;
OutputHolePositionZ = PSUHeight-WallThickness*7;
OutputHoleSizeY = 0;
OutputHoleSizeZ = 0;

InputHolePositionY = 45+WallThickness;
InputHolePositionZ = PSUHeight-WallThickness*7-1.8+5;
InputHoleSizeY = 0;
InputHoleSizeZ = 0;

BatterySizeX=24.5;
BatterySizeY=71.5;
BatteryPositionX=PSUWidth-BatterySizeX-7;
BatteryPositionY=PSULength-BatterySizeY-7;

DisplaySizeX=7;
DisplaySizeY=7;
DisplayPositionX=PSUWidth - 15;
DisplayPositionY=8+WallThickness;


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


translate([PSUWidth-0.2, 12, 22]) {
    rotate([90, 0, 90]) {
        linear_extrude(height = 1/2){
            text("220V Remote Switch", size=6, font="Arial Black");
        }
    }
}

translate([PSUWidth-0.2, 10, 12]) {
    rotate([90, 0, 90]) {
        linear_extrude(height = 1/2){
            text("220V 10A Output Max", size=6, font="Arial Black");
        }
    }
}
