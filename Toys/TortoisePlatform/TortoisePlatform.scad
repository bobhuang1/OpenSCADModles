module drawCircleSub(x, y) {
translate([0, x, y])
    rotate([0, 90, 0])
    cylinder(h=WallThickness, d=EmptyCircleDiameter, center=false, $fn=EmptyCircleFN);
}

module drawCircles(xlimit, ylimit) {
    xSizeLimit = round(xlimit/(EmptyCircleDiameter+EmptyCircleSpacing))+1;
    ySizeLimit = round(ylimit/(EmptyCircleDiameter+EmptyCircleSpacing))+1;
    for ( i = [0 : xSizeLimit] ){
        for ( j = [0 : xSizeLimit] ){
            x = i*(EmptyCircleDiameter+EmptyCircleSpacing);
            y = j*(EmptyCircleDiameter+EmptyCircleSpacing);

        if (x < xlimit-EmptyCircleDiameter/2 && y < ylimit-EmptyCircleDiameter/2 && x > EmptyCircleDiameter/2 && y > EmptyCircleDiameter/2)
        {            
            drawCircleSub(x, y);            
        }
        }
    }
}


WallThickness = 3;
StandHeight = 50;
RampLength = 70;
PlatformLength = 70;
EmptyCircleDiameter = 5;
EmptyCircleSpacing = 2;
EmptyCircleFN = 30;
RampDegree = 30;
RampDivider = 10;

UndersideWidth = 15;

cube(size=[PlatformLength, PlatformLength, WallThickness], center=false);

rotate([0, -RampDegree, 0])
translate([-RampLength+WallThickness/3, 0, -0.5])
union() {
cube(size=[RampLength, RampLength, WallThickness], center=false);
for ( i = [0 : RampDivider-1] ){
    if (i % 2) {
        translate([(RampLength/RampDivider)*i, 0, WallThickness/2])
        cube(size=[RampLength/RampDivider, RampLength, WallThickness], center=false);
    }
}
}

translate([-RampLength*cos(RampDegree), 0, -RampLength*sin(RampDegree)-StandHeight])
difference() {
    cube(size=[WallThickness, PlatformLength, StandHeight+WallThickness], center=false);
    drawCircles(PlatformLength, StandHeight+WallThickness);
}


translate([PlatformLength-WallThickness, 0, -RampLength*sin(RampDegree)-StandHeight])

difference() {
    cube(size=[WallThickness, PlatformLength, StandHeight+RampLength*sin(RampDegree)], center=false);
    drawCircles(PlatformLength, StandHeight+RampLength*sin(RampDegree));
}

translate([PlatformLength-UndersideWidth, 0, -RampLength*sin(RampDegree)-StandHeight])
cube(size=[UndersideWidth, PlatformLength, WallThickness], center=false);

translate([-RampLength*cos(RampDegree), 0, -RampLength*sin(RampDegree)-StandHeight])
cube(size=[UndersideWidth, PlatformLength, WallThickness], center=false);
