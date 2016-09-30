"""
Setup the structures needed for the Search routines,
including the Parameter data structure whose entries control optimization.
"""
module SearchSetup

export Parameter
export optimization_keywords!, set_parameter_defaults

type Parameter
  cases :: Int # number of cases in a least squares problem
  constraints :: Int # number of affine constraints
  goal :: AbstractString # "minimize" or "maximize"
  output_unit :: IO # for output of Search iterations
  parameters :: Int # number of parameters
  points :: Int # number of points in a grid search
  standard_errors :: Bool # true for parameter standard errors
  title :: AbstractString # problem title
  travel :: AbstractString # "grid" or "search"
  constraint :: Matrix{Float64} # parameter.constraint[constraint, par]
  constraint_level :: Vector{Float64}
  function_value :: Vector{Float64}
  grid :: Matrix{Float64} # parameter.grid[point, coordinate]
  min :: Vector{Float64}
  max :: Vector{Float64}
  name :: Vector{AbstractString}
  par :: Vector{Float64}
end

"""
Defines keywords specific to Search prior to parameter initialization.
"""
function optimization_keywords!(keyword::Dict{AbstractString, Any})

  keyword["cases"] = 0 # number of cases in a least squares problem
  keyword["constraints"] = 0 # number of affine constraints
  keyword["goal"] = "maximize" # "minimize" or "maximize"
  keyword["output_unit"] = STDOUT # for output of Search iterations
  keyword["parameters"] = 1 # number of parameters
  keyword["points"] = 0 # number of points in a grid search
  keyword["standard_errors"] = false # true for parameter standard errors
  keyword["title"] = "" # problem title
  keyword["travel"] = "search" # "search" or "grid"
  return keyword
end # optimization_keywords!

"""
Initializes the parameter data structure based on appropriate keywords.
"""
function set_parameter_defaults(keyword::Dict{AbstractString, Any})

  cases = keyword["cases"]
  constraints = keyword["constraints"]
  goal = keyword["goal"]
  output_unit = keyword["output_unit"]
  pars = keyword["parameters"]
  points = keyword["points"]
  standard_errors = keyword["standard_errors"]
  title = keyword["title"]
  travel = keyword["travel"]
  #
  # Check that input variables are properly defined.
  #
  if constraints < 0
    throw(ArgumentError(
      "The number of constraints ($constraints) must be nonnegative.\n \n"))
  end
  if goal != "minimize" && goal != "maximize"
    throw(ArgumentError(
      "The variable goal ($goal) must be minimize or maximize.\n \n"))
  end
  if pars < 0
    throw(ArgumentError(
      "The number of parameters ($pars) must be nonnegative.\n \n"))
  end
  if points < 0
    throw(ArgumentError(
      "The number of grid points ($points) must be nonnegative.\n \n"))
  end
  if travel != "grid" && travel != "search"
    throw(ArgumentError(
      "The variable travel ($travel) must be grid or search.\n \n"))
  end
  #
  # Name the parameters par 1, par 2, and so forth.
  #
  pname = ["par" for i = 1:pars]
  for i = 1:pars
    pname[i] = pname[i]*" $i"
    pname[i] = rpad(pname[i], 8, ' ')
  end
  #
  # Set other array defaults.
  #
  grid = zeros(points, pars)
  par = zeros(pars)
  pmin = zeros(pars)
  pmin[1:pars] = -Inf
  pmax = zeros(pars)
  pmax[1:pars] = Inf
  constraint = zeros(constraints, pars)
  constraint_level = zeros(constraints)
  level = zeros(constraints)
  if travel == "grid"
    function_value = zeros(points)
  else
    function_value = zeros(2)
  end
  parameter = Parameter(cases, constraints, goal, output_unit, pars, 
    points, standard_errors, title, travel, constraint, constraint_level, 
    function_value, grid, pmin, pmax, pname, par)
  #
  # These initial values can now be altered via the returned parameter.
  #
  return parameter
end # function set_parameter_defaults

end # module SearchSetup

