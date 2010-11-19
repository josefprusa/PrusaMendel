module ybrac(){
translate([0,0,17.5]) rotate([180,0,0]) difference(){union() {
translate([50,30,0]) rotate([0,-90,90]) import_stl("y-motor-bracket_1off.stl");
translate([-12,-22,0]) rotate([0,0,45]) cube([15,40,17.5]);
translate([-7,-14,0]) rotate([0,0,0]) cube([12,12,17.5]);
}
translate([-33,-20,10]) rotate([0,0,-60]) cube([80,35,30],center=true);
translate([-40,35,10]) rotate([0,0,45]) cube(20,20,60,center=true);
}

}
ybrac();