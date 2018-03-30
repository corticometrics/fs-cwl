cwlVersion: v1.0
class: CommandLineTool
baseCommand: mri_mask
# mri_mask -T 5 brain.mgz brainmask.mgz brain.finalsurfs.mgz

inputs:
  T:
    type: int
    default: 5
    inputBinding:
      prefix: -T
      position: 1
  brain:
    type: File
    inputBinding:
      position: 2
  mask:
    type: File
    inputBinding:
      position: 3      
  output_filename:
    type: string
    default: "brain.finalsurfs.mgz"
    inputBinding:
      position: 4

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)