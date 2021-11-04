# Welcome to HyperQube! (for ubuntu 20.04)

HyperQube is a home-grown tool of Bounded Model Checking for Hyperproperties.
It includes several parts:
	1) NuSMV model parsing and Boolean encoding of transition relation and specification;
	2) HyperLTL formula translation;
	3) QBF encoding of unfolding with bound k using specific semantics; and
	4) QBF solving with QBF solver QuAbs.

Our code is under MIT license as presented in LICENSE.tex, while the existing tool, QuAbs, is under AGPL license. (please see LICENSE.txt)


---------------------------------------------------------------------
      INSTRUCTIONS FOR RUNNING TACAS 2022 TOOL PAPER EXPERIMENTS
---------------------------------------------------------------------

We provide some shell scripts for executing our empirical results, including:

  ```./RUNALL.sh ```
	(execute all experiment in the paper)
		(1) All experimental results presented on Table 4;
		(2) All experimental results presented on Table 5.
			the well-formatted output	can be found in: REPORT.txt,
			the outputs (for cases that detects a bug) can be found in folder: OUTPUTS/

  ```./RUN_CITE26.sh  ``
	(execute all experiments from cited paper [26])
			the output can be found in: REPORT_CITE26.txt


In summary, after running the above two commands, the outputs are in:
	(1) REPORT.txt, for all results presented in the paper
	(2) REPORT_CITE26.txt, for results in cited paper [26]
	(3) REPORT_LARGE.txt, for some cases that are not runnable on VN (see below)
	(4) a directory OUTPUTS/, containing the output paths for cases with counterexample/witness.


---------------------------------------------------------------------------------------
(* Cases that are NOT runnable on TACAS VM due to high computational demands):
We noticed that some large cases are not able to be reproduced using TACAS22 VM 
(i.e., processes are `killed`), including:
- SNARK_BUG_2 with Linearizability;
- Shortest path with grid size as 40x40;
- Shortest path with grid size as 60x60;
- Robustness path with grid size as 60x60; and
- some large cases in cited paper [26].
We provide the statistical results of the above mentioned experiment in a separate file REPORT_LARGE.txt, which contains results that were ran by a MACBook Pro as stated in the paper.
---------------------------------------------------------------------------------------





-------------------------------------------------------
      INSTRUCTIONS FOR GENEAL USAGE OF THE TOOL
-------------------------------------------------------
## GET STARTED
You can start using HyperQube on ubuntu 20.04 with only one simple step.
First, install DOCKER by executing the following command:
    ```sudo apt install docker.io```

You are now ready to run HyperQube!:)

(* Why installing docker: We built a customized docker image to avoid possible hassle of compiling dependencies. With docker installed, HyperQube will automatically pull and execute the scripts on the image. To see our docker image, visit: https://hub.docker.com/repository/docker/tzuhanmsu/hyperqube )



## HOW TO USE
To run HyperQube, execute ```hyperqube.sh``` with one of the following two scenarios:

   1. BMC with single model
  ```sudo ./hyperqube.sh <model_file_name.smv> <formula_file_name.hq> <k> ```

   2. BMC with multi-model
  ```sudo ./hyperqube.sh <model_1_file_name.smv> <model_2_file_name.smv> <formula_file_name.hq> <k>```

Note that <k> is a natural number specifies the length of unrolling. To observe the tool outputs, all model checking results with counterexample will output as *_OUTPUT_formatted.cex. The parsed outputs have variables, time stamps, and values neatly presented.



## Run Some Simple Examples:
We now provide two demo examples. To run, execute each of the followings:
  - Example 1: bakery with symmetry:
    ```sudo ./hyperqube.sh demo/bakery.smv demo/symmetry 10 pes```
  - Example 2: SNARK with linearizability:
    ```sudo ./hyperqube.sh demo/SNARK_conc.smv demo/SNARK_seq.smv demo/linearizability 18 pes ```



## Run TACAS22 Tool Paper Experiments separately
(all models and formulas are in directory /cases)

Our evaluations include the following cases
- Case #1.1-#1.4: Symmetry in the Bakery Algorith
- Case #2.1-#2.2: Linearizability in SNARK Algorith
- Case #3.1-#3.2: Non-interference in Typed Multi-threaded Program
- Case #4.1-#4.2: Fairness in Non-repudiation Protocol
- Case #5.1-#5.2: Privacy-Preserving Path Synthesis for Robot
- Case #6.1: Mutant Synthesis for Mutation Testin

We now provide all the command lines needed for running each individule experiment:

[RUNNING EXAMPLE simple_krip with simple_krip_formula]
  sudo ./hyperqube.sh cases/simple_krip.smv  cases/simple_krip_formula.hq 5 pes


[BAKERY]
-- 1.1 BAKERY 3PROC SYM1 --
  sudo ./hyperqube.sh cases/bakery_3procs.smv cases/bakery_formula_sym1_3proc.hq 10 pes
-- 1.2 BAKERY 3PROC SYM2  --
  sudo ./hyperqube.sh cases/bakery_3procs.smv cases/bakery_formula_sym2_3proc.hq 10 pes
-- 1.3 BAKERY 5PROC SYM1 --
  sudo ./hyperqube.sh cases/bakery_5procs.smv cases/bakery_formula_sym1_5proc.hq 10 pes
-- 1.4 BAKERY 5PROC SYM2 --
  sudo ./hyperqube.sh cases/bakery_5procs.smv cases/bakery_formula_sym2_5proc.hq 10 pes


[SNARK]
-- 2.1 SNARK_BUG 1 --
  sudo ./hyperqube.sh cases/snark1_M1_concurrent.smv cases/snark1_M2_sequential.smv  cases/snark1_formula.hq 18 pes
-- 2.2 SNARK_BUG 2 --
  sudo ./hyperqube.sh cases/snark2_new_M1_concurrent.smv  cases/snark2_new_M2_sequential.smv cases/snark2_formula.hq 30 pes


[3-thread]
-- 3.1 3-thread incorrect --
  sudo ./hyperqube.sh cases/NI_incorrect.smv cases/NI_formula.hq 50 hpes
-- 3.2 3-thread correct --
  sudo ./hyperqube.sh cases/NI_correct.smv cases/NI_formula.hq 50 hopt


[Non-repudiation Protocol]
-- 4.1 NRP incorrect
  sudo ./hyperqube.sh cases/NRP_incorrect.smv cases/NRP_formula.hq 15 hpes
-- 4.2 NRP_correct --
  sudo ./hyperqube.sh cases/NRP_correct.smv cases/NRP_formula.hq 15 hopt


[Shortest Path]
-- Shortest Path 10x10 --
  sudo ./hyperqube.sh cases/robotic_sp_100.smv  cases/robotic_sp_formula.hq 20 hpes -find
-- Shortest Path 20x20 --
  sudo ./hyperqube.sh cases/robotic_sp_400.smv cases/robotic_sp_formula.hq 40 hpes -find
-- Shortest Path 40x40 --
  sudo ./hyperqube.sh cases/robotic_sp_1600.smv cases/robotic_sp_formula.hq 80 hpes -find
-- Shortest Path 60x60 --
  sudo ./hyperqube.sh cases/robotic_sp_3600.smv cases/robotic_sp_formula.hq 120 hpes -find


[Initial State Robustness]
-- Robustness 10x10 --
  sudo ./hyperqube.sh cases/robotic_robustness_100.smv cases/robotic_robustness_formula.hq 20 hpes -find
-- Robustness 20x20 --
  sudo ./hyperqube.sh cases/robotic_robustness_400.smv cases/robotic_robustness_formula.hq 40 hpes -find
-- Robustness 40x40 --
  sudo ./hyperqube.sh cases/robotic_robustness_1600.smv cases/robotic_robustness_formula.hq 80 hpes -find
-- Robustness 60x60 --
  sudo ./hyperqube.sh cases/robotic_robustness_3600.smv cases/robotic_robustness_formula.hq 120 hpes -find


[Mutation Testing]
  sudo ./hyperqube.sh cases/mutation_testing.smv cases/mutation_testing.hq 10 hpes -find



## People
Authors:
- [Tzu-Han Hsu](https://tzuhancs.github.io/), Michigan State University.
- [Borzoo Bonakdarpour](http://www.cse.msu.edu/~borzoo/), Michigan State University.
- [César Sánchez](https://software.imdea.org/~cesar/), IMDEA Software Institute.
