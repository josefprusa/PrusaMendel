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
cylinder(h = 23, r=6);
translate(v = [0, 5, 11.5]) cube(size = [12,10,23], center = true);
}

// inside diameter
cylinder(h = 30, r=2.9, $fn=16);

// screw holes
rotate ([0,0,90]) translate(v = [6, 15, 6]) rotate ([90,0,0]) cylinder(h = 30, r=2.7, $fn=16);
rotate ([0,0,90]) translate(v = [6, 15, 17]) rotate ([90,0,0]) cylinder(h = 30, r=2.7, $fn=16);

//main cut
translate(v = [0, 10, 11]) cube(size = [2,20,25], center = true);

}


// not important
% cylinder(h = 30, r=2.9, $fn=16);
% rotate ([0,0,90]) translate(v = [6, 15, 6]) rotate ([90,0,0]) cylinder(h = 30, r=2.7, $fn=16);
% rotate ([0,0,90]) translate(v = [6, 15, 17]) rotate ([90,0,0]) cylinder(h = 30, r=2.7, $fn=16);
