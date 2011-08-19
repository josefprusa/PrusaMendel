// PRUSA Mendel  
// X-carriage
// Used for sliding on X axis
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

/**
 * @id y-bushing
 * @name Y bushing
 * @category Printed
 * @using 4 m3washer
 * @using 2 m3x15xhex
 * @using 2 m3nut
 */

snap_in_mount = false;
use <bushing.scad>

module ybushing(){
	difference(){
		union(){
			translate(v = [0,0,5.05/2]) cube(size = [33,10,5.05], center = true);
			//translate(v = [0,0,1.5]) cube(size = [16,20,3], center = true);
			translate(v = [0,0,5]) rotate(a=[0,0,0]) standart_bushing();
			}
		translate(v = [12, 0, -2]) polyhole(m3_diameter, 12);
		translate(v = [-12, 0, -2]) polyhole(m3_diameter, 12);

	translate(v = [0,0,2.0/2]) cube(size = [34,120,2.05], center = true);
}
	}	

ybushing();