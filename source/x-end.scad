// PRUSA Mendel  
// X-end prototype for
// GNU GPL v2
// Josef Prusa
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel
// Thanks to GregFrost for refactoring!

include <configuration.scad>
corection = 1.17; 
use <bushing.scad>
use <teardrop.scad>

axis_diameter_real=4;
axis_diameter_larger=4.5;
pressure_pad_height=1.4;
add_strenght=1;
xend_height=15.8;
xend_length=40;
solid_end_width=3;
slot_width=1;

pad_height=5.2;
pad_width=7;
pad_connector_height=3.3;
bushing_support_width=17;
rod_support_width=10;

module xend_side(closed_end=true,curved_sides=false)
{
	translate([25,0,0])
	difference ()
	{
		union()
		{
			if (curved_sides)
			{
				for (i=[0:1])
				rotate(90) 
				rotate([180*i,0,0])
				teardrop(r=xend_height/2,h=xend_length);
			}
			else
			{
				difference ()
				{
					translate([0,xend_length/2,0])
					cube([xend_height,xend_length,xend_height],center=true);
	
					for (i=[0:1])
					translate([0,xend_length/2,0])
					rotate(i*180)
					{
					translate([-12,0,2]) 
					rotate([0,25,0]) 
					cube([10,xend_length+2,20],center=true);

					translate([-13,0,0]) rotate(a=[0,-10,0]) 
					cube([10,xend_length+2,20],center=true);
					}

//					mirror() translate(v = [-12,0,2]) rotate(a=[0,25,0]) translate(v = [0,-3.5,0]) 
//					cube(size = [10,13,20], center = true);


//					mirror() translate(v = [-13,0,]) rotate(a=[0,-10,0]) 
//					translate(v = [0,-3.5,0]) 
//					cube(size = [10,13,20], center = true);
				}
			}

			translate([-26,xend_length-bushing_support_width,-xend_height/2])
			cube([26,bushing_support_width,xend_height]);

			translate([-26,0,-xend_height/2])
			cube([26,rod_support_width,xend_height]);
		}

		difference ()
		{
			union ()
			{
			translate([0,xend_length-3,0])
			rotate([90,180,0]) mirror([1,0,0]) padded_teardrop(
				r=axis_diameter_real,
				h=xend_length-6,
				internal_offset=closed_end?0:10
				);

			}


		}

	}
}
//xend_side();
module xend(closed_end=true)
{
	
	if(linear==1) z_linear_bearings();
	if(linear==0) z_bushings();	
difference()
	{
		union ()
		{
			translate(v = [0,-25,xend_height/2])
			{
				xend_side(closed_end=closed_end,curved_sides=0);
				mirror([1,0,0]) xend_side(closed_end=closed_end,curved_sides=0);
			}	


			//Nut Trap
			translate([0,-20,0]) //
			cylinder(h=40,r=m8_nut_diameter/2+thin_wall*corection,$fn=6);
		}

		// Slider cutout.
		translate([0,10,32.5]) 
		cube([22.5,22.5,70],center=true);

		//Rod hole.
		difference()
		{
			translate([0,-20,39.5]) 
			cylinder(h=90,r=m8_nut_diameter/2,$fn=6,center=true);
			translate([0,-20,8.5]) 
			cylinder(h=4,r=m8_nut_diameter/2+thin_wall,$fn=6,center=true);
		}
		translate([0,-20,52]) 
		cylinder(h=90,r=m8_diameter/2,$fn=9,center=true);
	}
}

module xendcorners(dia1, dia2, dia3, dia4, height=0)
{
	translate(v = [0,35,24.5]) 
	union()
	{ 
		//round corners
		translate(v = [33.1, -60.1, -25]) rotate(a=[0,0,90]) roundcorner(dia1);
		translate(v = [33.1, -19.9, -25]) rotate(a=[0,0,-180]) roundcorner(dia2);
		translate(v = [-33.1,-60.1,-25]) rotate(a=[0,0,0]) roundcorner(dia3);
		translate(v = [-33.1, -19.9, -25]) rotate(a=[0,0,-90]) roundcorner(dia4);
	}
}
//xendcorners(5,5,5,5,0);
//difference(){
xend(true);
//translate(v = [15, -40, 0]) cube(size = [20,100,20]);

//translate(v = [-15-20, -40, 0]) cube(size = [20,100,20]);

//translate(v = [-50, -45, 0]) cube(size = [100,40,100]);
//}
//xend_side();
