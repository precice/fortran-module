This is an example of a Fortran 2003 solver dummy.

# Building

To build this project, make sure you have already build `precice.mod`.
Then simply run `make`.

Alternatively, build this solver including `precice.mod` and linking to the preCICE library:

```shell
gfortran solverdummy.f90 -I../.. -L$(pkg-config --libs libprecice)
```

Where `../..` is the path to `precice.mod`.

# Run

You can test the dummy solver by coupling two instances with each other. Open two terminals and run

 * `./solverdummy precice-config.xml SolverOne`
 * `./solverdummy precice-config.xml SolverTwo`

# Next Steps

If you want to couple any other solver against the dummy be sure to adjust the preCICE configuration (participant names, mesh names, data names etc.) to the needs of your solver, compare our [step-by-step guide for new adapters](https://github.com/precice/precice/wiki/Adapter-Example).
