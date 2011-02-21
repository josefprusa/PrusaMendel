// PRUSA Mendel  
// Endstop holder
// Used to attach endstops to 8mm rods
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>
module endstop(){
outer_diameter = m8_diameter/2+3.3;
screw_hole_spacing = 9; //20;

difference(){
	union(){


		translate([outer_diameter, outer_diameter, 0]) cylinder(h =12, r = outer_diameter, $fn = 20);
		translate([outer_diameter, 0, 0]) cube([15.5,outer_diameter*2,12]);
		translate([-57, 0, 0]) cube([80, 6, 12]);

		translate([outer_diameter -60, outer_diameter, 0]) cylinder(h =12, r = outer_diameter, $fn = 20);
		translate([outer_diameter-60, 0, 0]) cube([15.5,outer_diameter*2,12]);

		translate([outer_diameter-21, 0, 0]) cube([15.5,10,12]);
		
	}




	translate([9, outer_diameter/2+1, 0]) cube([18,05,20]);
	translate([outer_diameter, outer_diameter, 0]) cylinder(h =20, r = m8_diameter/2, $fn = 18);

	translate([9-60, outer_diameter/2+1, 0]) cube([24,05,20]);
	translate([outer_diameter-60, outer_diameter, 0]) cylinder(h =20, r = m8_diameter/2, $fn = 18);

	#translate([17, 17, 6+2.5]) rotate([90, 0, 0]) cylinder(h =20, r = m4_diameter/2, $fn = 10);
	translate([17-60, 17, 6]) rotate([90, 0, 0]) cylinder(h =20, r = m4_diameter/2, $fn = 10);

	//filkament drive holes
	#translate([17-50, 17, 6+2.5]) rotate([90, 0, 0]) cylinder(h =20, r = m4_diameter/2, $fn = 10);

	#translate([17-25, 17, 6-2.5]) rotate([90, 0, 0]) cylinder(h =20, r = 2.1, $fn = 10);
	translate([17-25, 3.49, 6-2.5]) rotate([90, 0, 0]) cylinder(h =3.5, r = m4_nut_radius, $fn = 6);
	
//	translate([-14, 17, 5]) rotate([90, 0, 0]) cylinder(h =20, r =m2_screw_radius, $fn = 10);
//	translate([-(14+screw_hole_spacing), 17, 5]) rotate([90, 0, 0]) cylinder(h =20, r =m2_screw_radius, $fn = 10);

}
}
endstop();
