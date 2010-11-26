// PRUSA Mendel  
// Bar clamp
// Used for joining 8mm rods
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>
module barclamp(){
outer_diameter = m8_diameter/2+3.3;

difference(){
	union(){
		
		translate([outer_diameter, outer_diameter, 0])cylinder(h =outer_diameter*2, r = outer_diameter, $fn = 20);
		translate([outer_diameter, 0, 0])cube([17.5,outer_diameter*2,outer_diameter*2]);
	}


	translate([9, outer_diameter/2+1, 0])cube([18,05,20]);
	translate([outer_diameter, outer_diameter, 0]) #cylinder(h =20, r = m8_diameter/2, $fn = 18);
	translate([17, 17, 7.5]) rotate([90, 0, 0]) #cylinder(h =20, r = m8_diameter/2, $fn = 10);
}
}
barclamp();
