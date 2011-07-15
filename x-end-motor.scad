// PRUSA Mendel  
// X-end with NEMA 17 motor mount
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>
corection = 1.17; 


rod_position = x_axis_rod_position ;
rod_size = x_axis_rod_size;

rod_radius = rod_size*0.5+0.5;
x_axis_global_width_round = x_axis_global_width * 0.5 + 0.1;
motor_size = (x_axis_global_width-70)*0.5;
//nut_pos_y = 5-rod_radius;
nut_pos_x = rod_position;


/**
 * @id x-end-motor
 * @name X end motor
 * @category Printed
 * @using 2 bushing
 * @using 8 m3x10
 * @using 4 m3nut
 * @using 4 m3washer
 * @using 1 m8spring
 * @using 2 m8nut
 */


module xendmotor(){
translate(v = [0,17,24.5]) union(){
difference(){
union(){
difference(){
	translate(v = [0, -40, -16.6]) cube(size = [x_axis_global_width,40,15.8], center = true);
	translate(v = [0, -43.5, -16.6]) cube(size = [28-(25-rod_position)*2,13,50], center = true);
	translate(v = [-14+(25-rod_position), -43.5, -16.6]) scale([ 1,1,1 ]) cylinder(h = 42, r=6.5, $fn=20, center=true);
	translate(v = [14-(25-rod_position), -43.5, -16.6]) scale([ 1,1,1 ]) cylinder(h = 42, r=6.5, $fn=20, center=true);
}
//translate(v = [-25, -40, -16.6])cube(size = [20,40,15.8], center = true);
//translate(v = [25, -40, -16.6])cube(size = [20,40,15.8], center = true);
}


//holes for axis
translate(v = [-rod_position, -18-22, -16.7]) rotate(a=[90,0,0]) {
	cylinder(h = 42, r=rod_radius, $fn=20, center=true);
	translate(v = [0, rod_radius*0.5, 0]) cylinder(h = 42, r=rod_radius*0.85, $fn=6, center=true);
}
translate(v = [rod_position, -18-22, -16.7]) rotate(a=[90,0,0]) {
	cylinder(h = 42, r=rod_radius, $fn=20, center=true);
	translate(v = [0, rod_radius*0.5, 0]) cylinder(h = 42, r=rod_radius*0.85, $fn=6, center=true);
}


//nut traps
translate(v = [-nut_pos_x, -29, -19.7]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
translate(v = [-nut_pos_x, -29, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
translate(v = [nut_pos_x, -29, -19.7]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
translate(v = [nut_pos_x, -29, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);

translate(v = [-nut_pos_x, -50, -19.7]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
translate(v = [-nut_pos_x, -50, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
translate(v = [nut_pos_x, -50, -19.7]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
translate(v = [nut_pos_x, -50, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);

//round corners
translate(v = [x_axis_global_width_round, -60.1, -25]) rotate(a=[0,0,90]) roundcorner(round_corner_diameter);
translate(v = [-x_axis_global_width_round, -60.1, -25]) rotate(a=[0,0,0]) roundcorner(round_corner_diameter);
translate(v = [-x_axis_global_width_round, -19.9, -25]) rotate(a=[0,0,-90]) roundcorner(round_corner_diameter);

//slider cutouts
translate(v = [0, -25, 15]) 
	difference(){
	translate(v = [0, -0, -14.5])cube(size = [23,23,60], center = true);
	}
//nut trap
translate(v = [0, -55, 15]) {
	difference(){
	translate(v = [0, -0, -15])cylinder(h = 50, r=m8_nut_diameter/2+thin_wall, $fn=6, center=true);
	}
}
}

//slider
translate(v = [0, -25, 15]) 
	difference(){
union(){
	translate(v = [0, -3.5, -7-(65-x_axis_global_height)*0.5]) cube(size = [17+2*thin_wall+2,17,x_axis_global_height], center = true);

	//translate(v = [0, -3.5, -31.6]) cube(size = [30,17,15.8], center = true);
}
	translate(v = [0, -0, -7])cube(size = [17,17,x_axis_global_height*2], center = true);
}

//nut trap
translate(v = [0, -55, 15]) {
difference(){
	union(){difference(){
union(){
	translate(v = [0, -0, -19.5])cylinder(h = 40, r=m8_nut_diameter/2+thin_wall*corection, $fn=6, center=true);
	//translate(v = [0, 0, -31.6]) cube(size = [30,10,15.8], center = true);
}
	cylinder(h = 90, r=m8_nut_diameter/2, $fn=6, center=true);
	}
	translate(v = [0, 0, -31]) cylinder(h = 4, r=m8_nut_diameter/2+thin_wall, $fn=6, center=true);}
	translate(v = [0, 0, 12.5]) cylinder(h = 90, r=m8_diameter/2, $fn=9, center=true);
}
}


//nema17 connector
translate(v = [motor_size, 0, -12]) difference(){
union(){
translate(v = [21-motor_size*0.5, -22.5, 36.5]) cube(size = [24+motor_size,5,6], center = true);
difference(){
	translate(v = [32.5, 2, 13.5]) cube(size = [5,54,52], center = true);
	translate([60, 29.5, 40]) rotate ([0,90,180]) roundcorner(round_corner_diameter);
}
translate(v = [21-motor_size*0.5, 2, -11]) cube(size = [20+motor_size,54,3], center = true);
}

// some reduction of bottom part 
translate(v = [15, 15, -11]) rotate ([0,0,-17]) scale ([1,5,1]) cube(size = [20,70,25], center = true);

translate(v = [0, 0, -4.7]){
	translate(v = [32.5, 7, 23.5]) rotate(a=[0,90,0]) rotate(a=[0,0,30]) cylinder(h = 10, r=12, $fn=20, center=true);

translate(v = [30, 7, 23]) rotate(a=[0,90,0]){rotate ([0,0,45]) translate([20,0,0]) cube(size = [9,3.2,25], center = true);
rotate ([0,0,-45]) translate([20,0,0]) cube(size = [9,3.2,25], center = true);
rotate ([0,0,135]) translate([20,0,0]) cube(size = [9,3.2,25], center = true);
rotate ([0,0,-135]) translate([20,0,0]) cube(size = [9,3.2,25], center = true);

//rotate ([0,0,135]) translate([32,0,0]) cube(size = [9,20,25], center = true);

}
}
}}
}
xendmotor();


