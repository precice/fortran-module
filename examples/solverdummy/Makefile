F03 ?= gfortran

all: solverdummy

solverdummy: solverdummy.f03
	$(F03) $^ -o $@ -I../.. $(shell pkg-config --libs libprecice)

clean:
	rm -f solverdummy
