FC ?= gfortran

all: solverdummy

solverdummy: solverdummy.f90
	$(FC)  -std=f2003 -g $^ -o $@ -I../.. $(shell pkg-config --libs libprecice)

clean:
	rm -f solverdummy
