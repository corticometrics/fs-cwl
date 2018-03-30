cwlVersion: v1.0
class: CommandLineTool
baseCommand: mri_cc
# mri_cc -aseg aseg.auto_noCCseg.mgz -o aseg.presurf.mgz -lta $SUBJECTS_DIR/bert/mri/transforms/cc_up.lta bert
# PW 2016/12/23:
#  mri_cc assumes the standard freesurfer directory structure
#  so call the cwl 'outdir' the freesurfer 'SUBJECTS_DIR' and stage
#  the input files accordingly

requirements:
  - class: EnvVarRequirement
    envDef:
       SUBJECTS_DIR: $(runtime.outdir)
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.aseg_no_cc)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/" + inputs.aseg_no_cc.basename)
    - entry: $(inputs.norm)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/" + "norm.mgz")

inputs:
  aseg_no_cc:
    type: File
    inputBinding:
      prefix: -aseg
      position: 1
      valueFrom: $(inputs.aseg_no_cc.basename)
  output_filename:
    type: string
    default: "aseg.presurf.mgz"
    inputBinding:
      position: 2
      prefix: -o
  lta_filename:
    type: string
    default: "cc_up.lta"
    inputBinding:
      position: 3
      prefix: -lta
  subname:
    type: string
    inputBinding:
      position: 4
  norm:
    type: File
   
outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.subname + "/mri/" + inputs.output_filename)