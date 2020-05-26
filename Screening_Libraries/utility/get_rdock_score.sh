#!/bin/bash

# script to locate binding cavity 
module load openbabel

# run docking
module load rdock
export RBT_ROOT=/export/apps/rDock/src/rDock_2013.1_src/
export ligand_home=/home/afrankz/demos/FMN_Screen/zinc_compounds/groups
export ligand_home=/home/afrankz/demos/SARS-CoV-2/

sdsort -n -fSCORE.INTER.VDW /home/ziqiaoxu/VAE_Raw_Data/VAEdesigns_Mar14_CDK2_5IEV/CDK2_5IEV_all_designs.sdf > CDK2_5IEV_all_designs_sorted.sdf
sdsort -n -fSCORE.INTER.VDW /home/ziqiaoxu/VAE_Raw_Data/VAEdesigns_Mar10_nCoV_6Y2F/nCoV_6Y2F_all_designs.sdf > nCoV_6Y2F_all_designs_sorted.sdf
sdsort -n -fSCORE.INTER.VDW /home/ziqiaoxu/VAE_Raw_Data/VAEdesigns_Apr21_RdRp-SARS-CoV-2/RdRp_nCoV_all_designs.sdf > RdRp_nCoV_all_designs_sorted.sdf

scores_header="REC _TITLE1 SCORE.INTER.VDW SCORE.INTER.POLAR SCORE.INTER SCORE.INTER.ROT SCORE"
echo ${scores_header} > CDK2_5IEV_all_designs_sorted.txt
sdreport -t"SCORE.INTER.VDW,SCORE.INTER.POLAR,SCORE.INTER,SCORE.INTER.ROT,SCORE" CDK2_5IEV_all_designs_sorted.sdf >> CDK2_5IEV_all_designs_sorted.txt

echo ${scores_header} > nCoV_6Y2F_all_designs_sorted.txt
sdreport -t"SCORE.INTER.VDW,SCORE.INTER.POLAR,SCORE.INTER,SCORE.INTER.ROT,SCORE" nCoV_6Y2F_all_designs_sorted.sdf >> nCoV_6Y2F_all_designs_sorted.txt

echo ${scores_header} > RdRp_nCoV_all_designs_sorted.txt
sdreport -t"SCORE.INTER.VDW,SCORE.INTER.POLAR,SCORE.INTER,SCORE.INTER.ROT,SCORE" RdRp_nCoV_all_designs_sorted.sdf >> RdRp_nCoV_all_designs_sorted.txt


babel -l 1000 -isdf CDK2_5IEV_all_designs_sorted.sdf -osdf CDK2_5IEV_all_designs_sorted_top1000.sdf
babel -l 1000 -isdf nCoV_6Y2F_all_designs_sorted.sdf -osdf nCoV_6Y2F_all_designs_sorted_top1000.sdf
babel -l 1000 -isdf RdRp_nCoV_all_designs_sorted.sdf -osdf RdRp_nCoV_all_designs_sorted_top1000.sdf

