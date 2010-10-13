module shortclamp(){ 
difference(){
import_stl("z-bar-top-clamp_4off.stl");
translate([0,10,10]) cube([30,30,30],center=true);
translate([0,65,10]) cube([30,30,30],center=true);
translate([0,36,28]) cube([30,30,30],center=true);
translate([0,36,-12]) cube([30,30,30],center=true);
}
}

shortclamp();