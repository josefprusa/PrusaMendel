// PRUSA Mendel  
// Configuration test
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel
include <configuration.scad>

/**
 * @id calibration
 * @name Configuration test
 */
module configurationtest(){
difference(){
	union(){
		rotate(a=[0,0,30]) cylinder(h = 10, r=(m8_nut_diameter/2)+4, $fn =6);
		translate(v=[(((m8_diameter/2)+3)*2+(m3_diameter/2)+2+(((m3_diameter/2)+2)*2)/2)/2,0,5]) cube(size = [((m8_diameter/2)+3)*2+(m3_diameter/2)+2+(((m3_diameter/2)+2)*2)/2,((m8_nut_diameter/2)+4)*2,10], center = true);

		translate(v=[((m8_diameter/2)+3),(m8_nut_diameter/2)+2,((m8_diameter)+15)/2]) cube(size = [((m8_diameter/2)+3)*2,4,(m8_diameter)+15], center = true);
		//translate(v=[(m8_diameter/2)+3,(m8_nut_diameter/2)+4,(m8_diameter/2)+10]) rotate(a=[90,0,0])cylinder(h = 4, r=(m8_diameter/2)+3);

		translate(v=[((m8_diameter/2)+3)*2+(m3_diameter/2)+1.9,(m8_nut_diameter/2)+2,((m8_diameter)+15)/2]) cube(size = [((m3_diameter/2)+2.1)*2,4,(m8_diameter)+15], center = true);
		//translate(v=[((m8_diameter/2)+3)*2+(m3_diameter/2)+2,(m8_nut_diameter/2)+4,(m8_diameter/2)+10]) rotate(a=[90,0,0])cylinder(h = 4, r=(m3_diameter/2)+2);
	}
	translate(v=[(m8_diameter/2)+3,(m8_nut_diameter/2)+5,(m8_diameter/2)+10]) rotate(a=[90,0,0])cylinder(h = 6, r=(m8_diameter/2));
	translate(v=[((m8_diameter/2)+3)*2+(m3_diameter/2)+2,(m8_nut_diameter/2)+5,(m8_diameter/2)+10]) rotate(a=[90,0,0])cylinder(h = 6, r=(m3_diameter/2));
	translate(v=[0,0,-1]) cylinder(h = 15, r=(m8_diameter/2));
	translate(v=[(m8_nut_diameter/2)+(m3_nut_diameter/2)+2,0,-1]) cylinder(h = 15, r=(m3_diameter/2));
	translate(v=[(m8_nut_diameter/2)+(m3_nut_diameter/2)+2,0,5]) rotate(a=[0,0,30]) cylinder(h = 15, r=(m3_nut_diameter/2), $fn =6);
	rotate(a=[0,0,30]) translate(v=[0,0,5]) cylinder(h = 15, r=(m8_nut_diameter/2), $fn =6);

	translate(v=[((m8_diameter/2)+3)*2+(m3_diameter/2)+2+(((m3_diameter/2)+2)*2)/2-4,0,0]) rotate(a=[0,0,-25])difference(){
 	translate(v=[0,0,-1])cube(size = [10,10,20]);
 	rotate(a=[0,0,50]) translate(v=[0,0,-1.5]) cube(size = [30,30,21]);}
	
	translate(v=[((m8_diameter/2)+3)*2+(m3_diameter/2)+2+(((m3_diameter/2)+2)*2)/2-4,-3.7,0]) rotate(a=[0,0,-25])difference(){
 	translate(v=[0,0,-1])cube(size = [10,10,20]);
 	rotate(a=[0,0,50]) translate(v=[0,0,-1.5]) cube(size = [30,30,21]);}
	
	translate(v=[((m8_diameter/2)+3)*2+(m3_diameter/2)+2+(((m3_diameter/2)+2)*2)/2-4,3.7,0]) rotate(a=[0,0,-25])difference(){
 	translate(v=[0,0,-1])cube(size = [10,10,20]);
 	rotate(a=[0,0,50]) translate(v=[0,0,-1.5]) cube(size = [30,30,21]);}
	}
}
configurationtest();

