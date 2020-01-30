This is an example of a Fortran 2003 solver dummy.

# Compilation

```
gfortran [path_to]/precice.f03 -o solverdummy solverdummy.f03 -L[path_to_preCICE_lib] -lprecice
```

# Run

You can test the dummy solver by coupling two instances with each other. Open two terminals and run
 * `./solverdummy precice-config.xml SolverOne MeshOne`
 * `./solverdummy precice-config.xml SolverTwo MeshTwo`

# Next Steps

If you want to couple any other solver against the dummy be sure to adjust the preCICE configuration (participant names, mesh names, data names etc.) to the needs of your solver, compare our [step-by-step guide for new adapters](https://github.com/precice/precice/wiki/Adapter-Example).
 
