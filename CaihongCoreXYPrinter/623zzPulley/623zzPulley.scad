
InternalDiameter = 10.2;
ExternalDiameter = 12.7;
RimDiameter = 15.7;
RimHeight = 1;
CompleteHeight = 8.2;

difference() {
    union() {
    cylinder(h=RimHeight, d=RimDiameter, center=false, $fn=200);
    cylinder(h=CompleteHeight, d=ExternalDiameter, center=false, $fn=200);
    translate([0, 0, CompleteHeight-RimHeight])
    cylinder(h=RimHeight, d=RimDiameter, center=false, $fn=200);
    }
    cylinder(h=CompleteHeight, d=InternalDiameter, center=false, $fn=200);
}
