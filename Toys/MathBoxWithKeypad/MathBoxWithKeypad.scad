
UnitLength = 100;
UnitWidth = 157;
UnitHeight = 30;
WallThickness = 1.5;

USBPowerHolePositionY = 10 + WallThickness + 12.5 + 4.5;
USBPowerHolePositionZ = 6.5;
USBPowerHoleSizeY = 13.2;
USBPowerHoleSizeZ = 13.2;

RegularPowerHolePositionY = 24 + 31.2;
RegularPowerHolePositionZ = USBPowerHolePositionZ-1;
RegularPowerHoleSizeY = 10.8;
RegularPowerHoleSizeZ = 13.8;

LCD12864SizeX=42.5;
LCD12864SizeY=74;
LCD12864PositionX=UnitWidth-LCD12864SizeX-17;
LCD12864PositionY=UnitLength-LCD12864SizeY-13;

ButtonSizeX = 8;
ButtonSizeY = 8;
ButtonDistanceX = 2.54*4;
ButtonDistanceY = 2.54*4;

Button0PositionX = 14+WallThickness;
Button0PositionY = 52+WallThickness+0.5;

Button1PositionX = Button0PositionX + ButtonDistanceX;
Button1PositionY = Button0PositionY + ButtonDistanceY;

Button2PositionX = Button0PositionX + ButtonDistanceX;
Button2PositionY = Button0PositionY;

Button3PositionX = Button0PositionX + ButtonDistanceX;
Button3PositionY = Button0PositionY - ButtonDistanceY;

Button4PositionX = Button0PositionX + ButtonDistanceX*2;
Button4PositionY = Button0PositionY + ButtonDistanceY;

Button5PositionX = Button0PositionX + ButtonDistanceX*2;
Button5PositionY = Button0PositionY;

Button6PositionX = Button0PositionX + ButtonDistanceX*2;
Button6PositionY = Button0PositionY - ButtonDistanceY;

Button7PositionX = Button0PositionX + ButtonDistanceX*3;
Button7PositionY = Button0PositionY + ButtonDistanceY;

Button8PositionX = Button0PositionX + ButtonDistanceX*3;
Button8PositionY = Button0PositionY;

Button9PositionX = Button0PositionX + ButtonDistanceX*3;
Button9PositionY = Button0PositionY - ButtonDistanceY;

ButtonDotPositionX = Button0PositionX;
ButtonDotPositionY = Button0PositionY - ButtonDistanceY;

ButtonEnterPositionX = Button0PositionX;
ButtonEnterPositionY = Button0PositionY - ButtonDistanceY*2;

ButtonBackPositionX = Button0PositionX + ButtonDistanceX*2;
ButtonBackPositionY = Button0PositionY - ButtonDistanceY*2;

// Shell

difference() {

        difference() {
            cube([UnitWidth, UnitLength, UnitHeight], center=false);
                translate([WallThickness, WallThickness, -WallThickness]) {
                    cube([UnitWidth - 2*WallThickness, UnitLength -2*WallThickness, UnitHeight
], center=false);
            }

            translate([LCD12864PositionX,LCD12864PositionY,UnitHeight-WallThickness]) {
                cube([LCD12864SizeX, LCD12864SizeY, WallThickness], center=false);
            }

            translate([Button0PositionX,Button0PositionY,UnitHeight-WallThickness]) {
                cube([ButtonSizeX, ButtonSizeY, WallThickness], center=false);
            }

            translate([Button1PositionX,Button1PositionY,UnitHeight-WallThickness]) {
                cube([ButtonSizeX, ButtonSizeY, WallThickness], center=false);
            }

            translate([Button2PositionX,Button2PositionY,UnitHeight-WallThickness]) {
                cube([ButtonSizeX, ButtonSizeY, WallThickness], center=false);
            }

            translate([Button3PositionX,Button3PositionY,UnitHeight-WallThickness]) {
                cube([ButtonSizeX, ButtonSizeY, WallThickness], center=false);
            }

            translate([Button4PositionX,Button4PositionY,UnitHeight-WallThickness]) {
                cube([ButtonSizeX, ButtonSizeY, WallThickness], center=false);
            }

            translate([Button5PositionX,Button5PositionY,UnitHeight-WallThickness]) {
                cube([ButtonSizeX, ButtonSizeY, WallThickness], center=false);
            }

            translate([Button6PositionX,Button6PositionY,UnitHeight-WallThickness]) {
                cube([ButtonSizeX, ButtonSizeY, WallThickness], center=false);
            }

            translate([Button7PositionX,Button7PositionY,UnitHeight-WallThickness]) {
                cube([ButtonSizeX, ButtonSizeY, WallThickness], center=false);
            }

            translate([Button8PositionX,Button8PositionY,UnitHeight-WallThickness]) {
                cube([ButtonSizeX, ButtonSizeY, WallThickness], center=false);
            }

            translate([Button9PositionX,Button9PositionY,UnitHeight-WallThickness]) {
                cube([ButtonSizeX, ButtonSizeY, WallThickness], center=false);
            }

            translate([ButtonDotPositionX,ButtonDotPositionY,UnitHeight-WallThickness]) {
                cube([ButtonSizeX, ButtonSizeY, WallThickness], center=false);
            }

            translate([ButtonBackPositionX,ButtonBackPositionY,UnitHeight-WallThickness]) {
                cube([ButtonSizeX, ButtonSizeY, WallThickness], center=false);
            }

            translate([ButtonEnterPositionX,ButtonEnterPositionY,UnitHeight-WallThickness]) {
                cube([ButtonSizeX, ButtonSizeY, WallThickness], center=false);
            }


    rotate([0,0,90]) {
            translate([0,-USBPowerHolePositionY,USBPowerHolePositionZ]) {
                cube([WallThickness, USBPowerHoleSizeY, USBPowerHoleSizeZ], center=false);
            }
       }

    rotate([0,0,90]) {
            translate([0,-RegularPowerHolePositionY,RegularPowerHolePositionZ]) {
                cube([WallThickness, RegularPowerHoleSizeY, RegularPowerHoleSizeZ], center=false);
            }
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


// Text

translate([UnitWidth-80, 0-1/2, 10]) {
    rotate([90, 0, 0]) {
        linear_extrude(height = 1/2){
            text("Math Exercise", size=6, font="Arial Black");
        }
    }
}


// Buttons
/*
// Number 0
translate([0, -10, WallThickness * 5/2]) {
    difference() {
        union() {
        cube([ButtonSizeX - 0.8, ButtonSizeY - 0.8, WallThickness * 5], center=true);
            translate([0, 0, -WallThickness]) {
                cube([ButtonSizeX + 1, ButtonSizeY + 1, WallThickness ], center=true);
            }
        }

        translate([-ButtonSizeX/3+0.2,-ButtonSizeY/3+0.2,WallThickness * 5/2-1]) {
            linear_extrude(height = 1){
            text("0", size=5, font="Arial Black");
            }
        }
    }
}

// Number 1
translate([10, -10, WallThickness * 5/2]) {
    difference() {
        union() {
        cube([ButtonSizeX - 0.8, ButtonSizeY - 0.8, WallThickness * 5], center=true);
            translate([0, 0, -WallThickness]) {
                cube([ButtonSizeX + 1, ButtonSizeY + 1, WallThickness ], center=true);
            }
        }

        translate([-ButtonSizeX/3+0.2,-ButtonSizeY/3+0.2,WallThickness * 5/2-1]) {
            linear_extrude(height = 1){
            text("1", size=5, font="Arial Black");
            }
        }
    }
}

// Number 2
translate([20, -10, WallThickness * 5/2]) {
    difference() {
        union() {
        cube([ButtonSizeX - 0.8, ButtonSizeY - 0.8, WallThickness * 5], center=true);
            translate([0, 0, -WallThickness]) {
                cube([ButtonSizeX + 1, ButtonSizeY + 1, WallThickness ], center=true);
            }
        }

        translate([-ButtonSizeX/3+0.2,-ButtonSizeY/3+0.2,WallThickness * 5/2-1]) {
            linear_extrude(height = 1){
            text("2", size=5, font="Arial Black");
            }
        }
    }
}

// Number 3
translate([30, -10, WallThickness * 5/2]) {
    difference() {
        union() {
        cube([ButtonSizeX - 0.8, ButtonSizeY - 0.8, WallThickness * 5], center=true);
            translate([0, 0, -WallThickness]) {
                cube([ButtonSizeX + 1, ButtonSizeY + 1, WallThickness ], center=true);
            }
        }

        translate([-ButtonSizeX/3+0.2,-ButtonSizeY/3+0.2,WallThickness * 5/2-1]) {
            linear_extrude(height = 1){
            text("3", size=5, font="Arial Black");
            }
        }
    }
}

// Number 4
translate([40, -10, WallThickness * 5/2]) {
    difference() {
        union() {
        cube([ButtonSizeX - 0.8, ButtonSizeY - 0.8, WallThickness * 5], center=true);
            translate([0, 0, -WallThickness]) {
                cube([ButtonSizeX + 1, ButtonSizeY + 1, WallThickness ], center=true);
            }
        }

        translate([-ButtonSizeX/3+0.2,-ButtonSizeY/3+0.2,WallThickness * 5/2-1]) {
            linear_extrude(height = 1){
            text("4", size=5, font="Arial Black");
            }
        }
    }
}

// Number 5
translate([50, -10, WallThickness * 5/2]) {
    difference() {
        union() {
        cube([ButtonSizeX - 0.8, ButtonSizeY - 0.8, WallThickness * 5], center=true);
            translate([0, 0, -WallThickness]) {
                cube([ButtonSizeX + 1, ButtonSizeY + 1, WallThickness ], center=true);
            }
        }

        translate([-ButtonSizeX/3+0.2,-ButtonSizeY/3+0.2,WallThickness * 5/2-1]) {
            linear_extrude(height = 1){
            text("5", size=5, font="Arial Black");
            }
        }
    }
}

// Number 6
translate([60, -10, WallThickness * 5/2]) {
    difference() {
        union() {
        cube([ButtonSizeX - 0.8, ButtonSizeY - 0.8, WallThickness * 5], center=true);
            translate([0, 0, -WallThickness]) {
                cube([ButtonSizeX + 1, ButtonSizeY + 1, WallThickness ], center=true);
            }
        }

        translate([-ButtonSizeX/3+0.2,-ButtonSizeY/3+0.2,WallThickness * 5/2-1]) {
            linear_extrude(height = 1){
            text("6", size=5, font="Arial Black");
            }
        }
    }
}

// Number 7
translate([70, -10, WallThickness * 5/2]) {
    difference() {
        union() {
        cube([ButtonSizeX - 0.8, ButtonSizeY - 0.8, WallThickness * 5], center=true);
            translate([0, 0, -WallThickness]) {
                cube([ButtonSizeX + 1, ButtonSizeY + 1, WallThickness ], center=true);
            }
        }

        translate([-ButtonSizeX/3+0.2,-ButtonSizeY/3+0.2,WallThickness * 5/2-1]) {
            linear_extrude(height = 1){
            text("7", size=5, font="Arial Black");
            }
        }
    }
}

// Number 8
translate([80, -10, WallThickness * 5/2]) {
    difference() {
        union() {
        cube([ButtonSizeX - 0.8, ButtonSizeY - 0.8, WallThickness * 5], center=true);
            translate([0, 0, -WallThickness]) {
                cube([ButtonSizeX + 1, ButtonSizeY + 1, WallThickness ], center=true);
            }
        }

        translate([-ButtonSizeX/3+0.2,-ButtonSizeY/3+0.2,WallThickness * 5/2-1]) {
            linear_extrude(height = 1){
            text("8", size=5, font="Arial Black");
            }
        }
    }
}

// Number 9
translate([90, -10, WallThickness * 5/2]) {
    difference() {
        union() {
        cube([ButtonSizeX - 0.8, ButtonSizeY - 0.8, WallThickness * 5], center=true);
            translate([0, 0, -WallThickness]) {
                cube([ButtonSizeX + 1, ButtonSizeY + 1, WallThickness ], center=true);
            }
        }

        translate([-ButtonSizeX/3+0.2,-ButtonSizeY/3+0.2,WallThickness * 5/2-1]) {
            linear_extrude(height = 1){
            text("9", size=5, font="Arial Black");
            }
        }
    }
}

// Number DOT
translate([0, -20, WallThickness * 5/2]) {
    difference() {
        union() {
        cube([ButtonSizeX - 0.8, ButtonSizeY - 0.8, WallThickness * 5], center=true);
            translate([0, 0, -WallThickness]) {
                cube([ButtonSizeX + 1, ButtonSizeY + 1, WallThickness ], center=true);
            }
        }

        translate([-ButtonSizeX/3+0.2,-ButtonSizeY/3+0.2,WallThickness * 5/2-1]) {
            linear_extrude(height = 1){
            text(".", size=6, font="Arial Black");
            }
        }
    }
}

// Number Enter
translate([10, -20, WallThickness * 5/2]) {
    difference() {
        union() {
        cube([ButtonSizeX - 0.8, ButtonSizeY - 0.8, WallThickness * 5], center=true);
            translate([0, 0, -WallThickness]) {
                cube([ButtonSizeX + 1, ButtonSizeY + 1, WallThickness ], center=true);
            }
        }

        translate([-ButtonSizeX/3-0.5,-ButtonSizeY/3+0.5,WallThickness * 5/2-1]) {
            linear_extrude(height = 1){
            text("☻", size=5, font="Arial Black");
            }
        }
    }
}

// Number Backspace
translate([20, -20, WallThickness * 5/2]) {
    difference() {
        union() {
        cube([ButtonSizeX - 0.8, ButtonSizeY - 0.8, WallThickness * 5], center=true);
            translate([0, 0, -WallThickness]) {
                cube([ButtonSizeX + 1, ButtonSizeY + 1, WallThickness ], center=true);
            }
        }

        translate([-ButtonSizeX/3-0.5,-ButtonSizeY/3+0.5,WallThickness * 5/2-1]) {
            linear_extrude(height = 1){
            text("◄", size=5, font="Arial Black");
            }
        }
    }
}
*/
