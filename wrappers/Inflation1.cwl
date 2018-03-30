cwlVersion: v1.0
class: CommandLineTool
baseCommand: mris_inflate
# mris_inflate -no-save-sulc ../surf/lh.smoothwm.nofix ../surf/lh.inflated.nofix

# PW 2016/12/23:
#  mris_inflate calls mris_write() to write the ouput file.  mris_write() writes 
#  the output file to the same directory as the input file and not to pwd.  We 
#  therefore need to stage the input file into the output dir so we can
#  glob the output
requirements:
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.smoothwm_nofix)
      entryname: $(runtime.outdir + "/" + inputs.smoothwm_nofix.basename)


inputs:
  no_sulc:
    type: boolean
    default: true
    inputBinding:
      position: 1
      prefix: -no-save-sulc
  smoothwm_nofix:
    type: File
    inputBinding:
      position: 2
      valueFrom: $(runtime.outdir + "/" + inputs.smoothwm_nofix.basename)
  output_filename:
    type: string
    default: ""    
    inputBinding:
      position: 3
      valueFrom: $(inputs.hemi + ".inflated.nofix") 
  hemi:
    type: string

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(inputs.hemi + ".inflated.nofix") 
