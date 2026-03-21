FC ?= gfortran

all: precice

precice: thirdparty/precice.f90
	$(FC) -std=f2003 -c $^

clean:
	rm -f precice.mod precice.o
