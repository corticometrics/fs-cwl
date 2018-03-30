cwlVersion: v1.0
class: CommandLineTool
baseCommand: mri_tessellate
# mri_tessellate ../mri/filled-pretess127.mgz 127 ../surf/rh.orig.nofix

inputs:
  filled_pretess:
    type: File
    inputBinding:
      position: 1
  labelstring:
    type: int 
    default: 127
    inputBinding:
      position: 2
  output_filename:
    type: string
    default: "rh.orig.nofix.pre_extract"
    inputBinding:
      position: 3

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)
