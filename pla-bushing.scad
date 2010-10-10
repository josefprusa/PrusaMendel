// PRUSA Mendel  
// Bushings
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

// Print them in PLA and glue them to place
// if they are too tight, define bigger rodsize
// or you can try to sand a bt off


rodsize = 8;
outerDiameter = 16;
lenght = 11;

module bushing(){

union(){
difference(){
union(){
translate(v=[0,-outerDiameter/4,lenght/2]) cube(size = [outerDiameter, outerDiameter/2,lenght], center = true);
//translate(v=[0,-outerDiameter/4-1,0.5]) cube(size = [outerDiameter+4, outerDiameter/2+2,1], center = true);
}

translate(v=[0,0,-1]) cylinder(h = lenght+2, r=(outerDiameter/2)-2);
}
rotate(a=[0,0,45])
difference(){
union(){
//outer ring
difference(){
union(){
cylinder(h = lenght, r=outerDiameter/2); //1mm lemování
//cylinder(h = 1, r=outerDiameter/2+2);
}
translate(v=[0,0,-1]) cylinder(h = lenght+2, r=(outerDiameter/2)-2);
}

//nipples inside touching the rod
difference(){
	union(){
		translate(v=[0,0,lenght/2]) cube(size = [outerDiameter-1,2,lenght], center = true);
		translate(v=[0,0,lenght/2]) cube(size = [2,outerDiameter-1,lenght], center = true);
	}
	translate(v=[0,0,-1]) cylinder(h = lenght+2, r=rodsize/2, $fn=20);
}
}
//opening cutout
translate(v=[(outerDiameter/2)+1,(outerDiameter/2)+1,(lenght)/2]) cube(size = [outerDiameter,outerDiameter,lenght+2], center = true);
}}
}

union(){
translate(v=[(rodsize+1),(rodsize+1),0]) bushing();
translate(v=[-(rodsize+1),(rodsize+1),0]) bushing();
translate(v=[(rodsize+1),-(rodsize+1),0]) mirror([ 0, 1, 0 ]) bushing();
translate(v=[-(rodsize+1),-(rodsize+1),0]) mirror([ 0, 1, 0 ]) bushing();
}