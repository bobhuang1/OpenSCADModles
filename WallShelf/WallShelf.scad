
ShelfLength = 190;
ShelfWidth = 100;
ShelfHeight = 8;
WallThickness = 1.5;

ColumnSize = 5;
ColumnHeight = 80;
ColumnOffset = 20;
ColumnHoleRadius = 1.5;

cube([ShelfWidth, ShelfLength, WallThickness], center=false);

translate([0, 0, ShelfHeight/2]) {
    rotate([0, 90, 0]) {
        cube([ShelfHeight, ShelfLength, WallThickness], center=false);
    }
}

translate([ShelfWidth, 0, 0-ColumnSize]) {
    cube([WallThickness, ShelfLength, ColumnSize + WallThickness], center=false);
}

translate([5, 0, -(ColumnHeight-ColumnOffset) + 3]) {
    rotate([0, -atan((ColumnHeight-ColumnOffset)/ShelfWidth),0]) {
        cube([sqrt(ShelfWidth*ShelfWidth + (ColumnHeight-ColumnOffset)*(ColumnHeight-ColumnOffset)) - 15, ColumnSize, ColumnSize], center=false);
    }
}

translate([5, ShelfLength-ColumnSize, -(ColumnHeight-ColumnOffset) + 3]) {
    rotate([0, -atan((ColumnHeight-ColumnOffset)/ShelfWidth),0]) {
        cube([sqrt(ShelfWidth*ShelfWidth + (ColumnHeight-ColumnOffset)*(ColumnHeight-ColumnOffset)) - 15, ColumnSize, ColumnSize], center=false);
    }
}

translate([0, 0, -ColumnSize]) {
    cube([ShelfWidth, ColumnSize, ColumnSize], center=false);
}

translate([0, ShelfLength-ColumnSize, -ColumnSize]) {
    cube([ShelfWidth, ColumnSize, ColumnSize], center=false);
}

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
