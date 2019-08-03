
import("C:/Users/Administrator/Desktop/OpenSCADModles/Shelves/MacMiniMonitorTopMount/Mac_mini1.stl");

TopWidth = 50;
TopLength = 190;
FrontWidth = 20;
WallThickness = 5;
ExistingLength = 160;

translate([0, ExistingLength, -TopWidth])
difference() {
cube([TopLength, WallThickness, TopWidth], center=false);

for (j =[0:2])
{
for (i =[0:11])
{
translate([12+i*(5+10), WallThickness/2, 10+j*(5+10)])
rotate([90, 0, 0])
cylinder(h = WallThickness, r = 5, center = true, $fn=30);
}
}
}


translate([0, ExistingLength-FrontWidth+WallThickness, -TopWidth-WallThickness])
cube([TopLength, FrontWidth, WallThickness], center=false);

translate([0, ExistingLength-FrontWidth+14, 0])
cube([TopLength, 11, WallThickness], center=false);


/*
ShelfLength = 180;
ShelfWidth = 110;
ShelfHeight = 8;
WallThickness = 2;

ColumnSize = 5;
ColumnHeight = 80;
ColumnOffset = 20;
ColumnHoleRadius = 0;

// Main surface
cube([ShelfWidth, ShelfLength, WallThickness], center=false);

// Backwall reenforcement
translate([0, 0, ShelfHeight/2]) {
    rotate([0, 90, 0]) {
        cube([ShelfHeight, ShelfLength, WallThickness], center=false);
    }
}


// Triangle reenforcement
translate([5, 0, -(ColumnHeight-ColumnOffset) + 3]) {
    rotate([0, -atan((ColumnHeight-ColumnOffset)/ShelfWidth),0]) {
        cube([sqrt(ShelfWidth*ShelfWidth + (ColumnHeight-ColumnOffset)*(ColumnHeight-ColumnOffset)) - 15, ColumnSize, ColumnSize], center=false);
    }
}

// Triangle reenforcement
translate([5, ShelfLength-ColumnSize, -(ColumnHeight-ColumnOffset) + 3]) {
    rotate([0, -atan((ColumnHeight-ColumnOffset)/ShelfWidth),0]) {
        cube([sqrt(ShelfWidth*ShelfWidth + (ColumnHeight-ColumnOffset)*(ColumnHeight-ColumnOffset)) - 15, ColumnSize, ColumnSize], center=false);
    }
}

// Surface reenforcement
translate([0, 0, -ColumnSize]) {
    cube([ShelfWidth, ColumnSize, ColumnSize], center=false);
}

// Surface reenforcement
translate([0, ShelfLength-ColumnSize, -ColumnSize]) {
    cube([ShelfWidth, ColumnSize, ColumnSize], center=false);
}

// Backwall vertical reenforcement
difference () {
    translate([0, 0, -ColumnHeight/2 - ColumnOffset]) {
        cube([ColumnSize, ColumnSize, ColumnHeight], center=false);
    }
    
    translate([0, ColumnSize/2, ColumnOffset - ColumnSize]) {
        rotate([0, 90, 0]) {
            cylinder(h = ColumnSize, r = ColumnHoleRadius, center = false);
        }
    }
}

difference () {
    translate([0, ShelfLength - ColumnSize, -ColumnHeight/2 - ColumnOffset]) {
        cube([ColumnSize, ColumnSize, ColumnHeight], center=false);
    }

    translate([0, ShelfLength - ColumnSize/2, ColumnOffset - ColumnSize]) {
        rotate([0, 90, 0]) {
            cylinder(h = ColumnSize, r = ColumnHoleRadius, center = false);
        }
    }
}
*/

/*
translate([PSUWidth-0.2, 8, 18]) {
    rotate([90, 0, 90]) {
        linear_extrude(height = 1/2){
            text("110-220V Input", size=3, font="Arial Black");
        }
    }
}

translate([PSUWidth-0.2, 5, 8]) {
    rotate([90, 0, 90]) {
        linear_extrude(height = 1/2){
            text("4V 1.25A Output", size=3, font="Arial Black");
        }
    }
}
*/
