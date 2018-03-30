cwlVersion: v1.0
class: CommandLineTool
baseCommand: mris_smooth

# mris_smooth -n 3 -nw -seed 1234 ../surf/lh.white.preaparc ../surf/lh.smoothwm
# PW 2016/12/23:
#  mri_smooth (and probably everything else that uses mris_write()) writes the 
#  output file to the same directory as the input file and not to pwd.  We 
#  therefore need to stage the input file into the output dir so we can
#  glob the output

requirements:
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.white_preaparc)
      entryname: $(runtime.outdir + "/" + inputs.white_preaparc.basename)

inputs:
  niters:
    type: int
    default: 3
    inputBinding:
      position: 1
      prefix: -n
  no_estimates:
    type: boolean
    default: true
    inputBinding:
      position: 2
      prefix: -nw 
  seed:
    type: int
    default: 1234
    inputBinding:
      position: 3
      prefix: -seed
  white_preaparc:
    type: File
    inputBinding:
      position: 4
      valueFrom: $(runtime.outdir + "/" + inputs.white_preaparc.basename)
  output_filename:
    type: string
    default: ""
    inputBinding:
      position: 5
      valueFrom: $(inputs.hemi + ".smoothwm")
  hemi:
    type: string

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(inputs.hemi + ".smoothwm")