// PRUSA Mendel  
// X-end with NEMA 17 motor mount
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>
include <utilities.scad>
corection = 1.17; 


rod_position = x_axis_rod_position ;
rod_size = x_axis_rod_size;

rod_radius = rod_size*0.5+0.5;
motor_size = (x_axis_global_width-70)*0.5;
//nut_pos_y = 5-rod_radius;
nut_pos_x = rod_position;
max_height = max(52, x_axis_global_height);

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

				axisBase(rod_position, x_axis_global_width);
				axisHoles(rod_position, rod_radius);
				nutTraps( rod_position ) ;

				// cutOuts
				
				slider( bushing_outerDiameter, max_height, rod_position, rod_radius, 1 );
				nutTrap( z_axis_rod_size, z_axis_rod_nut, rod_position, rod_radius, corection, 1 );
		}

		slider( bushing_outerDiameter, max_height, rod_position, rod_radius );
		nutTrap( z_axis_rod_size, z_axis_rod_nut, rod_position, rod_radius, corection );


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
                translate(v = [30, 7, 23]) rotate(a=[0,90,0]){
                    rotate ([0,0,45]) translate([20,0,0]) cube(size = [9,3.2,25], center = true);
                    rotate ([0,0,-45]) translate([20,0,0]) cube(size = [9,3.2,25], center = true);
                    rotate ([0,0,135]) translate([20,0,0]) cube(size = [9,3.2,25], center = true);
                    rotate ([0,0,-135]) translate([20,0,0]) cube(size = [9,3.2,25], center = true);

                    //rotate ([0,0,135]) translate([32,0,0]) cube(size = [9,20,25], center = true);
                }
            	}
        }
    }
}
xendmotor();
//nutTrap( z_axis_rod_size, z_axis_rod_nut, rod_position, rod_radius, corection );
//slider( bushing_outerDiameter, max_height, rod_position, rod_radius );

