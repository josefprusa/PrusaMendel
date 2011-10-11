// PRUSA Mendel  
// Bushings
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

// Print them in PLA and glue them to place
// if they are too tight, define bigger rodsize
// or you can try to sand a bt off


// bushing_type (located in configuration.scad file) Can generate three versions 
// 1 - regular old ones
// 2 - helical ones
// 3 - holders for brass or any other bought bushings


include <configuration.scad>
include <utilities.scad>

/**
 * @id bushing
 * @name Bushing
 * @category Printed
 */

space = 9-bushing_rodsize;


union(){
translate(v=[(bushing_rodsize+space),(bushing_rodsize+space)+3,0]) bushing();
translate(v=[-(bushing_rodsize+space),(bushing_rodsize+space)+3,0]) bushing();
translate(v=[(bushing_rodsize+space),-(bushing_rodsize+space),0]) mirror([ 0, 1, 0 ]) bushing();
translate(v=[-(bushing_rodsize+space),-(bushing_rodsize+space),0]) mirror([ 0, 1, 0 ]) bushing();
translate(v=[3*(bushing_rodsize+space),(bushing_rodsize+space)+3,0]) bushing();
translate(v=[-3*(bushing_rodsize+space),(bushing_rodsize+space)+3,0]) bushing();
translate(v=[3*(bushing_rodsize+space),-(bushing_rodsize+space),0]) mirror([ 0, 1, 0 ]) bushing();
translate(v=[-3*(bushing_rodsize+space),-(bushing_rodsize+space),0]) mirror([ 0, 1, 0 ]) bushing();
translate(v=[(bushing_rodsize+space),3*(bushing_rodsize+space)+3,0]) bushing();
translate(v=[-(bushing_rodsize+space),3*(bushing_rodsize+space)+3,0]) bushing();
translate(v=[(bushing_rodsize+space),-3*(bushing_rodsize+space),0]) mirror([ 0, 1, 0 ]) bushing();
translate(v=[-(bushing_rodsize+space),-3*(bushing_rodsize+space),0]) mirror([ 0, 1, 0 ]) bushing();
}

%cube([100,100,0.01],true);

