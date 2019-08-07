
$fn = 20;
TopWidth = 83;
Length = 155+3;
FrontWidth = 25;

WallThickness = 4;

ExistingWidth = 51+3;

HoleRadius = 4;
HoleDistance = 7;

difference() {
cube([WallThickness+ExistingWidth+WallThickness+TopWidth+WallThickness, Length, Length], center=false);

translate([WallThickness, 0, WallThickness])
cube([ExistingWidth, Length, Length]);


translate([WallThickness+ExistingWidth+WallThickness, 0, 0])
cube([TopWidth, Length, Length-WallThickness]);


translate([WallThickness+ExistingWidth+WallThickness+TopWidth, 0, 0])
cube([WallThickness, Length, Length-FrontWidth]);

translate([0, 0, Length/2])
cube([WallThickness, Length, Length]);
    
// Holes on back plate
for (i = [0 : 12]) {
for (j = [0 : 5]) {
translate([0, (HoleDistance + HoleRadius) * i + 13, (HoleDistance + HoleRadius) * j + 13])
rotate([0, 90, 0])
cylinder(h = WallThickness, r = HoleRadius, center = false);
}
}

// Holes on middle plate
for (i = [0 : 12]) {
for (j = [0 : 12]) {
translate([WallThickness+ExistingWidth, (HoleDistance + HoleRadius) * i + 13, (HoleDistance + HoleRadius) * j + 13])
rotate([0, 90, 0])
cylinder(h = WallThickness, r = HoleRadius, center = false);
}
}

// Holes on top
for (i = [0 : 6]) {
for (j = [0 : 12]) {
translate([
    (HoleDistance + HoleRadius) * i + 13 +WallThickness+ExistingWidth,
    (HoleDistance + HoleRadius) * j + 13,
    Length]
    )
rotate([0, 180, 0])
cylinder(h = WallThickness, r = HoleRadius, center = false);
}
}

// Holes on bottom
for (i = [0 : 3]) {
for (j = [0 : 12]) {
translate([
    (HoleDistance + HoleRadius) * i + 13,
    (HoleDistance + HoleRadius) * j + 13,
    WallThickness]
    )
rotate([0, 180, 0])
cylinder(h = WallThickness, r = HoleRadius, center = false);
}
}


}

