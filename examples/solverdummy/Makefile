FC ?= gfortran
FFLAGS ?= -Wall

all: solverdummy

solverdummy: solverdummy.f90
	$(FC) $(FFLAGS) -g $^ -o $@ -I../.. $(shell pkg-config --libs libprecice)

clean:
	rm -f solverdummy
