include <configuration.scad>
use <bar-clamp.scad>
use <belt-clamp.scad>
use <coupling.scad>
use <frame-vertex.scad>
use <pulley.scad>
use <rod-clamp.scad>
use <x-carriage.scad>
use <x-end-idler.scad>
use <x-end-motor.scad>
use <ybrac.scad>
use <z-motor-mount.scad>
use <endstop-holder.scad>

module grid(x,y){
union(){
for(i = [0:x]){
	translate([2*i,0,0.5]) cube([0.75,y,1],center=true);
	translate([-2*i,0,0.5]) cube([0.75,y,1],center=true);
	translate([0,3.5*i,1.5]) cube([y,0.75,1],center=true);
	translate([0,-3.5*i,1.5]) cube([y,0.75,1],center=true);
}
}
}
module interface(x){
translate([30,25,0])union(){
translate([-30,-25,2]) vertex(x);
intersection(){
translate([-30,-25,0]) vertex(x);
grid(16,100);
}
}
}
translate([0,0,0]) rotate([0,0,-90]) union(){
translate([39,43,0]) xcarriage();
translate([39,128-4,0]) xendmotor();
translate([19,162-4,0]) rotate(90,0,0) xendidler();
translate([87,110,30]) rotate([0,90,180]) zmotormount();
translate([105,75,30]) rotate([0,90,0]) zmotormount();
translate([87+2.5,35+8,0]) rotate([0,0,90]) coupling();
translate([138.7,147,0]) rotate([0,0,90]) coupling();
translate([146,138,0]) rotate([0,0,-90]) ybrac();
translate([146,114,0]) rotate([0,0,0]) pulley();
translate([124,88,0]) rotate([0,0,0]) pulley();
translate([27,19+8,0]) rotate([0,0,0]) barclamp();
translate([27,36+8,0]) rotate([0,0,0])  barclamp();
translate([70,193,0]) rotate([0,0,180]) endstop();
translate([97,180,0]) rotate([0,0,0]) endstop();
translate([118,26.5,0]) rotate([0,0,90]) mirror() endstop();

translate([152,180,0]) rotate([0,0,0])  barclamp();
translate([114,142,0]) rotate([0,0,90])  barclamp();
translate([114,114,0]) rotate([0,0,90])  barclamp();
translate([193,170,0]) rotate([0,0,90])  barclamp();
translate([163.5,179,0]) rotate([0,0,-90])  barclamp();
translate([186,142,0]) rotate([0,0,-90])  beltclamp();
translate([170,5,0]) rotate([0,0,0])  beltclamp();
translate([195,143,0]) rotate([0,0,90])  barclamp();
translate([90,6,5]) rotate([0,90,90]) rodclamp();
translate([150,167,5]) rotate([0,90,90]) rodclamp();
translate([86,152,0]) rotate([0,0,90]) beltclamp();
translate([98,152,0]) rotate([0,0,90]) beltclamp();
translate([150,117.5,0]) rotate([0,0,145]) mirror() vertex(true);
translate([160,80,0]) rotate([0,0,140]) mirror() vertex(false);
translate([150,117.5,13]) rotate([0,0,145]) mirror() interface(true);
translate([150,117.5,13+15]) rotate([0,0,145]) mirror() interface(true);
translate([150,117.5,13+30]) rotate([0,0,145]) mirror() interface(true);
translate([160,80,13]) rotate([0,0,140]) mirror() interface(false);
translate([137,187,0.5]) rotate([0,0,90]) import_stl("prusalogo.stl");
//%translate([100,10,35]) cube([200,20,10],center=true);
//%translate([100,190,35]) cube([200,20,10],center=true);
}
//#translate([100,-100,0]) cube(size=[200,200,0.01],center=true);
