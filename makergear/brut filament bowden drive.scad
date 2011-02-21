

difference() {
union() {
	//import_stl("C:\dev\MakerGear\MG Bot\brut\brut head\gearstruderbnoextruder.stl");
	translate(v=[5,14.1,-18]) rotate (a=[90,0,0]) cube(size=[20, 60, 10]);
	translate (v=[20,9+10,12]) rotate (a=[90,0,0]) cylinder(h=5, r=5, $fn=12);
}
	//remove edge excess
	translate(v=[25,42,22]) rotate (a=[90,0,0]) cube(size=[5,4, 20]);

	//filament hole
	translate (v=[20,15,12]) rotate (a=[90,0,0]) cylinder(h=20, r=1.75, $fn=12);
	translate (v=[20,9,12]) rotate (a=[90,0,0]) cylinder(h=6, r=8, $fn=16);
	translate (v=[20,9+3.5,12]) rotate (a=[90,0,0]) cylinder(h=3.5, r=4, $fn=6);
	#translate (v=[20,9+12,12]) rotate (a=[90,0,0]) cylinder(h=15, r=2.1, $fn=12);

	//mounting holes
	translate (v=[15,15,37]) rotate (a=[90,0,0]) cylinder(h=20, r=2.15, $fn=12);
	translate (v=[15,15,37]) rotate (a=[90,0,0]) cylinder(h=4, r=4.1, $fn=6);

	translate (v=[15,15,-13]) rotate (a=[90,0,0]) cylinder(h=20, r=2.15, $fn=12);
	translate (v=[15,15,-13]) rotate (a=[90,0,0]) cylinder(h=4, r=4.1, $fn=6);
		
}







// translate (v=[0,0,0]) rotate (a=[0,0,0])