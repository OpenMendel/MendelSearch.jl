module PkgTest

using Search, SearchSetup
using Base.Test

# write your own tests here

# include("search_setup_test.jl")
include("search_test.jl")
end # PkgTest module


# using Coverage
# julia -e 'Pkg.test("Search",coverage=true)'
# @show get_summary(process_file("src/search_setup.jl"))
# @show get_summary(process_file("src/Search.jl"))