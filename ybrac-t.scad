include <configuration.scad>
module ybract(){
difference(){
translate([7,4.5])rotate([0,0,90])mirror()linear_extrude(file="ybrac-t.dxf",height=7);
translate([3.4,30.05,10])cylinder(h=30,r=m8_diameter/2, center=true);
translate([-26,-21,10])cylinder(h=30,r=m8_diameter/2, center=true);
translate([33.5,-20.5,10])cylinder(h=30,r=4.4/2, center=true);
translate([4.5,-10,10])cylinder(h=30,r=4.4/2, center=true);
translate([15,19.2,10])cylinder(h=30,r=4.4/2, center=true);
}
}
ybract();
