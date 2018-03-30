cwlVersion: v1.0
class: CommandLineTool
baseCommand: mris_sphere
# mris_sphere -q -seed 1234 ../surf/lh.inflated.nofix ../surf/lh.qsphere.nofix

# PW 2016/12/23:
#  mris_sphere calls mris_write() to write the ouput file.  mris_write() writes 
#  the output file to the same directory as the input file and not to pwd.  We 
#  therefore need to stage the input file into the output dir so we can
#  glob the output
# PW 2017/01/05:
#  It seems like if the -q flag is not present, it also tries to load ?h.smoothwm?

requirements:
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.inflated_nofix)
      entryname: $(runtime.outdir + "/" + inputs.inflated_nofix.basename)

inputs:
  q:
    type: boolean
    default: true
    inputBinding:
      position: 1
      prefix: -q    
  seed:
    type: int
    default: 1234
    inputBinding:
      position: 2
      prefix: -seed
  inflated_nofix:
    type: File
    inputBinding:
      position: 3
      valueFrom: $(runtime.outdir + "/" + inputs.inflated_nofix.basename)
  output_filename:
    type: string
    default: ""
    inputBinding:
      position: 4
      valueFrom: $(inputs.hemi + ".qsphere.nofix")
  hemi:
    type: string

outputs:
  output_file:
    type: File
    outputBinding:
      glob:  $(inputs.hemi + ".qsphere.nofix")