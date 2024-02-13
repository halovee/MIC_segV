# Obtained from: https://github.com/lhoyer/DAFormer
# Modifications: Add HR, LR, and attention visualization
# ---------------------------------------------------------------
# Copyright (c) 2021-2022 ETH Zurich, Lukas Hoyer. All rights reserved.
# Licensed under the Apache License, Version 2.0
# ---------------------------------------------------------------

#!/bin/bash

# FOLDERPATH='/usr/bmicnas02/data-biwi-01/klanna_data/results/MIC/work_dirs/local-basic/'
FOLDERPATH='/cluster/work/cvl/klanna/MIC-results/work_dirs/local-basic/'
TEST_ROOT=$1
CONFIG_FILE="${FOLDERPATH}${TEST_ROOT}/*${TEST_ROOT: -1}.py"  # or .json for old configs
CHECKPOINT_FILE="${FOLDERPATH}${TEST_ROOT}/latest.pth"
SHOW_DIR="${FOLDERPATH}${TEST_ROOT}/preds"
echo 'Config File:' $CONFIG_FILE
echo 'Checkpoint File:' $CHECKPOINT_FILE
echo 'Predictions Output Directory:' $SHOW_DIR
python -m tools.test ${CONFIG_FILE} ${CHECKPOINT_FILE} --eval mDice --show-dir ${SHOW_DIR} --opacity 1

# Uncomment the following lines to visualize the LR predictions,
# HR predictions, or scale attentions of HRDA:
#python -m tools.test ${CONFIG_FILE} ${CHECKPOINT_FILE} --show-dir ${SHOW_DIR}_LR --opacity 1 --hrda-out LR
#python -m tools.test ${CONFIG_FILE} ${CHECKPOINT_FILE} --show-dir ${SHOW_DIR}_HR --opacity 1 --hrda-out HR
#python -m tools.test ${CONFIG_FILE} ${CHECKPOINT_FILE} --show-dir ${SHOW_DIR}_ATT --opacity 1 --hrda-out ATT
