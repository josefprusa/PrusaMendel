module teardrop (r=8,h=20)
{
	rotate([-270,0,90])
	linear_extrude(height=h)
	{
		circle(r=r);
		polygon(points=[[0,0],[r*cos(30),r*sin(30)],[0.5*r,r],[-0.5*r,r],[-r*cos(30),r*sin(30)]],
				paths=[[0,1,2,3,4]]);
	}
}

translate([0,0,14])difference(){
cube(size = [10,50,28], center = true);
teardrop(8, 10);
rotate(a=[0,-90,0])cylinder(h = 30, r=2, center=true);
}
module hook(){
translate([10,12+1.5,10]) cube(size = [10,3,20], center = true);
translate([13,5+12+0.5,10]) cube(size = [4,5,20], center = true);
translate([10.5,1+5+12+0.5,10]) cube(size = [1,3,20], center = true);
}
hook();
mirror([ 0, 1, 0 ])hook();