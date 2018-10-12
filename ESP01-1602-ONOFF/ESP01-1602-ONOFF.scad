
UnitLength = 120;
UnitWidth = 110;
UnitHeight = 40;
WallThickness = 1.25;

PowerHolePositionY = 10.3+WallThickness;
PowerHolePositionZ = UnitHeight-WallThickness*7-1+4;
PowerHoleSizeY = 6;
PowerHoleSizeZ = 2.5;

/*
OutputHolePositionY = 18.5+WallThickness;
OutputHolePositionZ = UnitHeight-WallThickness*7;
OutputHoleSizeY = 0;
OutputHoleSizeZ = 0;

InputHolePositionY = 45+WallThickness;
InputHolePositionZ = UnitHeight-WallThickness*7-1.8+5;
InputHoleSizeY = 0;
InputHoleSizeZ = 0;
*/

LCD1602SizeX=25;
LCD1602SizeY=72;
LCD1602PositionX=UnitWidth-LCD1602SizeX-8;
LCD1602PositionY=UnitLength-LCD1602SizeY-7;

SwitchSizeX=7;
SwitchSizeY=7;
SwitchPositionX=UnitWidth - 15;
SwitchPositionY=8+WallThickness;

OutletSizeX = 37;
OutletSizeY = 71;
OutletPositionX = 10;
OutletPositionY = UnitLength-OutletSizeY-7;;


// Bottom Cover

translate([0,UnitLength+WallThickness,0]) {
    cube([UnitWidth-2*WallThickness-0.4, UnitLength-2*WallThickness-0.4, WallThickness], center=false);
}

// Shell

difference() {

        difference() {
            cube([UnitWidth, UnitLength, UnitHeight], center=false);
                translate([WallThickness, WallThickness, -WallThickness]) {
                    cube([UnitWidth - 2*WallThickness, UnitLength -2*WallThickness, UnitHeight
], center=false);
            }

            translate([SwitchPositionX,SwitchPositionY,UnitHeight-WallThickness]) {

                cube([SwitchSizeX, SwitchSizeY, WallThickness], center=false);
            }

            translate([LCD1602PositionX,LCD1602PositionY,UnitHeight-WallThickness]) {

                cube([LCD1602SizeX, LCD1602SizeY, WallThickness], center=false);
            }

            translate([OutletPositionX,OutletPositionY,UnitHeight-WallThickness]) {

                cube([OutletSizeX, OutletSizeY, WallThickness], center=false);
            }

            translate([0,PowerHolePositionY,PowerHolePositionZ]) {
                cube([WallThickness, PowerHoleSizeY, PowerHoleSizeZ], center=false);
            }
/*
            translate([0,OutputHolePositionY,OutputHolePositionZ]) {
                cube([WallThickness, OutputHoleSizeY, OutputHoleSizeZ], center=false);
            }

            translate([0,InputHolePositionY,InputHolePositionZ]) {
                cube([WallThickness, InputHoleSizeY, InputHoleSizeZ], center=false);
            }
*/
       }
}


translate([UnitWidth-0.2, 12, 22]) {
    rotate([90, 0, 90]) {
        linear_extrude(height = 1/2){
            text("220V Remote Switch", size=6, font="Arial Black");
        }
    }
}

translate([UnitWidth-0.2, 10, 12]) {
    rotate([90, 0, 90]) {
        linear_extrude(height = 1/2){
            text("220V 10A Output Max", size=6, font="Arial Black");
        }
    }
}
