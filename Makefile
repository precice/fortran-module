FC ?= gfortran
FFLAGS ?= -Wall

all: precice

precice: precice.f90
	$(FC) $(FFLAGS) -c $^

clean:
	rm -f precice.mod precice.o
