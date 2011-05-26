// PRUSA Mendel  
// Z motor mount
// Used for mounting Z motors
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel
include <configuration.scad>

/**
 * @id z-motor-mount
 * @name Z motor mount
 * @category Printed
 * @using 2 m3x25
 * @using 2 m3nut
 * @using 2 m3washer
 * @using 2 m8nut
 * @using 2 m8washer
 */
 
module zmotormount(){
difference(){
union(){
translate(v=[2.5,0,0]) cube(size = [55,60,16], center = true);
translate(v=[2.5,0,-4]) cube(size = [55,74.5,8], center = true);
translate(v=[-25,29.25,0]) rotate(a=[0,90,0]) cylinder(h = 55, r=8, $fn=30);
translate(v=[-25,-29.25,0]) rotate(a=[0,90,0]) cylinder(h = 55, r=8, $fn=30);
}
translate(v=[-2.1,0,3.1]) cube(size = [46,43,10], center = true);

// Nema 17
rotate ([0,0,45]) translate([20,0,0]) cube(size = [9,3.2,25], center = true);
rotate ([0,0,-45]) translate([20,0,0]) cube(size = [9,3.2,25], center = true);
rotate ([0,0,135]) translate([20,0,0]) cube(size = [9,3.2,25], center = true);
rotate ([0,0,-135]) translate([20,0,0]) cube(size = [9,3.2,25], center = true);
translate(v=[0,0,-10])cylinder(h = 20, r=13);

translate(v=[30,0,-10]) cylinder(h = 20, r=4.2);
translate(v=[-26,29.25,0]) rotate(a=[0,90,0]) cylinder(h = 58, r=m8_diameter/2);
translate(v=[-26,-29.25,0]) rotate(a=[0,90,0]) cylinder(h = 58, r=m8_diameter/2);


translate(v=[16,7,0]) rotate(a=[0,90,0]) cylinder(h = 15, r=m3_diameter/2);
translate(v=[16,-7,0]) rotate(a=[0,90,0]) cylinder(h = 15, r=m3_diameter/2);
translate(v=[0,7,0]) rotate(a=[0,90,0]) rotate(a=[0,0,30]) cylinder(h = 24, r=m3_nut_diameter/2,$fn =6);
translate(v=[0,-7,0]) rotate(a=[0,90,0]) rotate(a=[0,0,30]) cylinder(h = 24, r=m3_nut_diameter/2, $fn=6);

}
}
zmotormount();
