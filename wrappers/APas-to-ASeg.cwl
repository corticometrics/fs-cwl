cwlVersion: v1.0
class: CommandLineTool
baseCommand: apas2aseg
# apas2aseg --i aparc_plus_aseg.mgz --o aseg.mgz

inputs:
  aparc_aseg:
    type: File
    inputBinding:
      prefix: --i
      position: 1
  output_filename:
    type: string
    default: "aseg.mgz"
    inputBinding:
      prefix: --o
      position: 2

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)
