// preview[tilt:top]

// (mm)
length = 200;

// (mm)
width = 120; // [20:100]

// (mm)
height = 15;

// of the top hexagonal surface
thickness = 2;   // [2:7]

inner_walls = 3; // [3:7]
outer_walls = 3; // [3:7]
cell_size = 15;  // [5:35]
seed = 1;
frequency = 0;  // [0:99]

/* [Hidden] */
hole_size = 6.5;

module honeycomb(rows, columns, cell_size, inner_walls, height) {
    missing = rands(0,100,rows*columns, seed);
    
    for (i = [0 : rows - 1]) {
        translate([(i % 2) * cell_size / 2, cell_size * i * sqrt(3) / 2, -height/2])
        linear_extrude(height=height) {
            for (j = [0 : columns - 1]) {
                if (missing[i*j] > frequency)
                    translate([j * cell_size, 0, 0]) rotate([0,0,30])
                    circle(r=(cell_size - inner_walls)/sqrt(3),$fn=6);
            }
        }
    }
}

difference() {
    cube([length, width, 15]);
    
    translate([outer_walls, outer_walls, thickness])
    cube([length - 2 * outer_walls, width - 2 * outer_walls, height - thickness]);

    // holes

    translate([0, outer_walls + hole_size/2 + 3, thickness + (height - thickness) / 2])
    rotate([0,90,0])
    cylinder(d=hole_size, h=length);

    translate([0, width - (outer_walls + hole_size/2 + 3), thickness + (height - thickness) / 2])
    rotate([0,90,0])
    cylinder(d=hole_size, h=length);
    
    // back
    polyhedron(
        [[outer_walls + 5,           0,            height / 2],
         [length - outer_walls - 5,  0,            height / 2],
         [length - outer_walls - 5,  outer_walls,  height / 2],
         [outer_walls + 5,           outer_walls,  height / 2],
         [outer_walls,               0,            height],
         [length - outer_walls,      0,            height],
         [length - outer_walls,      outer_walls,  height],
         [outer_walls,               outer_walls,  height]]
        ,
        [[0,1,2,3],  // bottom
         [4,5,1,0],  // front
         [7,6,5,4],  // top
         [5,6,2,1],  // right
         [6,7,3,2],  // back
         [7,4,0,3]]  // left
    );
    
    // front
    polyhedron(
        [[outer_walls + 3,           width - outer_walls,  3 * height / 4],
         [length - outer_walls - 3,  width - outer_walls,  3 * height / 4],
         [length - outer_walls - 3,  width,                3 * height / 4],
         [outer_walls + 3,           width,                3 * height / 4],
         [outer_walls,               width - outer_walls,  height],
         [length - outer_walls,      width - outer_walls,  height],
         [length - outer_walls,      width,                height],
         [outer_walls,               width,                height]]
        ,
        [[0,1,2,3],  // bottom
         [4,5,1,0],  // front
         [7,6,5,4],  // top
         [5,6,2,1],  // right
         [6,7,3,2],  // back
         [7,4,0,3]]  // left
    );
    
    // side

    polyhedron(
        [[0,                outer_walls + hole_size + 10,  thickness],
         [outer_walls,      outer_walls + hole_size + 10,  thickness],
         [outer_walls,      width - outer_walls - 10 - hole_size,           thickness],
         [0,                width - outer_walls - 10 - hole_size,           thickness],
         [0,                outer_walls + hole_size + 4,   height],
         [outer_walls,      outer_walls + hole_size + 4,   height],
         [outer_walls,      width - outer_walls - 10,           height],
         [0,                width - outer_walls - 10,           height]]
        ,
        [[0,1,2,3],  // bottom
         [4,5,1,0],  // front
         [7,6,5,4],  // top
         [5,6,2,1],  // right
         [6,7,3,2],  // back
         [7,4,0,3]]  // left
    );
    
    // side
    polyhedron(
        [[length - outer_walls,      outer_walls + hole_size + 10,  thickness],
         [length,               outer_walls + hole_size + 10,  thickness],
         [length,               width - outer_walls - 10 - hole_size,           thickness],
         [length - outer_walls,      width - outer_walls - 10 - hole_size,      thickness],
         [length - outer_walls,      outer_walls + hole_size + 4,   height],
         [length,               outer_walls + hole_size + 4,   height],
         [length,               width - outer_walls - hole_size-outer_walls,           height],
         [length - outer_walls,      width - outer_walls - hole_size- outer_walls,           height]]
        ,
        [[0,1,2,3],  // bottom
         [4,5,1,0],  // front
         [7,6,5,4],  // top
         [5,6,2,1],  // right
         [6,7,3,2],  // back
         [7,4,0,3]]  // left
    );

    translate([outer_walls, outer_walls, 0])
    intersection() {
        cube([length - 2 * outer_walls, width - 2 * outer_walls, thickness]);
        
        rows = ceil((width - 2 * outer_walls) / (cell_size * sqrt(3) / 2) + 1);
        columns =  ceil((length - 2 * outer_walls) / cell_size + 1);
        
        echo(rows);
        echo(columns);
        
        honeycomb(rows, columns, cell_size, inner_walls, 3 * thickness);
    }
}
