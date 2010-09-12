// PRUSA Mendel  
// Y"carriage"
// Used for sliding on Y axis
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

// Stop moaning its not sturdy enough, 4 sliders and belts holders are connected together
// to ease up drilling holes to plate! This way they are always aligned properly.
// When you screw it to plate its sturdy as hell, ok?


include <configuration.scad>


difference(){
union(){
translate(v=[0,0,0.6]) cube(size=[100,100,1.2], center=true);

// bushings holder
translate(v=[40,45,11.5]) cube(size=[20,10,23], center=true);
translate(v=[40,50,23]) rotate([90,0,0]) cylinder(h=10, r=10);

translate(v=[-40,45,11.5]) cube(size=[20,10,23], center=true);
translate(v=[-40,50,23]) rotate([90,0,0]) cylinder(h=10, r=10);

translate(v=[40,-45,11.5]) cube(size=[20,10,23], center=true);
translate(v=[40,-40,23]) rotate([90,0,0]) cylinder(h=10, r=10);

translate(v=[-40,-45,11.5]) cube(size=[20,10,23], center=true);
translate(v=[-40,-40,23]) rotate([90,0,0]) cylinder(h=10, r=10);

//belt holders
translate(v=[0,-45,11.5]) cube(size=[22,10,23], center=true);
translate(v=[0,45,11.5]) cube(size=[22,10,23], center=true);

//holders for screws
translate(v=[25,45,7.5]) cube(size=[10,10,15], center=true);
translate(v=[-25,45,7.5]) cube(size=[10,10,15], center=true);
translate(v=[25,-45,7.5]) cube(size=[10,10,15], center=true);
translate(v=[-25,-45,7.5]) cube(size=[10,10,15], center=true);
}
// cutouts
// axes
 translate(v=[40,60,23]) rotate([90,0,0]) cylinder(h=120, r=bushing_diameter/2, $fn=12);
 translate(v=[-40,60,23]) rotate([90,0,0]) cylinder(h=120, r=bushing_diameter/2, $fn=12);

//screws
//belts
translate(v=[7,45,-1]) cylinder(h=30, r=m4_diameter/2, $fn=8);
translate(v=[-7,45,-1]) cylinder(h=30, r=m4_diameter/2, $fn=8);
translate(v=[7,-45,-1]) cylinder(h=30, r=m4_diameter/2, $fn=8);
translate(v=[-7,-45,-1]) cylinder(h=30, r=m4_diameter/2, $fn=8);

//frog
translate(v=[25,45,-1]) cylinder(h=30, r=m4_diameter/2, $fn=8);
translate(v=[-25,45,-1]) cylinder(h=30, r=m4_diameter/2, $fn=8);
translate(v=[25,-45,-1]) cylinder(h=30, r=m4_diameter/2, $fn=8);
translate(v=[-25,-45,-1]) cylinder(h=30, r=m4_diameter/2, $fn=8);

// main cutout
 translate(v=[0,0,1]) cube(size=[80,80,4], center=true);
}

// cutouts
// axes
% translate(v=[40,60,23]) rotate([90,0,0]) cylinder(h=120, r=bushing_diameter/2, $fn=12);
% translate(v=[-40,60,23]) rotate([90,0,0]) cylinder(h=120, r=bushing_diameter/2, $fn=12);

//screws
//belts
%translate(v=[7,45,-1]) cylinder(h=30, r=m4_diameter/2, $fn=8);
%translate(v=[-7,45,-1]) cylinder(h=30, r=m4_diameter/2, $fn=8);
%translate(v=[7,-45,-1]) cylinder(h=30, r=m4_diameter/2, $fn=8);
%translate(v=[-7,-45,-1]) cylinder(h=30, r=m4_diameter/2, $fn=8);

//frog
%translate(v=[25,45,-1]) cylinder(h=30, r=m4_diameter/2, $fn=8);
%translate(v=[-25,45,-1]) cylinder(h=30, r=m4_diameter/2, $fn=8);
%translate(v=[25,-45,-1]) cylinder(h=30, r=m4_diameter/2, $fn=8);
%translate(v=[-25,-45,-1]) cylinder(h=30, r=m4_diameter/2, $fn=8);

// main cutout
% translate(v=[0,0,1]) cube(size=[80,80,4], center=true);