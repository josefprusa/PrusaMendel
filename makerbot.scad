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
for(i = [0:x]){
	translate([2*i,0,0.3]) cube([1,y,1],center=true);
	translate([-2*i,0,0.3]) cube([1,y,1],center=true);
//	translate([0,-2*i,0.3]) cube([100,0.3,0.6],center=true);
//	translate([2*i,0,0.9]) cube([0.6,100,0.3],center=true);
//	translate([-2*i,0,0.9]) cube([0.6,100,0.3],center=true);
}
}
module interface(){
intersection(){
translate([0,0,0]) rotate([0,0,0]) import_stl("frame-vertex-foot.stl");
translate([0,0,0]) grid(10,80);
}
}

module mbplate1(){
translate([0,0,0]) rotate([0,0,0]) union(){

//translate([39,35,0]) xcarriage();
//translate([38,128,0]) xendmotor();
//translate([17,163,0]) rotate(90,0,0) xendidler();
//translate([87,103,30]) rotate([0,90,0]) zmotormount();
//translate([105,75,30]) rotate([0,90,0]) zmotormount();
//translate([87,35,0]) rotate([0,0,90]) import_stl("coupling.stl");
translate([90,82,0]) rotate([0,0,0]) import_stl("coupling.stl");
//translate([168,92,0]) rotate([0,-90,0]) import_stl("y-motor-bracket_1off.stl");
translate([16,3,0]) rotate([0,0,90]) import_stl("bar-clamp.stl");
translate([16,50,0]) rotate([0,0,90]) import_stl("bar-clamp.stl");
translate([1.5,78,0]) rotate([0,0,0]) import_stl("bar-clamp.stl");
translate([27,81,0]) rotate([0,0,0]) import_stl("bar-clamp.stl");
translate([53,81,0]) rotate([0,0,0]) import_stl("bar-clamp.stl"); 
//translate([173,114,0]) rotate([0,0,0]) import_stl("bar-clamp.stl");
//translate([173,97,0]) rotate([0,0,0]) import_stl("bar-clamp.stl");
//translate([173,80,0]) rotate([0,0,0]) import_stl("bar-clamp.stl");
//translate([197,31,10]) rotate([0,90,90]) shortclamp();
//translate([95,32,10]) rotate([0,90,90]) shortclamp();
//translate([3,72,0]) rotate([0,0,0]) import_stl("belt-clamp.stl");
//translate([30,16,0]) rotate([0,0,0]) import_stl("belt-clamp.stl");
//translate([50,72,0]) rotate([0,0,0]) import_stl("belt-clamp.stl");
//translate([75,170,0]) rotate([0,0,0]) import_stl("belt-clamp.stl");
translate([58,19,0]) rotate([0,0,-90]) import_stl("frame-vertex-foot.stl");
translate([58,60,0]) rotate([0,0,90]) import_stl("frame-vertex-foot.stl");
translate([58,19,13.4]) rotate([0,0,-90]) import_stl("frame-vertex-foot.stl");
translate([58,19,13]) rotate([0,0,-90]) interface();
translate([58,60,13.4]) rotate([0,0,90]) import_stl("frame-vertex-foot.stl");
translate([58,60,13]) rotate([0,0,90])  interface();
translate([58,60,40.2]) rotate([0,0,90]) import_stl("frame-vertex-foot.stl");
translate([58,60,39.8]) rotate([0,0,90])  interface();
translate([58,60,26.8]) rotate([0,0,90]) import_stl("frame-vertex-foot.stl");
translate([58,60,26.4]) rotate([0,0,90])  interface();
//translate([95,2,0]) rotate([0,0,0]) import_stl("endstop-holder.stl");
//translate([80,198,0]) rotate([0,0,180]) import_stl("endstop-holder.stl"); 
//translate([99,182,0]) rotate([0,0,0]) import_stl("endstop-holder.stl");
translate([48,30,0]) rotate([0,0,0]) import_stl("pulley.stl");
translate([2,29,0]) rotate([0,0,0]) import_stl("pulley.stl");
//translate([137,190,0.5]) rotate([0,0,90]) import_stl("prusalogo.stl");
}
}

module mbplate2(){
translate([0,0,0]) rotate([0,0,0]) union(){

translate([39,36,0]) xcarriage();
//translate([38,128,0]) xendmotor();
//translate([17,163,0]) rotate(90,0,0) xendidler();
//translate([87,103,30]) rotate([0,90,90]) zmotormount();
//translate([105,75,30]) rotate([0,90,0]) zmotormount();
translate([87,35,0]) rotate([0,0,90]) import_stl("coupling.stl");
//translate([168,92,0]) rotate([0,-90,0]) import_stl("y-motor-bracket_1off.stl");
translate([25,17,0]) rotate([0,0,0]) import_stl("bar-clamp.stl");
//translate([25,71,0]) rotate([0,0,90]) import_stl("bar-clamp.stl");
//translate([173,80,0]) rotate([0,0,0]) import_stl("bar-clamp.stl");
translate([45,47,10]) rotate([0,90,0]) shortclamp();
//translate([124,32,10]) rotate([0,90,90]) shortclamp();
translate([83,74,0]) rotate([0,0,90]) import_stl("belt-clamp.stl");
translate([95,64,0]) rotate([0,0,90]) import_stl("belt-clamp.stl");
translate([28,34,0]) rotate([0,0,0]) import_stl("belt-clamp.stl");
translate([71,74,0]) rotate([0,0,90]) import_stl("belt-clamp.stl");
translate([23.5,73,0]) rotate([0,0,0]) import_stl("endstop-holder.stl");
translate([24,95,0]) rotate([0,0,180]) import_stl("endstop-holder.stl"); 
//translate([99,182,0]) rotate([0,0,0]) import_stl("endstop-holder.stl");
//translate([137,190,0.5]) rotate([0,0,90]) import_stl("prusalogo.stl");
}
}
module mbplate3(){
translate([0,0,0]) rotate([0,0,0]) union(){

//translate([38,128,0]) xendmotor();
translate([36,20,0]) rotate([0,0,180]) xendidler();
translate([40,67,30]) rotate([0,90,90]) zmotormount();
translate([40,86,30]) rotate([0,90,90]) zmotormount();
//translate([168,92,0]) rotate([0,-90,0]) import_stl("y-motor-bracket_1off.stl");
translate([95,71,0]) rotate([0,0,90]) import_stl("bar-clamp.stl");
translate([95,41,0]) rotate([0,0,90]) import_stl("bar-clamp.stl");
translate([100,44,10]) rotate([0,90,90]) shortclamp();
translate([75,28,0]) rotate([0,0,-90]) import_stl("endstop-holder.stl");
//translate([137,190,0.5]) rotate([0,0,0]) import_stl("prusalogo.stl");
}
}
module mbplate4(){
translate([0,0,0]) rotate([0,0,0]) union(){

translate([60,48,0]) xendmotor();
//translate([68,2,0]) rotate([0,-90,0]) import_stl("y-motor-bracket_1off.stl");
translate([15,70,0.5]) rotate([0,0,180]) import_stl("prusalogo.stl");
}
}
module mbplate5(){
translate([0,0,0]) rotate([0,0,0]) union(){

translate([45,-5,0]) rotate([0,-90,-35]) import_stl("y-motor-bracket_1off.stl");
}
}

//#translate([-49,-49,-1]) cube(size=[98,98,1]);
translate([-49,-49,0]) mbplate1();