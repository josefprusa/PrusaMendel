// PRUSA Mendel  
// motor/leadscrew coupling
// Used for connecting motor to leadscrew
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel
include <configuration.scad>

/**
 *@name Coupling
 *@using 1 m3x25
 *@using 1 m3nut
 *@using 2 m3washer
 */

module coupling_heads(base_height){
difference(){
union(){
	translate(v = [0, 0, (30-19+base_height)/2]) cube(size = [40,7,30-19+base_height], center = true);
	
	translate(v = [-20, 0, 30-19+base_height]) rotate ([0,90,0]) cylinder(h = 40, r=5, $fn=16);
}

//cube cutout for coupling center pice
translate(v = [0, 0, 19+25-19+base_height]) cube(size = [20,20,50], center = true);

//coupling hole
translate(v = [-25, 0, 30-19+base_height]) rotate ([0,90,0]) cylinder(h = 50, r=m3_diameter/2, $fn=16);
}
}

module coupling_motor(){
difference(){
union(){
	coupling_heads(19);
	cylinder(h = 19, r=7);
	translate(v = [0, 7, 9.5]) cube(size = [14,14,19], center = true);
	
}

// inside diameter
translate(v = [0, 0, -1])cylinder(h = 30, r=motor_shaft/2, $fn=16);


// screw holes
rotate ([0,0,90]) translate(v = [8.5, 15, 5]) rotate ([90,0,0]) cylinder(h = 30, r=m3_diameter/2, $fn=16);
rotate ([0,0,90]) translate(v = [8.5, 15, 14]) rotate ([90,0,0]) cylinder(h = 30, r=m3_diameter/2, $fn=16);

//main cut
translate(v = [0, 10, 14]) cube(size = [2,20,35], center = true);

//difference cut
//translate(v = [0, 7, 15])  cube(size = [20,8,1], center = true);
}
}

module coupling_leadscrew(){
difference(){
union(){
	coupling_heads(10);
	cylinder(h = 10, r=(m8_nut_diameter/2)+2.3, $fn=6);
}
//nut cutout
translate(v = [0, 0, 4]) cylinder(h = 10, r=(m8_nut_diameter/2), $fn=6);

//leadscre cutout
translate(v = [0, 0, -1]) cylinder(h = 10, r=(m8_diameter/2));
}
}

module coupling_heart(){
difference(){
union(){
translate(v = [0, 0, (2*m3_diameter+4)/2])	intersection() {
	cube(size = [19,19,2*m3_diameter+4], center=true);
	rotate ([0,0,45]) cube(size = [19,19,2*m3_diameter+4], center=true);
     }
}
rotate ([0,0,90]) translate(v = [-15, 0, 0]) rotate ([0,0,90]) translate(v = [0, 0, m3_diameter/2+2]) rotate ([90,0,0]) cylinder(h = 30, r=m3_diameter/2, $fn=16);
translate(v = [-15, 0, 0]) rotate ([0,0,90]) translate(v = [0, 0, (m3_diameter/2+2)+m3_diameter]) rotate ([90,0,0]) cylinder(h = 30, r=m3_diameter/2, $fn=16);
}
}

coupling_motor();
translate(v = [0, -17, 0]) coupling_leadscrew();
translate(v = [0, -38, 0]) coupling_heart();
/* assembly
coupling_motor();
translate(v = [0, 0, 47]) mirror([ 0, 0, 1 ]) rotate ([0,0,90]) coupling_leadscrew();
translate(v = [0, 0, 21.5]) coupling_heart();
*/
