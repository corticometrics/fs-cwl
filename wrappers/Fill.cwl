cwlVersion: v1.0
class: CommandLineTool
baseCommand: mri_fill
# mri_fill -a ../scripts/ponscc.cut.log -xform transforms/talairach.lta -segmentation aseg.auto_noCCseg.mgz wm.mgz filled.mgz

inputs:
  log_filename:
    type: string
    default: ponscc.cut.log
    inputBinding:
      position: 1
      prefix: -a
  talairach_lta:
    type: File
    inputBinding:
      position: 2
      prefix: -xform
  aseg_no_cc:
    type: File
    inputBinding:
      position: 3
      prefix: -segmentation      
  wm:
    type: File
    inputBinding:
      position: 4
  output_filename:
    type: string
    default: "filled.mgz"
    inputBinding:
      position: 5

outputs:
  log_file:
    type: File
    outputBinding:
      glob: $(inputs.log_filename)
  output_file:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)