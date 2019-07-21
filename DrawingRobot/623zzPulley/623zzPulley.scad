
InternalDiameter = 10.2;
ExternalDiameter = 12.7;
RimDiameter = 16;
RimHeight = 1.5;
CompleteHeight = 9.2;
RingsLimit = 20;
CylinderLimit = 200;

difference() {
    union() {
    cylinder(h=CompleteHeight, d=ExternalDiameter, center=false, $fn=CylinderLimit);

    // Rings on bottom
    for ( i = [0 : RingsLimit-1] ) {
        translate([0, 0, RimHeight/RingsLimit*i])
        cylinder(h=RimHeight/RingsLimit, d=ExternalDiameter+(RimDiameter-   ExternalDiameter)/RingsLimit*(RingsLimit-i), center=false, $fn=CylinderLimit);
        }
    
    // Rings on top
    for ( i = [0 : RingsLimit-1] ) {
        translate([0, 0, CompleteHeight-RimHeight/RingsLimit*(i+1)])
        cylinder(h=RimHeight/RingsLimit, d=ExternalDiameter+(RimDiameter-ExternalDiameter)/RingsLimit*(RingsLimit-i), center=false, $fn=CylinderLimit);
        }
    }
    cylinder(h=CompleteHeight, d=InternalDiameter, center=false, $fn=CylinderLimit);
}
