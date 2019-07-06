
WallThickness = 1.5;
UnitLength = 70 + 2 * WallThickness + 1;
UnitWidth = 115;
UnitHeight = 30;

USBPowerHolePositionY = 10 + WallThickness + 12.5 + 4.5;
USBPowerHolePositionZ = 6.5;
USBPowerHoleSizeY = 10;
USBPowerHoleSizeZ = 4;

LCDSizeX=34; // unit width
LCDSizeY=34; // unit length
LCDPositionX=UnitWidth-LCDSizeX-17;
LCDPositionY=UnitLength-LCDSizeY-12;

ButtonSizeX = 6;
ButtonSizeY = 6;
ButtonDistanceX = 2.54;
ButtonDistanceY = 2.54;

ButtonDoorPositionX = 5+WallThickness+0.5+0.5;
ButtonDoorPositionY = 65+WallThickness-0.5-ButtonSizeY;

ButtonResetPositionX = ButtonDoorPositionX + ButtonDistanceX * 6;
ButtonResetPositionY = ButtonDoorPositionY;

ButtonSelectPositionX = ButtonDoorPositionX;
ButtonSelectPositionY = ButtonDoorPositionY - ButtonDistanceY * 4;

ButtonCancelPositionX = ButtonResetPositionX;
ButtonCancelPositionY = ButtonSelectPositionY;

ButtonConfirmPositionX = ButtonSelectPositionX + ButtonDistanceX * 3;
ButtonConfirmPositionY = ButtonSelectPositionY - ButtonDistanceY * 3;

ButtonDownPositionX = ButtonDoorPositionX;
ButtonDownPositionY = ButtonConfirmPositionY - ButtonDistanceY * 11;

ButtonLeftPositionX = ButtonConfirmPositionX;
ButtonLeftPositionY = ButtonDownPositionY + ButtonDistanceY * 3;

ButtonRightPositionX = ButtonConfirmPositionX;
ButtonRightPositionY = ButtonDownPositionY - ButtonDistanceY * 3;

ButtonUpPositionX = ButtonResetPositionX;
ButtonUpPositionY = ButtonDownPositionY;


// Shell
/*
difference() {

        difference() {
            cube([UnitWidth, UnitLength, UnitHeight], center=false);
                translate([WallThickness, WallThickness, -WallThickness]) {
                    cube([UnitWidth - 2*WallThickness, UnitLength -2*WallThickness, UnitHeight
], center=false);
            }

            translate([LCDPositionX,LCDPositionY,UnitHeight-WallThickness]) {
                cube([LCDSizeX, LCDSizeY, WallThickness], center=false);
            }

            translate([ButtonDoorPositionX,ButtonDoorPositionY,UnitHeight-WallThickness]) {
                cube([ButtonSizeX, ButtonSizeY, WallThickness], center=false);
            }

            translate([ButtonResetPositionX,ButtonResetPositionY,UnitHeight-WallThickness]) {
                cube([ButtonSizeX, ButtonSizeY, WallThickness], center=false);
            }

            translate([ButtonSelectPositionX,ButtonSelectPositionY,UnitHeight-WallThickness]) {
                cube([ButtonSizeX, ButtonSizeY, WallThickness], center=false);
            }

            translate([ButtonConfirmPositionX,ButtonConfirmPositionY,UnitHeight-WallThickness]) {
                cube([ButtonSizeX, ButtonSizeY, WallThickness], center=false);
            }

            translate([ButtonCancelPositionX,ButtonCancelPositionY,UnitHeight-WallThickness]) {
                cube([ButtonSizeX, ButtonSizeY, WallThickness], center=false);
            }

            translate([ButtonDownPositionX,ButtonDownPositionY,UnitHeight-WallThickness]) {
                cube([ButtonSizeX, ButtonSizeY, WallThickness], center=false);
            }

            translate([ButtonLeftPositionX,ButtonLeftPositionY,UnitHeight-WallThickness]) {
                cube([ButtonSizeX, ButtonSizeY, WallThickness], center=false);
            }

            translate([ButtonRightPositionX,ButtonRightPositionY,UnitHeight-WallThickness]) {
                cube([ButtonSizeX, ButtonSizeY, WallThickness], center=false);
            }

            translate([ButtonUpPositionX,ButtonUpPositionY,UnitHeight-WallThickness]) {
                cube([ButtonSizeX, ButtonSizeY, WallThickness], center=false);
            }

            translate([UnitWidth-WallThickness,UnitLength-USBPowerHoleSizeY-10,0]) {
                cube([WallThickness, USBPowerHoleSizeY, USBPowerHoleSizeZ], center=false);
            }

        }
}       


// Slope

difference() {
    translate([0, 0, -UnitHeight*2]) {
        cube([UnitWidth, UnitLength, UnitHeight*2], center=false);
    }

    translate([WallThickness, WallThickness, -UnitHeight*2]) {
        cube([UnitWidth - 2*WallThickness, UnitLength -2*WallThickness, UnitHeight*2
], center=false);
    }
    rotate([0,atan(UnitHeight*2/UnitWidth),0]) {
        translate([0,0,-UnitHeight*2]) {
            cube([sqrt(UnitWidth*UnitWidth+UnitHeight*UnitHeight*4),UnitLength,UnitHeight*2], center=false);
        }
    }
}
*/

// Text
/*
translate([UnitWidth-80, 0-1/2, 10]) {
    rotate([90, 0, 0]) {
        linear_extrude(height = 1/2){
            text("Math Exercise", size=6, font="Arial Black");
        }
    }
}
*/

// Buttons

// Button Door
translate([0, -10, WallThickness * 5/2]) {
    difference() {
        union() {
        cube([ButtonSizeX - 0.8, ButtonSizeY - 0.8, WallThickness * 5], center=true);
            translate([0, 0, -WallThickness]) {
                cube([ButtonSizeX + 1, ButtonSizeY + 1, WallThickness ], center=true);
            }
        }

        translate([-ButtonSizeX/3-0.6,-ButtonSizeY/3-0.5,WallThickness * 5/2-1]) {
            linear_extrude(height = 1){
            text("D", size=5, font="Arial Black");
            }
        }
    }
}

// Button Reset
translate([10, -10, WallThickness * 5/2]) {
    difference() {
        union() {
        cube([ButtonSizeX - 0.8, ButtonSizeY - 0.8, WallThickness * 5], center=true);
            translate([0, 0, -WallThickness]) {
                cube([ButtonSizeX + 1, ButtonSizeY + 1, WallThickness ], center=true);
            }
        }

        translate([-ButtonSizeX/3-0.6,-ButtonSizeY/3-0.5,WallThickness * 5/2-1]) {
            linear_extrude(height = 1){
            text("R", size=5, font="Arial Black");
            }
        }
    }
}

// Button Select
translate([20, -10, WallThickness * 5/2]) {
    difference() {
        union() {
        cube([ButtonSizeX - 0.8, ButtonSizeY - 0.8, WallThickness * 5], center=true);
            translate([0, 0, -WallThickness]) {
                cube([ButtonSizeX + 1, ButtonSizeY + 1, WallThickness ], center=true);
            }
        }

        translate([-ButtonSizeX/3-0.6,-ButtonSizeY/3-0.5,WallThickness * 5/2-1]) {
            linear_extrude(height = 1){
            text("S", size=5, font="Arial Black");
            }
        }
    }
}

// Button Confirm
translate([30, -10, WallThickness * 5/2]) {
    difference() {
        union() {
        cube([ButtonSizeX - 0.8, ButtonSizeY - 0.8, WallThickness * 5], center=true);
            translate([0, 0, -WallThickness]) {
                cube([ButtonSizeX + 1, ButtonSizeY + 1, WallThickness ], center=true);
            }
        }

        translate([-ButtonSizeX/3-1.4,-ButtonSizeY/3+0.2,WallThickness * 5/2-1]) {
            linear_extrude(height = 1){
            text("☺", size=5, font="Arial Black");
            }
        }
    }
}

// Button Cancel
translate([40, -10, WallThickness * 5/2]) {
    difference() {
        union() {
        cube([ButtonSizeX - 0.8, ButtonSizeY - 0.8, WallThickness * 5], center=true);
            translate([0, 0, -WallThickness]) {
                cube([ButtonSizeX + 1, ButtonSizeY + 1, WallThickness ], center=true);
            }
        }

        translate([-ButtonSizeX/3-0.6,-ButtonSizeY/3-0.5,WallThickness * 5/2-1]) {
            linear_extrude(height = 1){
            text("X", size=5, font="Arial Black");
            }
        }
    }
}

// Number Down
translate([50, -10, WallThickness * 5/2]) {
    difference() {
        union() {
        cube([ButtonSizeX - 0.8, ButtonSizeY - 0.8, WallThickness * 5], center=true);
            translate([0, 0, -WallThickness]) {
                cube([ButtonSizeX + 1, ButtonSizeY + 1, WallThickness ], center=true);
            }
        }

        translate([-ButtonSizeX/3-1.3,-ButtonSizeY/3-0.4,WallThickness * 5/2-1]) {
            linear_extrude(height = 1){
            text("▼", size=5, font="Arial Black");
            }
        }
    }
}

// Number Left
translate([60, -10, WallThickness * 5/2]) {
    difference() {
        union() {
        cube([ButtonSizeX - 0.8, ButtonSizeY - 0.8, WallThickness * 5], center=true);
            translate([0, 0, -WallThickness]) {
                cube([ButtonSizeX + 1, ButtonSizeY + 1, WallThickness ], center=true);
            }
        }

        translate([-ButtonSizeX/3-1.3,-ButtonSizeY/3-0.4,WallThickness * 5/2-1]) {
            linear_extrude(height = 1){
            text("◄", size=5, font="Arial Black");
            }
        }
    }
}

// Number Right
translate([70, -10, WallThickness * 5/2]) {
    difference() {
        union() {
        cube([ButtonSizeX - 0.8, ButtonSizeY - 0.8, WallThickness * 5], center=true);
            translate([0, 0, -WallThickness]) {
                cube([ButtonSizeX + 1, ButtonSizeY + 1, WallThickness ], center=true);
            }
        }

        translate([-ButtonSizeX/3-1.3,-ButtonSizeY/3-0.4,WallThickness * 5/2-1]) {
            linear_extrude(height = 1){
            text("►", size=5, font="Arial Black");
            }
        }
    }
}

// Number Up
translate([80, -10, WallThickness * 5/2]) {
    difference() {
        union() {
        cube([ButtonSizeX - 0.8, ButtonSizeY - 0.8, WallThickness * 5], center=true);
            translate([0, 0, -WallThickness]) {
                cube([ButtonSizeX + 1, ButtonSizeY + 1, WallThickness ], center=true);
            }
        }

        translate([-ButtonSizeX/3-1.3,-ButtonSizeY/3-0.4,WallThickness * 5/2-1]) {
            linear_extrude(height = 1){
            text("▲", size=5, font="Arial Black");
            }
        }
    }
}


