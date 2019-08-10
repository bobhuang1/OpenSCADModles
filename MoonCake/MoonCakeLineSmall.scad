
CakeHeight = 170;

BoundaryWidth = 0.5;
BoundaryHeight = 0.5;

Arc1ToEdge = 15;

rotate([0, -90, 0])
cube(size=[BoundaryHeight, BoundaryWidth, CakeHeight-Arc1ToEdge*2], center=false);

translate([0, 4, 0])
rotate([0, -90, 0])
cube(size=[BoundaryHeight, BoundaryWidth, CakeHeight-Arc1ToEdge*2], center=false);



