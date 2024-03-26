# Fortran module for preCICE

This is a Fortran module that uses the [preCICE Fortran bindings](https://precice.org/couple-your-code-api.html) (written in C++) using the `iso_c_binding` intrinsic module.

Build this module using `make`. This executes:

```shell
gfortran -c precice.f90
```

This project was moved from the [main preCICE repository](https://github.com/precice/precice). See the [history](https://github.com/precice/precice/tree/d0fafbd912ad6cbf0727299d23e1210570957945/src/precice/bindings/f2003). Previous contributions by @haraldkl, @Krupp, @gatzhamm, @uekerman, @floli, @MakisH, @BenjaminRueth, @RPGP1.
