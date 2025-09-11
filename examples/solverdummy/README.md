# Fortran module for preCICE

This is a Fortran module that uses the [preCICE Fortran bindings](https://precice.org/couple-your-code-api.html) (written in C++) using the `iso_c_binding` intrinsic module.
The build process uses the GNU Fortran compiler (gfortran), which in turn depends on the default GCC version available on your system. You can check which version is being used with:
```shell
gfortran --version
```
If the version is not compatible with your setup, adjust your environment or compiler settings accordingly. Build the module using `make` which executes:
```shell
gfortran -c precice.f90
```

If the version is not compatible with your setup, adjust your environment or compiler settings accordingly.
```shell
find_package(precice REQUIRED CONFIG)
target_link_libraries(executable_name PRIVATE precice::precice)
```
Replace <executable_name> with the actual name of your target executable. To ensure your executable can locate the preCICE shared library (libprecice.so) at runtime, you need to add the installation path of preCICE to your environment

# Compilation check
After successful compilation, check if your executable can find the corresponding libprecice.so files by,
```shell
ldd executable_name
````

This project was moved from the [main preCICE repository](https://github.com/precice/precice). See the [history](https://github.com/precice/precice/tree/d0fafbd912ad6cbf0727299d23e1210570957945/src/precice/bindings/f2003). Previous contributions by @haraldkl, @Krupp, @gatzhamm, @uekerman, @floli, @MakisH, @BenjaminRueth, @RPGP1.
