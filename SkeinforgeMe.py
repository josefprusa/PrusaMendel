# WALK THROUGH AND PROCESS ALL STL FILES, may be "stl" or "STL"!!!!
# 2011-01-14, jordan miller, peptides@benchscience.org

# INSTRUCTIONS
# If you are using ReplicatorG, the first thing you need to do is find the location of the skeinforge you are using
# For me it is: /Applications/replicatorg-0023-mac/skein_engines/skeinforge-35/skeinforge_application/skeinforge.py
# Set that here

skeinforgeLocation = "/Applications/replicatorg-0023-mac/skein_engines/skeinforge-35/skeinforge_application/skeinforge.py"

## NEXT MAKE SURE YOU HAVE THE PROPER .skeinforge
# To make it reflect what RepG uses, you can create a soft link to it via command line so you won't have to 
# keep the files in sync
# The command in Terminal I used is:
# ln -s /Users/jmil/.replicatorg/sf_35_profiles/SF35-ToM-ABP-MGstepper-silverPLA-jmil/ /Users/jmil/.skeinforge
# just run this once!
# navigate to ~/.skeinforge and make sure it takes you to the expected skeinforge profile
# you should see the alterations and profiles directories for your individual profile.


# THEN you are ready to run this from the command line. It will skein EVERY .stl or .STL in the Prusa Mendel 
# by walking all directory trees.
# best to set this up at night. You wake up to a directory full of .gcode files. =]


import os

# WALK THROUGH ENTIRE DIRECTORY TREE AND SKEINFORGE ALL STL FILES, may be "stl" or "STL"!!!!

for root, dirs, files in os.walk('./'):
	for name in files:
		filename = os.path.join(root, name)
		
		if (name.endswith("stl") or name.endswith("STL")):
			print name
			os.system("python " + skeinforgeLocation + " " + filename)
		


