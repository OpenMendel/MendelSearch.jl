# MendelSearch
This [Julia](http://julialang.org/) package performs function optimization. MendelSearch permits bounds and linear constraints to be imposed on parameters and, in statistical applications, computes asymptotic standard errors and correlations of parameter estimates. It is one component of the umbrella [OpenMendel](https://openmendel.github.io) project.

[![](https://img.shields.io/badge/docs-current-blue.svg)](https://OpenMendel.github.io/MendelSearch.jl)

## Installation

*Note: The three OpenMendel packages (1) [SnpArrays](https://openmendel.github.io/SnpArrays.jl/latest/), (2) [MendelSearch](https://openmendel.github.io/MendelSearch.jl), and (3) [MendelBase](https://openmendel.github.io/MendelBase.jl) must be installed before any other OpenMendel package will run. It is easiest if these three packages are installed in the above order and before any other OpenMendel package.*

Within Julia, use the package manager to install MendelSearch:

    pkg> add https://github.com/OpenMendel/MendelSearch.jl

This package supports Julia v1.0+

## Running the Analysis

View the [MendelSearch Documentation](https://github.com/OpenMendel/MendelSearch.jl/tree/master/docs/SearchDocumentation.pdf) for in depth information about this package.
	
## Citation

If you use this analysis package in your research, please cite the following reference in the resulting publications:

*Zhou H, Sinsheimer JS, Bates DM, Chu BB, German CA, Ji SS, Keys KL, Kim J, Ko S, Mosher GD, Papp JC, Sobel EM, Zhai J, Zhou JJ, Lange K. OPENMENDEL: a cooperative programming project for statistical genetics. Hum Genet. 2020 Jan;139(1):61-71. doi: 10.1007/s00439-019-02001-z. Epub 2019 Mar 26. PMID: 30915546; PMCID: [PMC6763373](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6763373/).*

## Acknowledgments

This project has been supported by the National Institutes of Health under awards R01GM053275, R01HG006139, R25GM103774, and 1R25HG011845.
