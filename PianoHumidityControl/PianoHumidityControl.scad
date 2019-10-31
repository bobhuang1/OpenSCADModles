
UnitLength = 140;
UnitWidth = 183;
UnitHeight = 60;
WallThickness = 2;

PowerHolePositionY = 10.3+WallThickness;
PowerHolePositionZ = UnitHeight-WallThickness*7-1+4;
PowerHoleSizeY = 6;
PowerHoleSizeZ = 2.5;

LCD1602SizeX=49;
LCD1602SizeY=82;
LCD1602PositionX=UnitWidth-LCD1602SizeX-22;
LCD1602PositionY=UnitLength-LCD1602SizeY-28;

OutletSizeX = 73;
OutletSizeY = 73;
OutletPositionX = 14;
OutletPositionY = UnitLength-OutletSizeY-14;;


// Bottom Cover
/*
translate([0,UnitLength+WallThickness,0]) {
    cube([UnitWidth-2*WallThickness-0.4, UnitLength-2*WallThickness-0.4, WallThickness], center=false);
}
*/

// Shell

difference() {

        difference() {
            cube([UnitWidth, UnitLength, UnitHeight], center=false);
                translate([WallThickness, WallThickness, -WallThickness]) {
                    cube([UnitWidth - 2*WallThickness, UnitLength -2*WallThickness, UnitHeight
], center=false);
            }

            translate([LCD1602PositionX,LCD1602PositionY,UnitHeight-WallThickness]) {

                cube([LCD1602SizeX, LCD1602SizeY, WallThickness], center=false);
            }

            translate([OutletPositionX,OutletPositionY,UnitHeight-WallThickness]) {

                cube([OutletSizeX, OutletSizeY, WallThickness], center=false);
            }
rotate([0,0,90]) {
            translate([0,-PowerHolePositionY,PowerHolePositionZ]) {
                cube([WallThickness, PowerHoleSizeY, PowerHoleSizeZ], center=false);
            }
       }

translate([115, WallThickness, 40])
rotate([90, 0, 0])
cylinder(h=WallThickness, r=4, center=false, $fn=60);

}       
}


translate([UnitWidth-0.2, 20, 35]) {
    rotate([90, 0, 90]) {
        linear_extrude(height = 1/2){
            text("PianoHumidity Control", size=6, font="Arial Black");
        }
    }
}

translate([UnitWidth-0.2, 24, 15]) {
    rotate([90, 0, 90]) {
        linear_extrude(height = 1/2){
            text("220V 3A Output Max", size=6, font="Arial Black");
        }
    }
}

