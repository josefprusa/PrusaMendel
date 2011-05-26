// PRUSA Mendel  
// X-end with idler mount
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>
corection = 1.17; 

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

difference(){
union(){
translate(v = [-25, -40, -16.6])cube(size = [20,40,15.8], center = true);
translate(v = [25, -40, -16.6])cube(size = [20,40,15.8], center = true);
}
//nut traps

translate(v = [-25, -29, -19.7]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
translate(v = [-25, -29, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
translate(v = [25, -29, -19.7]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
translate(v = [25, -29, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);

translate(v = [-25, -50, -19.7]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
translate(v = [-25, -50, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
translate(v = [25, -50, -19.7]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
translate(v = [25, -50, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);


//round corners
translate(v = [35.1, -60.1, -25]) rotate(a=[0,0,90]) roundcorner(round_corner_diameter);
translate(v = [35.1, -19.9, -25]) rotate(a=[0,0,-180]) roundcorner(round_corner_diameter);


//holes for axis
translate(v = [-25, -18, -16.7]) rotate(a=[90,0,0]) {
	translate(v = [0, 0, 22]) cylinder(h = 42, r=4.5, $fn=20, center=true);
	translate(v = [0, 2.60, 22]) rotate(a=[0,0,0]) cylinder(h = 42, r=3.65, $fn=6, center=true);
}
translate(v = [25, -18, -16.7]) rotate(a=[90,0,0]) {
	translate(v = [0, 0, 22]) cylinder(h = 42, r=4.5, $fn=20, center=true);
	translate(v = [0, 2.60, 22]) rotate(a=[0,0,0]) cylinder(h = 42, r=3.65, $fn=6, center=true);
}
//slider cutouts
translate(v = [0, -25, 15]) 
	difference(){
	translate(v = [0, -0, -14.5])cube(size = [23,23,50], center = true);
	}
//nut trap
translate(v = [0, -55, 15]) {
	difference(){
	translate(v = [0, -0, -15])cylinder(h = 50, r=m8_nut_diameter/2+thin_wall, $fn=6, center=true);
	}
}
}

//slider
translate(v = [0, -25, 15]) 
	difference(){
union(){
	translate(v = [0, -3.5, -7]) cube(size = [17+2*thin_wall,17,65], center = true);

	translate(v = [0, -3.5, -31.6]) cube(size = [33,17,15.8], center = true);}
	translate(v = [0, -0, -7])cube(size = [17,17,70], center = true);}

//nut trap
//correction for thin wall



translate(v = [0, -55, 15]) {
difference(){
	union(){difference(){
union(){
	translate(v = [0, -0, -19.5])cylinder(h = 40, r=m8_nut_diameter/2+thin_wall*corection, $fn=6, center=true);
	translate(v = [0, 0, -31.6]) cube(size = [35,10,15.8], center = true);}
	cylinder(h = 90, r=m8_nut_diameter/2, $fn=6, center=true);
	}
	translate(v = [0, 0, -31]) cylinder(h = 4, r=m8_nut_diameter/2+thin_wall, $fn=6, center=true);}
	translate(v = [0, 0, 12.5]) cylinder(h = 90, r=m8_diameter/2, $fn=9, center=true);
}
}


//idler wheel connector
mirror(){
translate(v = [0, -35, -12]) difference(){
union(){
translate(v = [21, -21.5, 25.3]) cube(size = [25.5,7,4.4], center = true);
translate(v = [21, 12.5, 25.3]) cube(size = [24,5,4.4], center = true);
translate(v = [32.5, -5, 12.5]) cube(size = [5,40,30], center = true);
}

translate(v = [32.5, -6, 28-3-4.7]) rotate(a=[0,90,0]) cylinder(h = 90, r=m8_diameter/2, $fn=9, center=true);
//translate(v = [35.1,-25.1,-5]) rotate(a=[0,0,90]) roundcorner(3);
//translate(v = [-35.1, -19.9, -25]) rotate(a=[0,0,-90]) roundcorner(3);

}
}}

//two more rounded corners
translate(v = [-35.1,-25.1,-5]) rotate(a=[0,0,0]) roundcorner(5);
translate(v = [-35.1, +15.1, -5]) rotate(a=[0,0,-90]) roundcorner(5);
}
}
xendidler();


