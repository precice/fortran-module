F03 ?= gfortran

all: precice

precice: precice.f03
	$(F03) -c $^

clean:
	rm -f precice.mod precice.o
