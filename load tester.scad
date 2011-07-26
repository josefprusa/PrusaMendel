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
 * @name load tester
 * @using 4 bushing
 * @id loadtester
 */
module xcarriage(){


translate(v = [0,0,2.5]) union(){difference(){
	union(){
		//Base block
			cube(size = [68,70,5], center = true);
		//Nut holder base - extruder
			//translate(v = [0, 0, 1]) cube(size = [12,70,7], center = true);
			//translate(v = [0, -6, 1]) cube(size = [68,12,7], center = true);

		//Nut holder base - belt clamps
		//translate(v = [33-(7.5/2), -18, 1]) cube(size = [45-7.5,15,7], center = true);
		//translate(v = [33+45/2-7.5, -18, 1]) cylinder(h = 7, r=7.5, $fn=18, center=true);
		//translate(v = [33-(7.5/2), 18, 1]) cube(size = [45-7.5,15,7], center = true);
		//translate(v = [33+45/2-7.5, 18, 1]) cylinder(h = 7, r=7.5, $fn=18, center=true);

		//Bushing holder
		//translate(v = [-23, 30, 5])cube(size = [22,10,15], center = true);
		//translate(v = [-23, -30, 5])cube(size = [22,10,15], center = true);
		//translate(v = [23, -30, 5])cube(size = [22,10,15], center = true);
		//translate(v = [23, 30, 5])cube(size = [22,10,15], center = true);
		
		// fan holder
		translate(v = [-24, 20, 2])  cube(size = [20,10,9], center = true);
		translate(v = [-24, -20, 2]) cube(size = [20,10,9], center = true);

	}
	//round corners
	//translate([-34,-35.1,-10]) roundcorner(round_corner_diameter/2);
	//translate([34,-35.1,-10]) rotate(a=90, v=[0,0,1]) roundcorner(round_corner_diameter/2);

	//translate([-34,35.1,-10]) rotate(a=270, v=[0,0,1]) roundcorner(round_corner_diameter/2);
	//translate([34,35.1,-10]) rotate(a=-180, v=[0,0,1]) roundcorner(round_corner_diameter/2);
	
	translate([0,42])cylinder(r=14,h=10,center=true,$fn=6);
translate([0,-6, -4])rotate(a=90, v=[0,0,1])linear_extrude(file = "mdf_half_disk.dxf", 
                     layer = "holes", height = 10, 
                     convexity = 2, $fn=10);
	//main cutout
	//translate(v = [-12.5,0,0]) cube(size = [5,50,10], center = true);

	translate(v = [25.5, 30.4, 8])cube(size = [19,11,10], center = true);
	translate(v = [-25.5, 30.4, 8])cube(size = [19,11,10], center = true);
	translate(v = [25.5, -30.4, 8])cube(size = [19,11,10], center = true);
	translate(v = [-25.5, -30.4, 8])cube(size = [19,11,10], center = true);

	// holes for connecting extruder
		translate(v = [0, 0, 0]) {
		
		translate(v = [-40, -31, 2]) #cylinder(h = 10, r=m4_diameter/2, $fn=9, center=true);
		translate(v = [-40, -31, 5]) #cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);
		translate(v = [-40, 19, ]) #cylinder(h = 20, r=m4_diameter/2, $fn=9, center=true);
		translate(v = [-40, 19, 5]) #cylinder(h = 9, r=4.5, $fn=6, center=true);
		
		// Hotend hole
		translate(v = [0, -6, 12]) cylinder(h = 20, r=21, $fn=20, center=true);

		

		//translate(v = [-25, -6, 2]) cylinder(h = 10, r=m4_diameter/2, $fn=9, center=true);
		//translate(v = [-25, -6, 5]) cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);
		//translate(v = [25, -6, ]) cylinder(h = 20, r=m4_diameter/2, $fn=9, center=true);
		//translate(v = [25, -6, 5]) cylinder(h = 9, r=4.5, $fn=6, center=true);
		
		
		
		}
//belt clamp holes
	//translate(v = [30, -18, 2]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
	//translate(v = [30, -18, 5]) cylinder(h = 9, r=m3_nut_diameter/2, $fn=6, center=true);
	//translate(v = [48, -18, 2]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
	//translate(v = [48, -18, 5]) cylinder(h = 9, r=m3_nut_diameter/2, $fn=6, center=true);

	//translate(v = [30, 18, 2]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
	//translate(v = [30, 18, 5]) cylinder(h = 9, r=m3_nut_diameter/2, $fn=6, center=true);
	//translate(v = [48, 18, 2]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
	//translate(v = [48, 18, 5]) cylinder(h = 9, r=m3_nut_diameter/2, $fn=6, center=true);


		//translate(v = [-25, -20, 2.5]) rotate(a=[0,90,0]) cylinder(h = 30, r=m4_diameter/2, $fn=10, center=true);

		//translate(v = [-25, 20, 2.5]) rotate(a=[0,90,0]) cylinder(h = 30, r=m4_diameter/2, $fn=10, center=true);


}}
}
xcarriage();


