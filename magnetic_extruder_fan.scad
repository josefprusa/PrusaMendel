lenght = 36+12;
//translate(v = [0, +6, 17]) #cube(size = [52,11,2], center = true);
difference(){
union(){
translate(v = [0, 1, 26]) cube(size = [52,22,52], center = true);
translate(v = [0, lenght/2, 6.5]) cube(size = [52,lenght,13], center = true);

translate(v = [0, lenght, 0]){
	difference(){
		translate(v = [0, 0, 6.5]) cylinder(h = 13, r=26, $fn=30, center=true);
		translate(v = [0, 0, 5]) cylinder(h = 15, r=10, $fn=30, center=true);
	}
	
}
}//end union





translate(v = [0, 5, 26]) cube(size = [44,10,50], center = true);
translate(v = [0, -5, 26]) cube(size = [50,11,50], center = true);



translate(v = [0, lenght, 0]){
	translate(v = [0, 0, 5]) cylinder(h = 20, r=15, $fn=30, center=true);
	difference(){
		union(){
			translate(v = [0, 0, 6]) cylinder(h = 10, r=25, $fn=30, center=true);
			translate(v = [0, 0, 4]) cylinder(h = 10, r=20, $fn=30, center=true);	
		translate(v = [0, (-lenght/2), 6]) cube(size = [50,lenght-9.5,10], center = true);
		}
		translate(v = [0, 0, 5]) cylinder(h = 15, r=16, $fn=30, center=true);
		translate(v = [0, -lenght/2, 6]) cube(size = [20,2,10], center = true);
		
	}
	
}

}//end Diference