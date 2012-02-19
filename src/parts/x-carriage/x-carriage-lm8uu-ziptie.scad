// PRUSA Mendel  
// X-carriage
// Used for sliding on X axis
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <../configuration.scad>
linear=true;
lme8uu=false;

/**
 * @id x-carriage
 * @name X carriage
 * @category Printed
 * @using 2 m4nut
 * @using 2 m4x25
 */

snap_in_mount = false;
use <../lib-bearing.scad>

module mountingholes(){
					translate(v = [0, -25, -5]) polyhole(m3_diameter,10);
					//translate(v = [0, -25, 5]) cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);		
					translate(v = [0, 25, -5]) polyhole(m3_diameter,10);
					//translate(v = [0, 25, 5]) cylinder(h = 9, r=4.5, $fn=6, center=true);
}

module x_carriage(){

			translate(v = [0, 0, 2.5]) difference(){
				union(){
					//Base block
						translate(v = [15, 0, 0])cube(size = [35,50,5], center = true);
						translate(v = [0, 18.5, 0]) cube(size = [35,20,5], center = true);
						translate(v = [-2.4, -6, 0]) rotate(a=[0,0,15]) cylinder(h = 5, r=35, $fn=5, center=true);
						translate(v = [0, -31, 0]) cylinder(h = 5, r=m4_nut_diameter/2+2, $fn=6, center=true);	
					//Nut holder base - extruder
					//Nut holder base - belt clamps
						translate(v = [23-(7.5/2)+5, -11, 0]) cube(size = [45-7.5+10,15,5], center = true);
						translate(v = [(33+45/2-7.5), -11, 0]) cylinder(h = 5, r=7.5, $fn=18, center=true);
					//Nut holder base - belt clamps
						translate(v = [23-(7.5/2)+5, 11, 0]) cube(size = [45-7.5+10,15,5], center = true);
						translate(v = [(33+45/2-7.5), 11, 0]) cylinder(h = 5, r=7.5, $fn=18, center=true);
					// Bearing holders
						translate(v = [25,-30,-2.5]) rotate(a=[0,0,90]) horizontal_bearing(26, 15, true, tru,false,false);
						translate(v = [25,30,-2.5]) rotate(a=[0,0,90]) horizontal_bearing(26, 15, false,false,true, true);
						translate(v = [-25,21.7,-2.5]) rotate(a=[0,0,90]) horizontal_bearing(26, 15, false,false,true, true);
				}
					// Bearing zipties
						translate(v = [25,-30,-2.5]) rotate(a=[0,0,90]) horizontal_bearing_ziptie_cutter(26, 15, true, tru,false,false);
						translate(v = [25,30,-2.5]) rotate(a=[0,0,90]) horizontal_bearing_ziptie_cutter(26, 15, false,false,true, true);
						translate(v = [-25,21.7,-2.5]) rotate(a=[0,0,90]) horizontal_bearing_ziptie_cutter(26, 15, false,false,true, true);
					// holes for connecting extruder
						translate(v = [0, -6, 0]){
						rotate(a=[0,0,23]) mountingholes();
						rotate(a=[0,0,-23]) mountingholes();
						rotate(a=[0,0,0]) mountingholes();
						}
					//removing some mass	
						//translate(v = [0, 36, 0]) cylinder(h = 9, r=14, $fn=6, center=true);	
		
					// Hotend hole
						translate(v = [0, -6, 0]) cylinder(h = 20, r=20, $fn=20, center=true);
		
					//NORMAL MOUNT END
				
					//ZIPTIE holes for connecting belt
					//translate(v = [38, -18, 2]) cube(size = [5,3.5,30], center = true);

					translate(v = [0,-22,0]){
					translate(v = [30, 11, -5]) polyhole(m3_diameter,10);
					translate(v = [30, 11, 0.55]) nut(m3_nut_diameter,9);
					translate(v = [48, 11, -5]) polyhole(m3_diameter,10);
					translate(v = [48, 11, 0.55]) nut(m3_nut_diameter,9);
					}

					translate(v = [30, 11, -5]) polyhole(m3_diameter,10);
					translate(v = [30, 11, 0.55]) nut(m3_nut_diameter,9);
					translate(v = [48, 11, -5]) polyhole(m3_diameter,10);
					translate(v = [48, 11, 0.55]) nut(m3_nut_diameter,9);
				}
	


}


x_carriage(linear);


