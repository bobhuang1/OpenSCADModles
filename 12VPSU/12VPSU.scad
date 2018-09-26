
difference() {

        difference() {
            cube([45, 88, 30], center=false);
                translate([1.5, 1.5, -1.5]) {
                    cube([42, 85, 30], center=false);
            }
            translate([5,0,20]) {
                cube([6, 4, 2.5], center=false);
            }
            translate([48,0,20]) {
                cube([6, 4, 2], center=false);
            }
        }

}

translate([0, 90, 0]) {
    cube([41.8, 84.8, 1.5], center=false);
}
