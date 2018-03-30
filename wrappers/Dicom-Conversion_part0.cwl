cwlVersion: v1.0
class: CommandLineTool
baseCommand: mri_vol2vol
# mri_vol2vol --mov aseg.mgz --targ rawavg.mgz --regheader --nearest --o aseg-rawavg.nii.gz

requirements:
  - class: InlineJavascriptRequirement

inputs:
  mov:
    type: File
    inputBinding:
      prefix: --mov
      position: 1
  targ:
    type: File
    inputBinding:
      prefix: --targ
      position: 2
  regheader:
    type: boolean
    default: true
    inputBinding:
      prefix: --regheader
      position: 3 
  nearest:
    type: boolean
    default: true
    inputBinding:
      prefix: --nearest
      position: 4 
  output_filename:
    type: string
    inputBinding:
      prefix: --o
      position: 5

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.output_filename)