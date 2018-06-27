module ReducedFormTests
using MAT

# test reducedForm

import AMAFUNCS.reducedForm

#tweaked= False
# test reducedForm firmvalue example
function firmvalueFalse()::Bool

neq=4::Int64;nlag=1::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64

#=====================================
 bb=[0.  0.228571  0.  0.;
 0.  0.4  0.  0.;
 0.  0.  0.  0.;
 0.  0.  0.  1.]::Array{Float64,2}
 
 qNew=[0.  -0.4  0.  0.  0.  1.  -1.  0.;
 0.  0.  0.  0.  0.  0.  1.  0.;
 0.  0.  0.  -1.  0.  0.  0.  1.;
0. 0. 0. 0. 0. 0. 0. 0.]::Array{Float64,2}
============================#

qRows=4::Int64

qCols=8::Int64

bCols=4::Int64

anEpsi=0.0000000001::Float64

file = matopen("./matDir/reducedForm_examples/"*"firmvalueFalse.mat")
bb=read(file,"bb")
qNew=read(file,"qNew")
close(file)

(nonsingJulia,bbJulia)=reducedForm(qNew,qRows,qCols,bCols,neq,anEpsi)
isapprox(bbJulia,bb,rtol=0.0::Float64,atol=1e-4::Float64)#&&
#nonsingJulia==true
end;

#tweaked= False
# test reducedForm firmvalue3Leads2Lags example
function firmvalue3Leads2LagsFalse()::Bool


neq=4::Int64;nlag=2::Int64;nlead=3::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64

#==================================================
bb=[0.  0.0374804  0.  0.  0.  0.31179  0.  0.;
0.  0.4  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  1.]::Array{Float64,2}

qNew=[0.  -0.4  0.  0.  0.  0.  0.  0.  0.  1.  -1.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  -1.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  -0.4  0.  0.  0.  0.  0.  0.  0.  1.  -1.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -1.  0.  0.  0.  1.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  -0.4  0.  0.  0.  0.  0.  0.  0.  1.  -1.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -1.  0.  0.  0.  1.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.]::Array{Float64,2}
=================================================#

file = matopen("./matDir/reducedForm_examples/"*"firmvalue3Leads2LagsFalse.mat")
bb=read(file,"bb")
qNew=read(file,"qNew")
close(file)
    
nonsing=true::Bool

qRows=12::Int64

qCols=20::Int64

bCols=8::Int64

anEpsi=0.0000000001::Float64

(nonsingJulia,bbJulia)=reducedForm(qNew,qRows,qCols,bCols,neq,anEpsi)
isapprox(bbJulia,bb,rtol=0.0::Float64,atol=1e-4::Float64)&&
nonsingJulia==nonsing
end;

#tweaked= False
# test reducedForm example7 example
function example7False()::Bool


neq=4::Int64;nlag=1::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64

#=================================================
bb=[0.  0.  0.  -0.655141;
0.  0.  0.  -0.29452;
0.  0.  0.  -0.663972;
0.  0.  0.  0.336028]::Array{Float64,2}

qNew=[0.  0.  0.  1.  0.  0.  1.  -1.;
0.  0.  0.  -0.66  0.  -1.1  0.  1.;
0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.]::Array{Float64,2}
=================================================#

file = matopen("./matDir/reducedForm_examples/"*"example7False.mat")
bb=read(file,"bb")
qNew=read(file,"qNew")
close(file)
    
nonsing=true::Bool

qRows=4::Int64

qCols=8::Int64

bCols=4::Int64

anEpsi=0.0000000001::Float64

(nonsingJulia,bbJulia)=reducedForm(qNew,qRows,qCols,bCols,neq,anEpsi)
isapprox(bbJulia,bb,rtol=0.0::Float64,atol=1e-4::Float64)&&
nonsingJulia==nonsing
end;

#tweaked= False
# test reducedForm oneEquationNoLead example
function oneEquationNoLeadFalse()::Bool


neq=1::Int64;nlag=1::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


bb=hcat([-0.666667])::Array{Float64,2}

qNew=[2.  3.]::Array{Float64,2}

nonsing=true::Bool

qRows=1::Int64

qCols=2::Int64

bCols=1::Int64

anEpsi=0.0000000001::Float64

(nonsingJulia,bbJulia)=reducedForm(qNew,qRows,qCols,bCols,neq,anEpsi)
isapprox(bbJulia,bb,rtol=0.0::Float64,atol=1e-4::Float64)&&
nonsingJulia==nonsing
end;

#tweaked= False
# test reducedForm reliablePaperExmpl example
function reliablePaperExmplFalse()::Bool


neq=5::Int64;nlag=1::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64

#=====================================
bb=[0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.;
0.  0.  0.  0.214101  0.;
0.  0.  0.  0.361236  0.;
0.  0.  0.  0.530747  0.]::Array{Float64,2}

qNew=[0.  0.  0.  -0.5  0.  0.  -1.  0.7  -0.5  1.;
0.  0.  0.  0.  0.  1.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  1.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.]::Array{Float64,2}
======================================#

file = matopen("./matDir/reducedForm_examples/"*"reliablePaperExmplFalse.mat")
bb=read(file,"bb")
qNew=read(file,"qNew")
close(file)
    
nonsing=true::Bool

qRows=5::Int64

qCols=10::Int64

bCols=5::Int64

anEpsi=0.0000000001::Float64

(nonsingJulia,bbJulia)=reducedForm(qNew,qRows,qCols,bCols,neq,anEpsi)
isapprox(bbJulia,bb,rtol=0.0::Float64,atol=1e-4::Float64)&&
nonsingJulia==nonsing
end;

#tweaked= False
# test reducedForm athan example
function athanFalse()::Bool


neq=9::Int64;nlag=1::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64

#=============================================
bb=[0.828597  0.296449  -0.11369  0.212332  0.  0.  0.  0.  0.;
0.293  0.764  -0.293  0.  0.  0.  0.  0.  0.;
1.95019  1.3569  -0.520381  -0.486336  0.  0.  0.  0.  0.;
0.  0.  0.  0.911  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  1.]::Array{Float64,2}

qNew=[-0.293  -0.764  0.293  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  -1.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  -2.  -1.  1.  1.  0.  0.  2.  0.  0.;
0.  0.  0.  -0.911  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  -1.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  -1.  0.  0.  0.  0.  0.  0.  0.  0.  1.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.]::Array{Float64,2}
==============================================#

file = matopen("./matDir/reducedForm_examples/"*"athanFalse.mat")
bb=read(file,"bb")
qNew=read(file,"qNew")
close(file)
    
nonsing=true::Bool

qRows=9::Int64

qCols=18::Int64

bCols=9::Int64

anEpsi=0.0000000001::Float64

(nonsingJulia,bbJulia)=reducedForm(qNew,qRows,qCols,bCols,neq,anEpsi)
isapprox(bbJulia,bb,rtol=0.0::Float64,atol=1e-4::Float64)&&
nonsingJulia==nonsing
end;

#tweaked= False
# test reducedForm habitmod example
function habitmodFalse()::Bool


neq=12::Int64;nlag=4::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64

#==================================
bb=[0.0275299  0.  0.0204675  0.00384168  0.0510466  0.  0.  0.  0.  0.  0.  0.  -0.150125  0.  0.0802913  -0.0569634  0.0332227  0.  0.  0.  0.  0.  0.  0.  0.00762739  0.  0.132004  -0.000975575  0.140907  0.  0.  0.  0.  0.  0.  0.  0.409592  0.531564  0.281743  -0.370309  -0.00715738  0.  0.000594579  0.  0.  0.  0.  0.0247319;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.88879  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
-0.52802  0.  -0.11279  -0.031833  -0.024734  0.  0.  0.  0.  0.  0.  0.  0.71526  0.  -0.042076  0.22829  0.012267  0.  0.  0.  0.  0.  0.  0.  -0.22215  0.  0.14172  -0.26679  0.11959  0.  0.  0.  0.  0.  0.  0.  0.42308  0.  0.61076  0.10946  -0.17172  0.  0.  0.  0.  0.  0.  0.00011277;
-0.46436  0.  -0.16131  -0.02744  -0.17087  0.  0.  0.  0.  0.  0.  0.  1.3425  0.  -0.16794  0.35818  0.09837  0.  0.  0.  0.  0.  0.  0.  -1.06382  0.  0.02255  -0.51594  -0.08949  0.  0.  0.  0.  0.  0.  0.  0.46672  0.  0.11369  1.10657  0.26021  0.  0.  0.  0.  0.  0.  0.00141;
0.23292  0.  -0.08512  0.04213  -0.14149  0.  0.  0.  0.  0.  0.  0.  -0.03313  0.  -0.15223  -0.01572  0.34762  0.  0.  0.  0.  0.  0.  0.  -0.70552  0.  0.24697  -0.21888  0.07805  0.  0.  0.  0.  0.  0.  0.  0.56316  0.  0.08268  0.16054  0.68637  0.  0.  0.  0.  0.  0.  0.00348;
-0.0486562  0.  -0.0143582  -0.00361503  -0.0163681  0.  0.  0.  0.  0.  0.  0.  0.0963933  0.  -0.0262052  0.0337474  -0.00907889  0.  0.  0.  0.  0.  0.  0.  -0.0178323  0.  -0.0276432  -0.0192967  -0.0320882  0.  0.  0.  0.  0.  0.  0.  0.0410416  0.105222  -0.0348985  0.115168  -0.012502  0.  0.0000156628  0.  0.  0.  0.  0.0265769;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.99853  0.  0.  0.  0.  0.  0.00147  0.  0.  0.  0.  0.;
0.0265517  0.  0.019758  0.00370218  0.0492574  0.  0.  0.  0.  0.  0.  0.  -0.145004  0.  0.0774512  -0.0549674  0.0320274  0.  0.  0.  0.  0.  0.  0.  0.00761162  0.  0.127323  -0.000854112  0.135885  0.  0.  0.  0.  0.  0.  0.  -25.5133  0.512756  0.27179  -0.35728  -0.00690759  0.  -0.0375677  0.  0.  0.  0.  0.02386;
0.521517  0.  0.1143  0.0309276  0.0282826  0.  0.  0.  0.  0.  0.  0.  -0.724878  0.  0.0467801  -0.229153  -0.0155764  0.  0.  0.  0.  0.  0.  0.  0.232646  0.  -0.140072  0.271375  -0.122108  0.  0.  0.  0.  0.  0.  0.  -0.421116  0.0172992  -0.603894  -0.115681  0.153917  0.  0.00000222775  0.  0.  0.  0.  0.00504552;
0.0235796  0.  -0.0818094  0.0108053  -0.152502  0.  0.  0.  0.  0.  0.  0.  0.436271  0.  -0.246456  0.127264  0.0284865  0.  0.  0.  0.  0.  0.  0.  -0.248762  0.  -0.221058  -0.110815  -0.0970434  0.  0.  0.  0.  0.  0.  0.  25.5232  -0.947988  -0.416326  0.61486  0.420138  0.  0.0375093  0.  0.  0.  0.  -0.152162;
-0.00201156  0.  0.00248092  -0.000581449  0.00412511  0.  0.  0.  0.  0.  0.  0.  -0.0116365  0.  0.00675309  -0.00288513  -0.00242817  0.  0.  0.  0.  0.  0.  0.  0.00965336  0.  0.00373112  0.00447091  -0.00157814  0.  0.  0.  0.  0.  0.  0.  -0.998996  0.0173377  0.00574045  -0.0102517  -0.0165428  0.  -0.00146776  0.  0.  0.  0.  0.00513261;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.]::Array{Float64,2}

qNew=[0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  -1.  -1.  0.  0.  3.45419  0.  0.  -0.74118  0.00208517  0.494116  -0.1149;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -0.88879  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.52802  0.  0.11279  0.031833  0.024734  0.  0.  0.  0.  0.  0.  0.  -0.71526  0.  0.042076  -0.22829  -0.012267  0.  0.  0.  0.  0.  0.  0.  0.22215  0.  -0.14172  0.26679  -0.11959  0.  0.  0.  0.  0.  0.  0.  -0.42308  0.  -0.61076  -0.10946  0.17172  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  -0.00011277;
0.46436  0.  0.16131  0.02744  0.17087  0.  0.  0.  0.  0.  0.  0.  -1.3425  0.  0.16794  -0.35818  -0.09837  0.  0.  0.  0.  0.  0.  0.  1.06382  0.  -0.02255  0.51594  0.08949  0.  0.  0.  0.  0.  0.  0.  -0.46672  0.  -0.11369  -1.10657  -0.26021  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  -0.00141;
-0.23292  0.  0.08512  -0.04213  0.14149  0.  0.  0.  0.  0.  0.  0.  0.03313  0.  0.15223  0.01572  -0.34762  0.  0.  0.  0.  0.  0.  0.  0.70552  0.  -0.24697  0.21888  -0.07805  0.  0.  0.  0.  0.  0.  0.  -0.56316  0.  -0.08268  -0.16054  -0.68637  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  -0.00348;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -0.99853  0.  0.  0.  0.  0.  -0.00147  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.]::Array{Float64,2}
======================================#

file = matopen("./matDir/reducedForm_examples/"*"habitmodFalse.mat")
bb=read(file,"bb")
qNew=read(file,"qNew")
close(file)
    
nonsing=true::Bool

qRows=12::Int64

qCols=60::Int64

bCols=48::Int64

anEpsi=0.0000000001::Float64

(nonsingJulia,bbJulia)=reducedForm(qNew,qRows,qCols,bCols,neq,anEpsi)
isapprox(bbJulia,bb,rtol=0.0::Float64,atol=1e-4::Float64)&&
nonsingJulia==nonsing
end;

#tweaked= True
# test reducedForm firmvalue example
function firmvalueTrue()::Bool


neq=4::Int64;nlag=1::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64

#====================================
bb=[0.  0.228571  0.  0.000000000000000291653;
0.  0.4  0.  0.;
0.  0.0000000000000000391753  0.  0.;
0.  0.0000000000000000114197  0.  1.]::Array{Float64,2}

qNew=[0.  -0.367457  0.  0.081357  -0.000000000000000111022  0.918643  -1.  -0.081357;
0.  0.0325428  0.  0.081357  -0.000000000000000111022  -0.081357  1.  -0.081357;
0.  0.0325428  0.  -0.918643  0.  -0.081357  0.  0.918643;
0.  0.  0.  0.  0.  0.  0.  0.]::Array{Float64,2}
========================================#

file = matopen("./matDir/reducedForm_examples/"*"firmvalueTrue.mat")
bb=read(file,"bb")
qNew=read(file,"qNew")
close(file)
    
nonsing=true::Bool

qRows=4::Int64

qCols=8::Int64

bCols=4::Int64

anEpsi=0.0000000001::Float64

(nonsingJulia,bbJulia)=reducedForm(qNew,qRows,qCols,bCols,neq,anEpsi)
isapprox(bbJulia,bb,rtol=0.0::Float64,atol=1e-4::Float64)&&
nonsingJulia==nonsing
end;

#tweaked= True
# test reducedForm firmvalue3Leads2Lags example
function firmvalue3Leads2LagsTrue()::Bool


neq=4::Int64;nlag=2::Int64;nlead=3::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64

#=============================================
bb=[0.  0.0374804  0.  0.  0.  0.31179  0.  0.000000000227773;
0.  0.4  0.  0.  0.  0.00000000000000000156329  0.  -0.0000000000000000316816;
0.  0.00000000000000000518865  0.  0.  0.  0.0000000000000000236406  0.  -0.0000000000000000152263;
0.  -0.0000000000000000000989475  0.  0.  0.  0.  0.  1.]::Array{Float64,2}

qNew=[0.  -0.367457  0.  0.  0.  0.  0.  0.081357  0.  0.918643  -1.  -0.081357  0.  0.0000000000000000555112  0.  0.  0.  0.  0.  0.;
0.  0.0325428  0.  0.  0.  0.  0.  0.081357  -0.000000000000000111022  -0.081357  1.  -0.081357  0.  0.0000000000000000277556  0.  0.  0.  0.  0.  0.;
0.  0.0325428  0.  0.  0.  0.  0.  -0.918643  0.  -0.081357  0.  0.918643  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  -0.367457  0.  0.  0.  0.  0.  0.081357  0.  0.918643  -1.  -0.081357  0.  0.0000000000000000555112  0.  0.;
0.  0.  0.  0.  0.  0.0325428  0.  0.  0.  0.  0.  0.081357  -0.000000000000000111022  -0.081357  1.  -0.081357  0.  0.0000000000000000277556  0.  0.;
0.  0.  0.  0.  0.  0.0325428  0.  0.  0.  0.  0.  -0.918643  0.  -0.081357  0.  0.918643  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.31411  0.  0.  0.  0.  0.  -0.109152  0.0000000000000000496507  -0.785275  0.447214  0.109152;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.193439  0.  0.  0.  0.  0.  0.036384  -0.0000000000000000993014  -0.483598  1.34164  -0.036384;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.0325428  0.  0.  0.  0.  0.  -0.918643  0.  -0.081357  0.  0.918643;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.]::Array{Float64,2}
 ================================================#

file = matopen("./matDir/reducedForm_examples/"*"firmvalue3Leads2LagsTrue.mat")
bb=read(file,"bb")
qNew=read(file,"qNew")
close(file)
    
nonsing=true::Bool

qRows=12::Int64

qCols=20::Int64

bCols=8::Int64

anEpsi=0.0000000001::Float64

(nonsingJulia,bbJulia)=reducedForm(qNew,qRows,qCols,bCols,neq,anEpsi)
isapprox(bbJulia,bb,rtol=0.0::Float64,atol=1e-4::Float64)&&
nonsingJulia==nonsing
end;

#tweaked= True
# test reducedForm example7 example
function example7True()::Bool


neq=4::Int64;nlag=1::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64

#=======================================
bb=[0.  0.  0.  -0.655141;
0.  0.  0.  -0.29452;
0.  0.  0.  -0.663972;
0.  0.  0.  0.336028]::Array{Float64,2}

qNew=[0.  0.  0.  0.971449  0.000000000000000111022  0.0923723  0.916025  -1.;
0.  0.  0.  -0.688551  0.000000000000000111022  -1.00763  -0.0839749  1.;
0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.]::Array{Float64,2}
=========================================#

file = matopen("./matDir/reducedForm_examples/"*"example7True.mat")
bb=read(file,"bb")
qNew=read(file,"qNew")
close(file)
    
nonsing=true::Bool

qRows=4::Int64

qCols=8::Int64

bCols=4::Int64

anEpsi=0.0000000001::Float64

(nonsingJulia,bbJulia)=reducedForm(qNew,qRows,qCols,bCols,neq,anEpsi)
isapprox(bbJulia,bb,rtol=0.0::Float64,atol=1e-4::Float64)&&
nonsingJulia==nonsing
end;

#tweaked= True
# test reducedForm oneEquationNoLead example
function oneEquationNoLeadTrue()::Bool


neq=1::Int64;nlag=1::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


bb=hcat([-0.666667])::Array{Float64,2}

qNew=[2.  3.]::Array{Float64,2}

nonsing=true::Bool

qRows=1::Int64

qCols=2::Int64

bCols=1::Int64

anEpsi=0.0000000001::Float64

(nonsingJulia,bbJulia)=reducedForm(qNew,qRows,qCols,bCols,neq,anEpsi)
isapprox(bbJulia,bb,rtol=0.0::Float64,atol=1e-4::Float64)&&
nonsingJulia==nonsing
end;

#tweaked= True
# test reducedForm reliablePaperExmpl example
function reliablePaperExmplTrue()::Bool


neq=5::Int64;nlag=1::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64

#==========================================
bb=[0.  0.  0.  -0.0000000000000000367178  0.;
0.  0.  0.  -0.00000000000000000543387  0.;
0.  0.  0.  0.214101  0.;
0.  0.  0.  0.361236  0.;
0.  0.  0.  0.530747  0.]::Array{Float64,2}

qNew=[0.  0.  0.  0.396985  0.  -0.185051  0.608919  -0.555779  0.396985  -0.793969;
0.  0.  0.  0.171857  0.  0.90769  0.251405  -0.2406  0.171857  -0.343714;
0.  0.  0.  0.171857  0.  -0.0923097  1.2514  -0.2406  0.171857  -0.343714;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.]::Array{Float64,2}
========================================#

file = matopen("./matDir/reducedForm_examples/"*"reliablePaperExmplTrue.mat")
bb=read(file,"bb")
qNew=read(file,"qNew")
close(file)
    
nonsing=true::Bool

qRows=5::Int64

qCols=10::Int64

bCols=5::Int64

anEpsi=0.0000000001::Float64

(nonsingJulia,bbJulia)=reducedForm(qNew,qRows,qCols,bCols,neq,anEpsi)
isapprox(bbJulia,bb,rtol=0.0::Float64,atol=1e-4::Float64)&&
nonsingJulia==nonsing
end;

#tweaked= True
# test reducedForm athan example
function athanTrue()::Bool


neq=9::Int64;nlag=1::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64

#=================================================
bb=[0.828597  0.296449  -0.11369  0.212332  0.  0.  0.  0.  0.0000000000000000243728;
0.293  0.764  -0.293  -0.000000000000000166051  0.  0.  0.  0.  -0.00000000000000000000000000000000250755;
1.95019  1.3569  -0.520381  -0.486336  0.  0.  0.  0.  0.0000000000000000487455;
-0.0000000000000000766514  -0.0000000000000000981165  0.0000000000000000482506  0.911  0.  0.  0.  0.  0.;
-0.0000000000000000136872  -0.0000000000000000113968  0.00000000000000000968184  -0.0000000000000000708412  0.  0.  0.  0.  0.;
-0.0000000000000000501232  -0.0000000000000000515347  0.0000000000000000242667  -0.0000000000000000916579  0.  0.  0.  0.  0.;
-0.0000000000000000695575  -0.0000000000000000822573  0.0000000000000000352407  -0.0000000000000000916579  0.  0.  0.  0.  0.;
-0.0000000000000000823985  -0.0000000000000000966256  0.0000000000000000426039  -0.0000000000000000985968  0.  0.  0.  0.  0.;
-0.000000000000000108772  -0.000000000000000127348  0.0000000000000000535779  -0.000000000000000112475  0.  0.  0.  0.  1.]::Array{Float64,2}

qNew=[-0.27752  -0.723637  0.27752  0.0481292  0.  0.  0.  0.  0.0528312  0.105662  1.  -0.0528312  -0.105662  -0.0528312  -1.  -0.158494  0.  -0.0528312;
0.0154795  0.040363  -0.0154795  0.0481292  0.  0.  0.  0.  0.0528312  -1.89434  -1.  0.947169  0.894338  -0.0528312  0.  1.84151  0.  -0.0528312;
0.0154795  0.040363  -0.0154795  -0.862871  0.  0.  0.  0.  0.0528312  0.105662  -0.0000000000000000277556  -0.0528312  0.894338  -0.0528312  0.  -0.158494  -1.  -0.0528312;
0.0154795  0.040363  -0.0154795  0.0481292  0.  0.  0.  0.  0.0528312  0.105662  -0.0000000000000000277556  -0.0528312  -0.105662  0.947169  0.  -0.158494  0.  -0.0528312;
0.0154795  0.040363  -0.0154795  0.0481292  0.  0.  0.  0.  0.0528312  0.105662  -0.0000000000000000138778  -0.0528312  -0.105662  -0.0528312  1.  -0.158494  0.  -0.0528312;
0.0154795  0.040363  -0.0154795  0.0481292  0.  0.  0.  0.  0.0528312  0.105662  0.  -0.0528312  -0.105662  -0.0528312  0.  0.841506  0.  -0.0528312;
0.0154795  0.040363  -0.0154795  0.0481292  0.  0.  0.  0.  0.0528312  0.105662  0.0000000000000000138778  -0.0528312  -0.105662  -0.0528312  0.  -0.158494  1.  -0.0528312;
0.0154795  0.040363  -0.0154795  0.0481292  0.  0.  0.  0.  -0.947169  0.105662  0.0000000000000000277556  -0.0528312  -0.105662  -0.0528312  0.  -0.158494  0.  0.947169;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.]::Array{Float64,2}
    ================================================================#

file = matopen("./matDir/reducedForm_examples/"*"athanTrue.mat")
bb=read(file,"bb")
qNew=read(file,"qNew")
close(file)

nonsing=true::Bool

qRows=9::Int64

qCols=18::Int64

bCols=9::Int64

anEpsi=0.0000000001::Float64

(nonsingJulia,bbJulia)=reducedForm(qNew,qRows,qCols,bCols,neq,anEpsi)
isapprox(bbJulia,bb,rtol=0.0::Float64,atol=1e-4::Float64)&&
nonsingJulia==nonsing
end;

#tweaked= True
# test reducedForm habitmod example
function habitmodTrue()::Bool


neq=12::Int64;nlag=4::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64

#===========================================
bb=[0.0275299  0.  0.0204675  0.00384168  0.0510466  0.  0.  0.  0.  0.  0.  0.  -0.150125  0.  0.0802913  -0.0569634  0.0332227  0.  0.  0.  0.  0.  0.  0.  0.00762739  0.  0.132004  -0.000975575  0.140907  0.  0.  0.  0.  0.  0.  0.  0.409592  0.531564  0.281743  -0.370309  -0.00715738  0.  0.000594579  0.  0.  0.  0.  0.0247319;
-0.000000000000000271293  0.  -0.000000000000000110213  -0.0000000000000000254337  -0.000000000000000224664  0.  0.  0.  0.  0.  0.  0.  0.000000000000000949524  0.  -0.000000000000000377266  0.000000000000000339116  -0.000000000000000136706  0.  0.  0.  0.  0.  0.  0.  -0.000000000000000169558  0.  -0.000000000000000466284  -0.000000000000000135646  -0.000000000000000534107  0.  0.  0.  0.  0.  0.  0.  -0.00000000000000902048  0.88879  -0.000000000000000881701  0.00000000000000173797  0.0000000000000000847789  0.  -0.0000000000000000134244  0.  0.  0.  0.  -0.000000000000000106032;
-0.52802  0.  -0.11279  -0.031833  -0.024734  0.  0.  0.  0.  0.  0.  0.  0.71526  0.  -0.042076  0.22829  0.012267  0.  0.  0.  0.  0.  0.  0.  -0.22215  0.  0.14172  -0.26679  0.11959  0.  0.  0.  0.  0.  0.  0.  0.42308  0.00000000000000255955  0.61076  0.10946  -0.17172  0.  -0.000000000000000000242813  0.  0.  0.  0.  0.00011277;
-0.46436  0.  -0.16131  -0.02744  -0.17087  0.  0.  0.  0.  0.  0.  0.  1.3425  0.  -0.16794  0.35818  0.09837  0.  0.  0.  0.  0.  0.  0.  -1.06382  0.  0.02255  -0.51594  -0.08949  0.  0.  0.  0.  0.  0.  0.  0.46672  0.000000000000000666837  0.11369  1.10657  0.26021  0.  -0.00000000000000000966527  0.  0.  0.  0.  0.00141;
0.23292  0.  -0.08512  0.04213  -0.14149  0.  0.  0.  0.  0.  0.  0.  -0.03313  0.  -0.15223  -0.01572  0.34762  0.  0.  0.  0.  0.  0.  0.  -0.70552  0.  0.24697  -0.21888  0.07805  0.  0.  0.  0.  0.  0.  0.  0.56316  0.00000000000000154659  0.08268  0.16054  0.68637  0.  -0.000000000000000000318414  0.  0.  0.  0.  0.00348;
-0.0486562  0.  -0.0143582  -0.00361503  -0.0163681  0.  0.  0.  0.  0.  0.  0.  0.0963933  0.  -0.0262052  0.0337474  -0.00907889  0.  0.  0.  0.  0.  0.  0.  -0.0178323  0.  -0.0276432  -0.0192967  -0.0320882  0.  0.  0.  0.  0.  0.  0.  0.0410416  0.105222  -0.0348985  0.115168  -0.012502  0.  0.0000156628  0.  0.  0.  0.  0.0265769;
0.000000000000000197039  0.  0.0000000000000000845935  0.000000000000000011731  0.0000000000000001487  0.  0.  0.  0.  0.  0.  0.  -0.000000000000000684088  0.  0.000000000000000209115  -0.000000000000000185878  0.0000000000000000656476  0.  0.  0.  0.  0.  0.  0.  0.000000000000000104619  0.  0.000000000000000311549  0.000000000000000105648  0.000000000000000307426  0.  0.  0.  0.  0.  0.  0.  0.99853  0.000000000000000284445  0.000000000000000551808  -0.000000000000000994282  -0.0000000000000000579871  0.  0.00147  0.  0.  0.  0.  -0.00000000000000025895;
0.0265517  0.  0.019758  0.00370218  0.0492574  0.  0.  0.  0.  0.  0.  0.  -0.145004  0.  0.0774512  -0.0549674  0.0320274  0.  0.  0.  0.  0.  0.  0.  0.00761162  0.  0.127323  -0.000854112  0.135885  0.  0.  0.  0.  0.  0.  0.  -25.5133  0.512756  0.27179  -0.35728  -0.00690759  0.  -0.0375677  0.  0.  0.  0.  0.02386;
0.521517  0.  0.1143  0.0309276  0.0282826  0.  0.  0.  0.  0.  0.  0.  -0.724878  0.  0.0467801  -0.229153  -0.0155764  0.  0.  0.  0.  0.  0.  0.  0.232646  0.  -0.140072  0.271375  -0.122108  0.  0.  0.  0.  0.  0.  0.  -0.421116  0.0172992  -0.603894  -0.115681  0.153917  0.  0.00000222775  0.  0.  0.  0.  0.00504541;
0.0235796  0.  -0.0818094  0.0108053  -0.152502  0.  0.  0.  0.  0.  0.  0.  0.436271  0.  -0.246456  0.127264  0.0284865  0.  0.  0.  0.  0.  0.  0.  -0.248762  0.  -0.221058  -0.110815  -0.0970434  0.  0.  0.  0.  0.  0.  0.  25.5232  -0.947988  -0.416326  0.61486  0.420138  0.  0.0375093  0.  0.  0.  0.  -0.152215;
-0.00201156  0.  0.00248092  -0.000581449  0.00412511  0.  0.  0.  0.  0.  0.  0.  -0.0116365  0.  0.00675309  -0.00288513  -0.00242817  0.  0.  0.  0.  0.  0.  0.  0.00965336  0.  0.00373112  0.00447091  -0.00157814  0.  0.  0.  0.  0.  0.  0.  -0.998996  0.0173377  0.00574045  -0.0102517  -0.0165428  0.  -0.00146776  0.  0.  0.  0.  0.00513267;
-0.0000000000000000265308  0.  0.0000000000000000112236  -0.00000000000000000391164  0.0000000000000000595065  0.  0.  0.  0.  0.  0.  0.  -0.000000000000000108114  0.  0.0000000000000000868694  -0.0000000000000000210237  0.0000000000000000502013  0.  0.  0.  0.  0.  0.  0.  -0.000000000000000034086  0.  0.00000000000000015885  -0.0000000000000000312975  0.000000000000000159561  0.  0.  0.  0.  0.  0.  0.  -0.00000000000000151475  0.000000000000000865661  0.000000000000000379727  -0.000000000000000388401  -0.0000000000000000605926  0.  -0.00000000000000000220135  0.  0.  0.  0.  1.]::Array{Float64,2}

qNew=[-0.39069  0.  -0.0403489  -0.0298214  0.0476776  0.  0.  0.  0.  0.  0.  0.  0.311316  0.  0.0348916  0.115874  -0.0873389  0.  0.  0.  0.  0.  0.  0.  0.20149  0.  0.0594768  -0.0621964  0.10246  0.  0.  0.  0.  0.  0.  0.  -0.0902368  0.191856  0.46752  -0.185781  -0.35066  0.  -0.000321667  0.  0.  0.  0.  -0.218821  -0.207  -0.00886243  -0.628828  0.218821  0.218821  -0.715016  0.218821  0.0000000000000651146  0.153424  -0.00043163  -0.102282  0.241629;
-0.10974  0.  -0.0537692  0.00127517  -0.0293675  0.  0.  0.  0.  0.  0.  0.  0.137924  0.  -0.0404977  0.0515076  0.091476  0.  0.  0.  0.  0.  0.  0.  -0.16344  0.  0.130168  -0.115059  0.0866987  0.  0.  0.  0.  0.  0.  0.  0.571463  -0.482613  0.280614  -0.0465982  0.0850763  0.  0.000416683  0.  0.  0.  0.  0.283458  0.497859  0.0451412  -0.94262  0.127229  -0.283458  1.7197  -0.283458  -0.000000000000201839  -0.369003  0.00103812  0.246  -0.339805;
0.16914  0.  -0.0834705  0.0344558  -0.131352  0.  0.  0.  0.  0.  0.  0.  0.0518368  0.  -0.140709  0.00842449  0.305196  0.  0.  0.  0.  0.  0.  0.  -0.667457  0.  0.216233  -0.219605  0.064336  0.  0.  0.  0.  0.  0.  0.  0.268713  0.170893  0.0859198  0.197978  0.603286  0.  -0.000364386  0.  0.  0.  0.  -0.0491785  -0.14596  -0.0463155  0.131808  -0.0523601  -0.862642  -0.504173  0.247882  0.0000000000000236478  0.108183  -0.000304352  -0.0721213  0.0690267;
0.0573089  0.  0.0267312  0.00189935  0.0283755  0.  0.  0.  0.  0.  0.  0.  -0.17685  0.  0.0290868  -0.0478714  -0.0304009  0.  0.  0.  0.  0.  0.  0.  0.169275  0.  -0.0197478  0.0800256  0.00306391  0.  0.  0.  0.  0.  0.  0.  0.120641  -0.377425  -0.0349752  -0.142242  -0.0623092  0.  0.000320215  0.  0.  0.  0.  0.318504  -0.767477  1.19213  0.795583  0.118067  0.0530521  -2.65101  -0.217833  0.000000000000103473  0.568839  -0.00160032  -0.379223  -0.230675;
0.153223  0.  0.0555128  0.00811169  0.0559904  0.  0.  0.  0.  0.  0.  0.  -0.425783  0.  0.0563394  -0.115171  -0.0412687  0.  0.  0.  0.  0.  0.  0.  0.345864  0.  -0.0219033  0.171188  0.017707  0.  0.  0.  0.  0.  0.  0.  0.481873  0.504273  -0.0655464  -0.334226  -0.0913117  0.  0.000968726  0.  0.  0.  0.  0.167028  0.104058  -0.671428  -0.0557897  0.292287  0.0343027  0.359435  -0.658997  0.0000000000000154876  -0.0771255  0.000216978  0.0514166  -0.179521;
-0.536153  0.  -0.145961  -0.0365903  -0.129564  0.  0.  0.  0.  0.  0.  0.  1.30161  0.  -0.128183  0.354905  0.0292209  0.  0.  0.  0.  0.  0.  0.  -0.848094  0.  0.00239141  -0.459645  -0.0707033  0.  0.  0.  0.  0.  0.  0.  0.541578  0.0193783  0.190797  0.958162  0.0814752  0.  0.000229904  0.  0.  0.  0.  0.0319166  0.0448262  -0.0666291  -0.217552  -0.873343  0.169175  0.154838  -0.156397  -0.0000000000000492939  -0.0332242  0.0000934702  0.0221493  -0.0364049;
0.0236245  0.  -0.0177052  0.0058426  -0.0266397  0.  0.  0.  0.  0.  0.  0.  0.0306994  0.  -0.0282777  0.00717588  0.057066  0.  0.  0.  0.  0.  0.  0.  -0.138474  0.  0.0395484  -0.0480997  0.0101315  0.  0.  0.  0.  0.  0.  0.  0.583804  -0.195633  0.0169456  0.0539355  0.114044  0.  0.000710653  0.  0.  0.  0.  -0.817659  -0.125308  0.34542  0.123596  -0.0258243  -0.156794  -0.432838  -0.483438  0.0000000000000102141  0.0928759  -0.000261289  -0.0619168  0.832639;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.]::Array{Float64,2}
    ======================================================#

file = matopen("./matDir/reducedForm_examples/"*"habitmodTrue.mat")
bb=read(file,"bb")
qNew=read(file,"qNew")
close(file)

nonsing=true::Bool

qRows=12::Int64

qCols=60::Int64

bCols=48::Int64

anEpsi=0.0000000001::Float64

(nonsingJulia,bbJulia)=reducedForm(qNew,qRows,qCols,bCols,neq,anEpsi)
isapprox(bbJulia,bb,rtol=0.0::Float64,atol=1e-4::Float64)&&
nonsingJulia==nonsing
end;


end
