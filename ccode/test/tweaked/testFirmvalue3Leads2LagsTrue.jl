function firmvalue3Leads2LagsTrue()::Bool

    file = matopen("../test/matDir/"*"amaAlgTestMatsfirmvalue3Leads2LagsTrue.mat")
    bb=read(file,"bb")
    bb=if(typeof(bb)==(Array{Float64,2})) bb else hcat(bb) end
    close(file)

    file = matopen("../test/matDir/"*"amaAlgTestMatsfirmvalue3Leads2LagsTrue.mat")
    rts=read(file,"rts")
    rts=if(typeof(rts)==(Array{Float64,2})) rts else hcat(rts) end
    close(file)

    file = matopen("../test/matDir/"*"amaAlgTestMatsfirmvalue3Leads2LagsTrue.mat")
    hh=read(file,"hh")
    hh=if(typeof(hh)==(Array{Float64,2})) hh else hcat(hh) end
    close(file)
    
    nlags=2
    nleads=3

    display(hh)
    display(rts)
    display(bb)
    
    (hh, cofb, qmatrix, returnCode) = callSparseAim(hh, nleads, nlags)

    isapprox(cofb, bb)
end