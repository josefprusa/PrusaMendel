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
 *@using 2 m3x40
 *@using 2 m3x20
 *@using 4 m3nut
 *@using 4 m3washer
 *@using 2 m8nut
 */

//TODO integrate it to the settings, it the m3hole which must be drilled precisely
screw_hole = 2.8;

module coupling_heads(base_height){
difference(){
union(){
	translate(v = [0, 0, (30-19+base_height)/2]) cube(size = [40,7,30-19+base_height], center = true);
	
	translate(v = [-20, 0, 30-19+base_height]) rotate ([0,90,0]) cylinder(h = 40, r=5, $fn=16);
}
difference(){
translate(v = [0, 0, (base_height)/2]) cube(size = [41,8,base_height], center = true);
translate(v = [0, 0, (base_height)]) rotate ([0,45,0]) cube(size = [30,8,30], center = true);
}
//cube cutout for coupling center pice
translate(v = [0, 0, 19+25-19+base_height]) cube(size = [20,20,50], center = true);

//coupling hole
translate(v = [-25, 0, 30-19+base_height]) rotate ([0,90,0]) cylinder(h = 50, r=screw_hole/2, $fn=16);
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
// the cut is on the other side intentionally, helps with drilling the holes, print is even cleaner right away for final assembly
translate(v = [0, 6.5, 14]) cube(size = [2,20,35], center = true);

//difference cut
//translate(v = [0, 7, 15])  cube(size = [20,8,1], center = true);
}
}

module coupling_leadscrew(){
difference(){
union(){
	coupling_heads(8);
	cylinder(h = 8, r=(m8_nut_diameter/2)+2.3, $fn=6);
}
//nut cutout
translate(v = [0, 0, 2]) cylinder(h = 10, r=(m8_nut_diameter/2), $fn=6);

//leadscre cutout
translate(v = [0, 0, -1]) cylinder(h = 10, r=(m8_diameter/2));
}
}

module coupling_heart(){
difference(){
union(){

translate(v = [0, 0, (screw_hole*3)/2])cube(size = [19,screw_hole*2,screw_hole*3], center=true);
translate(v = [0, 0, screw_hole])rotate ([0,0,90])cube(size = [19,screw_hole*2,screw_hole*2], center=true);
}
rotate ([0,0,90]) translate(v = [-15, 0, 0]) rotate ([0,0,90]) translate(v = [0, 0, screw_hole]) rotate ([90,0,0]) cylinder(h = 30, r=screw_hole/2, $fn=16);
translate(v = [-15, 0, 0]) rotate ([0,0,90]) translate(v = [0, 0, screw_hole*2]) rotate ([90,0,0]) cylinder(h = 30, r=screw_hole/2, $fn=16);
}
}

if(true){
coupling_motor();
translate(v = [0, -17, 0]) coupling_leadscrew();
translate(v = [0, -38, 0]) coupling_heart();
}else{
// assembly
coupling_motor();
translate(v = [0, 0, 46]) mirror([ 0, 0, 1 ]) rotate ([0,0,90]) coupling_leadscrew();
translate(v = [0, 0, 24]) coupling_heart();
}
