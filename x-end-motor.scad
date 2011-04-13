// PRUSA Mendel  
// X-end with NEMA 17 motor mount
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>
corection = 1.17; 

/**
 * @name X end motor
 * @category Printed
 * @using 2 bushing
 * @using 8 m3x10
 * @using 4 m3nut
 * @using 4 m3washer
 * @using 1 m8spring
 * @using 2 m8nut
 */  

use <x-end.scad>
module xendmotor(){
mirror() xend();

//nema17 connector
translate(v = [0, 35, 12.5]) difference(){
	union(){
		translate(v = [21, -22.5, 24.5]) cube(size = [24,5,6], center = true);
		translate(v = [32.5, 2, 13.5]) cube(size = [5,54,52], center = true);
		translate(v = [22.5, 2, -11]) cube(size = [20,54,3], center = true);
	}

		// some reduction of bottom part 
		translate(v = [15, 15, -11]) rotate ([0,0,-17]) cube(size = [20,70,25], center = true);

		translate(v = [0, 0, -4.7]){
			translate(v = [32.5, 7, 23.5]) rotate(a=[0,90,0]) rotate(a=[0,0,30]) cylinder(h = 10, r=12, $fn=20, center=true);

			translate(v = [30, 7, 23]) rotate(a=[0,90,0]){
			rotate ([0,0,45]) translate([20,0,0]) cube(size = [9,3.2,25], center = true);
			rotate ([0,0,-45]) translate([20,0,0]) cube(size = [9,3.2,25], center = true);
			rotate ([0,0,135]) translate([20,0,0]) cube(size = [9,3.2,25], center = true);
			rotate ([0,0,-135]) translate([20,0,0]) cube(size = [9,3.2,25], center = true);

			rotate ([0,0,135]) translate([32,0,0]) cube(size = [9,20,25], center = true);
			rotate ([0,0,-135]) translate([35,0,0]) cube(size = [9,40,25], center = true);
}
		}
}
	

}

difference(){
xendmotor();
xendcorners(5,0,5,5,0);
}