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
 * Slides on the x-axis with extruder.
 * @id x-carriage
 * @name X carriage
 * @category Printed
 * @using 4 m3x10
 * @using 4 m3washer
 * @using 4 m3nut
 * @using 4 bushing
 */ 

module xcarriage(){


translate(v = [0,0,2.5]) union(){difference(){
	union(){
		//Base block
			cube(size = [70,70,5], center = true);
		//Nut holder base - extruder
			translate(v = [0, 0, 1]) cube(size = [12,70,7], center = true);
			translate(v = [0, -6, 1]) cube(size = [70,12,7], center = true);

		//Nut holder base - belt clamps
		translate(v = [33-(7.5/2), -18, 1]) cube(size = [45-7.5,15,7], center = true);
		translate(v = [33+45/2-7.5, -18, 1]) cylinder(h = 7, r=7.5, $fn=18, center=true);
		translate(v = [33-(7.5/2), 8, 1]) cube(size = [45-7.5,15,7], center = true);
		translate(v = [33+45/2-7.5, 8, 1]) cylinder(h = 7, r=7.5, $fn=18, center=true);

		//Bushing holder
		translate(v = [-25, 30, 5])cube(size = [26,10,15], center = true);
		translate(v = [-25, -30, 5])cube(size = [26,10,15], center = true);
		translate(v = [25, -30, 5])cube(size = [26,10,15], center = true);
		translate(v = [25, 30, 5])cube(size = [26,10,15], center = true);
		
		// fan holder
		translate(v = [-25, 20, 2])  cube(size = [20,10,9], center = true);
		translate(v = [-25, -20, 2]) cube(size = [20,10,9], center = true);

	}
	translate([0,42])cylinder(r=14,h=10,center=true,$fn=6);
	//main cutout
	translate(v = [-12.5,0,0]) cube(size = [5,50,10], center = true);

	translate(v = [25, 30.4, 12]) rotate(a=[90,0,0]) cylinder(h = 11, r=18/2, $fn=12, center=true);
	translate(v = [25, 30.4, 7.5])cube(size = [18,11,9], center = true);
	translate(v = [-25, 30.4, 12]) rotate(a=[90,0,0]) cylinder(h = 11, r=18/2, $fn=12, center=true);
	translate(v = [-25, 30.4, 7.5])cube(size = [18,11,9], center = true);
	translate(v = [25, -30.4, 12]) rotate(a=[90,0,0]) cylinder(h = 11, r=18/2, $fn=12, center=true);
	translate(v = [25, -30.4, 7.5])cube(size = [18,11,9], center = true);
	translate(v = [-25, -30.4, 12]) rotate(a=[90,0,0]) cylinder(h = 11, r=18/2, $fn=12, center=true);
	translate(v = [-25, -30.4, 7.5])cube(size = [18,11,9], center = true);

	// holes for connecting extruder
		translate(v = [0, 0, 0]) {
		
		translate(v = [0, -31, 2]) cylinder(h = 10, r=m4_diameter/2, $fn=9, center=true);
		translate(v = [0, -31, 5]) cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);
		translate(v = [0, 19, ]) cylinder(h = 20, r=m4_diameter/2, $fn=9, center=true);
		translate(v = [0, 19, 5]) cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);
		
		// Hotend hole
		translate(v = [0, -6, 0]) cylinder(h = 20, r=21, $fn=20, center=true);

		

#		translate(v = [-25, -6, 2]) cylinder(h = 10, r=m4_diameter/2, $fn=9, center=true);
		translate(v = [-25, -6, 5]) cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);
		translate(v = [25, -6, ]) cylinder(h = 20, r=m4_diameter/2, $fn=9, center=true);
		translate(v = [25, -6, 5]) cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);
		
		
		
		}
//belt clamp holes
	translate(v = [30, -18, 2]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
	translate(v = [30, -18, 5]) cylinder(h = 9, r=m3_nut_diameter/2, $fn=6, center=true);
	translate(v = [48, -18, 2]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
	translate(v = [48, -18, 5]) cylinder(h = 9, r=m3_nut_diameter/2, $fn=6, center=true);

	translate(v = [30, 8, 2]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
	translate(v = [30, 8, 5]) cylinder(h = 9, r=m3_nut_diameter/2, $fn=6, center=true);
	translate(v = [48, 8, 2]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
	translate(v = [48, 8, 5]) cylinder(h = 9, r=m3_nut_diameter/2, $fn=6, center=true);


		translate(v = [-25, -20, 2.5]) rotate(a=[0,90,0]) cylinder(h = 30, r=m4_diameter/2, $fn=10, center=true);

		translate(v = [-25, 20, 2.5]) rotate(a=[0,90,0]) cylinder(h = 30, r=m4_diameter/2, $fn=10, center=true);


}}
}
xcarriage();


