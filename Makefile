OPENSCAD:=$(shell which openscad)

TARGET=./stl
PARTS=$(TARGET)/bar-clamp.stl $(TARGET)/belt-clamp.stl $(TARGET)/coupling.stl $(TARGET)/endstop-holder.stl $(TARGET)/frame-vertex-with-foot.stl $(TARGET)/frame-vertex-without-foot.stl $(TARGET)/pla-bushing.stl $(TARGET)/pulley.stl $(TARGET)/rod-clamp.stl $(TARGET)/x-carriage.stl $(TARGET)/x-end-motor.stl $(TARGET)/x-end-idler.stl $(TARGET)/y-motor-bracket.stl $(TARGET)/z-motor-mount.stl

TARGETS=$(PARTS)
help: 
	@echo Options:
	@echo make all: makes the parts, the makerbot plates, the mendel plate and the extruder
	@echo make parts: makes all the individual parts
	@echo make extruder: makes all the extruder parts
	@echo make mbplates: makes all the makerbot plates
	@echo make mendelplate: makes the mendel plate
	@echo make clean: deletes the stl directory with the output files
all: parts mbplates mendelplate extruder
extruder: $(TARGET)/wade.stl $(TARGET)/wadebits.stl
mendelplate: parts
	$(OPENSCAD) -s $(TARGET)/mendelplate.stl plate1.scad
mbplates: parts
	$(OPENSCAD) -D platenum=1 -s $(TARGET)/mbotplate1.stl makerbot.scad
	$(OPENSCAD) -D platenum=2 -s $(TARGET)/mbotplate2.stl makerbot.scad
	$(OPENSCAD) -D platenum=3 -s $(TARGET)/mbotplate3.stl makerbot.scad
	$(OPENSCAD) -D platenum=4 -s $(TARGET)/mbotplate4.stl makerbot.scad
	$(OPENSCAD) -D platenum=5 -s $(TARGET)/mbotplate5.stl makerbot.scad
parts : $(TARGET) $(TARGETS)
$(TARGET) :
	mkdir -p $(TARGET)
$(TARGET)/%.stl : %.scad
	@echo "Processing $@"
	$(OPENSCAD) -s $@ $(subst $(subst ./,,$(TARGET)),.,$(subst .stl,.scad,$@))
$(TARGET)/frame-vertex-with-foot.stl: frame-vertex.scad
	$(OPENSCAD) -D basefoot=true -s $@ frame-vertex.scad 
$(TARGET)/frame-vertex-without-foot.stl: frame-vertex.scad
	$(OPENSCAD)  -D basefoot=false -s $@ frame-vertex.scad
$(TARGET)/y-motor-bracket.stl: ybrac-t.scad
	$(OPENSCAD) -s $@ ybrac-t.scad

#$(PARTS) : $(TARGET)
#	@echo "Processing $@"
#	$(OPENSCAD) -s $(TARGET)/$@.stl $@.scad
clean :
	rm -rf $(TARGET)
