F03 ?= gfortran

all: precice

precice: precice.f90
	$(F03) -c $^

clean:
	rm -f precice.mod precice.o
