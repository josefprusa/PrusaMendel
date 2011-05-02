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
 * @name Y bushing
 * @category Printed
 * @using 4 m3washer
 * @using 2 m3x15xhex
 * @using 2 m3nut
 */

snap_in_mount = false;
use <bushing.scad>

module ybushing(){
translate(v = [0,8.4,4.9]) rotate(a=[0,0,180]) cube(size = [5,3,4], center = true);difference(){
union(){
translate(v = [0,0,1.5]) cube(size = [33,11,3], center = true);
translate(v = [0,0,1.5]) cube(size = [16,20,3], center = true);

translate(v = [0,5.5,11]) rotate(a=[90,0,0]) bushing();
}
translate(v = [12, 0, -2]) cylinder(h = 12, r=m3_diameter/2, $fn=9, center=true);
translate(v = [-12, 0, -2]) cylinder(h = 12, r=m3_diameter/2, $fn=9, center=true);
}	
}
ybushing();