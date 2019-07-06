
PSULength = 48;
PSUWidth = 48;
PSUHeight = 25;
WallThickness = 1.5;
InputHolePositionX = 5;
InputHolePositionZ = 5;
InputHoleSizeX = 6;
InputHoleSizeZ = 2.5;
OutputHolePositionX = 35;
OutputHolePositionZ = 5;
OutputHoleSizeX = 6;
OutputHoleSizeZ = 2;

// Bottom Cover

translate([0,PSULength+WallThickness,0]) {
    cube([PSUWidth-2*WallThickness-0.3, PSULength-2*WallThickness-0.3, WallThickness], center=false);
}

// Shell

difference() {

        difference() {
            cube([PSUWidth, PSULength, PSUHeight], center=false);
                translate([WallThickness, WallThickness, -WallThickness]) {
                    cube([PSUWidth - 2*WallThickness, PSULength -2*WallThickness, PSUHeight
], center=false);
            }
            translate([InputHolePositionX,0,InputHolePositionZ]) {
                cube([InputHoleSizeX, WallThickness, InputHoleSizeZ], center=false);
            }
            translate([OutputHolePositionX,0,OutputHolePositionZ]) {
                cube([OutputHoleSizeX, WallThickness, OutputHoleSizeZ], center=false);
            }
        }

}

translate([PSUWidth-0.2, 8, 18]) {
    rotate([90, 0, 90]) {
        linear_extrude(height = 1/2){
            text("110-220V Input", size=3, font="Arial Black");
        }
    }
}

translate([PSUWidth-0.2, 5, 8]) {
    rotate([90, 0, 90]) {
        linear_extrude(height = 1/2){
            text("4V 1.25A Output", size=3, font="Arial Black");
        }
    }
}
