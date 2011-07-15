// PRUSA Mendel  
// Configuration file
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel
//
// added by hradec - http://hradec.com
// Some basic functions, shared by all parts

include <configuration.scad>

module roundcorner(diameter)
{
	difference() 
    {
		cube(size = [diameter,diameter,99], center = false);
		translate(v = [diameter, diameter, 0]) cylinder(h = 100, r=diameter, center=true);
	}
}


module sliderCutOut(bushing_outerDiameter, axis_global_height)
{
    cube(size = [bushing_outerDiameter,17,axis_global_height*2], center = true);
}

module nutTrapCutOut(height, axis_rod_nut)
{
    cylinder(h = height, r=axis_rod_nut/2+2*thin_wall, $fn=6, center=true);
}


module axisBase(rod_position, axis_global_width,  RoundCorner1=0, RoundCorner2=1, RoundCorner3=1, RoundCorner4=1 )
{
    axis_global_width_round = axis_global_width * 0.5 + 0.1;
    union()
    {
        difference()
        {
            translate(v = [0, -40, -16.6]) cube(size = [axis_global_width,40,15.8], center = true);
            translate(v = [0, -43.5, -16.6]) cube(size = [28-(25-rod_position)*2,13,50], center = true);
            translate(v = [-14+(25-rod_position), -43.5, -16.6]) scale([ 1,1,1 ]) cylinder(h = 42, r=6.5, $fn=20, center=true);
            translate(v = [14-(25-rod_position), -43.5, -16.6]) scale([ 1,1,1 ]) cylinder(h = 42, r=6.5, $fn=20, center=true);

            //round corners
            if( RoundCorner1>0) translate(v = [axis_global_width_round, -19.9, -25]) rotate(a=[0,0,180]) roundcorner(round_corner_diameter);
            if( RoundCorner2>0) translate(v = [axis_global_width_round, -60.1, -25]) rotate(a=[0,0,90]) roundcorner(round_corner_diameter);
            if( RoundCorner3>0) translate(v = [-axis_global_width_round, -60.1, -25]) rotate(a=[0,0,0]) roundcorner(round_corner_diameter);
            if( RoundCorner4>0) translate(v = [-axis_global_width_round, -19.9, -25]) rotate(a=[0,0,-90]) roundcorner(round_corner_diameter);

        }
        //translate(v = [-25, -40, -16.6])cube(size = [20,40,15.8], center = true);
        //translate(v = [25, -40, -16.6])cube(size = [20,40,15.8], center = true);
    }    
}

//holes for axis
module axisHoles(rod_position, rod_radius)
{
    translate(v = [-rod_position, -18-22, -16.7]) rotate(a=[90,0,0]) 
    {
        cylinder(h = 42, r=rod_radius, $fn=20, center=true);
        translate(v = [0, rod_radius*0.5, 0]) cylinder(h = 42, r=rod_radius*0.85, $fn=6, center=true);
    }
    translate(v = [rod_position, -18-22, -16.7]) rotate(a=[90,0,0]) 
    {
        cylinder(h = 42, r=rod_radius, $fn=20, center=true);
        translate(v = [0, rod_radius*0.5, 0]) cylinder(h = 42, r=rod_radius*0.85, $fn=6, center=true);
    }
}


//nut traps
module nutTraps( nut_pos )
{
    translate(v = [-nut_pos, -29, -19.7]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
    translate(v = [-nut_pos, -29, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
    translate(v = [nut_pos, -29, -19.7]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
    translate(v = [nut_pos, -29, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);

    translate(v = [-nut_pos, -50, -19.7]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
    translate(v = [-nut_pos, -50, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
    translate(v = [nut_pos, -50, -19.7]) cylinder(h = 7, r=m3_nut_diameter/2, $fn=6, center=true);
    translate(v = [nut_pos, -50, -20]) cylinder(h = 10, r=m3_diameter/2, $fn=9, center=true);
}




//slider
module slider( bushing_outerDiameter, axis_global_height, rod_position, rod_radius, cutOut=0 )
{
    difference(){
        translate(v = [0, -25, 15]) difference(){
            if(cutOut<1) union(){
                translate(v = [0, -3.5, -7-(65-axis_global_height)*0.5]) cube(size = [bushing_outerDiameter+2*thin_wall,17,axis_global_height], center = true);
            }
            translate(v = [0, -0, -7]) sliderCutOut(bushing_outerDiameter, axis_global_height);

        }
        if(cutOut<1) axisHoles(rod_position, rod_radius);
    }
}

//nut trap
module nutTrap( axis_rod_size, axis_rod_nut, rod_position, rod_radius, corection, cutOut=0 )
{
    difference(){
        translate(v = [0, -55, 15]) difference(){
            union(){
                difference(){
                    if(cutOut<1) union(){
                        translate(v = [0, -0, -19.5])cylinder(h = 40, r=axis_rod_nut/2+thin_wall*corection, $fn=6, center=true);
                        //translate(v = [0, 0, -31.6]) cube(size = [30,10,15.8], center = true);
                    }
                    cylinder(h = 90, r=axis_rod_nut/2, $fn=6, center=true);
                }
                if(cutOut<1) translate(v = [0, 0, -31]) nutTrapCutOut(4, axis_rod_size);
            }
            if(cutOut<1) translate(v = [0, 0, 12.5]) cylinder(h = 90, r=axis_rod_size/2, $fn=9, center=true);
        }	
        if(cutOut<1) axisHoles(rod_position, rod_radius);
    }
}