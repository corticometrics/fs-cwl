cwlVersion: v1.0
class: CommandLineTool
baseCommand: mris_smooth
# mris_smooth -nw -seed 1234 ../surf/lh.orig.nofix ../surf/lh.smoothwm.nofix

# PW 2016/12/23:
#  mri_smooth (and probably everything else that uses mris_write()) writes the 
#  output file to the same directory as the input file and not to pwd.  We 
#  therefore need to stage the input file into the output dir so we can
#  glob the output
requirements:
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.orig_nofix)
      entryname: $(runtime.outdir + "/" + inputs.orig_nofix.basename)

inputs:
  no_estimates:
    type: boolean
    default: true
    inputBinding:
      position: 1
      prefix: -nw
  seed:
    type: int
    default: 1234
    inputBinding:
      position: 2
      prefix: -seed  
  orig_nofix:
    type: File
    inputBinding:
      position: 3
      valueFrom: $(runtime.outdir + "/" + inputs.orig_nofix.basename)
  output_filename:
    type: string
    default: ""
    inputBinding:
      position: 4
      valueFrom: $(inputs.hemi + ".smoothwm.nofix")
  hemi:
    type: string

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(inputs.hemi + ".smoothwm.nofix")

