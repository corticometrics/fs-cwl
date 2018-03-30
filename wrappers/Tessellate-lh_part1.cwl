cwlVersion: v1.0
class: CommandLineTool
baseCommand: mri_tessellate
# mri_tessellate ../mri/filled-pretess255.mgz 255 ../surf/lh.orig.nofix

inputs:
  filled_pretess:
    type: File
    inputBinding:
      position: 1
  labelstring:
    type: int 
    default: 255
    inputBinding:
      position: 2
  output_filename:
    type: string
    default: "lh.orig.nofix.pre_extract"
    inputBinding:
      position: 3

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)
