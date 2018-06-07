module ShiftRight

export shiftRight

#= 
  shiftright(matrixIn,nn)

  Shift the rows of x to the right by nn columns, leaving zeros in the
  first nn columns.
=#

function shiftRight(matrixIn::Array{Float64,2}, nn::Int64)

	 numColumns = size(matrixIn, 2)	 

	 # left side of input matrix that holds data from column 1 to nn
	 left = matrixIn[:, 1:nn]

	 # initialize new array same size as input matrix to all zeros
	 result = zeros(matrixIn)

	 # replace right size of input matrix with the first nn columns
	 result[:, (nn + 1):numColumns] = left

	 return result 
end

end # module
