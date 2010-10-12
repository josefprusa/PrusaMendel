// PRUSA Mendel  
// Frame vertex
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

// Based on http://www.thingiverse.com/thing:2003 aka Viks footed 
// frame vertex, which is based on http://www.thingiverse.com/thing:1780 
// aka Tonokps parametric frame vertex
// Thank you guys for your great work

include <configuration.scad>

M8=m8_diameter+0.9;
vertex_height=M8+4;
with_foot=1;		// Comment out for no foot.
FN=8;

translate ([0,0,vertex_height/2])difference() 
{
	union () {
		dxf_linear_extrude(file = "vertex-body-fixed-qcad.dxf",height=vertex_height,center=true);
		//import_stl("vertex-body-fixed.stl");
		if (with_foot==1) {
			translate([40,-15,0]) vertex_foot();
		}
	}

	translate([11.013,59.912]) zhole(M8); 
	//translate([35.013,39.999,0]) zhole(M8); 
	translate([40.274,9.249,0]) zhole(M8); 
	//translate([40.217,30.992]) zhole(M3); 
	//translate([29.829,48.986]) zhole(M3); 
	translate([0,21,0]) 
		xteardrop(M8,200);
	translate([13.687,41.010,0]) rotate(a=60,v=[0,0,1])
		xteardrop(M8,200);
}


module zhole(diameter) cylinder(h=100,r=(diameter/2),center=true,$fn=FN); 

module xteardrop(diameter,length) rotate(a=-90,v=[0,1,0]) rotate(a=-90,v=[0,0,1]) zteardrop(diameter,length);

module yteardrop(diameter,length) rotate(a=90,v=[1,0,0]) zteardrop(diameter,length);

module zteardrop(diameter,height)
{
	rotate(a=0, v=[0,0,1]) union()
	{
		//translate([0,0,-height/2]) cube(size=[diameter/2,diameter/2,height],center=false);
		rotate(a=22.5, v=[0,0,1])cylinder(r=diameter/2, h = height,center=true,$fn=FN);
	}
}

module vertex_foot() {
	difference () {
		union () {
			cube([18,4,vertex_height],center=true);
			translate ([-5,8,0]) cube([5,18,vertex_height],center=true);
			translate ([5,9,0]) cube([5,18,vertex_height],center=true);
		}
		//translate ([0,8,0]) xteardrop(7,200);
	}
}
