use <text_on.scad>
use <HuangKangWeiBei.TTF>

CakeDiameter = 75;
CakeHeight = 170;

difference() {
cylinder(r=CakeDiameter/2,h=170, center=false,$fn=400);

translate([0, 0, CakeHeight/2-33])
text_on_cylinder(t="邱 再 生",r=CakeDiameter/2-0.8,h=CakeHeight,direction="ttb",size=24,font="DFPWeiBei\\-B5:style=Regular",spacing=1,extrusion_height=5);
}
