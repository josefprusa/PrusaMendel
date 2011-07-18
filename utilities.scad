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
module sliderCutOut(bushing_outerDiameter, axis_global_height)
{
    cube(size = [bushing_outerDiameter,17,axis_global_height*2], center = true);
}
module slider( bushing_outerDiameter, axis_global_height, rod_position, rod_radius, cutOut=0 )
{
    union(){
        union(){
            translate(v = [0, -25, 0]) union(){
                if( x_axis_parts_with_bushings > 0 ){
                    translate([0, 0.5, -24.5]) bushing(2.5);
                    difference(){
                        translate([0, 0.5, (axis_global_height-41.5)]) bushing(2.5,6);
                        translate([0, -1.5, (axis_global_height-40)]) cylinder(h=12, r1=bushing_outerDiameter*1.2, r2=1, $fn=20, center=true);
                    }
                }
            }
        }
        translate(v = [0, -25, 15]) difference(){
            difference(){
                if(cutOut<1) union(){
                    translate(v = [0, -3.5, -7-(65-axis_global_height)*0.5]) cube(size = [bushing_outerDiameter+2*thin_wall,17,axis_global_height], center = true);
                }
                translate(v = [0, -0, -7]) sliderCutOut(bushing_outerDiameter, axis_global_height);

            }
            if(cutOut<1) axisHoles(rod_position, rod_radius);
         }
    }
}

//nut trap
module nutTrapCutOut(height, axis_rod_nut)
{
    cylinder(h = height, r=axis_rod_nut/2+2*thin_wall, $fn=6, center=true);
}
module nutTrap( axis_rod_size, axis_rod_nut, rod_position, rod_radius, corection, cutOut=0 )
{
    difference(){
        translate(v = [0, -55, 15]) union(){
            if(cutOut<1) translate(v = [0, 0, -35.5]) cylinder(h = 8, r=axis_rod_size/2, $fn=9, center=true);

            difference(){
                union(){
                    difference(){
                        if(cutOut<1) union(){
                            translate(v = [0, -0, -19.5])cylinder(h = 40, r=axis_rod_nut/2+thin_wall*corection, $fn=6, center=true);
    //                        translate(v = [0, 0, -31.6]) cube(size = [30,10,15.8], center = true);
                        }
                        cylinder(h = 90, r=axis_rod_nut/2, $fn=6, center=true);
                    }
                    if(cutOut<1) translate(v = [0, 0, -30]) nutTrapCutOut(4, axis_rod_size);
                }
                if(cutOut<1) translate(v = [0, 0, 12.5]) cylinder(h = 90, r=axis_rod_size/2, $fn=9, center=true);
            }	
        }
        if(cutOut<1) axisHoles(rod_position, rod_radius);
    }
}



// bushings 
module bushing_core_straight( rodsize, outerDiameter, lenght ){
    union(){
        rotate(a=[0,0,45])
        difference(){
            union(){
                //outer ring
                difference(){
                    union(){
                        cylinder(h = lenght, r=outerDiameter/2); //1mm lemování
                        //cylinder(h = 1, r=outerDiameter/2+2);
                    }
                    translate(v=[0,0,-1]) cylinder(h = lenght+2, r=(outerDiameter/2)-2);
                }

                //nipples inside touching the rod
                difference(){
                    union(){
                        translate(v=[0,0,lenght/2]) cube(size = [outerDiameter-1,2,lenght], center = true);
                        translate(v=[0,0,lenght/2]) cube(size = [2,outerDiameter-1,lenght], center = true);
                    }
                    translate(v=[0,0,-1]) cylinder(h = lenght+2, r=rodsize/2, $fn=20);
                }
            }
            //opening cutout
            translate(v=[(outerDiameter/2)+1,(outerDiameter/2)+1,(lenght)/2]) cube(size = [outerDiameter,outerDiameter,lenght+2], center = true);
            
            }
        }
}
module bushing_core_holder( rodsize, outerDiameter, lenght ){
    union(){
        rotate(a=[0,0,45])
        difference(){
            union(){
                //outer ring
                difference(){
                    union(){
                        cylinder(h = lenght, r=outerDiameter/2); //1mm lemování
                        //cylinder(h = 1, r=outerDiameter/2+2);
                    }
                    translate(v=[0,0,-1]) cylinder(h = lenght+2, r=(rodsize/2));
                }
            }
            //opening cutout
            translate(v=[(outerDiameter/2)+1,(outerDiameter/2)+1,(lenght)/2]) cube(size = [outerDiameter,outerDiameter,lenght+2], center = true);
            
            }
        }
}

module bushing_core_helical( rodsize, outerDiameter, lenght ){
	union(){
        difference(){
            rotate(a=[0,0,44]) translate(v=[0,0,(lenght)/2]) linear_extrude(center = true, height = lenght, twist = 90,convexity = 20) projection(cut = true) bushing_core_straight(rodsize, outerDiameter, lenght );
            translate(v=[0,-2.3,0]) rotate(a=[0,0,45]) translate(v=[(outerDiameter/2)+1,(outerDiameter/2)+1,(lenght)/2]) cube(size = [outerDiameter,outerDiameter,lenght+2], center = true);
            // hack for easier cleanup
//            translate(v=[0,0,-0.5]) cylinder(h = 1, r=rodsize/2+1, $fn=20);
        }
    }
}

module bushing(extra_outerDiameter=0, extra_lenght=0){
    length = bushing_lenght+extra_lenght;
    union(){
        difference(){
            translate(v=[0,-(bushing_outerDiameter+extra_outerDiameter)/10,length/2]) cube(size = [bushing_outerDiameter+extra_outerDiameter, (bushing_outerDiameter+extra_outerDiameter),length], center = true);
            translate(v=[0,0,-1]) cylinder(h = length+2, r=((bushing_outerDiameter)/2)-2);
            translate(v=[0,-2.3,0]) rotate(a=[0,0,45]) translate(v=[((bushing_outerDiameter+extra_outerDiameter)/2)+1,((bushing_outerDiameter+extra_outerDiameter)/2)+1,(length)/2]) cube(size = [(bushing_outerDiameter+extra_outerDiameter),(bushing_outerDiameter+extra_outerDiameter),length+2], center = true);
            difference(){
                translate(v=[0,((bushing_outerDiameter+extra_outerDiameter)/2)+1,(length)/2]) cube(size = [(bushing_outerDiameter+extra_outerDiameter)+1,(bushing_outerDiameter+extra_outerDiameter)+1,length+2], center = true);
                translate(v=[0,0,-1]) cylinder(h = length+1, r=(bushing_outerDiameter+extra_outerDiameter)/2, $fn=100);
            }
        }
        if(bushing_type == 1){
            bushing_core_straight( bushing_rodsize, bushing_outerDiameter+extra_outerDiameter, length );
        }
        if(bushing_type == 2){
            bushing_core_helical( bushing_rodsize, bushing_outerDiameter+extra_outerDiameter, length );
        }
        if(bushing_type == 3){
            bushing_core_holder( bushing_rodsize, bushing_outerDiameter+extra_outerDiameter, length );
        }
    }
}

