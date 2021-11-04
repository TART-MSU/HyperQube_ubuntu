#!/bin/sh
REPORT=REPORT_CITE26.txt

# clean
rm ${REPORT}

# pacakges inatallation for cite35 experiments
pip3 install numpy
pip3 install matplotlib
pip3 install z3
pip3 install z3-solver

echo "===========================================" 2>&1 | tee -a ${REPORT}
echo "  Shortest Path Synthesis, using [26] " 2>&1 | tee -a ${REPORT}
echo "===========================================" 2>&1 | tee -a ${REPORT}

cd citation_26

echo "SP 10x10, cited[26]" 2>&1 | tee -a ../${REPORT}
(python3 sp_10.py) 2>&1 | tee -a ../${REPORT}
echo "SP 20x20, cited[26]" 2>&1 | tee -a ../${REPORT}
(python3 sp_20.py) 2>&1 | tee -a ../${REPORT}
# echo "SP 40x40, cited[26]" 2>&1 | tee -a ../${REPORT}
# (python3 sp_40.py) 2>&1 | tee -a ../${REPORT}
# echo "SP 60x60, cited[26]" 2>&1 | tee -a ../${REPORT}
# (python3 sp_60.py) 2>&1 | tee -a ../${REPORT}

cd ..



echo "===========================================" 2>&1 | tee -a ${REPORT}
echo "  Robust Path Synthesis, using [26] " 2>&1 | tee -a ${REPORT}
echo "===========================================" 2>&1 | tee -a ${REPORT}

cd citation_26

echo "RB 10x10, cited[26]" 2>&1 | tee -a ../${REPORT}
(python3 rb_10.py) 2>&1 | tee -a ../${REPORT}
echo "RB 20x20, cited[26]" 2>&1 | tee -a ${REPORT}
(python3 rb_20.py) 2>&1 | tee -a ../${REPORT}
# echo "RB 40x40, cited[26]" 2>&1 | tee -a ${REPORT}
# (python3 rb_40.py) 2>&1 | tee -a ../${REPORT}

cd ..
