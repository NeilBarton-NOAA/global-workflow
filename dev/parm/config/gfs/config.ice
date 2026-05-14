#! /usr/bin/env bash

echo "BEGIN: config.ice"

# Override atm-only FV3 settings when ice model is on
export min_seaice="1.0e-6"
export use_cice_alb=".true."

export MESH_ICE="mesh.mx${ICERES}.nc"

export CICE_GRID="grid_cice_NEMS_mx${ICERES}.nc"
export CICE_MASK="kmtu_cice_NEMS_mx${ICERES}.nc"

# Mushy edits
#export CICE_FBOT_XFER_TYPE='mushy'          # default constant
#export CICE_TFREEZE_OPTION='linear_salt'    # default mushy
#export CICE_CONDUCT='bubbly'

# Albedo Changes
#export CICE_AHMAX=0.2                       # default 0.3
#export CICE_R_ICE=2.5                       # default 0
#export CICE_R_PND=2.5                       # default 0
#export CICE_R_SNW=2.5

# CPC Changes/Dynamics
#export CICE_KSTRENGTH=0
#export CICE_E_YIELDCURVE=1.5

# Turn off Melt Ponds
#export CICE_TR_POND_LVL='.false.'
#export CICE_PNDASPECT=0.9                   # default 0.8

# Dmitry Changes
#export CICE_SNWREDIST='ITDrdg'

# snow changes
#export CICE_RSNW_FALL=50.
#export CICE_RSNW_MLT=800.





echo "END: config.ice"
