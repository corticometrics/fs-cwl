cwlVersion: v1.0
class: CommandLineTool
baseCommand: mri_normalize
# mri_normalize -mprage -aseg aseg.presurf.mgz -mask brainmask.mgz norm.mgz brain.mgz

inputs:
  mprage:
    type: boolean
    default: true
    inputBinding:
      prefix: -mprage
      position: 1
  aseg_presurf:
    type: File
    inputBinding:
      prefix: -aseg
      position: 2
  mask:
    type: File
    inputBinding:
      prefix: -mask
      position: 3  
  norm:
    type: File
    inputBinding:
      position: 4
  output_filename:
    type: string
    default: "brain.mgz"
    inputBinding:
      position: 5

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)