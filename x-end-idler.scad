// PRUSA Mendel  
// X-end with idler mount
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>
include <utilities.scad>
corection = 1.17; 


rod_position =  x_axis_rod_position ;
rod_size =  x_axis_rod_size;

rod_radius = rod_size*0.5+0.5;
x_axis_global_width_round = x_axis_global_width * 0.5 + 0.1;
motor_size = (x_axis_global_width-70)*0.5;
//nut_pos_y = 5-rod_radius;
nut_pos_x = rod_position;


/**
 * @id x-end-idler
 * @name X end idler
 * @category Printed
 * @using 2 bushing
 * @using 1 m8spring
 * @using 2 m8nut
 */ 

module xendidler(){
	difference(){
		translate(v = [0,35,24.5]) union(){ 

			difference()
			{

				axisBase(rod_position, x_axis_global_width, 1, 1, 0, 0);
				axisHoles(rod_position, rod_radius);
				nutTraps( rod_position ) ;

				// cutOuts
				slider( bushing_outerDiameter, x_axis_global_height, rod_position, rod_radius, 1 );
				nutTrap( z_axis_rod_size, z_axis_rod_nut, rod_position, rod_radius, corection, 1 );
			}
			slider( bushing_outerDiameter, x_axis_global_height, rod_position, rod_radius );
			nutTrap( z_axis_rod_size, z_axis_rod_nut, rod_position, rod_radius, corection );


			//idler wheel connector
			mirror(){
				difference(){
				   translate(v = [0, -35, -12]) difference(){
					union(){
						translate(v = [21+motor_size, -21.5, 25.3]) cube(size = [25.5,7,4.4], center = true);
						translate(v = [21+motor_size, 12.5, 25.3]) cube(size = [24,5,4.4], center = true);
						translate(v = [32.5+motor_size, -5, 12.5]) cube(size = [5,40,30], center = true);
					}
					translate(v = [32.5, -6, 28-3-4.7]) rotate(a=[0,90,0]) cylinder(h = 90, r=m8_diameter/2, $fn=9, center=true);
					//translate(v = [35.1,-25.1,-5]) rotate(a=[0,0,90]) roundcorner(3);
					//translate(v = [-35.1, -19.9, -25]) rotate(a=[0,0,-90]) roundcorner(3);
				   }
				   slider( bushing_outerDiameter, x_axis_global_height, rod_position, rod_radius, 1 );
				   nutTrap( z_axis_rod_size, z_axis_rod_nut, rod_position, rod_radius, corection, 1 );
				   axisHoles(rod_position, rod_radius);
				}

			}
		}

		//two more rounded corners
		translate(v = [-35.1-motor_size,-25.1,-5]) rotate(a=[0,0,0]) roundcorner(5);
		translate(v = [-35.1-motor_size, +15.1, -5]) rotate(a=[0,0,-90]) roundcorner(5);
		

	}
}
xendidler();


