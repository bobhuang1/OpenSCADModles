// Total length (mm)
length = 238; 

// Handle bar width(mm)
width = 15;

// Wall thickness
thickness = 2;

bigcirclediameter = 45;
smallcircleinnterdiameter = 20.3;
smallcirclediameter=20.5+thickness*2;
height = smallcirclediameter;

centercirclediameter = 8.5;
smalldotdiameter = 3.8;
smalldotheight = 3.3;
distance = 13.1;

difference() {
    union() {
    // Big circle
        difference() {
            cylinder(d=bigcirclediameter, h=width, $fn=300);
            translate([0, 0, thickness])
            cylinder(d=bigcirclediameter-2*thickness, h=width-2*thickness);
        }
        
        // Horizontal support inside big circle
        translate([-thickness/2,-bigcirclediameter/2+0.2, 0])
        cube([thickness, bigcirclediameter-0.4, width]);
        
        // Vertical support inside big circle
        translate([-bigcirclediameter/2+0.2, -thickness/2, 0])
        cube([bigcirclediameter-0.4, thickness, width]);
        
        // Center block
        difference() {
            cylinder(d=distance*2+smalldotdiameter+thickness/2, h=width);
            translate([0, 0, thickness])
            cylinder(d=distance*2-smalldotdiameter-thickness/2, h=width-2*thickness);
        }
        
        // Center center block
        cylinder(d=centercirclediameter+2*thickness, h=width);

        // Horizontal support inside the handle bar
        translate([0,-thickness/2+0.1, 0])
        cube([length-smallcirclediameter-bigcirclediameter/2+thickness, thickness, width]);


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
            cube([length-smallcirclediameter/2-bigcirclediameter/2, height-2*thickness, width-2*thickness]);
        
        
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
                cylinder(d=smallcirclediameter, h=width);
                translate([0, 0, thickness])
                cylinder(d=smallcirclediameter-2*thickness, h=width-2*thickness, $fn=200);
            }
        }
    
    }
    // Center hole
    cylinder(d=centercirclediameter, h=width, $fn=200);
}
