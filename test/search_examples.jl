  function initial1(keyword::Dict{ASCIIString, Any})
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

function initial2(keyword::Dict{ASCIIString, Any})
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

function initial3(keyword::Dict{ASCIIString, Any})
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

function initial4(keyword::Dict{ASCIIString, Any})
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
  f = sin(par[1]+par[2])+(par[1]-par[2])^2-1.5*par[1]+2.5*par[2]
  df[1] = cos(par[1]+par[2])+2.*(par[1]-par[2])-1.5
  df[2] = cos(par[1]+par[2])-2.*(par[1]-par[2])+2.5
  return (f, df, nothing)
end

function initial5(keyword::Dict{ASCIIString, Any})
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

function initial6(keyword::Dict{ASCIIString, Any})
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

function initial7(keyword::Dict{ASCIIString, Any})
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

function initial8(keyword::Dict{ASCIIString, Any})
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

function initial9(keyword::Dict{ASCIIString, Any})
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

function initial10(keyword::Dict{ASCIIString, Any})
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

function initial11(keyword::Dict{ASCIIString, Any})
#
# This function initializes a minimization problem.
#
#  Set defaults for the parameter data structure.
#
  keyword["goal"] = "minimize"
  keyword["constraints"] = 0
  keyword["parameters"] = 4
  keyword["cases"] = 21
  keyword["standard_errors"] = true
  keyword["title"] = "nonlinear least squares"
  parameter = set_parameter_defaults(keyword)
#
#  Change these defaults as needed.
#
  parameter.par[1] = 10.
  parameter.par[2] = -0.1
  parameter.par[3] = 5.
  parameter.par[4] = -0.01
  parameter.max[2] = 0.
  parameter.max[4] = 0.
  return parameter 
end

function fun11(par::Vector{Float64})
#
# Define a function to be minimized. Include as needed
# the first and second differentials.
#
  count = [15.1117,11.3601,9.7652,9.0935,8.4820,7.6891,7.3342,
           7.0593,6.7041,6.4313,6.1554,5.9940,5.7698,5.6440,5.3915,5.0938,
           4.8717,4.5996,4.4968,4.3602,4.2668]
  weight = [.004379,.007749,.010487,.012093,.013900,.016914,
           .018591,.020067,.022249,.024177,.026393,.027833,.030039,.031392,
           .034402,.038540,.042135,.047267,.049453,.052600,.054928]
  time = [2.,4.,6.,8.,10.,15.,20.,25.,30.,40.,50.,60.,70.,80.,
           90.,110.,130.,150.,160.,170.,180.]
#
# This problem of exponential fitting revolves around the 
# Gauss-Newton method.
#
  pars = length(par)
  f = 0.0
  df = zeros(pars) 
  d2f = zeros(pars,pars)      
  dg = zeros(pars)
#
# Loop over all cases. The regression function is denoted by g.
# 
  for i = 1:length(count)
    g = par[1]*exp(par[2]*time[i])+par[3]*exp(par[4]*time[i])
    dg[1] = exp(par[2]*time[i])
    dg[2] = time[i]*par[1]*exp(par[2]*time[i])
    dg[3] = exp(par[4]*time[i])
    dg[4] = time[i]*par[3]*exp(par[4]*time[i])
    residual = count[i]-g
    f = f+weight[i]*residual^2
    df = df-2.0*weight[i]*residual*dg
    d2f = d2f+2.0*weight[i]*dg*dg'
  end
  return(f, df, d2f)
end

function initial12(keyword::Dict{ASCIIString, Any})
#
# This function initializes a minimization problem.
#
#  Set defaults for the parameter data structure.
#
  keyword["goal"] = "maximize"
  keyword["constraints"] = 1
  keyword["parameters"] = 3
  keyword["cases"] = 0
  keyword["standard_errors"] = true
  keyword["title"] = "ABO frequency estimation"
  parameter = set_parameter_defaults(keyword)
#
#  Change these defaults as needed.
#
  fill!(parameter.min,1e-6)
  fill!(parameter.par,1.0/3.0)
  fill!(parameter.constraint,1.0)
  fill!(parameter.constraint_level,1.0)
  parameter.name[1] = "A freq  "
  parameter.name[2] = "B freq  "
  parameter.name[3] = "O freq  "
  return parameter
end

function fun12(par::Vector{Float64})
#
# Define a function to be minimized. Include as needed
# the first and second differentials.
#
  count = [182.,60.,17.,176.]
#
# This problem estimates ABO allele frequencies.
#
  pars = length(par)
  cases = sum(count)
  f = 0.0
  df = zeros(pars)
  d2f = zeros(pars,pars) 
  for i = 1:4
    dq = zeros(pars) 
    if i == 1
      q = par[1]^2+2par[1]*par[3]
      dq[1] = 2(par[1]+par[3])
      dq[3] = 2par[1]
    elseif i == 2
      q = par[2]^2+2par[2]*par[3]
      dq[2] = 2(par[2]+par[3])
      dq[3] = 2par[2]
    elseif i == 3
      q = 2par[1]*par[2]
      dq[1] = 2par[2]
      dq[2] = 2par[1]
    else
      q = par[3]^2
      dq[3] = 2par[3]
    end
    f = f + count[i]*log(q)
    df = df + count[i]*dq/q
    d2f = d2f - (cases/q)*dq*dq'
  end
#
# This example illustrates the scoring algorithm.
# To see the impact of numerical differentiation on
# convergence and values of estimated standard errors,
# return just the objective value f.
#
  return(f, df, d2f)
#   return(f, df, nothing)
end

function initial13(keyword::Dict{ASCIIString, Any})
#
# This function initializes a minimization problem.
#
#  Set defaults for the parameter data structure.
#
  keyword["goal"] = "minimize"
  keyword["constraints"] = 1
  keyword["parameters"] = 2
  keyword["standard_errors"] = true
  keyword["title"] = "survival data"
  parameter = set_parameter_defaults(keyword)
#
#  Change these defaults as needed.
#
  fill!(parameter.min,1e-6)
  fill!(parameter.par,10.0)
  parameter.name[1] = "mean 1  "
  parameter.name[2] = "mean 2  "
  parameter.constraint[1,1] = 1.0
  parameter.constraint[1,2] = -1.0
  return parameter
end

function fun13(par::Vector{Float64})
#
# Define a function to be minimized. Include as needed
# the first and second differentials.
#
  time = [6.,6.,6.,7.,10.,13.,16.,22.,23.,6.,9.,10.,11.,17.,
          19.,20.,25.,32.,32.,34.,35.,1.,1.,2.,2.,3.,4.,4.,5.,
          5.,8.,8.,8.,8.,11.,11.,12.,12.,15.,17.,22.,23.]
  died = zeros(Int64,42)
  died[10:21] = 1
  group = ones(Int64,42)
  group[22:42] = 2
#
  pars = length(par)
  f = 0.0
  df = zeros(pars)
  d2f = zeros(pars,pars)
#
# Loop over all cases.
#
  for j = 1:length(time)
    i = group[j]
    mean = par[i]
    if died[j] == 1
      g = exp(-time[j]/mean)
      dg = g*time[j]/mean^2
      f = f-log(g)
      df[i] = df[i]-dg/g
      d2f[i,i] = d2f[i,i]+dg^2/(g*(1.0-g))
    else
      g = mean
      dg = 1.0
      f = f+log(g)+time[j]/g
      df[i] = df[i]+(g-time[j])*dg/g^2
      d2f[i,i] = d2f[i,i]+dg^2/g^2
    end
  end
  return(f, df, d2f)
end

function initial14(keyword::Dict{ASCIIString, Any})
#
# This function initializes a minimization problem.
#
#  Set defaults for the parameter data structure.
#
  keyword["goal"] = "minimize"
  keyword["constraints"] = 0
  keyword["parameters"] = 2
  keyword["standard_errors"] = false
  keyword["title"] = "slash regression"
  parameter = set_parameter_defaults(keyword)
  parameter = set_parameter_defaults(keyword)
#
# Declare global variables to pass the slash parameter
# and the standard deviation parameter.
#
  global nu, sigma
  nu = 4.0
  sigma = 41.0
#
#  Change these defaults as needed.
#
  parameter.par[1] = 115.
  parameter.par[2] = .93
  return parameter
end

function fun14(par::Vector{Float64})
#
# Define a function to be minimized. Include as needed
# the first and second differentials.
#
  births = [142.,173.,130.,122.,111.,112.,99.,88.,130.,137.,48.,
            94.,97.,88.,91.,104.,100.,121.,97.,133.,115.,120.,224.,4.]
  deaths = [228.,253.,230.,242.,213.,217.,248.,207.,228.,311.,110.,
            257.,233.,217.,237.,281.,233.,204.,194.,199.,220.,231.,243.,14.]
#
  global nu, sigma
#
  pars = length(par)
  f = 0.0
  df = zeros(pars)
  d2f = zeros(pars,pars)
  dg = zeros(pars)
  cases = length(births)
  sumsq = 0.0
  sumv = 0.0
#
# Loop over all cases.
#
  for i = 1:cases
    g = par[1]+par[2]*births[i]
    residual = deaths[i]-g
    dg[1] = 1.0
    dg[2] = births[i]
    beta = nu+0.5
    s = 0.5*(residual/sigma)^2
    (gamin, dgamin) = incgam(beta,s)
    if s+gamin < 20.0
      weight = beta/s-1.0/(s*exp(s+gamin))
    else
      weight = beta/s
    end
    f = f-log(nu/sigma)-gamin
    df = df-weight*residual*dg
    d2f = d2f+weight*dg*dg'      
    sumsq = sumsq+weight*residual^2
    sumv = sumv+dgamin      
  end
#
# Update the slash parameter and the standard deviation parameter.
#
  nu = -cases/sumv
  sigma = sqrt(sumsq/cases)
  return(f, df, d2f)
end

function incgam(beta,s)
#
# This function delivers the log of the incomplete
# gamma function and its derivative.
#
  if s/beta <= 10.0
    b = beta
    prod = 1.0/b
    sum = -prod
    gamin = prod
    dgamin = prod*sum
    for i = 1:100
      b = b+1.0
      prod = prod*s/b
      sum = sum-1.0/b
      g = gamin
      d = dgamin
      gamin = gamin+prod
      dgamin = dgamin+prod*sum
      if gamin == g && dgamin == d; break; end
    end
    dgamin = dgamin/gamin
    gamin = log(gamin)-s
  else
    gamin = lgamma(beta)-beta*log(s)
    dgamin = digamma(beta)-log(s)
  end
  return (gamin, dgamin)
end

#
# Run the various test problems.
# Launch Julia, then run this file:
# include("search_example.jl")
#
using Search
using SearchSetup
keyword = Dict{ASCIIString, Any}()
keyword = optimization_dictionary(keyword)
outfile = "Search.out"
io = open(outfile, "w")
keyword["output_unit"] = io
parameter = initial1(keyword)
(best_point, best_value) = optimize(fun1, parameter)
parameter = initial2(keyword)
(best_point, best_value) = optimize(fun2, parameter)
parameter = initial3(keyword)
(best_point, best_value) = optimize(fun3, parameter)
parameter = initial4(keyword)
(best_point, best_value) = optimize(fun4, parameter)
parameter = initial5(keyword)
(best_point, best_value) = optimize(fun5, parameter)
parameter = initial6(keyword)
(best_point, best_value) = optimize(fun6, parameter)
parameter = initial7(keyword)
(best_point, best_value) = optimize(fun7, parameter)
parameter = initial8(keyword)
(best_point, best_value) = optimize(fun8, parameter)
parameter = initial9(keyword)
(best_point, best_value) = optimize(fun9, parameter)
parameter = initial10(keyword)
(best_point, best_value) = optimize(fun10, parameter)
parameter = initial11(keyword)
(best_point, best_value) = optimize(fun11, parameter)
parameter = initial12(keyword)
(best_point, best_value) = optimize(fun12, parameter)
parameter = initial13(keyword)
(best_point, best_value) = optimize(fun13, parameter)
parameter = initial14(keyword)
(best_point, best_value) = optimize(fun14, parameter)
close(io)

