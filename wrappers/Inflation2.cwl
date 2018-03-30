cwlVersion: v1.0
class: CommandLineTool
baseCommand: mris_inflate
# mris_inflate  ../surf/lh.smoothwm ../surf/lh.inflated

# PW 2016/12/23:
#  mris_inflate calls mris_write() to write the ouput file.  mris_write() writes 
#  the output file to the same directory as the input file and not to pwd.  We 
#  therefore need to stage the input file into the output dir so we can
#  glob the output
requirements:
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.smoothwm)
      entryname: $(runtime.outdir + "/" + inputs.smoothwm.basename)

inputs:
  smoothwm:
    type: File
    inputBinding:
      position: 1
      valueFrom: $(runtime.outdir + "/" + inputs.smoothwm.basename)
  output_filename:
    type: string
    default: ""
    inputBinding:
      position: 2
      valueFrom: $(inputs.hemi + ".inflated")
  hemi:
    type: string

outputs:
  output_file_inflated:
    type: File
    outputBinding:
      glob: $(inputs.hemi + ".inflated")
  output_file_sulc:
    type: File
    outputBinding:
      glob: $(inputs.hemi + ".sulc")