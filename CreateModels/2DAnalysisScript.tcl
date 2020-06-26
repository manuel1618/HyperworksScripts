# Hyperparameter
set volumeFracUpperBound 0.3
set thicknessDesignSpace 1


# Materials
*createentity mats cardimage=MAT1 includeid=0 name=steel
*setelementcolormode 3
*setvalue mats id=1 STATUS=1 1=210000
*setvalue mats id=1 STATUS=1 3=0.3
*setvalue mats id=1 STATUS=1 4=7.85e-09

# properties
*createentity props cardimage=PSHELL includeid=0 name=designProperty
*setelementcolormode 2
*setvalue props id=1 STATUS=1 95=$thicknessDesignSpace
*setvalue props id=1 materialid={mats 1}


# Components
*createentity comps includeid=0 name=DesignComponent
*setvalue comps id=1 propertyid={props 1}
*setelementcolormode 1


# Analysis
*createentity loadcols includeid=0 name=spcs
*createentity loadcols includeid=0 name=loads
*createentity loadsteps includeid=0 name=loadstep1
*createmark loadsteps 1 "loadstep1"
*clearmark loadsteps 1
*setvalue loadsteps id=1 STATUS=2 OS_TYPE=0
*setvalue loadsteps id=1 STATUS=1 4709=1
*setvalue loadsteps id=1 STATUS=2 4059=1
*setvalue loadsteps id=1 STATUS=2 4060=STATICS
*setvalue loadsteps id=1 STATUS=0 707=0
*setvalue loadsteps id=1 STATUS=0 9293={Loadcols 0}
*setvalue loadsteps id=1 STATUS=2 3240=1
*setvalue loadsteps id=1 STATUS=2 289=0
*setvalue loadsteps id=1 STATUS=2 288=0
*setvalue loadsteps id=1 STATUS=2 4347=0
*setvalue loadsteps id=1 STATUS=2 4034=0
*setvalue loadsteps id=1 STATUS=2 4037=0
*setvalue loadsteps id=1 STATUS=2 9891=0
*setvalue loadsteps id=1 STATUS=2 10701=0
*setvalue loadsteps id=1 STATUS=2 8142=0
*setvalue loadsteps id=1 STATUS=2 4722=0
*setvalue loadsteps id=1 STATUS=2 10839=0
*setvalue loadsteps id=1 STATUS=2 3391=0
*setvalue loadsteps id=1 STATUS=2 3396=0
*setvalue loadsteps id=1 STATUS=2 7408=0
*setvalue loadsteps id=1 STATUS=2 8897=0
*setvalue loadsteps id=1 STATUS=2 578=0
*setvalue loadsteps id=1 STATUS=2 4152=0
*setvalue loadsteps id=1 STATUS=2 4973=0
*setvalue loadsteps id=1 STATUS=2 351=0
*setvalue loadsteps id=1 STATUS=2 3292=0
*mergehistorystate "" ""
*setvalue loadsteps id=1 STATUS=2 OS_SPCID={loadcols 1}
*setvalue loadsteps id=1 STATUS=2 4143=1
*setvalue loadsteps id=1 STATUS=1 4144=1
*setvalue loadsteps id=1 STATUS=1 4145={Loadcols 1}
*setvalue loadsteps id=1 STATUS=2 OS_LOADID={loadcols 2}
*setvalue loadsteps id=1 STATUS=2 4143=1
*setvalue loadsteps id=1 STATUS=1 4146=1
*setvalue loadsteps id=1 STATUS=1 4147={Loadcols 2}
*setvalue loadsteps id=1 STATUS=0 7763=0
*setvalue loadsteps id=1 STATUS=0 7740={Loadcols 0}


#




