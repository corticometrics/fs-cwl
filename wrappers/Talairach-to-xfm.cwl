cwlVersion: v1.0
class: CommandLineTool
baseCommand: lta_convert
# lta_convert --inlta talairach.lta --outmni talairach.xfm

requirements:
  - class: InlineJavascriptRequirement

inputs:
  samseg_talairach:
    type: File
    inputBinding:
      position: 1
      prefix: --inlta
  talairach_xfm:
    type: string
    default: talairach.xfm
    inputBinding:
      position: 2
      prefix: --outmni

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.talairach_xfm)
      