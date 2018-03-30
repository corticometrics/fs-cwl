cwlVersion: v1.0
class: CommandLineTool
baseCommand: mris_sphere
# mris_sphere -seed 1234 ../surf/lh.inflated ../surf/lh.sphere

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
    - entry: $(inputs.inflated)
      entryname: $(runtime.outdir + "/" + inputs.inflated.basename)
    - entry: $(inputs.smoothwm)
      entryname: $(runtime.outdir + "/" + inputs.smoothwm.basename)

inputs:
  seed:
    type: int
    default: 1234
    inputBinding:
      position: 1
      prefix: -seed  
  inflated:
    type: File
    inputBinding:
      position: 2
      valueFrom: $(runtime.outdir + "/" + inputs.inflated.basename)
  output_filename:
    type: string
    default: ""
    inputBinding:
      position: 3
      valueFrom: $(inputs.hemi + ".sphere")
  smoothwm:
    type: File
  hemi:
    type: string


outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(inputs.hemi + ".sphere")