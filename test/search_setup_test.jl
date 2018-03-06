using Search,   SearchSetup

info("Unit tests for search_setup")

srand(123)

@testset "set some keyword if we want to run optimization" begin
    keyword = Dict{AbstractString, Any}()
    optimization_keywords!(keyword)

    @test typeof(keyword) == Dict{AbstractString, Any}
    @test keyword["cases"] == 0 # number of cases in a least squares problem
    @test keyword["constraints"] == 0 # number of affine constraints
    @test keyword["goal"] == "maximize" # "minimize" or "maximize"
    @test keyword["output_unit"] == STDOUT # for output of Search iterations
    @test keyword["parameters"] == 1 # number of parameters
    @test keyword["points"] == 0 # number of points in a grid search
    @test keyword["standard_errors"] == false # true for parameter standard errors
    @test keyword["title"] == "" # problem title
    @test keyword["travel"] == "search" # "search" or "grid"
end

@testset "set parameter defaults" begin
    keyword = Dict{AbstractString, Any}()
    optimization_keywords!(keyword)
    param = set_parameter_defaults(keyword)
    @test param.cases == 0
    @test param.constraints == 0
    @test param.goal == "maximize"
    @test param.output_unit == STDOUT
    @test typeof(param.output_unit) == Base.TTY # typeof(STDOUT) == Base.TTY
    @test param.parameters == 1
    @test param.points == 0
    @test param.title == ""
    @test param.travel == "search"
    @test size(param.constraint) == (0, 1)
    @test typeof(param.constraint) <: Array
    @test eltype(param.constraint) == Float64
    @test size(param.constraint_level) == (0, )
    @test typeof(param.constraint_level) <: Array
    @test eltype(param.constraint_level) == Float64
    @test size(param.function_value) == (2,)
    @test typeof(param.function_value) <: Array
    @test eltype(param.function_value) == Float64
    @test param.function_value == zeros(2)
    @test size(param.grid) == (0, 1)
    @test typeof(param.grid) <: Array
    @test param.grid == zeros(param.points, param.parameters)
    @test size(param.min) == (1, )
    @test typeof(param.min) <: Array
    @test all(param.min .== -Inf)
    @test size(param.max) == (1, )
    @test typeof(param.max) <: Array
    @test all(param.max .== Inf)
    @test typeof(param.name) <: Array
    @test eltype(param.name) == AbstractString
    @test size(param.name) == (1, )
    @test typeof(param.par) <: Array
    @test size(param.par) == (1, )

    # give bad inputs and see if errors are thrown properly
    keyword["constraints"] = -rand()
    @test_throws(ArgumentError, set_parameter_defaults(keyword))
    keyword["constraints"] = 0 # set it back 
    keyword["goal"] = "random string"
    @test_throws(ArgumentError, set_parameter_defaults(keyword))
    keyword["goal"] = "minimize"
    keyword["parameters"] = -rand()
    @test_throws(ArgumentError, set_parameter_defaults(keyword))
    keyword["parameters"] = 1
    keyword["points"] = -rand()
    @test_throws(ArgumentError, set_parameter_defaults(keyword))
    keyword["points"] = 0
    keyword["travel"] = "random string"
    @test_throws(ArgumentError, set_parameter_defaults(keyword))
end