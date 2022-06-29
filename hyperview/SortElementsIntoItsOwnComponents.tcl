# Call it with: 

#C:\Program Files\Altair\2022\hwdesktop\hw\bin\win64\hmopengl.exe (no batch)
#or 
#C:\Program Files\Altair\2022\hwdesktop\hw\bin\win64\hmbatch.exe (batch)

# parameters: -tcl <path to this file>

# so this is how it looks like:
#"C:\Program Files\Altair\2022\hwdesktop\hw\bin\win64\hmbatch.exe" -tcl "F:\Altair\Adeline\20220628HypermeshElementsIntoItsOwnComps\SortElementsIntoItsOwnComponents.tcl" 


# file paths
set ALTAIR_HOME "C:/Program Files/Altair/2022/" 

set hmFileToOpen "F:/Altair/Adeline/20220628HypermeshElementsIntoItsOwnComps/simpleModel.hm"

set hmFileToSave "F:/Altair/Adeline/20220628HypermeshElementsIntoItsOwnComps/simpleModelOrganized.hm"


# Template Optistruct
*templatefileset "$ALTAIR_HOME/hwdesktop/templates/feoutput/optistruct/optistruct"

# open
*readfile $hmFileToOpen


*createmark elems 1 "all"
set elems [hm_getmark elements 1]
set numberOfElems [llength $elems]

set yngsmdl 210000
set nu 0.3
set density 7.85e-09

set i 1

foreach elem_id $elems {
	
	puts "$i of $numberOfElems"
	set i [expr $i+1]
	
	*createentity comps includeid=0 name=comp_$elem_id
	*createentity props cardimage=PSOLID includeid=0 name=prop_$elem_id
	*createentity mats cardimage=MAT1 includeid=0 name=mat_$elem_id
	set comp_id [hm_getentityvalue comps comp_$elem_id id 0 -byname]
	set mat_id [hm_getentityvalue mats mat_$elem_id id 0 -byname]
	set prop_id [hm_getentityvalue props prop_$elem_id id 0 -byname]
	# change material parameters
	*setvalue mats id=$mat_id STATUS=1 1=$yngsmdl
	*setvalue mats id=$mat_id STATUS=1 3=$nu
	*setvalue mats id=$mat_id STATUS=1 4=$density
	# links to prop and comp
	*setvalue props id=$prop_id materialid=$mat_id
	*setvalue comps id=$comp_id propertyid=$prop_id
	# move the element
	*createmark elements 1 $elem_id
	*movemark elements 1 comp_$elem_id
	
	
}

# save
hm_answernext yes
*writefile $hmFileToSave 1
*quit 1 
exit #batch
