cwlVersion: v1.0
class: CommandLineTool
baseCommand: mris_curvature
# mris_curvature -thresh .999 -n -a 5 -w -distances 10 10 lh.inflated

# PW 2016/12/23:
#  mris_inflate calls mris_write() to write the ouput file.  mris_write() writes 
#  the output file to the same directory as the input file and not to pwd.  We 
#  therefore need to stage the input file into the output dir so we can
#  glob the output
requirements:
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.inflated)
      entryname: $(runtime.outdir + "/" + inputs.inflated.basename)

inputs:
  thresh:
    type: float
    default: .999
    inputBinding:
      position: 1
      prefix: -thresh
  n:
    type: boolean
    default: true
    inputBinding:
      position: 2
      prefix: -n
  a:
    type: int
    default: 5
    inputBinding:
      position: 3
      prefix: -a      
  w:
    type: boolean
    default: true
    inputBinding:
      position: 4
      prefix: -w
  distances:
    type: int[]
    default: [10, 10]
    inputBinding:
      position: 5
      prefix: -distances
  inflated:
    type: File
    inputBinding:
      position: 6
      valueFrom: $(runtime.outdir + "/" + inputs.inflated.basename)

outputs:
  output_file_H:
    type: File
    outputBinding:
      glob: $(inputs.inflated.basename + ".H")
  output_file_K:
    type: File
    outputBinding:
      glob: $(inputs.inflated.basename + ".K")