teardropcentering2();
padded_teardrop();

module teardrop (r=4.5,h=20, r_mult=1)
{
	union(){
		cylinder(r=r, h=h, $fn=20);
		teardrop_poly(r=r, h=h, r_mult=r_mult);
	}
}

module teardrop_poly (r=4.5,h=20, r_mult=1.2)
{
	linear_extrude(height=h)
	{
		polygon(points=[[0,0],[r*cos(30),r*sin(30)],[0.5*r,r_mult*r],[-0.5*r,r_mult*r],[-r*cos(30),r*sin(30)]],
				paths=[[0,1,2,3,4]]);
	}
}

module teardropcentering (r=4.5,h=20)
{
    {
		teardrop(r=r, h=h, r_mult=1.2);
	}
}

module teardropcentering2 (r=4.5,h=20)
{
	difference(){
        teardrop(r=r, h=h, r_mult=1.2);
	translate(v = [-1.5*r, -1.5*r,-1])cube(size =[3*r,1.5*r,h+2]);
	}
}

module padded_teardrop(r = 4, h = 15, diameter_adjust = 0.5, internal_offset = 0, pressure_pad_height_ratio=0.325, add_strenght = 1, cut_spacing = 5, cut_h=5.5, magic = 10, cut_width=1)
{

	//r is real radius, as measured on steel.
    // (real object has radius bigger by diameter_adjust
	//h is lenght of pressure pad, including cutouts.
	// (Real object has teardrop part enlarged by
    // magic number to positive direction and by internal_offset to negative direcion

	// you should not have to change to change latter
	//diameter_adjust is here due to wall width, or something like this.
	//pressure_pad_height_ratio is how far the pressure pad sticks into the rod hole

	//add_strenght enables 'cuts' to trick skeinforge into putting more plastic
	//  into pressure pad, greatly strenghtening it.
	//  set to 1 for cylindrical, 2 for slot cuts.
	//cut_spacing is distance between cuts. for cylindrical cuts every odd cut
	//  is offset by cut_spacing/2
	// cut_h is height of cuts, you should be able to fine tune it so it begins in object layer 2
	//magic is here to assure that when substracting we get out of the object
    //cut_width is distande between pressure pad and object

	//always substract just from nearest wrapping object

	difference(){
		//axe hole
        translate([-internal_offset,0,0])
		  teardropcentering((r+diameter_adjust), h+magic+internal_offset);
		//pressure pad
		rotate([0,-90,90])
		translate([
			0,
			-(r+diameter_adjust),
			(-(r+diameter_adjust))-(r-(r*pressure_pad_height_ratio))-magic
			])
			cube(size = [
				h,
				(r+diameter_adjust)*2,(r+diameter_adjust)+magic]);
	}
	rotate([0,-90,90]) {
		//cutting along the axis
		//this one goes thru
		translate(v = [0, -(r+diameter_adjust), -(r+diameter_adjust)-magic])
			cube(size = [h,cut_width,(r+diameter_adjust)+magic]);
		//this one does not
		translate(v = [0, (r+diameter_adjust)-cut_width, -(r+diameter_adjust)])
			cube(size = [h,cut_width,(r+diameter_adjust)]);
		//cuts across axis, both go thru
		translate(v = [0, -(r+diameter_adjust), -(r+diameter_adjust)-magic])
			cube(size = [cut_width,(r+diameter_adjust)*2,(r+diameter_adjust)+magic]);
		translate(v = [h-cut_width, -(r+diameter_adjust), -(r+diameter_adjust)-magic])
			cube(size = [cut_width,(r+diameter_adjust)*2,(r+diameter_adjust)+magic]);

		if(add_strenght==1){
			//cylinder cut
			translate([cut_spacing,0,0]) {
				for (i=[1:h/cut_spacing]){
					translate(v = [(i-1)*cut_spacing, (r+diameter_adjust)-r/2, -(r+diameter_adjust)])
						cylinder(h = cut_h, r=0.4, $fn=6, center=true);
					translate(v = [(i-1)*cut_spacing- (cut_spacing/2) , (r+diameter_adjust)+r/2, -(r+diameter_adjust)])
						cylinder(h = cut_h, r=0.4, $fn=6, center=true);
				}
			}
		} 
		if (add_strenght == 2){
			//slot cut
			for (i=[1:h/cut_spacing]){
				translate(v = [i*cut_spacing, (r+diameter_adjust)-r/2, -(r+diameter_adjust)-cut_h/2])
					cube([0.4,r,cut_h]); 
			}
		}
	}
}
