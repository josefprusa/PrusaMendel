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

// if true, cutout for bfb hotend is added
bfb = true;

union(){difference(){
	union(){
		//Base block
		cube(size = [70,70,5], center = true);
		//Nut holder base - extruder
		translate(v = [0, 0, 2]) cube(size = [70,12,9], center = true);

		//Nut holder base - belt clamps
		translate(v = [33, -18, 2]) cube(size = [45,15,9], center = true);
		translate(v = [33, 18, 2]) cube(size = [45,15,9], center = true);

		//Bushing holder
		translate(v = [-25, 30, 7])cube(size = [20,10,10], center = true);
		translate(v = [-25, 30, 12])rotate(a=[90,0,0]) cylinder(h = 10, r=10, $fn=20, center=true);

		translate(v = [-25, -30, 7])cube(size = [20,10,10], center = true);
		translate(v = [-25, -30, 12])rotate(a=[90,0,0]) cylinder(h = 10, r=10, $fn=20, center=true);

		translate(v = [25, -30, 7])cube(size = [20,10,10], center = true);
		translate(v = [25, -30, 12])rotate(a=[90,0,0]) cylinder(h = 10, r=10, $fn=20, center=true);

		translate(v = [25, 30, 7])cube(size = [20,10,10], center = true);
		translate(v = [25, 30, 12])rotate(a=[90,0,0]) cylinder(h = 10, r=10, $fn=20, center=true);
		
		translate(v = [-25, 20, 2])  cube(size = [20,10,9], center = true);

		translate(v = [-25, -20, 2]) cube(size = [20,10,9], center = true);



	}
	cube(size = [30,50,20], center = true);
	translate(v = [25, 0, 12]) rotate(a=[90,0,0]) cylinder(h = 80, r=bushing_diameter/2, $fn=12, center=true);
	translate(v = [-25, 0, 12]) rotate(a=[90,0,0]) cylinder(h = 80, r=bushing_diameter/2, $fn=12, center=true);

	// holes for connecting extruder
	translate(v = [-25, 0, 12]) cylinder(h = 80, r=m4_diameter/2, $fn=9, center=true);
	translate(v = [-25, 0, 5]) cylinder(h = 5, r=m4_nut_diameter/2, $fn=6, center=true);
	translate(v = [25, 0, ]) cylinder(h = 20, r=m4_diameter/2, $fn=9, center=true);
	translate(v = [25, 0, 5]) cylinder(h = 5, r=4.5, $fn=6, center=true);

	translate(v = [30, -18, 12]) cylinder(h = 80, r=m4_diameter/2, $fn=9, center=true);
	translate(v = [30, -18, 5]) cylinder(h = 5, r=m4_nut_diameter/2, $fn=6, center=true);
	translate(v = [48, -18, 12]) cylinder(h = 80, r=m4_diameter/2, $fn=9, center=true);
	translate(v = [48, -18, 5]) cylinder(h = 5, r=m4_nut_diameter/2, $fn=6, center=true);

	translate(v = [30, 18, 12]) cylinder(h = 80, r=m4_diameter/2, $fn=9, center=true);
	translate(v = [30, 18, 5]) cylinder(h = 5, r=m4_nut_diameter/2, $fn=6, center=true);
	translate(v = [48, 18, 12]) cylinder(h = 80, r=m4_diameter/2, $fn=9, center=true);
	translate(v = [48, 18, 5]) cylinder(h = 5, r=m4_nut_diameter/2, $fn=6, center=true);


		translate(v = [-25, -20, 2.5]) rotate(a=[0,90,0]) cylinder(h = 40, r=m4_diameter/2, $fn=10, center=true);

		translate(v = [-25, 20, 2.5]) rotate(a=[0,90,0]) cylinder(h = 40, r=m4_diameter/2, $fn=10, center=true);

if(bfb) cylinder(h = 40, r=21, $fn=20, center=true);
}//
%translate(v = [-45, -25, -2.5]) cube(size=[10,50,50]);
translate(v = [-25, -35, 19]) cube(size=[50,10,3]);
translate(v = [-25, 25, 19]) cube(size=[50,10,3]);
//translate(v = [10, -25, 9]) %cube(size=[50,50,14]);
}



