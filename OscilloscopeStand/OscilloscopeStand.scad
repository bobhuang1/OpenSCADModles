// (mm)
length = 238;

// (mm)
width = 20; // [20:100]

// of the top hexagonal surface
thickness = 3;   // [2:7]


bigcirclediameter = 45;
smallcircleinnterdiameter = 20.5;
smallcirclediameter=20.5+thickness*4;
height = smallcirclediameter;

centercirclediameter = 9.5;
smalldotdiameter = 3.8;
distance = 13.5;

difference() {
    cylinder(d=bigcirclediameter, h=width);
    translate([0, 0, thickness])
    cylinder(d=bigcirclediameter-2*thickness, h=width-thickness);
}

cylinder(d=distance+smalldotdiameter, h=width);


translate([0, 0, width-0.1])
cylinder(d=centercirclediameter, h=8);

translate([distance, 0, width-0.1])
cylinder(d=smalldotdiameter, h=4);

translate([distance, 0, 0])
cylinder(d=6, h=width);

translate([distance-3, 0, 0])
cylinder(d=6, h=width);
translate([distance+3, 0, 0])
cylinder(d=6, h=width);


translate([0,-thickness/2+0.1, 0])
cube([length-smallcirclediameter-bigcirclediameter/2+thickness, thickness, width]);

for ( i = [0 : 7] ){
        translate([30+i*20,-height/2, 0])
        cube([thickness, height, width]);
    }

translate([length-smallcirclediameter/2-bigcirclediameter/2, 0, 0])
{
    difference() {
        cylinder(d=smallcirclediameter, h=width);
        translate([0, 0, thickness])
        cylinder(d=smallcirclediameter-2*thickness, h=width);
    }
}


difference() {
    translate([0,-height/2, 0])
    cube([length-smallcirclediameter/2-bigcirclediameter/2, height, width]);

    translate([0,-height/2+thickness, thickness])
    cube([length-smallcirclediameter/2-bigcirclediameter/2, height-2*thickness, width]);

    translate([0, 0, thickness])
    cylinder(d=bigcirclediameter-2*thickness, h=width-thickness);
    
}

translate([0,-bigcirclediameter/2, 0])
cube([thickness, bigcirclediameter, width]);

translate([-bigcirclediameter/2, 0, 0])
cube([bigcirclediameter, thickness, width]);

