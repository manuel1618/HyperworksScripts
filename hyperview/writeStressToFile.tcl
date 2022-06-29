#cd D:/adel/New_folder
cd F:/Altair/Adeline/modelFile
#set outPath "D:/adel/New_folder/adeline/output.txt"
set outPath "F:/Altair/Adeline/20220624HyperviewScripting/output.txt"
#set import_file_path "D:/adel/New_folder/Implant_grooved_1mmnew_changed_material.h3d"
set import_file_path "F:/Altair/Adeline/modelFile/Implant_grooved_1mmnew_changed_material.h3d"
hwi OpenStack
hwi GetSessionHandle session
session GetProjectHandle project
project GetPageHandle page 1
page GetWindowHandle win 1
win SetClientType animation
win GetClientHandle anim
anim AddModel $import_file_path
set id [anim AddModel $import_file_path]
anim GetModelHandle myModel $id
myModel SetResult $import_file_path
anim Draw
myModel GetResultCtrlHandle myResult
set current [myResult GetCurrentSubcase]
myResult SetCurrentSimulation [expr [myResult GetNumberOfSimulations $current]-1]
set data_types [myResult GetDataTypeList $current]
myResult GetContourCtrlHandle myContour
myContour SetDataType [lindex $data_types 8] # depends on you outputs
myContour SetEnableState true
anim Draw
myModel GetQueryCtrlHandle myQuery
set set_id [myModel AddSelectionSet element]
myModel GetSelectionSetHandle elem_set $set_id
elem_set Add "component_name == cort_remesh_2"
myQuery SetSelectionSet $set_id
myQuery SetQuery "element.id contour.value"
myQuery WriteData $outPath
hwi CloseStack
