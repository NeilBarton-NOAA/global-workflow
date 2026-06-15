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
#export CICE_AHMAX=0.1                       # default 0.3
#export CICE_R_ICE=2.5                       # default 0
#export CICE_R_PND=2.5                       # default 0
#export CICE_R_SNW=2.5

# CPC Changes/Dynamics
#export CICE_KSTRENGTH=0
#export CICE_E_YIELDCURVE=1.5

# Turn off Melt Ponds
#export CICE_TR_POND_LVL='.false.'

# Dmitry Changes
#export CICE_TR_POND_TOPO='.true.'
#export CICE_TR_POND_LVL='.false.'
#export CICE_HS0=0.2
#export CICE_HS1=0.005
#export CICE_DPSCALE=0.01
#export CICE_RFRACMIN=0.15
#export CICE_RFRACMAX=1.0
#export CICE_PNDASPECT=0.8

#export CICE_SNWREDIST='ITDrdg'

# snow changes
#export CICE_RSNW_MLT=800.

# Bob Changes
#export CICE_EMISSIVITY=0.97
#export CICE_CALC_DRAGIO=.true.
#export CICE_ADVECTION='upwind'
#export CICE_FLOE_DIAM=1000.
#export CICE_MU_RDG=1.
#export CICE_PHI_C_SLOW_MODE=0.2

# slow brine drainage
#export CICE_PHI_C_SLOW_MODE=0.2
#export CICE_DSDT_SLOW_MODE=-1.0e7
#export CICE_RAC_RAPID_MODE=20

# melt pond settings
#export CICE_HS1=0.08
#export CICE_DPSCALE=2.0e-3
#export CICE_RFRACMAX=0.5
#export CICE_PNDASPECT=1.5

echo "END: config.ice"
