// PRUSA Mendel  
// Z motor mount
// Used for mounting Z motors
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

difference() {
	// body
	union() {
		translate(v=[2.5,0,0])
			cube(size = [55,60,16], center = true);
		translate(v=[2.5,0,-4])
			cube(size = [55,76,8], center = true);
		translate(v=[-25,30,0])
			rotate(a=[0,90,0])
				cylinder(h = 55, r=8, $fn=30);
		translate(v=[-25,-30,0])
			rotate(a=[0,90,0])
				cylinder(h = 55, r=8, $fn=30);
	}

	// NEMA17 motor mount socket
	translate(v=[-2.6, 0, 3.6])
		cube(size = [47,43,11], center = true);
	// NEMA17 motor mount screw holes
	translate(v=[15,15,0])
		cube(size = [9,3.2,25], center = true);
	translate(v=[-15,15,0])
		cube(size = [9,3.2,25], center = true);
	translate(v=[15,-15,0])
		cube(size = [9,3.2,25], center = true);
	translate(v=[-15,-15,0])
		cube(size = [9,3.2,25], center = true);
	// NEMA17 motor mount shaft hole
	translate(v=[0,0,-20])
		cylinder(h = 100, r=15);

	// top rod holes
	translate(v=[-50,30,0])
		rotate(a=[0,90,0])
			cylinder(h = 100, r=4.5);
	translate(v=[-50,-30,0])
		rotate(a=[0,90,0])
			cylinder(h = 100, r=4.5);

	// Z bar socket
		translate(v=[30,0,-20])
			cylinder(h = 100, r=4.2);
			
	// Z bar clamp screw holes
	translate(v=[0,7,0])
		rotate(a=[0,90,0])
			cylinder(h = 100, r=2.2);
	translate(v=[0,-7,0])
		rotate(a=[0,90,0])
			cylinder(h = 100, r=2.2);

	// Z bar clamp nut traps
	translate(v=[0,7,0])
		rotate(a=[0,90,0])
			rotate(a=[0,0,30])
				cylinder(h = 24, r=4,$fn =6);
	translate(v=[0,-7,0])
		rotate(a=[0,90,0])
			rotate(a=[0,0,30])
				cylinder(h = 24, r=4, $fn=6);
}
