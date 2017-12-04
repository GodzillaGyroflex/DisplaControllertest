
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name DisplaControllertest -dir "C:/Users/Saulo/Documents/DisplaControllertest/planAhead_run_3" -part xc3s250etq144-4
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "C:/Users/Saulo/Documents/DisplaControllertest/Top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Saulo/Documents/DisplaControllertest} }
set_property target_constrs_file "TOP_MODULE.ucf" [current_fileset -constrset]
add_files [list {TOP_MODULE.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "C:/Users/Saulo/Documents/DisplaControllertest/Top.ncd"
if {[catch {read_twx -name results_1 -file "C:/Users/Saulo/Documents/DisplaControllertest/Top.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"C:/Users/Saulo/Documents/DisplaControllertest/Top.twx\": $eInfo"
}
