// PRUSA Mendel  
// Bushings
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

// Linear bushing options


lm8uu_diameter=(lme8uu==true) ? 16 : 15;
lm8uu_length=(lme8uu==true) ? 25 : 24;
lm8uu_radius = lm8uu_diameter / 2;
block_height = 2*lm8uu_length+17;

//linear_holder_base(20);
// Generates base profile for other holders and stuff
module linear_holder_base(length, bearing_diameter){
	difference(){
		union(){
		// Main block from which we cut
		translate(v=[-5,0,length/2]) cube(size = [10,20,length], center = true);
		// Adds some stuff to make snap in arms
		if(snap_in_bearings){translate(v=[0,0,0]) cylinder(h = length, r=10, $fn=60);}
		}
		// REMOVING TIME!!
		// Main cut for bearing
		translate(v=[0,0,-2]) cylinder(h = length+4, r=(bearing_diameter+0.8)/2, $fn=50);
		// Deletes some stuff to make snap in arms
		if(snap_in_bearings){
			// Creating arms
			translate(v=[10,0,length/2]) cube(size = [20,14,length+4], center = true);
			// Smooth entry cut
			translate(v=[12,0,length/2]) rotate(a=[0,0,45]) cube(size = [20,20,length+4], center = true);
		}
	}
}

//horizontal_bearing(26, 15, true, true, true, true);

module horizontal_bearing(bearing_length, bearing_diameter, lf, lb, rf, rb){
	// Lenght with added sliding preventing boxes
	actual_length = bearing_length + 4;
	// Corner cutting offset
	cutting_offset = 3;
	union(){
	difference(){
		union(){
			// Bearing holder base positioned 3 mm in the Z
			translate(v=[actual_length/2,0,10+3]) rotate(a=[0,-90,0]) linear_holder_base(actual_length, bearing_diameter);
			// Same base below 
			translate(v=[0,0,3/2]) cube(size = [actual_length,20,3], center = true);
		}
		// Cutted corners
		if(lf) translate(v=[(-actual_length/2)+cutting_offset,(10)-cutting_offset,0]) rotate(a=[0,0,-135]) rotate(a=[35,0,0]) translate(v=[0,-5,0]) cube(size = [20,10,20], center = true);
		if(lb) translate(v=[(-actual_length/2)+cutting_offset,(-10)+cutting_offset,0]) rotate(a=[0,0,-45]) rotate(a=[35,0,0]) translate(v=[0,-5,0]) cube(size = [20,10,20], center = true);//mirror([ 0, 1, 0 ]){
		mirror([ 1, 0, 0 ]){
			if(rf) translate(v=[(-actual_length/2)+cutting_offset,(10)-cutting_offset,0]) rotate(a=[0,0,-135]) rotate(a=[35,0,0]) translate(v=[0,-5,0]) cube(size = [20,10,20], center = true);
			if(rb) translate(v=[(-actual_length/2)+cutting_offset,(-10)+cutting_offset,0]) rotate(a=[0,0,-45]) rotate(a=[35,0,0]) translate(v=[0,-5,0]) cube(size = [20,10,20], center = true);//mirror([ 0, 1, 0 ]){
		}
	}
	// Slide preventing boxes
	translate(v=[1-actual_length/2,0,1.5+4]) cube(size = [2,15,3], center = true);
	translate(v=[-1+actual_length/2,0,1.5+4]) cube(size = [2,15,3], center = true);
	}
}

// Used for cutting ziptie channel for bearing holder
// EXAMPLE
//difference(){
//	horizontal_bearing(26, 15, true, true, true, true);
//	horizontal_bearing_ziptie_cutter();
//}
module horizontal_bearing_ziptie_cutter(){
	
	translate(v=[0,0,11.5]) rotate(a=[0,90,0]) difference(){
		cylinder(h = 3, r=13, center = true, $fn=60);
		cylinder(h = 5, r=10, center = true, $fn=60);
		translate(v=[-8,0,0]) cube(size = [16,30,5], center = true);
	}
}

// Generates vertical bearing holders
// vertical_bearing(25,15,3);
module vertical_bearing(bearing_length, bearing_diameter, bearing_count){
	
	// Actual length of the holder including sliding preventing blockg
	actual_length = bearing_length * bearing_count + 4 + (bearing_count-1) * 2;

	translate(v=[0,0,0]) rotate(a=[0,0,90]){
		difference(){
			linear_holder_base(actual_length, bearing_diameter);
			//translate(v=[0,0,14.5+2]) ziptie();
			//translate(v=[0,0,block_height-(12+2)-5]) ziptie();
		}
		// Slide preventing block
		for ( i = [0:bearing_count] ) {
			translate(v=[0,0,(2+bearing_length)*i]) translate(v=[-(10-5.5)/2-lm8uu_radius+2,0,1]) cube(size = [10-5.5,20,2], center = true);
		 }
	}
}

// Used for cutting ziptie grooves on vertical bearing holder.
difference(){
	vertical_bearing(25,15,3);
	vertical_bearing_ziptie_cutter(25,15,3);
}
module vertical_bearing_ziptie_cutter(bearing_length, bearing_diameter, bearing_count){
	// Slide preventing block
	for ( i = [0:bearing_count] ) {
		translate(v=[0,0,((2+bearing_length)/2)+(2+bearing_length)*i]) vertical_ziptie();
	 }
}


module vertical_ziptie(){
	difference(){
		translate(v=[0,0,0]) cylinder(h = 3.9, r=lm8uu_diameter);
		translate(v=[0,0,0]) cylinder(h = 5, r=lm8uu_diameter-3, $fn=50);
		translate(v=[0,0,3]) cylinder(h = 1, r1=lm8uu_diameter-3, r2=lm8uu_diameter, $fn=50);
	}
}




