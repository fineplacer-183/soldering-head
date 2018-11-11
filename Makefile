
project_files = $(wildcard *.scad)

all: main.png mount-projection-hairline.svg

%.png: %.scad $(project_files)
	openscad $< --imgsize=1280,1024 --preview -o $@
	convert $@ -trim $@

%.svg: %.scad $(project_files)
	openscad $< -o $@

mount-projection-red.svg: mount-projection.svg
	cat $< | replace "stroke=\"black\" fill=\"lightgray\"" "stroke=\"red\" fill=\"none\"" > $@

mount-projection-hairline.svg: mount-projection-red.svg
	cat $< | sed -e "s/stroke-width=\"\([0-9]*\.[0-9]*\)\"//g" -e "s/stroke=\"red\"/stroke=\"red\" stroke-width=\"0.1\"/g" > $@

clean:
	rm -fr *.png *.svg


