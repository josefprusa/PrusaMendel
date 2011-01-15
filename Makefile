VARIANT=0
OPENSCAD:=$(shell which openscad) -D variant=$(VARIANT)
ifeq ($(VARIANT),0)
	TARGET=./stl
endif
ifeq ($(VARIANT),1)
	TARGET=./stl-sae
endif

PARTS=$(TARGET)/bar-clamp.stl $(TARGET)/belt-clamp.stl $(TARGET)/coupling.stl $(TARGET)/endstop-holder.stl $(TARGET)/frame-vertex-with-foot.stl $(TARGET)/frame-vertex-without-foot.stl $(TARGET)/pla-bushing.stl $(TARGET)/pulley.stl $(TARGET)/rod-clamp.stl $(TARGET)/x-carriage.stl $(TARGET)/x-end-motor.stl $(TARGET)/x-end-idler.stl $(TARGET)/y-motor-bracket.stl $(TARGET)/z-motor-mount.stl

TARGETS=$(PARTS)
help: 
	@echo Options:
	@echo make all: makes the parts, the makerbot plates, the mendel plate and the extruder
	@echo make calibration: makes calibration part
	@echo make parts: makes all the individual parts
	@echo make extruder: makes all the extruder parts
	@echo make mbplates: makes all the makerbot plates
	@echo make mendelplate: makes the mendel plate
	@echo make clean: deletes the stl directory with the output files
	@echo adding VARIANT=1 to any of these commands generates SAE parts
	@echo SAE parts get saved in ./stl-sae, metric parts in ./stl
all: parts mbplates mendelplate extruder
calibration: $(TARGET)/calibration.stl $(TARGET)/calibration.stl
extruder: $(TARGET)/wade.stl $(TARGET)/wadebits.stl
mendelplate: parts extruder $(TARGET)/mendelplate.stl
$(TARGET)/mendelplate.stl: plate1.scad parts
	$(OPENSCAD) -s $(TARGET)/mendelplate.stl plate1.scad
mbplates: makerbot.scad parts $(TARGET)/mbotplate1.stl $(TARGET)/mbotplate2.stl $(TARGET)/mbotplate3.stl $(TARGET)/mbotplate4.stl $(TARGET)/mbotplate5.stl
$(TARGET)/mbotplate1.stl: $(TARGET)/frame-vertex-with-foot.stl $(TARGET)/frame-vertex-without-foot.stl $(TARGET)/bar-clamp.stl $(TARGET)/belt-clamp.stl 
	$(OPENSCAD) -D platenum=1 -s $(TARGET)/mbotplate1.stl makerbot.scad
$(TARGET)/mbotplate2.stl: $(TARGET)/x-carriage.stl $(TARGET)/coupling.stl $(TARGET)/rod-clamp.stl $(TARGET)/belt-clamp.stl $(TARGET)/bar-clamp.stl
	$(OPENSCAD) -D platenum=2 -s $(TARGET)/mbotplate2.stl makerbot.scad
$(TARGET)/mbotplate3.stl: $(TARGET)/endstop-holder.stl $(TARGET)/x-end-idler.stl $(TARGET)/z-motor-mount.stl
	$(OPENSCAD) -D platenum=3 -s $(TARGET)/mbotplate3.stl makerbot.scad
$(TARGET)/mbotplate4.stl: $(TARGET)/x-end-motor.stl $(TARGET)/bar-clamp.stl
	$(OPENSCAD) -D platenum=4 -s $(TARGET)/mbotplate4.stl makerbot.scad
$(TARGET)/mbotplate5.stl: $(TARGET)/pulley.stl $(TARGET)/endstop-holder.stl $(TARGET)/y-motor-bracket.stl
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
