using Search, SearchSetup, SpecialFunctions

info("Unit tests for Search, problems from test problems 
    for nonlinear programming with optimal solutions. The 
    first 10 tests are the same as search examples. Test 11 and
    12 are tests using grid. Tests 13 and 14 are tests that requires
    search to estimate function derivatives.")

srand(123)

function initial1(keyword::Dict{AbstractString, Any})
#
# This function initializes a minimization problem.
#
#  Set defaults for the parameter data structure.
#
  keyword["goal"] = "minimize"
  keyword["parameters"] = 2
  keyword["title"] = "test problem 1"
  parameter = set_parameter_defaults(keyword)
#
#  Change these defaults as needed.
#
  parameter.par[1] = -2.0
  parameter.par[2] = 1.0
  parameter.min[2] = -3.0/2.0
  return parameter
end

function fun1(par::Vector{Float64})
#
# Define a function to be minimized. Include as needed
# the first and second differentials.
#
  pars = length(par)
  df = zeros(pars) 
  f = 100(par[2]-par[1]^2)^2+(1.-par[1])^2
  df[1] = -400(par[2]-par[1]^2)*par[1]-2(1.-par[1])
  df[2] = 200(par[2]-par[1]^2)
  return (f, df, nothing)
end

function initial2(keyword::Dict{AbstractString, Any})
#
# This function initializes a minimization problem.
#
#  Set defaults for the parameter data structure.
#
  keyword["goal"] = "minimize"
  keyword["parameters"] = 2
  keyword["title"] = "test problem 2"
  parameter = set_parameter_defaults(keyword)
#
#  Change these defaults as needed.
#
  parameter.par[1] = 10.0
  parameter.par[2] = 1.0
  parameter.min[2] = 0.0
  return parameter
end

function fun2(par::Vector{Float64})
#
# Define a function to be minimized. Include as needed
# the first and second differentials.
#
  pars = length(par)
  df = zeros(pars) 
  f = par[2]+(1e-5)*(par[2]-par[1])^2
  df[1] = -(2e-5)*(par[2]-par[1])
  df[2] = 1.+(2e-5)*(par[2]-par[1])
  return (f, df, nothing)
end

function initial3(keyword::Dict{AbstractString, Any})
#
# This function initializes a minimization problem.
#
#  Set defaults for the parameter data structure.
#
  keyword["goal"] = "minimize"
  keyword["parameters"] = 2
  keyword["title"] = "test problem 3"
  parameter = set_parameter_defaults(keyword)
#
#  Change these defaults as needed.
#
  parameter.par[1] = 1.125
  parameter.par[2] = .125
  parameter.min[1] = 1.
  parameter.min[2] = 0.
  return parameter
end

function fun3(par::Vector{Float64})
#
# Define a function to be minimized. Include as needed
# the first and second differentials.
#
  pars = length(par)
  df = zeros(pars) 
  f = (par[1]+1.)^3/3.+par[2]
  df[1] = (par[1]+1.)^2
  df[2] = 1.
  return (f, df, nothing)
end

function initial4(keyword::Dict{AbstractString, Any})
#
# This function initializes a minimization problem.
#
#  Set defaults for the parameter data structure.
#
  keyword["goal"] = "minimize"
  keyword["parameters"] = 2
  keyword["title"] = "test problem 4"
  parameter = set_parameter_defaults(keyword)
#
#  Change these defaults as needed.
#
  parameter.par[1] = 0.
  parameter.par[2] = 0.
  parameter.max[1] = 4.
  parameter.max[2] = 3.
  parameter.min[1] = -1.5
  parameter.min[2] = -3.
  return parameter
end

function fun4(par::Vector{Float64})
#
# Define a function to be minimized. Include as needed
# the first and second differentials.
#
  pars = length(par)
  df = zeros(pars) 
  f = sin(par[1]+par[2])+(par[1]-par[2])^2-1.5*par[1]+2.5*par[2]+1
  df[1] = cos(par[1]+par[2])+2.*(par[1]-par[2])-1.5
  df[2] = cos(par[1]+par[2])-2.*(par[1]-par[2])+2.5
  return (f, df, nothing)
end

function initial5(keyword::Dict{AbstractString, Any})
#
# This function initializes a minimization problem.
#
#  Set defaults for the parameter data structure.
#
  keyword["goal"] = "minimize"
  keyword["constraints"] = 1
  keyword["parameters"] = 2
  keyword["title"] = "test problem 5"
  parameter = set_parameter_defaults(keyword)
#
#  Change these defaults as needed.
#
  parameter.par[1] = 0.
  parameter.par[2] = 0.
  parameter.constraint[1,1] = 4.
  parameter.constraint[1,2] = -3.
  return parameter
end

function fun5(par::Vector{Float64})
#
# Define a function to be minimized. Include as needed
# the first and second differentials.
#
  pars = length(par)
  df = zeros(pars) 
  f = sin(pi*par[1]/12.)*cos(pi*par[2]/16.)
  df[1] = pi*cos(pi*par[1]/12.)*cos(pi*par[2]/16.)/12.
  df[2] = -pi*sin(pi*par[1]/12.)*sin(pi*par[2]/16.)/16.
  return (f,df,nothing)
end

function initial6(keyword::Dict{AbstractString, Any})
#
# This function initializes a minimization problem.
#
#  Set defaults for the parameter data structure.
#
  keyword["goal"] = "minimize"
  keyword["constraints"] = 1
  keyword["parameters"] = 3
  keyword["title"] = "test problem 6"
  parameter = set_parameter_defaults(keyword)
#
#  Change these defaults as needed.
#
   parameter.par[1] = 3.
   parameter.par[2] = 1.
   parameter.par[3] = 29.
   parameter.max[1] = 50.
   parameter.max[2] = 50.
   parameter.min[1] = 2.
   parameter.min[2] = -50.
   parameter.min[3] = 10.
   parameter.constraint[1,1] = 10.
   parameter.constraint[1,2] = -1.
   parameter.constraint[1,3] = -1.
   return parameter
end

function fun6(par::Vector{Float64})
#
# Define a function to be minimized. Include as needed
# the first and second differentials.
#
  pars = length(par)
  df = zeros(pars) 
  f = .01*par[1]^2+par[2]^2-100.
  df[1] = .02*par[1]
  df[2] = 2.*par[2]
  return (f, df, nothing)
end

function initial7(keyword::Dict{AbstractString, Any})
#
# This function initializes a minimization problem.
#
#  Set defaults for the parameter data structure.
#
  keyword["goal"] = "minimize"
  keyword["constraints"] = 1
  keyword["parameters"] = 3
  keyword["title"] = "test problem 7"
  parameter = set_parameter_defaults(keyword)
#
#  Change these defaults as needed.
#
  parameter.par[1] = -4.
  parameter.par[2] = 1.
  parameter.par[3] = 1.
  parameter.constraint[1,1] = 1.
  parameter.constraint[1,2] = 2.
  parameter.constraint[1,3] = 3.
  parameter.constraint_level[1] = 1.
  return parameter
end

function fun7(par::Vector{Float64})
#
# Define a function to be minimized. Include as needed
# the first and second differentials.
#
  pars = length(par)
  df = zeros(pars) 
  f = (par[1]+par[2])^2+(par[2]+par[3])^2
  df[1] = 2.*(par[1]+par[2])
  df[2] = 2.*(par[1]+par[2])+2.*(par[2]+par[3])
  df[3] = 2.*(par[2]+par[3])
  return (f, df, nothing)
end

function initial8(keyword::Dict{AbstractString, Any})
#
# This function initializes a minimization problem.
#
#  Set defaults for the parameter data structure.
#
  keyword["goal"] = "minimize"
  keyword["constraints"] = 1
  keyword["parameters"] = 4
  keyword["title"] = "test problem 8"
  parameter = set_parameter_defaults(keyword)
  parameter = set_parameter_defaults(keyword)
#
#  Change these defaults as needed.
#
  parameter.par[1] = 10.
  parameter.par[2] = 10.
  parameter.par[3] = 10.
  parameter.par[4] = 50.
  parameter.max[1] = 20.
  parameter.max[2] = 11.
  parameter.max[3] = 42.
  parameter.max[4] = 72.
  parameter.min[1] = 0.
  parameter.min[2] = 0.
  parameter.min[3] = 0.
  parameter.constraint[1,1] = 1.
  parameter.constraint[1,2] = 2.
  parameter.constraint[1,3] = 2.
  parameter.constraint[1,4] = -1.
  return parameter
end

function fun8(par::Vector{Float64})
#
# Define a function to be minimized. Include as needed
# the first and second differentials.
#
  pars = length(par)
  df = zeros(pars) 
  f = -par[1]*par[2]*par[3]
  df[1] = -par[2]*par[3]
  df[2] = -par[1]*par[3]
  df[3] = -par[1]*par[2]
  return (f, df, nothing)
end

function initial9(keyword::Dict{AbstractString, Any})
#
# This function initializes a minimization problem.
#
#  Set defaults for the parameter data structure.
#
  keyword["goal"] = "minimize"
  keyword["constraints"] = 2
  keyword["parameters"] = 4
  keyword["title"] = "test problem 9"
  parameter = set_parameter_defaults(keyword)
#
#  Change these defaults as needed.
#
  parameter.par[1] = 1.
  parameter.par[2] = .5
  parameter.par[3] = parameter.par[1]/3.0^(0.5) - parameter.par[2]
  parameter.par[4] = parameter.par[1] + 3.0^(0.5) * parameter.par[2]
  parameter.max[4] = 6.
  parameter.min[1] = 0.
  parameter.min[2] = 0.
  parameter.min[3] = 0.
  parameter.min[4] = 0.
  parameter.constraint[1,1] = 1./3.0^(0.5)
  parameter.constraint[1,2] = -1.
  parameter.constraint[1,3] = -1.
  parameter.constraint[2,1] = 1.
  parameter.constraint[2,2] = 3.0^(0.5)
  parameter.constraint[2,4] = -1.
  return parameter
end

function fun9(par::Vector{Float64})
#
# Define a function to be minimized. Include as needed
# the first and second differentials.
#
  pars = length(par)
  df = zeros(pars) 
  f = ((par[1]-3.)^2-9.)*par[2]^3
  df[1] = 2.*(par[1]-3.)*par[2]^3
  df[2] = 3.*((par[1]-3.)^2-9.)*par[2]^2
 return (f, df, nothing)
end

function initial10(keyword::Dict{AbstractString, Any})
#
# This function initializes a minimization problem.
#
#  Set defaults for the parameter data structure.
#
  keyword["goal"] = "minimize"
  keyword["constraints"] = 0
  keyword["parameters"] = 4
  keyword["title"] = "test problem 10"
  parameter = set_parameter_defaults(keyword)
#
#  Change these defaults as needed.
#
  parameter.par[1] = -3.
  parameter.par[2] = -1.
  parameter.par[3] = -3.
  parameter.par[4] = -1.
  return parameter
end

function fun10(par::Vector{Float64})
#
# Define a function to be minimized. Include as needed
# the first and second differentials.
#
  pars = length(par)
  df = zeros(pars) 
  f = 100.*(par[2]-par[1]^2)^2+(1.-par[1])^2+
       90.*(par[4]-par[3]^2)^2+(1.-par[3])^2+ 
       10.1*((par[2]-1.)^2+(par[4]-1.)^2)+
       19.8*(par[2]-1.0)*(par[4]-1.0)
  df[1] = -100.*2.*(par[2]-par[1]^2)*2.*par[1]-2.*(1.-par[1])
  df[2] = 100.*2.*(par[2]-par[1]^2)+10.1*2.*(par[2]-1.)+ 
           19.8*(par[4]-1.)
  df[3] = -90.*2.*(par[4]-par[3]^2)*2.*par[3]
  df[4] = 90.*2.*(par[4]-par[3]^2)+10.1*2.*(par[4]-1.)+ 
           19.8*(par[2]-1.)
  return (f, df, nothing)
end

function initial11(keyword::Dict{AbstractString, Any})
#
# Same function as fun1, except we set travel=grid. 
# Want to test if grid is working
#
  keyword["goal"] = "minimize"
  keyword["parameters"] = 2
  keyword["title"] = "test problem 1 using grid"
  keyword["travel"] = "grid"
  keyword["points"] = 10000
  parameter = set_parameter_defaults(keyword)
  parameter.par[1] = -2.0
  parameter.par[2] = 1.0
  parameter.min[2] = -3.0/2.0
# 
#   uniformly distributed random grid of n points over the square [0, 1]^2
#
  n = parameter.points
  p = parameter.parameters
  parameter.grid = rand(n, p)
  return parameter
end

function fun11(par::Vector{Float64})
#
# Same function as fun1, except we set travel=grid. 
# Want to test if grid is working
#
  pars = length(par)
  df = zeros(pars) 
  f = 100(par[2]-par[1]^2)^2+(1.-par[1])^2
  df[1] = -400(par[2]-par[1]^2)*par[1]-2(1.-par[1])
  df[2] = 200(par[2]-par[1]^2)
  return (f, df, nothing)
end

function initial12(keyword::Dict{AbstractString, Any})
#
# Same function as fun2, except we set travel=grid. 
# Want to test if grid is working
#
  keyword["goal"] = "minimize"
  keyword["parameters"] = 2
  keyword["title"] = "test problem 2 using grid"
  keyword["travel"] = "grid"
  keyword["points"] = 10000
  parameter = set_parameter_defaults(keyword)

  parameter.par[1] = 10.0
  parameter.par[2] = 1.0
  parameter.min[2] = 0.0
# 
#   uniformly distributed random grid of n points over the square [0, 1]^2
#
  n = parameter.points
  p = parameter.parameters
  parameter.grid = rand(n, p)
  return parameter
end

function fun12(par::Vector{Float64})
#
# Same function as fun2, except we set travel=grid. 
# Want to test if grid is working
#
  pars = length(par)
  df = zeros(pars) 
  f = par[2]+(1e-5)*(par[2]-par[1])^2
  # df[1] = -(2e-5)*(par[2]-par[1])
  # df[2] = 1.+(2e-5)*(par[2]-par[1])
  return (f, df, nothing)
end


function initial13(keyword::Dict{AbstractString, Any})
#
# calculate standard error of problem 1, not providing grad nor hessian.
#
  keyword["goal"] = "minimize"
  keyword["parameters"] = 2
  keyword["standard_errors"] = true
  keyword["title"] = "test problem 1, not providing derivatives"
  parameter = set_parameter_defaults(keyword)
  parameter.par[1] = -2.0
  parameter.par[2] = 1.0
  parameter.min[2] = -3.0/2.0
  return parameter
end

function fun13(par::Vector{Float64})
#
# calculate standard error of problem 1, not providing grad nor hessian.
#
  pars = length(par)
  df = zeros(pars) 
  f = 100(par[2]-par[1]^2)^2+(1.-par[1])^2
  df[1] = -400(par[2]-par[1]^2)*par[1]-2(1.-par[1])
  df[2] = 200(par[2]-par[1]^2)
  return (f, nothing, nothing)
end

function initial14(keyword::Dict{AbstractString, Any})
#
# Test problem 2 again, now requesting standard error.
# provide grad but not hessian.
# 
  keyword["goal"] = "minimize"
  keyword["parameters"] = 2
  keyword["title"] = "test problem 2, request standard_errors"
  keyword["standard_errors"] = true
  parameter = set_parameter_defaults(keyword)
#
#  Change these defaults as needed.
#
  parameter.par[1] = 10.0
  parameter.par[2] = 1.0
  parameter.min[2] = 0.0
  return parameter
end

function fun14(par::Vector{Float64})
#
# Test problem 2 again, now requesting standard error.
# provide grad but not hessian.
# 
  pars = length(par)
  df = zeros(pars) 
  f = par[2]+(1e-5)*(par[2]-par[1])^2
  df[1] = -(2e-5)*(par[2]-par[1])
  df[2] = 1.+(2e-5)*(par[2]-par[1])
  return (f, df, nothing)
end



@testset "Problem 1 test" begin
    #problem 1 in test problems for nonlinear programming with optimal solutions
    keyword = Dict{AbstractString, Any}()
    keyword = optimization_keywords!(keyword)
    parameter = initial1(keyword)
    (best_point, best_value) = optimize(fun1, parameter)
    @test round(best_value, 20) == 0.0 #Rosenbrock function converges to 0, round result to 20 significant digits
    @test best_point ≈ [1.0, 1.0] #global min is achieved at (a, a^2), and we picked a = 1
end

@testset "Problem 2 test" begin
    #problem 3 in test problems for nonlinear programming with optimal solutions
    keyword = Dict{AbstractString, Any}()
    keyword = optimization_keywords!(keyword)
    parameter = initial2(keyword)
    (best_point, best_value) = optimize(fun2, parameter)
    @test round(best_value, 20) == 0.0 #global min = 0
    @test best_point ≈ [0.0, 0.0] #global min at x = (0, 0)
end

@testset "Problem 3 test" begin
    #problem 4 in test problems for nonlinear programming with optimal solutions
    keyword = Dict{AbstractString, Any}()
    keyword = optimization_keywords!(keyword)
    parameter = initial3(keyword)
    (best_point, best_value) = optimize(fun3, parameter)
    @test round(best_value, 20) == 8/3
    @test best_point ≈ [1.0, 0.0]
end

@testset "Problem 4 test" begin
    #problem 5 in test problems for nonlinear programming with optimal solutions
    keyword = Dict{AbstractString, Any}()
    keyword = optimization_keywords!(keyword)
    parameter = initial4(keyword)
    (best_point, best_value) = optimize(fun4, parameter)
    @test round(best_value, 20) ≈ -0.5 * sqrt(3) - π/3
    @test best_point ≈ [-π/3 + 0.5, -π/3 - 0.5] 
end

@testset "Problem 5 test" begin
    #problem 9 in test problems for nonlinear programming with optimal solutions
    keyword = Dict{AbstractString, Any}()
    keyword = optimization_keywords!(keyword)
    parameter = initial5(keyword)
    (best_point, best_value) = optimize(fun5, parameter)
    @test round(best_value, 20) ≈ -0.5
    @test best_point ≈ [-3.0, -4.0] #taking k = 0, as in the book
end

@testset "Problem 6 test" begin
    #problem 21 in test problems for nonlinear programming with optimal solutions
    keyword = Dict{AbstractString, Any}()
    keyword = optimization_keywords!(keyword)
    parameter = initial6(keyword)
    (best_point, best_value) = optimize(fun6, parameter)
    @test round(best_value, 20) == -99.96
    @test best_point[1] == 2.0
    @test round(best_point[2], 10) ≈ 0.0
end

@testset "Problem 7 test" begin
    #problem 28 in test problems for nonlinear programming with optimal solutions
    keyword = Dict{AbstractString, Any}()
    keyword = optimization_keywords!(keyword)
    parameter = initial7(keyword)
    (best_point, best_value) = optimize(fun7, parameter)
    @test round(best_value, 20) == 0.0
    @test best_point ≈ [0.5, -0.5, 0.5]
end

@testset "Problem 8 test" begin
    #problem 36 in test problems for nonlinear programming with optimal solutions
    keyword = Dict{AbstractString, Any}()
    keyword = optimization_keywords!(keyword)
    parameter = initial8(keyword)
    (best_point, best_value) = optimize(fun8, parameter)
    @test round(best_value, 10) == -3300.0
    @test best_point[1] ≈ 20.0
    @test best_point[2] ≈ 11.0
    @test best_point[3] ≈ 15.0
end

@testset "Problem 9 test" begin
    #problem 24 in test problems for nonlinear programming with optimal solutions
    keyword = Dict{AbstractString, Any}()
    keyword = optimization_keywords!(keyword)
    parameter = initial9(keyword)
    (best_point, best_value) = optimize(fun9, parameter)
    @test round(best_value / 27.0 / sqrt(3), 10) == -1.0
    @test best_point[1:2] ≈ [3, sqrt(3)]
end

@testset "Problem 10 test" begin
    #problem 24 in test problems for nonlinear programming with optimal solutions
    keyword = Dict{AbstractString, Any}()
    keyword = optimization_keywords!(keyword)
    parameter = initial10(keyword)
    (best_point, best_value) = optimize(fun10, parameter)
    @test round(best_value, 10) == 0.0
    @test round(best_point[1], 5) ≈ 1.0 
    @test round(best_point[2], 5) ≈ 1.0#2nd term is 0.999999 (6 nines)
    @test round(best_point[3], 5) ≈ 1.0
    @test round(best_point[4], 5) ≈ 1.0
end

@testset "Problem 11 test" begin
    #same as problem 1, except we use travel = grid instead of search.
    # For some reason the global min is found but the best_point is incorrect.
    keyword = Dict{AbstractString, Any}()
    keyword = optimization_keywords!(keyword)
    parameter = initial11(keyword)
    (best_point, best_value) = optimize(fun11, parameter)
    # @test round(best_value, 20) == 0.0 #Rosenbrock function converges to 0, round result to 20 significant digits
    # @test best_point ≈ [1.0, 1.0] #global min is achieved at (a, a^2), and we picked a = 1
end

@testset "Problem 12 test" begin
    # This is the same as problem 2, except we use travel = grid instead of search.
    # For some reason the global min is found but the best_point is incorrect.
    keyword = Dict{AbstractString, Any}()
    keyword = optimization_keywords!(keyword)
    parameter = initial12(keyword)
    (best_point, best_qvalue) = optimize(fun12, parameter)
    # @test round(best_value, 4) == 0.0 
    # @test best_point ≈ [0.0, 0.0] #global min at x = (0, 0)
end

@testset "Problem 13 test" begin
    #calculate standard error of problem 1, not providing grad or hessian
    keyword = Dict{AbstractString, Any}()
    keyword = optimization_keywords!(keyword)
    parameter = initial13(keyword)
    (best_point, best_value) = optimize(fun13, parameter)
    @test round(best_value, 15) == 0.0 # Instead of having >20 significant digit accuracy, now only has 18
    @test best_point ≈ [1.0, 1.0] #global min is achieved at (a, a^2), and we picked a = 1
end

@testset "Problem 14 test" begin
    #problem 2 test again, requesting standard error
    keyword = Dict{AbstractString, Any}()
    keyword = optimization_keywords!(keyword)
    parameter = initial14(keyword)
    (best_point, best_value) = optimize(fun14, parameter)
    @test round(best_value, 20) == 0.0 #global min = 0
    @test best_point ≈ [0.0, 0.0] #global min at x = (0, 0)
end

#need travel = grid
#need hess_provided = true
#need to recompute the first differential using central differences
