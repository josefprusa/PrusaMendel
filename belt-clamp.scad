// PRUSA Mendel  
// Belt clamp
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

difference(){
cube([22,10,4]);
translate(v = [4, 5, 0]){
	cylinder(h=10, r=m4_diameter/2, $fn=9, center=true);
	translate(v = [14, 0, 0]) cylinder(h=10, r=m4_diameter/2, $fn=9, center=true);
}}