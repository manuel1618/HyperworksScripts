# Hyperparameter
set volumeFracUpperBound 0.3
set thicknessDesignSpace 1
set thicknessNonDesignSpace 1
set basethickness 0




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

*createentity props cardimage=PSHELL includeid=0 name=nonDesignProperty
*setelementcolormode 2
*setvalue props id=2 STATUS=1 95=$thicknessNonDesignSpace
*setvalue props id=2 materialid={mats 1}

# Components
*createentity comps includeid=0 name=DesignComponent
*setvalue comps id=1 propertyid={props 1}
*setelementcolormode 1

*createentity comps includeid=0 name=NonDesignComponent
*setvalue comps id=2 propertyid={props 2}
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

# TopOptDesVar
*createentity designvars config=108 name=TopOptDesVar
*setvalue designvars id=1 STATUS=0 9627=0
*mergehistorystate "" ""
*setvalue designvars id=1 STATUS=2 propertytypename="PSHELL"
*setvalue designvars id=1 STATUS=2 basethickness=$basethickness
*retainmarkselections 1
*retainmarkselections 0
*retainmarkselections 1
*retainmarkselections 0
*setvalue designvars id=1 STATUS=2 propertylist={props 1}


# Responses
*createentity optiresponses response=29 name=weightedCompliance
*setvalue optiresponses id=1 STATUS=2 response=32
*retainmarkselections 1
*retainmarkselections 0
*setvalue optiresponses id=1 STATUS=2 loadsteplist={loadsteps 1}
*setvalue optiresponses id=1 STATUS=2 ROW=0 loadstepweightname= {1}
*createentity optiresponses response=29 name=volumeFrac
*setvalue optiresponses id=2 STATUS=2 response=3

# DesignConstraint
*createentity opticonstraints name=opticonstraint1
*setvalue opticonstraints id=1 STATUS=2 responseid={optiresponses 2}
*setvalue opticonstraints id=1 STATUS=0 10102=0
*mergehistorystate "" ""
*setvalue opticonstraints id=1 STATUS=2 upperoption=1
*setvalue opticonstraints id=1 STATUS=1 upperbound=$volumeFracUpperBound

# Objective
*createentity objectives name=objective1
*setvalue objectives id=1 STATUS=2 responseid={optiresponses 1}

# Opticontrols
*setvalue opticonstraints id=1 STATUS=2 upperoption=0
*setvalue opticonstraints id=1 STATUS=2 upperoption=1
*opticontrolcreate80sr1 1 100 0 0 0 0.6 0 0.01 1 1 0 0 0 0 0 0.005 0 0.5 0 0.2 0 0.5 0 1 0 10 0 0 0 0 0 0 0 0 1 0 1 0
*opticontrolupdateeslparameters 0 30 0 1 0 0.3
*opticontrolupdateoptimizationparameters 0 2 0 "MFD" 0 20 0 20 0 1
*opticontrolupdateremeshparameters 0 0
*opticontrolupdateapproxparameters 0 "FULL"
*opticontrolupdatebarconparameters 0 "REQUIRED"
*opticontrolupdatecontolparameters 0 1
*opticontrolupdatetopdiscparameters 0 "NO"
*opticontrolupdatetopdvparameters 0 "ALTER"
*opticontrolupdatetoprstparameters 0 "STRICT"
*opticontrolupdatemanthrparameters 0 1






