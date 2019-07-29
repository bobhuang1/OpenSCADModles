
WallThickness = 3;
StrapLength = 80;
StrapWidth = 20;
HoleDiameter = 5.5;
HoleDistance = 60;

difference() {
cube(size=[StrapLength, StrapWidth, WallThickness], center=false);

translate([(StrapLength-HoleDistance)/2, StrapWidth/2, 0])
cylinder(h=WallThickness, d=HoleDiameter, center=false, $fn=30);

translate([(StrapLength-HoleDistance)/2+HoleDistance, StrapWidth/2, 0])
cylinder(h=WallThickness, d=HoleDiameter, center=false, $fn=30);
}
