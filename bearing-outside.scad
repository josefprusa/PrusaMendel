difference(){
union(){
translate(v = [0, 0, 5.5]) cylinder(h = 11, r=11, $fn=15, center=true);
translate(v = [0, 0, 1]) cylinder(h = 2, r=14, $fn=15, center=true);
translate(v = [0, 0, 10]) cylinder(h = 2, r=14, $fn=15, center=true);

//support shell
intersection(){
	union(){
	difference(){
		translate(v = [0, 0, 5]) cylinder(h = 10, r=20, $fn=15, center=true);
		translate(v = [0, 0, 6]) cylinder(h = 15, r=17, $fn=15, center=true);
	}
	translate(v = [0, 0, 9.5]) cylinder(h = 1, r=20, $fn=15, center=true);
	}
	translate(v = [0, 0, 10])cube(size = [29,50,20], center = true);
}
}
translate(v = [0, 0, 5.5]) cylinder(h = 20, r=8, $fn=30, center=true);
}