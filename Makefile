target metric: OPENSCAD:=$(shell which openscad) -D variant=0 -D linear=0 -D acme=0
target metric: TARGET=./metric-prusa
target metric-lm8uu: TARGET=./metric-prusa-linear
target metric-lm8uu: OPENSCAD:=$(shell which openscad) -D variant=0 -D linear=1 -D acme=0
target metric-lm8uu-acme: TARGET=./metric-prusa-linear-acme
target metric-lm8uu-acme: OPENSCAD:=$(shell which openscad) -D variant=0 -D linear=1 -D acme=1
target sae: TARGET=./sae-prusa
target sae: OPENSCAD:=$(shell which openscad) -D variant=1 -D linear=0 -D acme=0
target sae-lm8uu: TARGET=./sae-prusa-linear
target sae-lm8uu: OPENSCAD:=$(shell which openscad) -D variant=1 -D linear=1 -D acme=0

PARTS= $(TARGET)/x-end-motor.stl $(TARGET)/x-end-idler.stl $(TARGET)/bar-clamp.stl

TARGETS=$(PARTS)
help: 
	@echo Options:
	@echo make metric: makes metric parts
	@echo make metric-lm8uu: makes metric parts
	@echo make metric-lm8uu-acme: makes metric parts with acme leadscrew
	@echo make sae: makes metric parts
	@echo make sae-lm8uu: makes metric parts
	@echo make clean: deletes the stl directory with the output files
	@echo adding VARIANT=1 to any of these commands generates SAE parts
	@echo SAE parts get saved in ./stl-sae, metric parts in ./stl
metric : parts
metric-lm8uu : parts
metric-lm8uu-acme : parts
sae : parts
sae-lm8uu : parts
parts : $(TARGET) $(TARGETS)
$(TARGET) :
	mkdir -p $(TARGET)
$(TARGET)/%.stl : source/%.scad
	@echo "Processing $@"
	$(OPENSCAD) -s $(TARGET)$@ $(subst $(TARGET),.,source$(subst .stl,.scad,$@))
$(TARGET)/frame-vertex-with-foot.stl: source/frame-vertex.scad
	$(OPENSCAD) -D basefoot=true -s $@ source/frame-vertex.scad 
$(TARGET)/frame-vertex-without-foot.stl: source/frame-vertex.scad
	$(OPENSCAD)  -D basefoot=false -s $@ source/frame-vertex.scad
$(TARGET)/y-motor-bracket.stl: source/ybrac-t.scad
	$(OPENSCAD) -s $@ ybrac-t.scad

#$(PARTS) : $(TARGET)
#	@echo "Processing $@"
#	$(OPENSCAD) -s $(TARGET)/$@.stl $@.scad
clean :
	rm -rf $(TARGET)
