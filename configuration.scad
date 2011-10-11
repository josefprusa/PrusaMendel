// PRUSA Mendel  
// Configuration file
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

// PLEASE SELECT ONE OF THE CONFIGURATIONS BELOW
// BY UN-COMMENTING IT

variant=0; //0 for metric
//variant=1; //1 for SAE
if(variant==0){
echo("variant: metric");
}else if(variant==1){
echo("variant: sae");
} else{
echo("WARNING: INVALID CONFIGURATION");
}


vars=[
//[m8_dia, m8_nut, m4_dia, m4_nut, m3_dia, m3_nut, bush_dia, mot_shaft, bush_rod, bush_outerdia, bush_length]
[9,16.4,5,9,4.4,7,11,5.3,8,16,11],//metric
[9,15.7,5.5,10.6,5.5,10.6,11.5,5.3,7.9375,16,11]//SAE
];

//BUSHING TYPE Can generate three versions
// 1 - regular old ones
// 2 - helical ones
// 3 - holders for brass or any other bought bushings
bushing_type = 2;

//Round corner diameter
round_corner_diameter = 8;

//Thin wall size
layer_height = 0.4;
perimeter_width_over_thicknes = 1.5;
infill_widht_over_thickness = 1.5;
thin_wall = 2*(perimeter_width_over_thicknes*layer_height+infill_widht_over_thickness*layer_height);
if(thin_wall<2){
	echo("Check thin wall size, its below 2mm!");
}
echo(thin_wall);

//DO NOT TOUCH THIS SECTION!
m8_diameter = vars[variant][0];
m8_nut_diameter = vars[variant][1];
m4_diameter = vars[variant][2];
m4_nut_diameter = vars[variant][3];
m3_diameter = vars[variant][4];
m3_nut_diameter = vars[variant][5];
motor_shaft=vars[variant][7];
bushing_diameter = vars[variant][6];
bushing_rodsize = vars[variant][8];
bushing_outerDiameter = vars[variant][9];
bushing_lenght = vars[variant][10];



// bushing_type Can generate three versions
// 1 - regular old ones
// 2 - helical ones
// 3 - holders for brass or any other bought bushings
bushing_type = 2; // 1=straight, 2=helical, 3=holder


// X axis setup
x_axis_global_width = 70; // min = 57.5
x_axis_global_height = 65; // min = 52
x_axis_rod_position = 25;
x_axis_rod_size = bushing_rodsize;
x_axis_parts_with_bushings = 1; // 0 = No Bushings / 1 = Bushings printed in place

// Z axis setup
z_axis_rod_size = m8_diameter;
z_axis_rod_nut = m8_nut_diameter;

// MINI-HUXLEY VERSION (TODO, just place holder)
// include <configuration-huxley.scad>
x_axis_global_height = 40; 
x_axis_global_width = 50; 
x_axis_rod_position = 16; // a little wider, but better since the rod is 1/4 inch (6.35mm)
x_axis_rod_size = 6.35;
bushing_outerDiameter = 14;
bushing_rodsize = 6.35;
m8_diameter     = 6.35;
m8_nut_diameter = 12.4;
z_axis_rod_size = 6.35;
z_axis_rod_nut = 12.4;


// MEGA VERSION (TODO, just place holder)
// include <configuration-mega.scad>







