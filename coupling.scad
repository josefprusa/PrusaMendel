// PRUSA Mendel  
// motor/leadscrew coupling
// Used for connecting motor to leadscrew
// GNU GPL v2
// Josef PrÅ¯Å¡a
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel
// Some modifications from GregFrost and Auzee! Thanks guys!



include <configuration.scad>

/**
 * @name Coupling
 * @category Printed
 * @using 1 m3x25
 * @using 1 m3nut
 * @using 2 m3washer
 */
module coupling()
{
	difference()
	{
		render()
		intersection ()
		{
			union()
			{
				cylinder(h = 30, r=7);
				translate(v = [0, 6, 15]) cube(size = [14,12,30], center = true);
			}
			translate([0,0,-1])
			cylinder(r=12.3,h=32);
		}
		
		// inside diameter
		translate(v = [0, 0, -1])cylinder(h = 16, r=motor_shaft/2, $fn=16);
		translate(v = [0, 0, 14.5])cylinder(h = 16, r=m8_diameter/2, $fn=16);
		
		// screw holes
		for (hole=[-1,1])
		{
		rotate ([0,0,90]) translate(v = [6.5, 15, 15+7.5*hole]) rotate ([90,0,0]) 
		cylinder(h = 30, r=m3_diameter/2, $fn=16);
		rotate ([0,0,90]) translate(v = [6.5, 12-2, 15+7.5*hole]) rotate ([90,0,0]) 
		cylinder(h = 5, r=m3_nut_diameter/2, $fn=6);
		rotate ([0,0,90]) translate(v = [6.5, 12-14-5+2, 15+7.5*hole]) rotate ([90,0,0]) 
		cylinder(h = 5, r=m3_nut_diameter/2+0.1, $fn=16);
		}
				
		//main cut
		translate(v = [0, 10, 14]) cube(size = [2,20,35], center = true);
		
		translate(v = [0, -2, 20])  cube(size = [20,8,1], center = true);
		translate(v = [0, -2, 10])  cube(size = [20,8,1], center = true);
		//difference cut
		intersection ()
		{
		translate(v = [0, 7, 15])  cube(size = [20,8,1], center = true);
		translate([0,0,14])
		cylinder(r=11.5,h=3);
		}
	}
}

intersection()
{
	coupling();
}