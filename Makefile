F03 ?= gfortran

all: precice

precice: precice.f90
	$(F03) -std=f2003 -c $^

clean:
	rm -f precice.mod precice.o
