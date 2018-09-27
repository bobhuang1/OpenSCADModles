
difference() {

        difference() {
            cube([45, 88, 30], center=false);
                translate([1.5, 1.5, -1.5]) {
                    cube([42, 85, 30], center=false);
            }
            translate([5,0,20]) {
                cube([6, 4, 2.5], center=false);
            }
            translate([35,0,20]) {
                cube([6, 4, 2], center=false);
            }
        }

}

translate([44.8, 14, 18]) {
    rotate([90, 0, 90]) {
        linear_extrude(height = 1/2){
            text("110-220V Input", size=5, font="Arial Black");
        }
    }
}

translate([44.8, 10, 8]) {
    rotate([90, 0, 90]) {
        linear_extrude(height = 1/2){
            text("12V 2A Output PSU", size=5, font="Arial Black");
        }
    }
}


/*

translate([0, 90, 0]) {
    cube([41.8, 84.8, 1.5], center=false);
}
*/