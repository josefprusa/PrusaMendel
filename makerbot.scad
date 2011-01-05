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


module mbplate1(){
translate([0,0,0]) rotate([0,0,0]) union(){
translate([35,72,0]) rotate([0,0,145]) mirror() vertex(true);
translate([40,120,0]) rotate([0,0,140]) mirror() vertex(false);
translate([8,32,0]) barclamp();//7 to go
translate([8,83,0]) beltclamp();
translate([55,0,0]) beltclamp();
translate([86,12,0]) rotate([0,0,90]) beltclamp();//1 to go
translate([35,72,13]) rotate([0,0,145]) mirror() interface(true);
translate([35,72,13+15]) rotate([0,0,145]) mirror() interface(true);
translate([35,72,13+30]) rotate([0,0,145]) mirror() interface(true);
translate([40,120,13]) rotate([0,0,140]) mirror() interface(false);

}
}

module mbplate2(){
translate([0,0,0]) rotate([0,0,0]) union(){

translate([38,38,0]) rotate([0,0,90]) xcarriage();
translate([38,84,0]) rotate([0,0,0]) coupling();
translate([77,88,0]) rotate([0,0,90]) coupling();
translate([81,85-18,0]) rotate([0,0,180]) rodclamp();
translate([81,58-18,0]) rotate([0,0,180]) rodclamp();
translate([86,0,0]) rotate([0,0,90]) beltclamp();
translate([30,19+3,0]) rotate([0,0,0]) barclamp();
translate([30,36+3,0]) rotate([0,0,0])  barclamp();//5 to go

}
}
module mbplate3(){
translate([0,0,0]) rotate([0,0,0]) union(){
translate([25.5,83-1,0]) rotate([0,0,0])mirror()  endstop();
translate([55.5,98-1,0]) rotate([0,0,180])mirror()  endstop();

translate([42.5,15,0]) rotate([0,0,180]) xendidler();
translate([42,55,30]) rotate([0,90,90]) zmotormount();
translate([47,72.5,30]) rotate([0,90,90]) zmotormount();
}
}
module mbplate4(){
translate([0,0,0]) rotate([0,0,0]) union(){

translate([48,48,0]) xendmotor();
translate([33,19+40,0]) rotate([0,0,0]) barclamp();
translate([33,36+40,0]) rotate([0,0,0])  barclamp();
translate([5,19+27.5,0]) rotate([0,0,0]) barclamp();
translate([5,19+44,0]) rotate([0,0,0]) barclamp();
translate([5,36+43.5,0]) rotate([0,0,0])  barclamp();
}
}
module mbplate5(){
translate([0,0,0]) rotate([0,0,0]) union(){
translate([45,66,0]) rotate([0,0,-33]) pulley();
translate([73,72,0]) rotate([0,0,-25]) pulley();
translate([83.5,25,0]) rotate([0,0,90])mirror()  endstop();

translate([35,52,0]) rotate([0,0,-90]) ybract();
translate([36,16,0.5]) rotate([0,0,0]) import_stl("prusalogo.stl");
}
}
platenum=3;
%cube(size=[85,98,0.01],center=true);
if(platenum==1)
	translate([-43,-49,0]) mbplate1();
if(platenum==2)
	translate([-44,-49,0]) mbplate2();
if(platenum==3)
	translate([-44,-49,0]) mbplate3();
if(platenum==4)
	translate([-45,-49,0]) mbplate4();
if(platenum==5)
	translate([-44,-45,0]) mbplate5();

