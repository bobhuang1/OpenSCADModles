use <text_on.scad>

CakeDiameter = 75;
CakeHeight = 170;

//A normal cylinder
difference() {
cylinder(r=CakeDiameter/2,h=170, center=false,$fn=400);

translate([0, 0, CakeHeight/2-40])
text_on_cylinder(t="邱 再 生",r=CakeDiameter/2-0.8,h=CakeHeight,direction="ttb",size=24,font="MingLiU",spacing=1,extrusion_height=5);
}
