module YaoToEinsum

using YaoBlocks, YaoBlocks.YaoArrayRegister, OMEinsum
using YaoBlocks: sparse
using LinearAlgebra
using OMEinsum: writejson, readjson
import OMEinsum: optimize_code

export yao2einsum, DensityMatrixMode, PauliBasisMode, VectorMode
export TensorNetwork, optimize_code, contraction_complexity, contract
export TreeSA
export save_tensor_network, load_tensor_network

include("Core.jl")
include("circuitmap.jl")
include("densitymatrix.jl")
include("fileio.jl")

@deprecate optimize_code(network::TensorNetwork, optimizer, simplifier; kwargs...) optimize_code(network, optimizer; simplifier, kwargs...)

end
