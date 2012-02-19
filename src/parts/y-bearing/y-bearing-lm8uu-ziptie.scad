// PRUSA Mendel  
// Y bearing holder
// Used for sliding on X axis
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <../configuration.scad>

/**
 * @id y-bearing
 * @name Y bearing
 * @category Printed
 * @using 4 m3washer
 * @using 2 m3x15xhex
 * @using 2 m3nut
 */

use <../lib-bearing.scad>

module y_bearing(){
	difference(){
		union(){
			horizontal_bearing(26, 15, true, true, true, true);
			// Nut holders
			translate(v=[0,0,1.5]) cube(size = [14,26,3], center = true);
			translate(v=[0,-13,0]) cylinder(h = 3, r=7, $fn=6);
			translate(v=[0,13,0]) cylinder(h = 3, r=7, $fn=6); 
		}
		translate(v=[0,-14,0]) polyhole(m3_diameter, 10);
		translate(v=[0,14,0]) polyhole(m3_diameter, 10);
		horizontal_bearing_ziptie_cutter();
	}
}

y_bearing();