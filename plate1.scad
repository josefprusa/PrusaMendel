include <configuration.scad>
bfb = false;
orientation = true;
module xcarriage(){
translate(v = [0,0,2.5]) union(){difference(){
	union(){
		//Base block
			cube(size = [70,70,5], center = true);
		//Nut holder base - extruder
			if(orientation) translate(v = [0, 0, 1]) cube(size = [12,70,7], center = true);
			if(orientation == false) translate(v = [0, 0, 1]) cube(size = [70,12,7], center = true);

		//Nut holder base - belt clamps
		translate(v = [33, -18, 1]) cube(size = [45,15,7], center = true);
		translate(v = [33, 18, 1]) cube(size = [45,15,7], center = true);

		//Bushing holder
		translate(v = [-25, 30, 5])cube(size = [26,10,15], center = true);
		translate(v = [-25, -30, 5])cube(size = [26,10,15], center = true);
		translate(v = [25, -30, 5])cube(size = [26,10,15], center = true);
		translate(v = [25, 30, 5])cube(size = [26,10,15], center = true);
		
		// fan holder
		translate(v = [-25, 20, 2])  cube(size = [20,10,9], center = true);
		translate(v = [-25, -20, 2]) cube(size = [20,10,9], center = true);

	}
	//main cutout
	if(orientation) translate(v = [0, -5, 2]) cube(size = [30,30,20], center = true);
	if(orientation == false) cube(size = [30,50,20], center = true);
	translate(v = [-12.5,0,0]) cube(size = [5,50,20], center = true);

	translate(v = [25, 30.4, 12]) rotate(a=[90,0,0]) cylinder(h = 11, r=18/2, $fn=12, center=true);
	translate(v = [25, 30.4, 7.5])cube(size = [18,11,9], center = true);
	translate(v = [-25, 30.4, 12]) rotate(a=[90,0,0]) cylinder(h = 11, r=18/2, $fn=12, center=true);
	translate(v = [-25, 30.4, 7.5])cube(size = [18,11,9], center = true);
	translate(v = [25, -30.4, 12]) rotate(a=[90,0,0]) cylinder(h = 11, r=18/2, $fn=12, center=true);
	translate(v = [25, -30.4, 7.5])cube(size = [18,11,9], center = true);
	translate(v = [-25, -30.4, 12]) rotate(a=[90,0,0]) cylinder(h = 11, r=18/2, $fn=12, center=true);
	translate(v = [-25, -30.4, 7.5])cube(size = [18,11,9], center = true);

	// holes for connecting extruder
		if(orientation) translate(v = [0, 0, 0]) {
		translate(v = [0, -30, 12]) cylinder(h = 80, r=m4_diameter/2, $fn=9, center=true);
		translate(v = [0, -30, 5]) cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);
		translate(v = [0, 20, ]) cylinder(h = 20, r=m4_diameter/2, $fn=9, center=true);
		translate(v = [0, 20, 5]) cylinder(h = 9, r=4.5, $fn=6, center=true);
		}
	
		if(orientation == false) {
		translate(v = [-25, 0, 12]) cylinder(h = 80, r=m4_diameter/2, $fn=9, center=true);
		translate(v = [-25, 0, 5]) cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);
		translate(v = [25, 0, ]) cylinder(h = 20, r=m4_diameter/2, $fn=9, center=true);
		translate(v = [25, 0, 5]) cylinder(h = 9, r=4.5, $fn=6, center=true);
		}

	translate(v = [30, -18, 12]) cylinder(h = 80, r=m4_diameter/2, $fn=9, center=true);
	translate(v = [30, -18, 5]) cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);
	translate(v = [48, -18, 12]) cylinder(h = 80, r=m4_diameter/2, $fn=9, center=true);
	translate(v = [48, -18, 5]) cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);

	translate(v = [30, 18, 12]) cylinder(h = 80, r=m4_diameter/2, $fn=9, center=true);
	translate(v = [30, 18, 5]) cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);
	translate(v = [48, 18, 12]) cylinder(h = 80, r=m4_diameter/2, $fn=9, center=true);
	translate(v = [48, 18, 5]) cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);


		translate(v = [-25, -20, 2.5]) rotate(a=[0,90,0]) cylinder(h = 30, r=m4_diameter/2, $fn=10, center=true);

		translate(v = [-25, 20, 2.5]) rotate(a=[0,90,0]) cylinder(h = 30, r=m4_diameter/2, $fn=10, center=true);

if(bfb) if(orientation == false) cylinder(h = 40, r=21, $fn=20, center=true);
if(bfb) if(orientation) translate(v = [0, -5, 0]) cylinder(h = 40, r=21, $fn=20, center=true);
}//
%translate(v = [-45, -25, -2.5]) cube(size=[10,50,50]);
//translate(v = [10, -25, 9]) %cube(size=[50,50,14]);
}
}

module xendmotor(){
translate(v = [0,17,24.5]) union(){
difference(){
union(){
//translate(v = [0, -25, 0]) cube(size = [70,70,5], center = true);
translate(v = [0, -25, 0])translate(v = [-25, 0, -16.6])cube(size = [20,70,15.8], center = true);
translate(v = [0, -25, 0])translate(v = [25, 0, -16.6])cube(size = [20,70,15.8], center = true);
}
translate(v = [0, 0, -15])cube(size = [80,40,50], center = true);

//nut traps

translate(v = [-25, -29, -19.7]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
translate(v = [-25, -29, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
translate(v = [25, -29, -19.7]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
translate(v = [25, -29, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);

translate(v = [-25, -50, -19.7]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
translate(v = [-25, -50, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
translate(v = [25, -50, -19.7]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
translate(v = [25, -50, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);

//holes for axis
translate(v = [-25, -18, -16.7]) rotate(a=[90,0,0]) {
	cylinder(h = 120, r=4.5, $fn=20, center=true);
	translate(v = [0, 2.60, 0]) rotate(a=[0,0,0]) cylinder(h = 120, r=3.65, $fn=6, center=true);
}
translate(v = [25, -18, -16.7]) rotate(a=[90,0,0]) {
	cylinder(h = 120, r=4.5, $fn=20, center=true);
	translate(v = [0, 2.60, 0]) rotate(a=[0,0,0]) cylinder(h = 120, r=3.65, $fn=6, center=true);
}
//slider cutouts
translate(v = [0, -25, 15]) 
	difference(){
	translate(v = [0, -0, -14.5])cube(size = [23,23,50], center = true);
	}
//nut trap
translate(v = [0, -55, 15]) {
	difference(){
	translate(v = [0, -0, -15])cylinder(h = 50, r=12, $fn=6, center=true);
	}
}
}

//slider
translate(v = [0, -25, 15]) 
	difference(){
union(){
	translate(v = [0, -3.5, -7])cube(size = [24,17,65], center = true);

	translate(v = [0, -3.5, -31.65]) cube(size = [35,17,15.8], center = true);}
	translate(v = [0, -0, -7])cube(size = [17,17,70], center = true);}

//nut trap
translate(v = [0, -55, 15]) {
difference(){
	union(){difference(){
union(){
	translate(v = [0, -0, -19.5])cylinder(h = 40, r=12, $fn=6, center=true);
	translate(v = [0, 0, -31.65]) cube(size = [35,10,15.8], center = true);}
	cylinder(h = 90, r=m8_nut_diameter/2, $fn=6, center=true);
	}
	translate(v = [0, 0, -31]) cylinder(h = 4, r=11, $fn=6, center=true);}
	translate(v = [0, 0, 12.5]) cylinder(h = 90, r=m8_diameter/2, $fn=9, center=true);
}
}


//nema17 connector
translate(v = [0, 0, -12]) difference(){
union(){
translate(v = [21, -22.5, 36.5]) cube(size = [24,5,6], center = true);
translate(v = [32.5, 2, 13.5]) cube(size = [5,54,52], center = true);
translate(v = [22.5, 2, -11]) cube(size = [20,54,3], center = true);}

translate(v = [0, 0, -4.7]){
	translate(v = [32.5, 7, 23.5]) rotate(a=[0,90,0]) rotate(a=[0,0,30]) cylinder(h = 80, r=12, $fn=20, center=true);

	translate(v = [32.5, 7+15.5, 23.5+15.5-3]) cube(size = [20,3.5,8], center = true);
	translate(v = [32.5, 7-15.5, 23.5+15.5-3]) cube(size = [20,3.5,8], center = true);
	translate(v = [32.5, 7+15.5, 23.5-15.5+3]) cube(size = [20,3.5,8], center = true);
	translate(v = [32.5, 7-15.5, 23.5-15.5+3]) cube(size = [20,3.5,8], center = true);
}
}}

}

module xendidler(){
translate(v = [0,35,24.5]) union(){ 

difference(){
union(){
//translate(v = [0, -25, 0]) cube(size = [70,70,5], center = true);
translate(v = [0, -25, 0])translate(v = [-25, 0, -16.6])cube(size = [20,70,15.8], center = true);
translate(v = [0, -25, 0])translate(v = [25, 0, -16.6])cube(size = [20,70,15.8], center = true);
}
translate(v = [0, 0, -15])cube(size = [80,40,50], center = true);

//nut traps

translate(v = [-25, -29, -19.7]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
translate(v = [-25, -29, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
translate(v = [25, -29, -19.7]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
translate(v = [25, -29, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);

translate(v = [-25, -50, -19.7]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
translate(v = [-25, -50, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
translate(v = [25, -50, -19.7]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
translate(v = [25, -50, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);

//holes for axis
translate(v = [-25, -18, -16.7]) rotate(a=[90,0,0]) {
	cylinder(h = 120, r=4.5, $fn=20, center=true);
	translate(v = [0, 2.60, 0]) rotate(a=[0,0,0]) cylinder(h = 120, r=3.65, $fn=6, center=true);
}
translate(v = [25, -18, -16.7]) rotate(a=[90,0,0]) {
	cylinder(h = 120, r=4.5, $fn=20, center=true);
	translate(v = [0, 2.60, 0]) rotate(a=[0,0,0]) cylinder(h = 120, r=3.65, $fn=6, center=true);
}
//slider cutouts
translate(v = [0, -25, 15]) 
	difference(){
	translate(v = [0, -0, -14.5])cube(size = [23,23,50], center = true);
	}
//nut trap
translate(v = [0, -55, 15]) {
	difference(){
	translate(v = [0, -0, -15])cylinder(h = 50, r=12, $fn=6, center=true);
	}
}
}

//slider
translate(v = [0, -25, 15]) 
	difference(){
union(){
	translate(v = [0, -3.5, -7])cube(size = [24,17,65], center = true);

	translate(v = [0, -3.5, -31.65]) cube(size = [35,17,15.8], center = true);}
	translate(v = [0, -0, -7])cube(size = [17,17,70], center = true);}

//nut trap
translate(v = [0, -55, 15]) {
difference(){
	union(){difference(){
union(){
	translate(v = [0, -0, -19.5])cylinder(h = 40, r=12, $fn=6, center=true);
	translate(v = [0, 0, -31.65]) cube(size = [35,10,15.8], center = true);}
	cylinder(h = 90, r=m8_nut_diameter/2, $fn=6, center=true);
	}
	translate(v = [0, 0, -31]) cylinder(h = 4, r=11, $fn=6, center=true);}
	translate(v = [0, 0, 12.5]) cylinder(h = 90, r=m8_diameter/2, $fn=9, center=true);
}
}


//idler wheel connector
mirror(){
translate(v = [0, -35, -12]) difference(){
union(){
translate(v = [21, -23.5, 26.3]) cube(size = [24,3,2.4], center = true);
translate(v = [21, 13.5, 26.3]) cube(size = [24,3,2.4], center = true);
translate(v = [33.5, -5, 12.5]) cube(size = [3,40,30], center = true);
}

translate(v = [32.5, -6, 28-3-4.7]) rotate(a=[0,90,0]) cylinder(h = 90, r=m4_diameter/2, $fn=9, center=true);}
}}
}

module zmotormount(){
difference(){
union(){
translate(v=[2.5,0,0]) cube(size = [55,60,16], center = true);
translate(v=[2.5,0,-4]) cube(size = [55,76,8], center = true);
translate(v=[-25,30,0]) rotate(a=[0,90,0]) cylinder(h = 55, r=8, $fn=30);
translate(v=[-25,-30,0]) rotate(a=[0,90,0]) cylinder(h = 55, r=8, $fn=30);
}
translate(v=[-2.1,0,3.1]) cube(size = [46,43,10], center = true);
translate(v=[15,15,0]) cube(size = [9,3.2,25], center = true);
translate(v=[-15,15,0]) cube(size = [9,3.2,25], center = true);
translate(v=[15,-15,0]) cube(size = [9,3.2,25], center = true);
translate(v=[-15,-15,0]) cube(size = [9,3.2,25], center = true);
translate(v=[0,0,-20])cylinder(h = 100, r=15);
translate(v=[30,0,-20]) cylinder(h = 100, r=4.2);
translate(v=[-50,30,0]) rotate(a=[0,90,0]) cylinder(h = 100, r=4.5);
translate(v=[-50,-30,0]) rotate(a=[0,90,0]) cylinder(h = 100, r=4.5);


translate(v=[0,7,0]) rotate(a=[0,90,0]) cylinder(h = 100, r=2.2);
translate(v=[0,-7,0]) rotate(a=[0,90,0]) cylinder(h = 100, r=2.2);
translate(v=[0,7,0]) rotate(a=[0,90,0]) rotate(a=[0,0,30]) cylinder(h = 24, r=4,$fn =6);
translate(v=[0,-7,0]) rotate(a=[0,90,0]) rotate(a=[0,0,30]) cylinder(h = 24, r=4, $fn=6);

}
}


module shortclamp(){
difference(){
import_stl("z-bar-top-clamp_4off.stl");
translate([0,10,10]) cube([30,30,30],center=true);
translate([0,65,10]) cube([30,30,30],center=true);
translate([0,36,28]) cube([30,30,30],center=true);
translate([0,36,-12]) cube([30,30,30],center=true);
}
}



module grid(x,y){
union(){
for(i = [0:x]){
	translate([2*i,0,0.5]) cube([0.75,y,1],center=true);
	translate([-2*i,0,0.5]) cube([0.75,y,1],center=true);
	translate([0,3.5*i,1.5]) cube([y,0.75,1],center=true);
	translate([0,-3.5*i,1.5]) cube([y,0.75,1],center=true);
//	translate([2*i,0,0.9]) cube([0.6,100,0.3],center=true);
//	translate([-2*i,0,0.9]) cube([0.6,100,0.3],center=true);
}
}
}
module interface(){
intersection(){
translate([0,0,0]) rotate([0,0,0]) import_stl("frame-vertex-foot.stl");
translate([0,0,0]) grid(12,80);
}
}


translate([0,198,0]) rotate([0,0,-90]) union(){

//translate([39,35,0]) import_stl("x-carriage.stl");
translate([39,35,0]) xcarriage();
//translate([40,125,0]) import_stl("x-end-motor.stl");
translate([38,128,0]) xendmotor();
//translate([17,163,0]) rotate(90,0,0) import_stl("x-end-idler.stl");
translate([17,163,0]) rotate(90,0,0) xendidler();
//translate([90,105,30]) rotate([0,90,0]) import_stl("z-motor-mount.stl");
translate([87,103,30]) rotate([0,90,0]) zmotormount();
//translate([85,188,30]) rotate([-90,90,180]) import_stl("z-motor-mount.stl");
translate([105,75,30]) rotate([0,90,0]) zmotormount();
translate([87,35,0]) rotate([0,0,90]) import_stl("coupling.stl");
translate([100,156,0]) rotate([0,0,0]) import_stl("coupling.stl");
translate([168,92,0]) rotate([0,-90,0]) import_stl("y-motor-bracket_1off.stl");
//translate([103,25,0]) rotate([0,0,0]) import_stl("y-idler-bracket_1off.stl");
translate([27,28,0]) rotate([0,0,0]) import_stl("bar-clamp.stl");
translate([90,143,0]) rotate([0,0,90]) import_stl("bar-clamp.stl");
translate([153,183,0]) rotate([0,0,0]) import_stl("bar-clamp.stl");
translate([198,172,0]) rotate([0,0,90]) import_stl("bar-clamp.stl");
translate([120,68,0]) rotate([0,0,30]) import_stl("bar-clamp.stl"); //
translate([173,114,0]) rotate([0,0,0]) import_stl("bar-clamp.stl");
translate([173,97,0]) rotate([0,0,0]) import_stl("bar-clamp.stl");
translate([173,80,0]) rotate([0,0,0]) import_stl("bar-clamp.stl");
//translate([140,10,10]) rotate([0,90,0]) import_stl("z-bar-top-clamp_4off.stl");
//translate([160,10,10]) rotate([0,90,0]) import_stl("z-bar-top-clamp_4off.stl");
translate([197,31,10]) rotate([0,90,90]) shortclamp();
translate([150,167,10]) rotate([0,90,90]) shortclamp();
translate([3,72,0]) rotate([0,0,0]) import_stl("belt-clamp.stl");
translate([30,16,0]) rotate([0,0,0]) import_stl("belt-clamp.stl");
translate([50,72,0]) rotate([0,0,0]) import_stl("belt-clamp.stl");
translate([75,170,0]) rotate([0,0,0]) import_stl("belt-clamp.stl");
translate([158,19,0]) rotate([0,0,-90]) import_stl("frame-vertex-foot.stl");
translate([158,60,0]) rotate([0,0,90]) import_stl("frame-vertex-foot.stl");
translate([158,19,15]) rotate([0,0,-90]) import_stl("frame-vertex-foot.stl");
translate([158,19,13]) rotate([0,0,-90]) interface();
translate([158,60,15]) rotate([0,0,90]) import_stl("frame-vertex-foot.stl");
translate([158,60,13]) rotate([0,0,90])  interface();
translate([158,60,45]) rotate([0,0,90]) import_stl("frame-vertex-foot.stl");
translate([158,60,43]) rotate([0,0,90])  interface();
translate([158,60,30]) rotate([0,0,90]) import_stl("frame-vertex-foot.stl");
translate([158,60,28]) rotate([0,0,90])  interface();
translate([95,2,0]) rotate([0,0,0]) import_stl("endstop-holder.stl");
translate([80,198,0]) rotate([0,0,180]) import_stl("endstop-holder.stl"); 
translate([99,182,0]) rotate([0,0,0]) import_stl("endstop-holder.stl");
translate([128,108,0]) rotate([0,0,0]) import_stl("pulley.stl");
translate([152,82,0]) rotate([0,0,0]) import_stl("pulley.stl");
//translate([96,47,0]) rotate([0,0,0]) import_stl("pulley.stl");
translate([137,190,0.5]) rotate([0,0,90]) import_stl("prusalogo.stl");
//translate([100,10,35]) cube([200,20,10],center=true);
//translate([100,190,35]) cube([200,20,10],center=true);
}
//rotate([0,0,-90]) difference() { #translate([0,0,-1]) cube(size=[200,200,1]);
//translate([170,130,-10]) cube([30,40,20]);
//}