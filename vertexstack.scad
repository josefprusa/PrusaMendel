
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

module vertstack(){
translate([0,0,0]) rotate([0,0,0]) union(){

translate([48,39,0]) rotate([0,0,-90]) import_stl("frame-vertex-foot.stl");
translate([48,39,15]) rotate([0,0,-90]) import_stl("frame-vertex-foot.stl");
translate([48,39,13]) rotate([0,0,-90]) interface();
}
}

//#translate([-49,-49,-1]) cube(size=[98,98,1]);
translate([-49,-49,0]) vertstack();