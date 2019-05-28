// (mm)
length = 50;

// (mm)
width = 45;

// (mm)
height = 7.5;

thickness = 1.75;

sensorholediameter = 18.5;
sensorholeoffsetY = 7;

screwholediameter = 3.1;

screwholedistance = 30;

difference() {
    union() {
        // Main structure
        difference() {
            cube([length, width, height]);
            translate([3*thickness, 0, thickness])
            cube([length-6*thickness, width-2*thickness, height-thickness]);
        }
        // Cross reenforcement
        translate([0, width/2-3*thickness, 0])
        cube([length, thickness*3, thickness*3]);
        translate([length/2-thickness*3/2, 0, 0])
        cube([thickness*3, width, thickness*3]);
        
        // Sensor outer ring reenforcement
        translate([length/2,sensorholediameter/2+sensorholeoffsetY, 0])
        cylinder(d=sensorholediameter+6*thickness, h=thickness*3, $fn=200);
        }
        // Sensor hole
        translate([length/2,sensorholediameter/2+sensorholeoffsetY, 0])
        cylinder(d=sensorholediameter, h=thickness*3, $fn=200);
        // Screw hole 1
        translate([length/2-screwholedistance/2, width-2*thickness, height-2.8])
        rotate([0, 90, 90])
        cylinder(d=screwholediameter, h=2*thickness, $fn=40);
        // Screw hole 2
        translate([length/2+screwholedistance/2, width-2*thickness, height-2.8])
        rotate([0, 90, 90])
        cylinder(d=screwholediameter, h=2*thickness, $fn=40);
}
