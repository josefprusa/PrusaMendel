cp metric-prusa/bar-clamps.stl  metric-prusa-lm8uu/bar-clamps.stl 
cp metric-prusa/bearing-guide.stl metric-prusa-lm8uu/bearing-guide.stl 
cp metric-prusa/belt-clamp-bed-holder.stl metric-prusa-lm8uu/belt-clamp-bed-holder.stl 
cp metric-prusa/belt-clamp.stl  metric-prusa-lm8uu/belt-clamp.stl 
cp metric-prusa/coupling.stl metric-prusa-lm8uu/coupling.stl 
cp metric-prusa/endstop-holder.stl metric-prusa-lm8uu/endstop-holder.stl 
cp metric-prusa/frame-vertex.stl metric-prusa-lm8uu/frame-vertex.stl 
cp metric-prusa/frame-vertex-foot.stl metric-prusa-lm8uu/frame-vertex-foot.stl 
cp metric-prusa/printable-bushing.stl metric-prusa-lm8uu/printable-bushing.stl 
cp metric-prusa/pulley.stl metric-prusa-lm8uu/pulley.stl 
cp metric-prusa/rod-clamp.stl metric-prusa-lm8uu/rod-clamp.stl 
cp metric-prusa/sanguinololu-holder.stl metric-prusa-lm8uu/sanguinololu-holder.stl 
cp metric-prusa/wade.stl metric-prusa-lm8uu/wade.stl 
cp metric-prusa/wadebits.stl metric-prusa-lm8uu/wadebits.stl 
cp metric-prusa/ybrac-t.stl metric-prusa-lm8uu/ybrac-t.stl 
cp metric-prusa/z-motor-mount.stl metric-prusa-lm8uu/z-motor-mount.stl 

openscad -s metric-prusa-lm8uu/x-end-idler.stl -D 'linear=true' source/x-end-idler.scad
openscad -s metric-prusa-lm8uu/x-end-motor.stl -D 'linear=true' source/x-end-motor.scad
openscad -s metric-prusa-lm8uu/x-carriage.stl -D 'linear=true' source/x-carriage.scad
openscad -s metric-prusa-lm8uu/y-bushing.stl -D 'linear=true' source/x-bushing.scad