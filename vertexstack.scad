
module grid(x,y){
for(i = [0:x]){
	translate([3*i,0,1]) cube([1,y,2],center=true);
	translate([-3*i,0,1]) cube([1,y,2],center=true);
	translate([0,4*i,3]) cube([y,1,2],center=true);
	translate([0,-4*i,3]) cube([y,1,2],center=true);
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

module vertstack(){
translate([0,0,0]) rotate([0,0,0]) union(){

translate([48,39,0]) rotate([0,0,-90]) import_stl("frame-vertex-foot.stl");
translate([48,39,17]) rotate([0,0,-90]) import_stl("frame-vertex-foot.stl");
translate([48,39,13]) rotate([0,0,-90]) interface();
}
}

//#translate([-49,-49,-1]) cube(size=[98,98,1]);
translate([-49,-49,0]) vertstack();