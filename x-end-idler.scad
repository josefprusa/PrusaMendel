// PRUSA Mendel  
// X-end with idler mount
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

translate(v = [0,35,24.5]) union(){ 

difference(){
union(){
translate(v = [0, -25, 0]) cube(size = [70,70,5], center = true);
translate(v = [0, -25, 0])translate(v = [-25, 0, -12])cube(size = [20,70,25], center = true);
translate(v = [0, -25, 0])translate(v = [25, 0, -12])cube(size = [20,70,25], center = true);
}
translate(v = [0, 0, -15])cube(size = [80,40,40], center = true);

//nut traps

translate(v = [-25, -29, -17]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
translate(v = [-25, -29, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
translate(v = [25, -29, -17]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
translate(v = [25, -29, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);

translate(v = [-25, -50, -17]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
translate(v = [-25, -50, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
translate(v = [25, -50, -17]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
translate(v = [25, -50, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);

//holes for axis
translate(v = [-25, -18, -12]) rotate(a=[90,0,0]) {
	cylinder(h = 120, r=4.5, $fn=15, center=true);
	translate(v = [0, 2.8, 0]) rotate(a=[0,0,45]) cube(size = [5,5,120], center = true);
}
translate(v = [25, -18, -12]) rotate(a=[90,0,0]) {
	cylinder(h = 120, r=4.5, $fn=15, center=true);
	translate(v = [0, 2.8, 0]) rotate(a=[0,0,45]) cube(size = [5,5,120], center = true);
}
//slider cutouts
translate(v = [0, -25, 15]) 
	difference(){
	translate(v = [0, -0, -15])cylinder(h = 50, r=10, $fn=15, center=true);
	}
//nut trap
translate(v = [0, -55, 15]) {
	difference(){
	translate(v = [0, -0, -15])cylinder(h = 50, r=12, $fn=15, center=true);
	}
}
}

//slider
translate(v = [0, -25, 15]) 
	difference(){
union(){
	translate(v = [0, -0, -14.5])cylinder(h = 50, r=10, $fn=15, center=true);

	translate(v = [0, 0, -27.5]) cube(size = [35,10,24], center = true);}
	cylinder(h = 90, r=bushing_diameter/2, $fn=9, center=true);}

//nut trap
translate(v = [0, -55, 15]) {
difference(){
	union(){difference(){
union(){
	translate(v = [0, -0, -14.5])cylinder(h = 50, r=12, $fn=15, center=true);
	translate(v = [0, 0, -27.5]) cube(size = [35,10,24], center = true);}
	cylinder(h = 90, r=m8_nut_diameter/2, $fn=6, center=true);
	}
	translate(v = [0, 0, -31]) cube(size = [16,16,4], center = true);}
cylinder(h = 90, r=m8_diameter/2, $fn=9, center=true);
}
}


//idler wheel connector
mirror(){
translate(v = [0, -35, -12]) difference(){
union(){
translate(v = [22, -22.5, 25.5]) cube(size = [24,5,24], center = true);
translate(v = [20, 12.5, 25.5]) cube(size = [24,5,24], center = true);
translate(v = [32.5, -5, 13.5]) cube(size = [5,40,52], center = true);
}

translate(v = [32.5, -4, 28-3]) rotate(a=[0,90,0]) cylinder(h = 90, r=m4_diameter/2, $fn=9, center=true);}
}}