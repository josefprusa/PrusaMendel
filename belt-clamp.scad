// PRUSA Mendel  
// Belt clamp
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

/**
 * @id belt-clamp
 * @name Belt clamp
 * @category Printed
 */ 

module beltclamp(){
difference(){
cube([26,10,5]);
translate(v = [4, 5, 0]){
	translate(v = [0, 0, -1])polyhole(m3_diameter, 12);
	translate(v = [18, 0, -1]) polyhole(m3_diameter, 12);polyhole(m3_diameter, 12);
}}
}
beltclamp();