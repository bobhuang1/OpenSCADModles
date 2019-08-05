

TopWidth = 50;
Length = 155+3;
FrontWidth = 20;

WallThickness = 4;

ExistingWidth = 51+3;

difference() {
cube([WallThickness+ExistingWidth+WallThickness+TopWidth+WallThickness, Length, Length], center=false);

translate([WallThickness, 0, WallThickness])
cube([ExistingWidth, Length, Length]);


translate([WallThickness+ExistingWidth+WallThickness, 0, 0])
cube([TopWidth, Length, Length-WallThickness]);

}

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
