python thingdoc/thingdoc --graph | dot -Tpng > docs/assembly-graph.png
python thingdoc/thingdoc;
cd docs;
pdflatex documentation.tex;
rm documentation.aux;
rm documentation.log;
rm documentation.out;
rm documentation.toc;
cd ..;