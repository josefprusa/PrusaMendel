// PRUSA Mendel  
// X-end with NEMA 17 motor mount
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>


translate(v = [0,17,24.5]) union(){
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



//nema17 connector
translate(v = [0, 0, -12]) difference(){
union(){
translate(v = [21, -22.5, 25.5]) cube(size = [28,5,24], center = true);
translate(v = [32.5, 2, 15.5]) cube(size = [5,54,56], center = true);
translate(v = [22.5, 2, -11]) cube(size = [20,54,3], center = true);}


translate(v = [32.5, 7, 23.5]) rotate(a=[0,90,0]) rotate(a=[0,0,30]) cylinder(h = 80, r=12, $fn=20, center=true);

translate(v = [32.5, 7+15.5, 23.5+15.5-3]) cube(size = [20,3.5,8], center = true);
translate(v = [32.5, 7-15.5, 23.5+15.5-3]) cube(size = [20,3.5,8], center = true);
translate(v = [32.5, 7+15.5, 23.5-15.5+3]) cube(size = [20,3.5,8], center = true);
translate(v = [32.5, 7-15.5, 23.5-15.5+3]) cube(size = [20,3.5,8], center = true);}}
