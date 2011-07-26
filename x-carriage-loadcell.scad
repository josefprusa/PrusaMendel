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
 * @id x-carriage
 * @name X carriage
 * @category Printed
 * @using 2 m4nut
 * @using 2 m4x25
 */

snap_in_mount = false;
use <bushing.scad>

module xcarriage(){
union(){
	translate(v = [0,0,2.5]) 
		union(){
			difference(){
				union(){
					//Base block
						cube(size = [65,70,5], center = true);
						translate(v = [0, -31, 0]) cylinder(h = 5, r=m4_nut_diameter/2+2, $fn=6, center=true);	
					//Nut holder base - extruder

					//Nut holder base - belt clamps
						translate(v = [23-(7.5/2)+5, -18, 0]) cube(size = [45-7.5+10,15,5], center = true);
						translate(v = [(33+45/2-7.5), -18, 0]) cylinder(h = 5, r=7.5, $fn=18, center=true);
					//Nut holder base - belt clamps
						translate(v = [23-(7.5/2)+5, 18, 0]) cube(size = [45-7.5+10,15,5], center = true);
						translate(v = [(33+45/2-7.5), 18, 0]) cylinder(h = 5, r=7.5, $fn=18, center=true);
				}
				// holes for connecting extruder
				// SNAP IN MOUNT
				if(snap_in_mount){
					// Hotend hole
					translate(v = [0, -6, 0]) cylinder(h = 20, r=6, $fn=20, center=true);
					translate(v = [0, -6, 3]) cylinder(h = 2, r=8, $fn=20, center=true);
					translate(v = [0, 0, 3]) cube(size = [16,12,2], center = true);
					//translate(v = [0, -6, -5]) %cylinder(h = 2, r=8, $fn=20, center=true);

					translate(v = [0, 0, 0]) cube(size = [12,12,15], center = true);
					translate(v = [0, 8, 0]) cube(size = [16,16,15], center = true);
					translate(v = [0, 16, 0]) cylinder(h = 20, r=8, $fn=20, center=true);

					//cutouts for clips
					translate(v = [0, -4.5, 0]) translate(v = [-13, 6, 0]) cube(size = [4,45,15], center = true);
					translate(v = [0, -4.5, 0]) translate(v = [13, 6, 0]) cube(size = [4,45,15], center = true);
		
					//bigger oepening
					translate(v = [0, -4.5+12.5, 0]) translate(v = [-15.5, 6, 0]) cube(size = [9,20,15], center = true);
					translate(v = [0, -4.5+12.5, 0]) translate(v = [15.5, 6, 0]) cube(size = [9,20,15], center = true);
		
		
					translate(v = [0, -4.5+9.5, 0]) translate(v = [-15.5, 6, 6.5]) rotate(a=[-20,0,0])  cube(size = [9,20,15], center = true);
					translate(v = [0, -4.5+9.5, 0]) translate(v = [15.5, 6, 6.5]) rotate(a=[-20,0,0]) cube(size = [9,20,15], center = true);
		
					translate(v = [0, -4.5-12.5, 0]) translate(v = [-18, 6, 3.5]) cube(size = [4,20,3], center = true);
					translate(v = [0, -4.5-12.5, 0]) translate(v = [18, 6, 3.5]) cube(size = [4,20,3], center = true);
				
					//SNAP IN MOUNT END
				}else{
					//NORMAL MOUNT
		
					translate(v = [0, -31, 2]) cylinder(h = 10, r=m4_diameter/2, $fn=9, center=true);		
					translate(v = [0, -31, 5]) cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);		
					translate(v = [0, 19, ]) cylinder(h = 20, r=m4_diameter/2, $fn=9, center=true);
					translate(v = [0, 19, 5]) cylinder(h = 9, r=4.5, $fn=6, center=true);	
		
					// Hotend hole
					translate(v = [0, -6, 0]) cylinder(h = 20, r=21, $fn=20, center=true);
		
					//NORMAL MOUNT END
				}
				//ZIPTIE holes for connecting belt
				//translate(v = [38, -18, 2]) cube(size = [5,3.5,30], center = true);

				//belt clamp holes
					translate(v = [30, -18, 2]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
				translate(v = [30, -18, 5]) cylinder(h = 9, r=m3_nut_diameter/2, $fn=6, center=true);
					translate(v = [48, -18, 2]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);		
				translate(v = [48, -18, 5]) cylinder(h = 9, r=m3_nut_diameter/2, $fn=6, center=true);

				translate(v = [30, 18, 2]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
				translate(v = [30, 18, 5]) cylinder(h = 9, r=m3_nut_diameter/2, $fn=6, center=true);
				translate(v = [48, 18, 2]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
				translate(v = [48, 18, 5]) cylinder(h = 9, r=m3_nut_diameter/2, $fn=6, center=true);

			}

	}

}
}


//rotate(a=[0,180,0])translate(v = [0, 6, 0]) #xcarriage();
difference(){
union(){
//loadcell
translate(v = [21, -25, 6.5+5+4]) %cube(size = [55,13,13], center = true);
translate(v = [21, 25, 6.5+5+4]) %cube(size = [55,13,13], center = true);

// base
translate(v = [21, 0, 2.5]) cube(size = [55,71,5], center = true);
//loadcell standoffs
translate(v = [40, 0, 4.5]) cube(size = [10,65,9], center = true);

translate(v = [43.5, 0, 4.5]) cube(size = [10,65,9], center = true);

//fins
translate(v = [21, 23 - 6.5 -2.5 - 2, +5+4+2]) cube(size = [55,9,18], center = true);

translate(v = [21, 45 - 6.5 -2.5 - 2, +5+2]) cube(size = [55,3,7], center = true);
translate(v = [21, -45 + 6.5 +2.5 + 2, +5+2]) cube(size = [55,3,7], center = true);
translate(v = [21, -23 + 6.5 +2.5 + 2, +5+4+2]) cube(size = [55,9,18], center = true);

}//union end
//hotend
translate(v = [13, 0, 0])cylinder(h = 20, r=3.5/2, $fn=10, center=true);

cylinder(h = 20, r=18/2, $fn=25, center=true);
translate(v = [-12.5, 0, 0])cube(size = [25,18,20], center = true);

translate(v = [0, 0, 5])cylinder(h = 0.5, r=17/2, $fn=35, center=true);
translate(v = [-12.5, 0, 5])cube(size = [25,17,0.5], center = true);

translate(v = [0, -25, 5]) cylinder(h = 10, r=m4_diameter/2, $fn=9, center=true);		
translate(v = [0, -25, 6]) cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);		
translate(v = [0, 25, 5]) cylinder(h = 20, r=m4_diameter/2, $fn=9, center=true);
translate(v = [0, 25, 6]) cylinder(h = 9, r=4.5, $fn=6, center=true);

translate(v = [40, -25, 5]) cylinder(h = 10, r=m4_diameter/2, $fn=9, center=true);		
translate(v = [40, 25, 5]) cylinder(h = 20, r=m4_diameter/2, $fn=9, center=true);

}






















