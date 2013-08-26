
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name C3PU -dir "/home/ivan/Dropbox/S3/C3PU/planAhead_run_1" -part xc3s700anfgg484-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/ivan/Dropbox/S3/C3PU/MC3PU.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/ivan/Dropbox/S3/C3PU} }
set_property target_constrs_file "mc3pu.ucf" [current_fileset -constrset]
add_files [list {mc3pu.ucf}] -fileset [get_property constrset [current_run]]
link_design
