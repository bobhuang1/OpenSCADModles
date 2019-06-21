WallThickness = 1.5;

BaseWidth = 20;
BaseDepth = 10;

cube(size=[BaseWidth, BaseDepth, WallThickness], center=false);

for ( i = [1 : 5] ){
translate([0, (BaseDepth+0.05)*i, 0])
cube(size=[BaseWidth, BaseDepth, WallThickness], center=false);
}
