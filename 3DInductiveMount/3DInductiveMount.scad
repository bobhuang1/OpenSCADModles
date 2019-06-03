// (mm)
length = 40;
// (mm)
width = 22;
// (mm)
height = 7.5;
thickness = 3;
sensorholediameter = 18.5;
screwholediameter = 3.4;
screwholedistance = 32;

baseplatetofanoffset = 2.5;
fanbaselength=40;

difference() {
union() {
// Base
difference() {
    union() {
        // Main structure
        cube([length, width, height]);
    }
        // Sensor hole
        translate([length/2,width/2, 0])
        cylinder(d=sensorholediameter, h=height, $fn=200);
        
        // Screw hole 1
        translate([length/2-screwholedistance/2, 0, height/2])
        rotate([0, 90, 90])
        cylinder(d=screwholediameter, h=width, $fn=40);
        
        // Screw hole 2
        translate([length/2+screwholedistance/2, 0, height/2])
        rotate([0, 90, 90])
        cylinder(d=screwholediameter, h=width, $fn=40);
}

// Connector between base and fanbase
translate([length-1, 0, 0])
cube([baseplatetofanoffset*2, width, height]);

difference() {
  union() {
    difference() {
        
    translate([length+baseplatetofanoffset, 0, 0])
    cube([height*2, fanbaselength, fanbaselength]);
    translate([length+baseplatetofanoffset, thickness, height/2+thickness])
    cube([height*2, fanbaselength-thickness*2, fanbaselength-height-thickness]);

    translate([length+baseplatetofanoffset+height, thickness, thickness])
    cube([height, fanbaselength-thickness*2, fanbaselength-thickness*2]);
    }        
    // fan mounting bases
    translate([length+baseplatetofanoffset, 36, 4])
    rotate([0, 90, 0])
    cylinder(d=8, h=height*2, $fn=10);
    translate([length+baseplatetofanoffset, 4, 4])
    rotate([0, 90, 0])
    cylinder(d=8, h=height*2, $fn=10);
    translate([length+baseplatetofanoffset, 4, 36])
    rotate([0, 90, 0])
    cylinder(d=8, h=height*2, $fn=10);
    translate([length+baseplatetofanoffset, 36, 36])
    rotate([0, 90, 0])
    cylinder(d=8, h=height*2, $fn=10);
  }    

    // fan mounting holes
    translate([length+baseplatetofanoffset, 4, 4])
    rotate([0, 90, 0])
    cylinder(d=2, h=height*2, $fn=10);
    translate([length+baseplatetofanoffset, 36, 4])
    rotate([0, 90, 0])
    cylinder(d=screwholediameter, h=height*2, $fn=10);
    translate([length+baseplatetofanoffset, 4, 36])
    rotate([0, 90, 0])
    cylinder(d=screwholediameter, h=height*2, $fn=10);
    translate([length+baseplatetofanoffset, 36, 36])
    rotate([0, 90, 0])
    cylinder(d=screwholediameter, h=height*2, $fn=10);
    
    // opening for output cooling
    translate([length+baseplatetofanoffset+baseplatetofanoffset, thickness*2.5, 0])
    cube([height*2-thickness*2, fanbaselength-thickness*5, height]);
}

difference() {
    translate([length+baseplatetofanoffset+baseplatetofanoffset, 1.8, 0])
    rotate([0, 0, 125])
    cube([30, thickness, fanbaselength]);
    translate([length-20+baseplatetofanoffset, width, 0])
    cube([20, 20, fanbaselength]);
}

// top cover
translate([0, 0, fanbaselength-thickness])
linear_extrude(height = thickness, center = false, convexity = 10, twist = 0)
polygon(points=[[length+baseplatetofanoffset+1,0],[28,width],[length+baseplatetofanoffset+1,width]], paths=[[0,1,2]]);



translate([42.5, 5, 0.1])
rotate([90, 0, 180])
difference() {
    rotate_extrude(angle = 45, center = true, convexity = 10, $fn=200)
    rotate([0, 0, 90])
    polygon(points=[[0, 0], 
    [0, height*2-thickness*2+thickness*2],
    [fanbaselength-thickness*5+thickness*2, height*2-thickness*2+thickness*2],
    [fanbaselength-thickness*5+thickness*2, 0]
    ], paths=[[0, 1, 2, 3]]);
    
    translate([-thickness/2, 0, thickness/2])
    rotate_extrude(angle = 90, center = true, convexity = 10, $fn=200)
    rotate([0, 0, 90])
    polygon(points=[[0, 0], 
    [0, height*2-thickness*2+thickness],
    [fanbaselength-thickness*5+thickness, height*2-thickness*2+thickness],
    [fanbaselength-thickness*5+thickness, 0]
    ], paths=[[0, 1, 2, 3]]);
}


nozzlelength = 40;
nozzlewitdth = 31;
nozzleheight = 15;

translate([25, 5, -38.6])
rotate([0, -45, 0])
difference() {
    cube([nozzlelength, nozzlewitdth, nozzleheight]);
    translate([0, thickness, thickness])
    cube([nozzlelength, nozzlewitdth-thickness*2, nozzleheight-thickness*2]);
    
}
}

translate([0, 2, -60])
rotate([0, -20, 0])
cube([40, 40, 40]);
}