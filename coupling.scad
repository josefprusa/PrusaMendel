// PRUSA Mendel  
// motor/leadscrew coupling
// Used for connecting motor to leadscrew
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

difference(){

union(){
cylinder(h = 30, r=7);
translate(v = [0, 6, 15]) cube(size = [14,12,30], center = true);
}

// inside diameter
translate(v = [0, 0, -1])cylinder(h = 16, r=4.3, $fn=16);
translate(v = [0, 0, 14.5])cylinder(h = 16, r=2.9, $fn=16);

// screw holes
rotate ([0,0,90]) translate(v = [7, 15, 7.5]) rotate ([90,0,0]) cylinder(h = 30, r=2.7, $fn=16);
rotate ([0,0,90]) translate(v = [7, 15, 22.5]) rotate ([90,0,0]) cylinder(h = 30, r=2.7, $fn=16);

//main cut
translate(v = [0, 10, 14]) cube(size = [2,20,35], center = true);

//difference cut
translate(v = [0, 7, 15])  cube(size = [20,8,1], center = true);
}


// not important
% cylinder(h = 30, r=2.9, $fn=16);
% rotate ([0,0,90]) translate(v = [7, 15, 7.5]) rotate ([90,0,0]) cylinder(h = 30, r=2.7, $fn=16);
% rotate ([0,0,90]) translate(v = [7, 15, 22.5]) rotate ([90,0,0]) cylinder(h = 30, r=2.7, $fn=16);
