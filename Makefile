F03 ?= gfortran

all: precice

precice: precice.f90
	$(F03) -c $^

prototype: precice.f90
	$(F03) -fc-prototypes -fsyntax-only $^ -I../.. $(shell pkg-config --libs libprecice) > precice-prototype.h

clean:
	rm -f precice.mod precice.o precice-prototype.h
