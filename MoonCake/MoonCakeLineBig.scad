
CakeHeight = 170;

BoundaryWidth = 1.5;
BoundaryHeight = 1.75;

Arc1ToEdge = 15;

rotate([0, -90, 0])
cube(size=[BoundaryHeight, BoundaryWidth, CakeHeight-Arc1ToEdge*2], center=false);

translate([0, 6, 0])
rotate([0, -90, 0])
cube(size=[BoundaryHeight, BoundaryWidth, CakeHeight-Arc1ToEdge*2], center=false);



