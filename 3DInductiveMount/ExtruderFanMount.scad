
height = 6;
thickness = 5;
screwholediameter = 3.4;
screwholedistance = 32;
fanbaselength=40;

difference() {
union() {
translate([103, -2.6, -149.75])
rotate([0, 90, 90])
import("C:/Users/Administrator/Desktop/Arduino/OpenSCADModles/3DInductiveMount/Suporte_Com_Chanfro_18mm.stl");

translate([-13, 0, 0])
    cube([15, fanbaselength, thickness]);

difference() {
    union() {

        difference() {
        cube([height, fanbaselength, fanbaselength]);
        translate([0, thickness, thickness])
        cube([height, fanbaselength-thickness*2, fanbaselength-thickness*2]);
        }
        
        // fan mounting bases
        translate([0, 36, 4])
        rotate([0, 90, 0])
        cylinder(d=8, h=height, $fn=10);
        
        translate([0, 4, 4])
        rotate([0, 90, 0])
        cylinder(d=8, h=height, $fn=10);
    
        translate([0, 4, 36])
        rotate([0, 90, 0])
        cylinder(d=8, h=height, $fn=10);
    
        translate([0, 36, 36])
        rotate([0, 90, 0])
        cylinder(d=8, h=height, $fn=10);
    }
    
    union() {
    // fan mounting holes
    translate([0, 4, 4])
    rotate([0, 90, 0])
    cylinder(d=screwholediameter, h=height, $fn=10);
    translate([0, 4, 36])
    rotate([0, 90, 0])
    cylinder(d=screwholediameter, h=height, $fn=10);

    translate([0, 36, 4])
    rotate([0, 90, 0])
    cylinder(d=screwholediameter, h=height, $fn=10);
    translate([0, 36, 36])
    rotate([0, 90, 0])
    cylinder(d=screwholediameter, h=height, $fn=10);
    }
}
}

translate([height, 0, 0])
        cube([30, fanbaselength, fanbaselength]);

}
