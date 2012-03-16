// PRUSA Mendel  
// Coupling from nophead
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel
//
// This one is AWESOME design by NOPHEAD
// Modified to be symmetrically and have an orientation sign


include <configuration.scad>

/**
 * @id coupling
 * @name Coupling
 * @category Printed
 * @using 2 m3x20
 * @using 2 m3washer
 * @using 2 m3nut
 * @step Make sure the M3 bolts can move freely inside the round holes. If not, ream them out. 
 * @step Clean out the bridges from the couplings
 * @step Place M3 nuts in all nut traps.
 * @step Insert screws with washers on them and tighten them just a bit prior to installation.
 */

/**
 * 20mm long piece of PVC tube. 
 * 5mm inside diameter, 8mm outside diameter
 * or flexible PVC: 4mm inside diameter, 7mm outer diameter
 * This can be usually found in aquarium shops.
 * @id coupling-tube
 * @name Coupling tube
 * @category Nuts&bolts
 */

holeX = 7.5;
holeY = 6.5;

holeR = 3.4;
nutR = 3.25;
nutH = 3;
corner_cut = 26;

studding_dia = 8.0;
shaft_dia = 7.0;

module coupling(c){
    union(){
        difference(){
            cube(size = [30,25,8], center = true);

			//slot
			*cube(size = [2,40,30], center = true);

			//nut holes
			translate([ holeX,  holeY, nutH/2 - 4.01-3/2]) nut(m3_nut_diameter,3);
			translate([-holeX,  holeY, nutH/2 - 4.01-3/2]) nut(m3_nut_diameter,3);

            //shaft groves
            translate([ -16, 0, 4.5]) rotate([0,90,0]) cylinder(h = 16, r=studding_dia / 2, $fn=16);
            translate([-0.5, 0, 4.5]) rotate([0,90,0]) cylinder(h = 16, r=shaft_dia / 2,    $fn=16);

            //screw holes
            translate([ holeX,  holeY, -10]) polyhole(m3_diameter,20);
            translate([ holeX, -holeY, -10]) polyhole(m3_diameter,20);
            translate([-holeX,  holeY, -10]) polyhole(m3_diameter,20);
            translate([-holeX, -holeY, -10]) polyhole(m3_diameter,20);

            //corners
            rotate([0,0,30])   translate([corner_cut, 0, 0]) cube(size = [20,40,20], center = true);
            rotate([0,0,-30])  translate([corner_cut, 0, 0]) cube(size = [20,40,20], center = true);
            rotate([0,0,150])  translate([corner_cut, 0, 0]) cube(size = [20,40,20], center = true);
            rotate([0,0,-150]) translate([corner_cut, 0, 0]) cube(size = [20,40,20], center = true);
	
			#translate(v=[4,-4,-4]) rotate(a=90,v=[0,0,1]) scale([0.5,0.5,1]) linear_extrude(file = "this-way-up.dxf", layer = "0", height = 2, center = true, convexity = 10);
        }
        // bridge
    	translate([ holeX,  holeY, nutH-3.9]) cylinder(h = 0.4, r=nutR+0.1, $fn=6, center=true);
    	translate([-holeX,  holeY, nutH-3.9]) cylinder(h = 0.4, r=nutR+0.1, $fn=6, center=true);
    }
}

translate([0, 14, 4]) coupling(c=0);
//translate([0, -14, 4]) rotate([0,0,180]) coupling(c=1);
