cwlVersion: v1.0
class: CommandLineTool
baseCommand: mris_curvature
# mris_curvature -w lh.white.preaparc
# PW 2016/12/23:
#  mris_inflate calls mris_write() to write the ouput file.  mris_write() writes 
#  the output file to the same directory as the input file and not to pwd.  We 
#  therefore need to stage the input file into the output dir so we can
#  glob the output
requirements:
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.white_preaparc)
      entryname: $(runtime.outdir + "/" + inputs.white_preaparc.basename)

inputs:
  w:
    type: boolean
    default: true
    inputBinding:
      position: 1
      prefix: -w  
  white_preaparc:
    type: File
    inputBinding:
      position: 2
      valueFrom: $(runtime.outdir + "/" + inputs.white_preaparc.basename)


outputs:
  output_file_H:
    type: File
    outputBinding:
      glob: $(inputs.white_preaparc.basename + ".H")
  output_file_K:
    type: File
    outputBinding:
      glob: $(inputs.white_preaparc.basename + ".K")
