#!/bin/sh

# RUNALL executs all emperical results in table 4 and  table 5, including
# (1) All experimental results presented on Table 4;
#	(2) All experimental results presented on Table 5; and
#	(3) All experimental results from cited paper [26].

# double check if docker has been installed
sudo apt install docker.io

# pull the image
sudo docker pull tzuhanmsu/hyperqube:latest


## prep
# rm REPORT.txt
# rm alllog.txt
# rm -r OUTPUTS

# prepare for a new report
PWD=$(pwd)
touch alllog.txt
## the folder with all outputs
mkdir OUTPUTS


echo "======================" 2>&1 | tee -a REPORT.txt
echo " bakery w/ symmetry"    2>&1 | tee -a REPORT.txt
echo "======================" 2>&1 | tee -a REPORT.txt

# ### case 0.1
CASE="0.1"
ALLARG="cases/bakery_3procs.smv cases/bakery_formula_S1_3proc.hq 10 pes"
## execute python scripts on docker
(sudo docker run -v ${PWD}:/mnt tzuhanmsu/hyperqube:latest /bin/bash -c "cd mnt/; time -p ./parse.sh ${ALLARG}; ") 2>&1 | tee -a outlog.txt
## run BMC unrolling and QBF solving
(./bmc.sh ${ALLARG}) 2>&1 | tee -a outlog.txt
## get nice formatted  output for this case
echo "\n-------------------- Summary of Case ${CASE} ---------------------" 2>&1 | tee -a REPORT.txt
python3 extract_log.py 2>&1 | tee -a REPORT.txt
## safe output and clean up
cat outlog.txt >> alllog.txt
rm outlog.txt

## save the outputs
cp OUTPUT_byName.cex OUTPUTS/case0.1_out_byName.out
cp OUTPUT_byTime.cex OUTPUTS/case0.1_out_byTime.out
cp OUTPUT_formatted.cex OUTPUTS/case0.1_out_formatted.out


### case 0.2
CASE="0.2"
ALLARG="cases/bakery_3procs.smv cases/bakery_formula_S2_3proc.hq 10 pes"
## execute python scripts on docker
(sudo docker run -v ${PWD}:/mnt tzuhanmsu/hyperqube:latest /bin/bash -c "cd mnt/; time -p ./parse.sh ${ALLARG}; ") 2>&1 | tee -a outlog.txt
## run BMC unrolling and QBF solving
(./bmc.sh ${ALLARG}) 2>&1 | tee -a outlog.txt
## get nice formatted  output for this case
echo "\n-------------------- Summary of Case ${CASE} ---------------------" 2>&1 | tee -a REPORT.txt
python3 extract_log.py 2>&1 | tee -a REPORT.txt
## safe output and clean up
cat outlog.txt >> alllog.txt
rm outlog.txt

## save the outputs
cp OUTPUT_byName.cex OUTPUTS/case0.2_out_byName.out
cp OUTPUT_byTime.cex OUTPUTS/case0.2_out_byTime.out
cp OUTPUT_formatted.cex OUTPUTS/case0.2_out_formatted.out


### case 0.3
CASE="0.3"
ALLARG="cases/bakery_3procs.smv cases/bakery_formula_S3_3proc.hq 10 pes"
## execute python scripts on docker
(sudo docker run -v ${PWD}:/mnt tzuhanmsu/hyperqube:latest /bin/bash -c "cd mnt/; time -p ./parse.sh ${ALLARG}; ") 2>&1 | tee -a outlog.txt
## run BMC unrolling and QBF solving
(./bmc.sh ${ALLARG}) 2>&1 | tee -a outlog.txt
## get nice formatted  output for this case
echo "\n-------------------- Summary of Case ${CASE} ---------------------" 2>&1 | tee -a REPORT.txt
python3 extract_log.py 2>&1 | tee -a REPORT.txt
## safe output and clean up
cat outlog.txt >> alllog.txt
rm outlog.txt





### case 1.1
CASE="1.1"
ALLARG="cases/bakery_3procs.smv cases/bakery_formula_sym1_3proc.hq 10 pes"
## execute python scripts on docker
(sudo docker run -v ${PWD}:/mnt tzuhanmsu/hyperqube:latest /bin/bash -c "cd mnt/; time -p ./parse.sh ${ALLARG}; ") 2>&1 | tee -a outlog.txt
## run BMC unrolling and QBF solving
(./bmc.sh ${ALLARG}) 2>&1 | tee -a outlog.txt
## get nice formatted  output for this case
echo "\n-------------------- Summary of Case ${CASE} ---------------------" 2>&1 | tee -a REPORT.txt
python3 extract_log.py 2>&1 | tee -a REPORT.txt
## safe output and clean up
cat outlog.txt >> alllog.txt
rm outlog.txt

## save the outputs
cp OUTPUT_byName.cex OUTPUTS/case1.1_out_byName.out
cp OUTPUT_byTime.cex OUTPUTS/case1.1_out_byTime.out
cp OUTPUT_formatted.cex OUTPUTS/case1.1_out_formatted.out



#
### case 1.2
CASE="1.2"
ALLARG="cases/bakery_3procs.smv cases/bakery_formula_sym2_3proc.hq 10 pes"
## execute python scripts on docker
(sudo docker run -v ${PWD}:/mnt tzuhanmsu/hyperqube:latest /bin/bash -c "cd mnt/; time -p ./parse.sh ${ALLARG}; ") 2>&1 | tee -a outlog.txt
## run BMC unrolling and QBF solving
(./bmc.sh ${ALLARG}) 2>&1 | tee -a outlog.txt
## get nice formatted  output for this case
echo "\n-------------------- Summary of Case ${CASE} ---------------------" 2>&1 | tee -a REPORT.txt
python3 extract_log.py 2>&1 | tee -a REPORT.txt
## safe output and clean up
cat outlog.txt >> alllog.txt
rm outlog.txt

## save the outputs
cp OUTPUT_byName.cex OUTPUTS/case1.2_out_byName.out
cp OUTPUT_byTime.cex OUTPUTS/case1.2_out_byTime.out
cp OUTPUT_formatted.cex OUTPUTS/case1.2_out_formatted.out
#
#
### case 1.3
CASE="1.3"
ALLARG="cases/bakery_5procs.smv cases/bakery_formula_sym1_5proc.hq 10 pes"
## execute python scripts on docker
(sudo docker run -v ${PWD}:/mnt tzuhanmsu/hyperqube:latest /bin/bash -c "cd mnt/; time -p ./parse.sh ${ALLARG}; ") 2>&1 | tee -a outlog.txt
## run BMC unrolling and QBF solving
(./bmc.sh ${ALLARG}) 2>&1 | tee -a outlog.txt
## get nice formatted  output for this case
echo "\n-------------------- Summary of Case ${CASE} ---------------------" 2>&1 | tee -a REPORT.txt
python3 extract_log.py 2>&1 | tee -a REPORT.txt
## safe output and clean up
cat outlog.txt >> alllog.txt
rm outlog.txt

## save the outputs
mv OUTPUT_byName.cex OUTPUTS/case1.3_out_byName.out
mv OUTPUT_byTime.cex OUTPUTS/case1.3_out_byTime.out
mv OUTPUT_formatted.cex OUTPUTS/case1.3_out_formatted.out
#
# ### case 1.4
CASE="1.4"
ALLARG="cases/bakery_5procs.smv cases/bakery_formula_sym2_5proc.hq 10 pes"
## execute python scripts on docker
(sudo docker run -v ${PWD}:/mnt tzuhanmsu/hyperqube:latest /bin/bash -c "cd mnt/; time -p ./parse.sh ${ALLARG}; ") 2>&1 | tee -a outlog.txt
## run BMC unrolling and QBF solving
(./bmc.sh ${ALLARG}) 2>&1 | tee -a outlog.txt
## get nice formatted  output for this case
echo "\n-------------------- Summary of Case ${CASE} ---------------------" 2>&1 | tee -a REPORT.txt
python3 extract_log.py 2>&1 | tee -a REPORT.txt
## safe output and clean up
cat outlog.txt >> alllog.txt
rm outlog.txt
#
## save the outputs
mv OUTPUT_byName.cex OUTPUTS/case1.4_out_byName.out
mv OUTPUT_byTime.cex OUTPUTS/case1.4_out_byTime.out
mv OUTPUT_formatted.cex OUTPUTS/case1.4_out_formatted.out

#
echo "==================" 2>&1 | tee -a REPORT.txt
echo "  SNARK BUG 1&2"    2>&1 | tee -a REPORT.txt
echo "==================" 2>&1 | tee -a REPORT.txt
## case 2.1
CASE="2.1"
ALLARG="cases/snark1_M1_concurrent.smv cases/snark1_M2_sequential.smv  cases/snark1_formula.hq 18 pes"
## execute python scripts on docker
(sudo docker run -v ${PWD}:/mnt tzuhanmsu/hyperqube:latest /bin/bash -c "cd mnt/; time -p ./parse.sh ${ALLARG}; ") 2>&1 | tee -a outlog.txt
## run BMC unrolling and QBF solving
(./bmc.sh ${ALLARG}) 2>&1 | tee -a outlog.txt
## get nice formatted  output for this case
echo "\n-------------------- Summary of Case ${CASE} ---------------------" 2>&1 | tee -a REPORT.txt
python3 extract_log.py 2>&1 | tee -a REPORT.txt
## safe output and clean up
cat outlog.txt >> alllog.txt
rm outlog.txt
## save the outputs
mv OUTPUT_byName.cex OUTPUTS/case2.1_out_byName.out
mv OUTPUT_byTime.cex OUTPUTS/case2.1_out_byTime.out
mv OUTPUT_formatted.cex OUTPUTS/case2.1_out_formatted.out
#
## case 2.2 ### killed!!
echo "\ncase 2.2 is killed by TACAS VM, please see OUTPUT_LARGE.txt for details" 2>&1 | tee -a REPORT.txt
# CASE="2.2"
# ALLARG="cases/snark2_new_M1_concurrent.smv  cases/snark2_new_M2_sequential.smv cases/snark2_formula.hq 30 pes"
# ## execute python scripts on docker
# (sudo docker run -v ${PWD}:/mnt tzuhanmsu/hyperqube:latest /bin/bash -c "cd mnt/; time -p ./parse.sh ${ALLARG}; ") 2>&1 | tee -a outlog.txt
# ## run BMC unrolling and QBF solving
# (./bmc.sh ${ALLARG}) 2>&1 | tee -a outlog.txt
# ## get nice formatted  output for this case
# echo "\n-------------------- Summary of Case ${CASE} ---------------------" 2>&1 | tee -a REPORT.txt
# python3 extract_log.py 2>&1 | tee -a REPORT.txt
# ## safe output and clean up
# cat outlog.txt >> alllog.txt
# rm outlog.txt
#
## save the outputs
# mv OUTPUT_byName.cex OUTPUTS/SNARK2.2_out_byName.cex
# mv OUTPUT_byTime.cex OUTPUTS/SNARK2.2_out_byTime.cex
# mv OUTPUT_formatted.cex OUTPUTS/SNARK2.2_out_formatted.cex
#
#
#
#
#
echo "===============================" 2>&1 | tee -a REPORT.txt
echo " 3-threads w/ Non-interference"    2>&1 | tee -a REPORT.txt
echo "===============================" 2>&1 | tee -a REPORT.txt
# ### case 3.1
CASE="3.1"
ALLARG="cases/NI_incorrect.smv cases/NI_formula.hq 50 hpes"
## execute python scripts on docker
(sudo docker run -v ${PWD}:/mnt tzuhanmsu/hyperqube:latest /bin/bash -c "cd mnt/; time -p ./parse.sh ${ALLARG}; ") 2>&1 | tee -a outlog.txt
## run BMC unrolling and QBF solving
(./bmc.sh ${ALLARG}) 2>&1 | tee -a outlog.txt
## get nice formatted  output for this case
echo "\n-------------------- Summary of Case ${CASE} ---------------------" 2>&1 | tee -a REPORT.txt
python3 extract_log.py 2>&1 | tee -a REPORT.txt
## safe output and clean up
cat outlog.txt >> alllog.txt
rm outlog.txt
# save the outputs
mv OUTPUT_byName.cex OUTPUTS/case3.1_out_byName.out
mv OUTPUT_byTime.cex OUTPUTS/case3.1_out_byTime.out
mv OUTPUT_formatted.cex OUTPUTS/case3.1_out_formatted.out
#
# ### case 3.2
CASE="3.2"
ALLARG="cases/NI_correct.smv cases/NI_formula.hq 50 hopt"
## execute python scripts on docker
(sudo docker run -v ${PWD}:/mnt tzuhanmsu/hyperqube:latest /bin/bash -c "cd mnt/; time -p ./parse.sh ${ALLARG}; ") 2>&1 | tee -a outlog.txt
## run BMC unrolling and QBF solving
(./bmc.sh ${ALLARG}) 2>&1 | tee -a outlog.txt
## get nice formatted  output for this case
echo "\n-------------------- Summary of Case ${CASE} ---------------------" 2>&1 | tee -a REPORT.txt
python3 extract_log.py 2>&1 | tee -a REPORT.txt
## safe output and clean up
cat outlog.txt >> alllog.txt
rm outlog.txt

#
#
echo "======================================" 2>&1 | tee -a REPORT.txt
echo " Non-repudiation Protocol w/ Fairness"    2>&1 | tee -a REPORT.txt
echo "======================================" 2>&1 | tee -a REPORT.txt
# ### case 4.1
CASE="4.1"
ALLARG="cases/NRP_incorrect.smv cases/NRP_formula.hq 15 hpes"
## execute python scripts on docker
(sudo docker run -v ${PWD}:/mnt tzuhanmsu/hyperqube:latest /bin/bash -c "cd mnt/; time -p ./parse.sh ${ALLARG}; ") 2>&1 | tee -a outlog.txt
## run BMC unrolling and QBF solving
(./bmc.sh ${ALLARG}) 2>&1 | tee -a outlog.txt
## get nice formatted  output for this case
echo "\n-------------------- Summary of Case ${CASE} ---------------------" 2>&1 | tee -a REPORT.txt
python3 extract_log.py 2>&1 | tee -a REPORT.txt
## safe output and clean up
cat outlog.txt >> alllog.txt
rm outlog.txt

#
# ### case 4.2
CASE="4.2"
ALLARG="cases/NRP_correct.smv cases/NRP_formula.hq 15 hopt"
## execute python scripts on docker
(sudo docker run -v ${PWD}:/mnt tzuhanmsu/hyperqube:latest /bin/bash -c "cd mnt/; time -p ./parse.sh ${ALLARG}; ") 2>&1 | tee -a outlog.txt
## run BMC unrolling and QBF solving
(./bmc.sh ${ALLARG}) 2>&1 | tee -a outlog.txt
## get nice formatted  output for this case
echo "\n-------------------- Summary of Case ${CASE} ---------------------" 2>&1 | tee -a REPORT.txt
python3 extract_log.py 2>&1 | tee -a REPORT.txt
## safe output and clean up
cat outlog.txt >> alllog.txt
rm outlog.txt
# #
# save the outputs
mv OUTPUT_byName.cex OUTPUTS/case4.2_out_byName.out
mv OUTPUT_byTime.cex OUTPUTS/case4.2_out_byTime.out
mv OUTPUT_formatted.cex OUTPUTS/case4.2_out_formatted.out

#
#
#
#
echo "==============================" 2>&1 | tee -a REPORT.txt
echo " Synth of Shortest Path (SP)"    2>&1 | tee -a REPORT.txt
echo "==============================" 2>&1 | tee -a REPORT.txt
CASE="SP 10x10 "
ALLARG="cases/robotic_sp_100.smv  cases/robotic_sp_formula.hq 20 hpes -find"
## execute python scripts on docker
(sudo docker run -v ${PWD}:/mnt tzuhanmsu/hyperqube:latest /bin/bash -c "cd mnt/; time -p ./parse.sh ${ALLARG}; ") 2>&1 | tee -a outlog.txt
## run BMC unrolling and QBF solving
(./bmc.sh ${ALLARG}) 2>&1 | tee -a outlog.txt
## get nice formatted  output for this case
echo "\n------------------ Summary of Case ${CASE} -------------------" 2>&1 | tee -a REPORT.txt
python3 extract_log.py 2>&1 | tee -a REPORT.txt
## safe output and clean up
cat outlog.txt >> alllog.txt
rm outlog.txt
# save the outputs
mv OUTPUT_byName.cex OUTPUTS/case_sp10_out_byName.out
mv OUTPUT_byTime.cex OUTPUTS/case_sp10_out_byTime.out
mv OUTPUT_formatted.cex OUTPUTS/case_sp10_out_formatted.out
#
CASE="SP 20x20 "
ALLARG="cases/robotic_sp_400.smv cases/robotic_sp_formula.hq 40 hpes -find"
## execute python scripts on docker
(sudo docker run -v ${PWD}:/mnt tzuhanmsu/hyperqube:latest /bin/bash -c "cd mnt/; time -p ./parse.sh ${ALLARG}; ") 2>&1 | tee -a outlog.txt
## run BMC unrolling and QBF solving
(./bmc.sh ${ALLARG}) 2>&1 | tee -a outlog.txt
## get nice formatted  output for this case
echo "\n------------------ Summary of Case ${CASE} -------------------" 2>&1 | tee -a REPORT.txt
python3 extract_log.py 2>&1 | tee -a REPORT.txt
## safe output and clean up
cat outlog.txt >> alllog.txt
rm outlog.txt
# save the outputs
mv OUTPUT_byName.cex OUTPUTS/case_sp20_out_byName.out
mv OUTPUT_byTime.cex OUTPUTS/case_sp20_out_byTime.out
mv OUTPUT_formatted.cex OUTPUTS/case_sp20_out_formatted.out
#

echo "\nSP 40x40 is killed by TACAS VM, please see OUTPUT_LARGE.txt for details" 2>&1 | tee -a REPORT.txt
# CASE="SP 40x40 " ## killed
# ALLARG="cases/robotic_sp_1600.smv cases/robotic_sp_formula.hq 80 hpes -find"
# ## execute python scripts on docker
# (sudo docker run -v ${PWD}:/mnt tzuhanmsu/hyperqube:latest /bin/bash -c "cd mnt/; time -p ./parse.sh ${ALLARG}; ") 2>&1 | tee -a outlog.txt
# ## run BMC unrolling and QBF solving
# (./bmc.sh ${ALLARG}) 2>&1 | tee -a outlog.txt
# ## get nice formatted  output for this case
# echo "\n------------------ Summary of Case ${CASE} -------------------" 2>&1 | tee -a REPORT.txt
# python3 extract_log.py 2>&1 | tee -a REPORT.txt
# ## safe output and clean up
# cat outlog.txt >> alllog.txt
# rm outlog.txt
# #
echo "\nSP 60x60 is killed by TACAS VM, please see OUTPUT_LARGE.txt for details" 2>&1 | tee -a REPORT.txt
# # CASE="SP 60x60 " ## killed
# # ALLARG="cases/robotic_sp_3600.smv cases/robotic_sp_formula.hq 120 hpes -find"
# # ## execute python scripts on docker
# # (sudo docker run -v ${PWD}:/mnt tzuhanmsu/hyperqube:latest /bin/bash -c "cd mnt/; time -p ./parse.sh ${ALLARG}; ") 2>&1 | tee -a outlog.txt
# # ## run BMC unrolling and QBF solving
# # (./bmc.sh ${ALLARG}) 2>&1 | tee -a outlog.txt
# # ## get nice formatted  output for this case
# # echo "\n------------------ Summary of Case ${CASE} -------------------" 2>&1 | tee -a REPORT.txt
# # python3 extract_log.py 2>&1 | tee -a REPORT.txt
# # ## safe output and clean up
# # cat outlog.txt >> alllog.txt
# # rm outlog.txt
#
#
echo "==============================" 2>&1 | tee -a REPORT.txt
echo " Synth of Robustness Path (RB)"    2>&1 | tee -a REPORT.txt
echo "==============================" 2>&1 | tee -a REPORT.txt
CASE="RB 10x10 "
ALLARG="cases/robotic_robustness_100.smv cases/robotic_robustness_formula.hq 20 hpes -find"
## execute python scripts on docker
(sudo docker run -v ${PWD}:/mnt tzuhanmsu/hyperqube:latest /bin/bash -c "cd mnt/; time -p ./parse.sh ${ALLARG}; ") 2>&1 | tee -a outlog.txt
## run BMC unrolling and QBF solving
(./bmc.sh ${ALLARG}) 2>&1 | tee -a outlog.txt
## get nice formatted  output for this case
echo "\n------------------ Summary of Case ${CASE} -------------------" 2>&1 | tee -a REPORT.txt
python3 extract_log.py 2>&1 | tee -a REPORT.txt
## safe output and clean up
cat outlog.txt >> alllog.txt
rm outlog.txt
# save the outputs
mv OUTPUT_byName.cex OUTPUTS/case_rb10_out_byName.out
mv OUTPUT_byTime.cex OUTPUTS/case_rb10_out_byTime.out
mv OUTPUT_formatted.cex OUTPUTS/case_rb10_out_formatted.out
#
CASE="RB 20x20 "
ALLARG="cases/robotic_robustness_400.smv cases/robotic_robustness_formula.hq 40 hpes -find"
## execute python scripts on docker
(sudo docker run -v ${PWD}:/mnt tzuhanmsu/hyperqube:latest /bin/bash -c "cd mnt/; time -p ./parse.sh ${ALLARG}; ") 2>&1 | tee -a outlog.txt
## run BMC unrolling and QBF solving
(./bmc.sh ${ALLARG}) 2>&1 | tee -a outlog.txt
## get nice formatted  output for this case
echo "\n------------------ Summary of Case ${CASE} -------------------" 2>&1 | tee -a REPORT.txt
python3 extract_log.py 2>&1 | tee -a REPORT.txt
## safe output and clean up
cat outlog.txt >> alllog.txt
rm outlog.txt
# save the outputs
mv OUTPUT_byName.cex OUTPUTS/case_rb20_out_byName.out
mv OUTPUT_byTime.cex OUTPUTS/case_rb20_out_byTime.out
mv OUTPUT_formatted.cex OUTPUTS/case_rb20_out_formatted.out
#
CASE="RB 40x40 "
ALLARG="cases/robotic_robustness_1600.smv cases/robotic_robustness_formula.hq 80 hpes -find"
## execute python scripts on docker
(sudo docker run -v ${PWD}:/mnt tzuhanmsu/hyperqube:latest /bin/bash -c "cd mnt/; time -p ./parse.sh ${ALLARG}; ") 2>&1 | tee -a outlog.txt
## run BMC unrolling and QBF solving
(./bmc.sh ${ALLARG}) 2>&1 | tee -a outlog.txt
## get nice formatted  output for this case
echo "\n------------------ Summary of Case ${CASE} -------------------" 2>&1 | tee -a REPORT.txt
python3 extract_log.py 2>&1 | tee -a REPORT.txt
## safe output and clean up
cat outlog.txt >> alllog.txt
rm outlog.txt
# save the outputs
mv OUTPUT_byName.cex OUTPUTS/case_rb40_out_byName.out
mv OUTPUT_byTime.cex OUTPUTS/case_rb40_out_byTime.out
mv OUTPUT_formatted.cex OUTPUTS/case_rb40_out_formatted.out
#
echo "\nRB 60x60 is killed by TACAS VM, please see OUTPUT_LARGE.txt for details" 2>&1 | tee -a REPORT.txt
# # CASE="RB 60x60 " ## killed
# # ALLARG="cases/robotic_robustness_3600.smv cases/robotic_robustness_formula.hq 120 hpes -find"
# # ## execute python scripts on docker
# # (sudo docker run -v ${PWD}:/mnt tzuhanmsu/hyperqube:latest /bin/bash -c "cd mnt/; time -p ./parse.sh ${ALLARG}; ") 2>&1 | tee -a outlog.txt
# # ## run BMC unrolling and QBF solving
# # (./bmc.sh ${ALLARG}) 2>&1 | tee -a outlog.txt
# # ## get nice formatted  output for this case
# # echo "\n------------------ Summary of Case ${CASE} -------------------" 2>&1 | tee -a REPORT.txt
# # python3 extract_log.py 2>&1 | tee -a REPORT.txt
# # ## safe output and clean up
# # cat outlog.txt >> alllog.txt
# # rm outlog.txt
#
#
echo "======================================" 2>&1 | tee -a REPORT.txt
echo " synth mutatnt for mutation testing"    2>&1 | tee -a REPORT.txt
echo "======================================" 2>&1 | tee -a REPORT.txt
CASE=" Mutation Testing "
ALLARG="cases/mutation_testing.smv cases/mutation_testing.hq 10 hpes -find"
## execute python scripts on docker
(sudo docker run -v ${PWD}:/mnt tzuhanmsu/hyperqube:latest /bin/bash -c "cd mnt/; time -p ./parse.sh ${ALLARG}; ") 2>&1 | tee -a outlog.txt
## run BMC unrolling and QBF solving
(./bmc.sh ${ALLARG}) 2>&1 | tee -a outlog.txt
## get nice formatted  output for this case
echo "\n-------------------- Summary of Case ${CASE} ---------------------" 2>&1 | tee -a REPORT.txt
python3 extract_log.py 2>&1 | tee -a REPORT.txt
## safe output and clean up
cat outlog.txt >> alllog.txt
rm outlog.txt
# save the outputs
mv OUTPUT_byName.cex OUTPUTS/case_MT_out_byName.out
mv OUTPUT_byTime.cex OUTPUTS/case_MT_out_byTime.out
mv OUTPUT_formatted.cex OUTPUTS/case_MT_out_formatted.out
