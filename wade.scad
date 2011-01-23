include<configuration.scad>
devx=2;

module b608(h=8){
difference(){
union(){
translate([0,0,3.45]) cylinder(r=11.01,h=h,center=true,$fn=60);
translate([0,0,3.5]) cylinder(r=6,h=7,center=true,$fn=30);
}
//translate([0,0,3.5]) cylinder(r=4,h=8,center=true,$fn=30);
}
}
module wadeblock(bfb=false){
difference(){
union(){
cube([81,51.5,5]);
cube([109,6,28]);
translate([57,0,0])cube([24,51.5,28]);
translate([80,1,0])cube([10,10,28]);
}
translate([90,5,0]) rotate([0,0,45])cube([10,10,28]);

translate([-21,0,30]) rotate([0,45,0])cube([30,7.5,30]);
translate([95,0,28]) rotate([0,45,0])cube([20,7.5,20]);
translate([95,0,0]) rotate([0,45,0])cube([20,7.5,20]);
translate([106,0,4]) rotate([0,0,0])cube([20,7.5,20]);
translate([75,20,15]) rotate([90,0,0]) cylinder(h = 70, r=4/2, center=true);
translate([75-25,2,15]) rotate([90,0,0]) cylinder(h = 10, r=m4_diameter/2, center=true);
translate([75-25,5,15]) rotate([90,0,0]) cylinder(h = 2, r=m4_nut_diameter/2, center=true, $fn=6);
translate([75+25,2,15]) rotate([90,0,0]) cylinder(h = 10, r=m4_diameter/2, center=true);
translate([75+25,5,15]) rotate([90,0,0]) cylinder(h = 2, r=m4_nut_diameter/2, center=true, $fn=6);
translate([70,18.5,8.5]) rotate([90,0,90])cylinder(h=40,r=(m4_diameter)/2, center=true);
translate([70,18.5,21.5]) rotate([90,0,90])cylinder(h=40,r=(m4_diameter)/2, center=true);
translate([70,44.5,8.5]) rotate([90,0,90])cylinder(h=40,r=(m4_diameter)/2, center=true);
translate([70,44.5,21.5]) rotate([90,0,90])cylinder(h=40,r=(m4_diameter)/2, center=true);
translate([55,44.5,8.5]) rotate([90,0,90])cylinder(h=10,r=(m4_nut_diameter)/2, $fn=6, center=true);
translate([55,44.5,21.5]) rotate([90,0,90])cylinder(h=10,r=(m4_nut_diameter)/2, $fn=6, center=true);
translate([55,18.5,8.5]) rotate([90,0,90])cylinder(h=10,r=(m4_nut_diameter)/2, $fn=6, center=true);
translate([55,18.5,21.5]) rotate([90,0,90])cylinder(h=10,r=(m4_nut_diameter)/2, $fn=6, center=true);
translate([35,31.5,-1]) cylinder(r=10.75,h=10);
translate([22,31.5,-1]) cylinder(r=10.75,h=10);
translate([21,21,-1]) cube([15,21.5,10]);
translate([36,45.5,-1]) cube([16,3.2,10]);
translate([36,14.5,-1]) cube([16,3.2,10]);
translate([5,45.5,-1]) cube([16,3.2,10]);
translate([5+devx,14.5,-1]) cube([16-devx,3,50]);
translate([-5,22]) rotate([0,0,0])cube([38,30,6]);
translate([-5,-1]) rotate([0,0,0])cube([16,30,30]);
translate([70,31.5,9]) cylinder(r=m8_diameter/2,h=30);
translate([70,31.5,21]) b608();
translate([70,31.5,-0]) b608();
translate([83,31.5,11]) b608(9);
if(bfb){
translate([56.5,5,-1]) cube([9,5,12]);
translate([84.5,5,-1]) cube([9,5,12]);
translate([75,0,15]) rotate([0,180,0]){
rotate([0,180,0]) translate([0,2,16.6]) rotate([90,0,0]) cylinder(r=6,h=10, center=true);

rotate([0,180+180,0]) translate([0,0,16.6]) rotate([90,0,0]) cylinder(r=3,h=5, center=true);
rotate([0,180+60,0]) translate([0,0,16.6]) rotate([90,0,0]) cylinder(r=4,h=6, center=true);
rotate([0,180-60,0]) translate([0,0,16.6]) rotate([90,0,0]) cylinder(r=4,h=6, center=true);
rotate([0,60,0]) translate([0,0,16.6]) rotate([90,0,0]) cylinder(r=2.6,h=25, center=true);
rotate([0,-60,0]) translate([0,0,16.6]) rotate([90,0,0]) cylinder(r=2.6,h=25, center=true);
}
}
else{
translate([75,-7,15]) rotate([90,0,0]) cylinder(h = 30, r=16/2, center=true);
translate([79,5,14]) rotate([0,0,0]) cylinder(h = 30, r=3/2, center=true);
translate([72,5,14]) rotate([0,0,0]) cylinder(h = 30, r=3/2, center=true);
translate([75,-4,15]) rotate([0,-40,0])translate([-15,0,0])rotate([90,0,0]) cylinder(h = 30, r=2.4, center=true);
translate([75,-4,15]) rotate([0,180-40,0])translate([-15,0,0])rotate([90,0,0]) cylinder(h = 30, r=2.4, center=true);
translate([59.5,5,-1]) cube([9,5,12]);
translate([81.5,5,20.5]) cube([9,7,12]);
}

}}
bfbext=false;
translate([6,-55,0]) rotate([0,0,70]) wadeblock(bfbext);
%cube([85,98,0.01],center=true);
