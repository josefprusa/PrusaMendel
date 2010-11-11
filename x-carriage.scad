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
// bfb hotend support tested only with vertical mounting
	bfb = false;

// orientation of extruder
// true - horizontal
// false - vertical
	orientation = true;

translate(v = [0,0,2.5]) {
	union() {
		difference() {
			union() {
				//Base block
				cube(size = [70,70,5], center = true);

				//Nut holder base - extruder
				if(orientation)
					translate(v = [0, 0, 1])
						cube(size = [12,70,7], center = true);
				if(orientation == false)
					translate(v = [0, 0, 1])
						cube(size = [70,12,7], center = true);

				//Nut holder base - belt clamps
				translate(v = [33, -18, 1])
					cube(size = [45,15,7], center = true);
				translate(v = [33, 18, 1])
					cube(size = [45,15,7], center = true);

				//Bushing holder
				translate(v = [-25, 30, 5])
					cube(size = [26,10,15], center = true);
				translate(v = [-25, -30, 5])
					cube(size = [26,10,15], center = true);
				translate(v = [25, -30, 5])
					cube(size = [26,10,15], center = true);
				translate(v = [25, 30, 5])
					cube(size = [26,10,15], center = true);

				// fan holder
				translate(v = [-25, 20, 2])
					cube(size = [20,10,9], center = true);
				translate(v = [-25, -20, 2])
					cube(size = [20,10,9], center = true);
			}
			
			//main cutout
			if(orientation)
				translate(v = [0, -5, 2])
					cube(size = [30,30,20], center = true);
			if(orientation == false)
				cube(size = [30,50,20], center = true);
			translate(v = [-12.5,0,0])
				cube(size = [5,50,20], center = true);

			// bushing cutouts
			translate(v = [25, 30.4, 7.5])
				cube(size = [18,11,9], center = true);
			translate(v = [-25, 30.4, 7.5])
				cube(size = [18,11,9], center = true);
			translate(v = [25, -30.4, 7.5])
				cube(size = [18,11,9], center = true);
			translate(v = [-25, -30.4, 7.5])
				cube(size = [18,11,9], center = true);

			// bushing clamps
			translate(v = [25, 30.4, 12])
				rotate(a=[90,0,0])
					cylinder(h = 11, r=9, $fn=12, center=true);
			translate(v = [-25, 30.4, 12])
				rotate(a=[90,0,0])
					cylinder(h = 11, r=9, $fn=12, center=true);
			translate(v = [25, -30.4, 12])
				rotate(a=[90,0,0])
					cylinder(h = 11, r=9, $fn=12, center=true);
			translate(v = [-25, -30.4, 12])
				rotate(a=[90,0,0])
					cylinder(h = 11, r=9, $fn=12, center=true);

			// holes for connecting extruder
			if(orientation) {
				// screw holes
				translate(v = [0, -30, 12])
					cylinder(h = 80, r=m4_diameter/2, $fn=9, center=true);
				translate(v = [0, 20, 12])
					cylinder(h = 80, r=m4_diameter/2, $fn=9, center=true);
				// nut traps
				translate(v = [0, -30, 5])
					cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);
				translate(v = [0, 20, 5])
					cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);
			}

			if(orientation == false) {
				// screw holes
				translate(v = [-25, 0, 12])
					cylinder(h = 80, r=m4_diameter/2, $fn=9, center=true);
				translate(v = [25, 0, 12])
					cylinder(h = 80, r=m4_diameter/2, $fn=9, center=true);
				// nut traps
				translate(v = [-25, 0, 5])
					cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);
				translate(v = [25, 0, 5])
					cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);
			}

			// belt clamp screw holes
			translate(v = [30, -18, 12])
				cylinder(h = 80, r=m4_diameter/2, $fn=9, center=true);
			translate(v = [48, -18, 12])
				cylinder(h = 80, r=m4_diameter/2, $fn=9, center=true);
			translate(v = [30, 18, 12])
				cylinder(h = 80, r=m4_diameter/2, $fn=9, center=true);
			translate(v = [48, 18, 12])
				cylinder(h = 80, r=m4_diameter/2, $fn=9, center=true);

			// belt clamp nut traps
			translate(v = [48, -18, 5])
				cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);
			translate(v = [30, -18, 5])
				cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);
			translate(v = [30, 18, 5])
				cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);
			translate(v = [48, 18, 5])
				cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);

			// fan mount screw holes
			translate(v = [-25, -20, 2.5])
				rotate(a=[0,90,0])
					cylinder(h = 30, r=m4_diameter/2, $fn=10, center=true);
			translate(v = [-25, 20, 2.5])
				rotate(a=[0,90,0])
					cylinder(h = 30, r=m4_diameter/2, $fn=10, center=true);

			if(bfb) {
				if(orientation == false)
					cylinder(h = 40, r=21, $fn=20, center=true);
				if(orientation)
					translate(v = [0, -5, 0])
						cylinder(h = 40, r=21, $fn=20, center=true);
			}
		}
	}
}
