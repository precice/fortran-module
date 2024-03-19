F03 ?= gfortran

all: solverdummy

solverdummy: solverdummy.f90
	$(F03)  -std=f2003 -g $^ -o $@ -I../.. $(shell pkg-config --libs libprecice)

clean:
	rm -f solverdummy
