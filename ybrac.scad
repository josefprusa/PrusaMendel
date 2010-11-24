include<configuration.scad>
module ybrac(){
difference(){ linear_extrude(file="ybrac.dxf", height=17);
translate([3.4,30.05,10])cylinder(h=30,r=m8_diameter/2, center=true);
translate([-26,-21,10])cylinder(h=30,r=m8_diameter/2, center=true);
}
}
ybrac();