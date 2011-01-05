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
use <ybrac-t.scad>
use <wade.scad>
use <wadebits.scad>
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
module bcinterface(){
translate([12,10,0])union(){
translate([-12,-10,2]) barclamp();
intersection(){
translate([-12,-10,0]) barclamp();
grid(6,30);
}
}
}

*translate([0,0,15])bcinterface();
translate([1,-2.5,0]) rotate([0,0,-90]) union(){
translate([39,43,0]) xcarriage();
translate([39,128-4,0]) xendmotor();
translate([19,162-4,0]) rotate(90,0,0) xendidler();
translate([86,107,30]) rotate([0,90,180]) zmotormount();
translate([103,78.5,30]) rotate([0,90,0]) zmotormount();
translate([87+0.5,35+8,0]) rotate([0,0,90]) coupling();
translate([102,28.3,0]) rotate([0,0,0]) coupling();
translate([141.5,69,0]) rotate([0,0,-88]) mirror()ybract();
translate([120,19,0]) rotate([0,0,0]) pulley();
translate([157.5,165,0]) rotate([0,0,0]) pulley();
translate([25,19+2.5,0]) rotate([0,0,0]) barclamp();
translate([25,19+2.5,15]) rotate([0,0,0]) bcinterface();
translate([25,36+2.5,0]) rotate([0,0,0])  barclamp();
translate([25,36+2.5,15]) rotate([0,0,0])  bcinterface();
translate([68.5,191,0]) rotate([0,0,180]) endstop();
translate([72.5,171,0]) rotate([0,0,0]) endstop();
translate([102,2,0]) rotate([0,0,0]) mirror() endstop();
translate([191,196.5,0]) rotate([0,0,180])  wadeblock();
translate([162.5,33,0])WadesL();
translate([142,97,0])WadesS();
translate([181,155,0])rotate([0,0,90])wadeidler();
translate([107,145,0]) rotate([0,0,90])  barclamp();
translate([90,145,0]) rotate([0,0,90])  barclamp();
translate([107,145,15]) rotate([0,0,90])  bcinterface();
translate([90,145,15]) rotate([0,0,90])  bcinterface();
translate([132,55,0]) rotate([90,0,40])  beltclamp();
translate([26,102.5,0]) rotate([90,0,0])  beltclamp();
translate([50,7,0]) rotate([90,0,0])  beltclamp();
translate([22,7,0]) rotate([90,0,0])  beltclamp();
translate([187,74,0]) rotate([0,0,0]) rodclamp();
translate([187,124,0]) rotate([0,0,12]) rodclamp();
translate([114,87])rotate([0,0,-88])mirror(){
vertex(true);
translate(){translate([0,0,13]) interface(true);
translate([0,0,13+15]) interface(true);
translate([0,0,13+30]) interface(true);
translate([0,0,13+45]) interface(false);
translate([0,0,13+60]) interface(false);
}
}
translate([25,183,14.5]) rotate([0,0,90]) import_stl("prusalogo.stl");
//%translate([100,10,35]) cube([200,20,10],center=true);
//%translate([100,190,35]) cube([200,20,10],center=true);
}
%translate([100,-100,0]) cube(size=[195,193,0.01],center=true);
