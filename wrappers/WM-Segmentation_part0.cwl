cwlVersion: v1.0
class: CommandLineTool
baseCommand: mri_segment
# mri_segment -mprage brain.mgz wm.seg.mgz
inputs:
  mprage:
    type: boolean
    default: true
    inputBinding:
      position: 1
      prefix: -mprage
  brain:
    type: File
    inputBinding:
      position: 2
  output_filename:
    type: string
    default: "wm.seg.mgz"
    inputBinding:
      position: 3

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)