
difference() {
    union() {

        translate([-105, -27, -29]) {
        difference() {
            cube([60, 88, 30], center=false);
                translate([1.5, 1.5, -1.5]) {
                    cube([57, 85, 30], center=false);
            }
            translate([5,0,20]) {
                cube([6, 4, 2], center=false);
            }
        }
    }
/*
    scale([0.6,0.6,0.6]) {
        import("C:/Users/asus/Desktop/OpenSCADModles/BridgeLightBase/foot_rev1.stl");
    }
*/
}

    translate([-75, 6, -5]) {
        cube([7, 17, 30], center=false);
    }
}
