// Total length (mm)
length = 238; 

// Handle bar width(mm)
width = 20;

// Wall thickness
thickness = 3;

bigcirclediameter = 45;
smallcircleinnterdiameter = 20.3;
smallcirclediameter=20.5+thickness*4;
height = smallcirclediameter;

centercirclediameter = 8.5;
smalldotdiameter = 3.8;
smalldotheight = 3.4;
distance = 13.1;

difference() {
    union() {
    // Big circle
        difference() {
            cylinder(d=bigcirclediameter, h=width, $fn=300);
            translate([0, 0, thickness])
            cylinder(d=bigcirclediameter-2*thickness, h=width-thickness, $fn=300);
        }
        
        // Horizontal support inside big circle
        translate([-thickness/2,-bigcirclediameter/2+0.2, 0])
        cube([thickness, bigcirclediameter-0.4, width]);
        
        // Vertical support inside big circle
        translate([-bigcirclediameter/2+0.2, -thickness/2, 0])
        cube([bigcirclediameter-0.4, thickness, width]);
        
        // Center block
        difference() {
            cylinder(d=distance*2+smalldotdiameter+thickness/2, h=width, $fn=300);
            cylinder(d=distance*2-smalldotdiameter-thickness/2, h=width, $fn=300);
        }
        
        // Center center block
        cylinder(d=centercirclediameter+thickness, h=width, $fn=300);
        // Horizontal support inside the handle bar
        
        translate([0,-thickness/2+0.1, 0])
        cube([length-smallcirclediameter-bigcirclediameter/2+thickness, thickness, width]);

    }
    // Center hole
    cylinder(d=centercirclediameter-thickness, h=width, $fn=200);
}

// Small dots
for ( j = [0 : 11] ){
    rotate([0, 0, j*30]) {
        translate([distance, 0, width-0.1])
        cylinder(d=smalldotdiameter, h=smalldotheight, $fn=100);
    }
}

// Long handle bar
difference() {
    translate([0,-height/2, 0])
    cube([length-smallcirclediameter/2-bigcirclediameter/2, height, width]);

    translate([0,-height/2+thickness, thickness])
    cube([length-smallcirclediameter/2-bigcirclediameter/2, height-2*thickness, width]);

    translate([0, 0, thickness])
    cylinder(d=bigcirclediameter-2*thickness, h=width-thickness, $fn=300);
}

// Vertical support inside the handle bar
for ( i = [0 : 7] ){
        translate([30+i*20,-height/2, 0])
        cube([thickness, height, width]);
    }


// Small circle
translate([length-smallcirclediameter/2-bigcirclediameter/2, 0, 0])
{
    difference() {
        cylinder(d=smallcirclediameter, h=width, $fn=250);
        translate([0, 0, thickness])
        cylinder(d=smallcirclediameter-2*thickness, h=width, $fn=200);
    }
}
