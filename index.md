Search is a component of the umbrella [OpenMendel](https://openmendel.github.io) project. This package performs function optimization, and permits bounds and linear constraints to be imposed on parameters and, in statistical applications, computes asymptotic standard errors and correlations of parameter estimates. Search is necessary to run any OpenMendel analysis package, and you should install Search first, before you install the analyis packages. View the [Search Documentation](https://github.com/OpenMendel/Search.jl/tree/master/docs/SearchDocumentation.pdf) for in depth information about this package.

### Installation
*Note: The three OpenMendel packages (1) [SnpArrays](https://openmendel.github.io/SnpArrays.jl/latest/), (2) [Search](https://openmendel.github.io/Search.jl), and (3) [MendelBase](https://openmendel.github.io/MendelBase.jl) must be installed before any other OpenMendel package will run. It is easiest if these three packages are installed in the above order and before any other OpenMendel package.*

Within Julia, use the package manager to install Search:

    Pkg.clone("https://github.com/OpenMendel/Search.jl.git")

This package supports Julia v0.4 and v0.5.

## Citation

If you use [OpenMendel](https://openmendel.github.io) analysis packages in your research, please cite the following reference in the resulting publications:

*Lange K, Papp JC, Sinsheimer JS, Sripracha R, Zhou H, Sobel EM (2013) Mendel: The Swiss army knife of genetic analysis programs. Bioinformatics 29:1568-1570.*

<!--- ## Contributing
We welcome contributions to this Open Source project. To contribute, follow this procedure ... --->

## Acknowledgments

This project is supported by the National Institutes of Health under NIGMS awards R01GM053275 and R25GM103774 and NHGRI award R01HG006139.
