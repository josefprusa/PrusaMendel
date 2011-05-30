python thingdoc/thingdoc --graph | dot -Tpng > docs/graph.png
python thingdoc/thingdoc;
cd docs;
pdflatex thingdoc.tex;
cd ..;