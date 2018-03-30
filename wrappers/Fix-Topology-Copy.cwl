cwlVersion: v1.0
class: CommandLineTool
baseCommand: cp
# cp ../surf/rh.inflated.nofix ../surf/rh.inflated
requirements:
  - class: InlineJavascriptRequirement

inputs:
  input_file:
    type: File
    inputBinding:
      position: 1
  output_filename:
    type: string
    inputBinding:
      position: 2

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.output_filename)