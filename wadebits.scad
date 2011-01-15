// PRUSA Mendel  
// Parametric Wade extruder bracket based on nopheads work. Thank you mate!
// http://www.thingiverse.com/thing:3462
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel
include <configuration.scad>

long_side = 35;
short_side = 25;
corners_diameter = 3;
corn_fn = corners_diameter*5;
height= 12;
608_dia = 12;
608_height = 9;
mounting_dist_short = 13;
mounting_dist_long = 27;
mounting_dia = m4_diameter/2;

module wadeidler() {difference(){
// Main block
union(){
translate(v=[0,0,height/2]) cube(size = [long_side,short_side-2*corners_diameter,height], center = true);
translate(v=[0,0,height/2]) cube(size = [long_side-2*corners_diameter,short_side,height], center = true);

translate(v=[(long_side/2-corners_diameter),(short_side/2-corners_diameter),0])  cylinder(h = height, r=corners_diameter, $fn = corn_fn);
translate(v=[-(long_side/2-corners_diameter),(short_side/2-corners_diameter),0])  cylinder(h = height, r=corners_diameter, $fn = corn_fn);
translate(v=[(long_side/2-corners_diameter),-(short_side/2-corners_diameter),0])  cylinder(h = height, r=corners_diameter, $fn = corn_fn);
translate(v=[-(long_side/2-corners_diameter),-(short_side/2-corners_diameter),0])  cylinder(h = height, r=corners_diameter, $fn = corn_fn);
}

// bearing cutout
translate(v=[0,0,height-2]){
	rotate(a=[90,0,0]) cylinder(h = 608_height, r=608_dia, center=true);
	rotate(a=[90,0,0]) cylinder(h = short_side-2, r=m8_diameter/2, center=true);
}

//mounting holes
translate(v=[mounting_dist_long/2,mounting_dist_short/2,0]) cylinder(h = height*2.1, r=mounting_dia, center=true,$fn = corn_fn);
translate(v=[-mounting_dist_long/2,mounting_dist_short/2,0]) cylinder(h = height*2.1, r=mounting_dia, center=true,$fn = corn_fn);
translate(v=[mounting_dist_long/2,-mounting_dist_short/2,0]) cylinder(h = height*2.1, r=mounting_dia, center=true,$fn = corn_fn);
translate(v=[-mounting_dist_long/2,-mounting_dist_short/2,0]) cylinder(h = height*2.1, r=mounting_dia, center=true,$fn = corn_fn);
}
}
use <inc/mendel_misc.inc>
use <inc/parametric_involute_gear_v5.0.scad>


module WadesL(){
	//Large WADE's Gear
	//rotate([0,0,-2])translate([0,0,0])color([ 100/255, 255/255, 200/255])import_stl("39t17p.stl");
	difference(){
		gear (number_of_teeth=39,
			circular_pitch=268,
			gear_thickness = 5,
			rim_thickness = 7,
			rim_width = 3,
			hub_thickness = 13,
			hub_diameter = 25,
			bore_diameter = 8,
			circles=0);
		translate([0,0,6])rotate([180,0,0])m8_hole_vert_with_hex(100);
	}
}

module WadesS(){
	//small WADE's Gear
	//rotate([180,0,-23.5])translate([-10,-10,-18])color([ 100/255, 255/255, 200/255])import_stl("wades_gear.stl");
	difference(){
		gear (number_of_teeth=11,
			circular_pitch=268,
			gear_thickness = 9,
			rim_thickness = 9,
			hub_thickness = 18,
			hub_diameter = 20,
			bore_diameter = 5,
			circles=0);
		translate([0,-5,16])cube([5.5,2.3,9],center = true);
		translate([0,0,14])rotate([0,90,-90])cylinder(r=1.7,h=20);
	}
}
translate([62,40,0]) WadesL(); //this module call will make the large gear
translate([15,60,0]) WadesS(); //this module call will make the small gear
translate([16.5,22])rotate([0,0,90])wadeidler();
%cube([98,85,0.01],center=true);

