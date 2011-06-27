// PRUSA Mendel  
// Bushings
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

/**
 * @id bushing
 * @name Bushing
 * @category Printed
 * @id bushing
 */ 

rodsize = bushing_rodsize;
outerDiameter = bushing_outerDiameter;
lenght = bushing_lenght;
type = bushing_type;


module bushing(stiff, lenght=11){
	difference(){
		union(){
			translate(v=[-7.5,-8,0])cube(size = [15,8,lenght]);
			cylinder(h = lenght, r=7.5);
		}
	//cutout inside
	//Opening
	rotate(a=[0,0,45]) translate(v=[1,1,-1]) cube(size = [16,16,lenght+2]);
	//Cutouts to make it more bendy
	if(stiff){
		translate(v=[-4.8,-6,-1]) cube(size = [0.8,6,lenght+2]);
		translate(v=[4,-6,-1]) cube(size = [0.8,6,lenght+2]);
	}else{
		translate(v=[-4.8,-8,-1]) cube(size = [0.8,8,lenght+2]);
		translate(v=[4,-8,-1]) cube(size = [0.8,8,lenght+2]);
	}
	translate(v=[0,5,(lenght+2)/2]) cube(size = [7,8,lenght+2], center=true);
	translate(v=[0,0,-1]) cylinder(h = lenght+2, r=5);
	}
}


module standart_bushing(){

difference(){translate(v=[0,5,8])rotate(a=[90,0,0]){
bushing(false, 10);
translate(v=[-7,-13,0])cube(size = [14,5,10]);
translate(v=[-2,-13,-3])cube(size = [4,5,16]);
translate(v=[-2,-11,-3])cube(size = [4,7.5,2]);
translate(v=[-2,-11,11])cube(size = [4,7.5,2]);
}
translate(v=[-3,-1,-16])rotate(a=[45,0,0])cube(size = [6,5,16]);

mirror([ 0, 1, 0 ]) translate(v=[-3,-1,-16])rotate(a=[45,0,0])cube(size = [6,5,16]);}
}


// Includes small cutouts for better prints
module vertical_bushing(stiff, lenght){
difference(){
bushing(stiff, lenght);
translate(v=[-5,0,-1]) cube(size = [10,2.5,lenght+2]);
}
}


vertical_bushing();