cwlVersion: v1.0
class: CommandLineTool
baseCommand: mri_pretess
# mri_pretess ../mri/filled.mgz 255 ../mri/norm.mgz ../mri/filled-pretess255.mgz

inputs:
  filled:
    type: File
    inputBinding:
      position: 1
  label_value:
    type: int
    default: 255
    inputBinding:
      position: 2
  norm:
    type: File
    inputBinding:
      position: 3
  output_filename:
    type: string
    default: filled-pretess255.mgz
    inputBinding:
      position: 4

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)