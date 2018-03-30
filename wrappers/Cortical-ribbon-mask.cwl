cwlVersion: v1.0
class: CommandLineTool
baseCommand: mris_volmask
# mris_volmask --aseg_name aseg.presurf --label_left_white 2 --label_left_ribbon 3 --label_right_white 41 --label_right_ribbon 42 --save_ribbon bert

# PW 2017/01/08:
#  mris_volmask assumes the standard freesurfer directory structure
#  so call the cwl 'outdir' the freesurfer 'SUBJECTS_DIR' and stage
#  the input files accordingly
requirements:
  - class: EnvVarRequirement
    envDef:
       SUBJECTS_DIR: $(runtime.outdir)
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.aseg_presurf)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/"   + "aseg.presurf.mgz")
    - entry: $(inputs.surf_lh_white)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/"  + "lh.white")
    - entry: $(inputs.surf_rh_white)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/"  + "rh.white")
    - entry: $(inputs.surf_lh_pial)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/"  + "lh.pial")
    - entry: $(inputs.surf_rh_pial)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/"  + "rh.pial")

inputs:
  aseg_presurf:
    type: File
    inputBinding:
      prefix: --aseg_name
      position: 1
      valueFrom: $("aseg.presurf")
  label_left_white:
    type: int
    default: 2
    inputBinding:
      prefix: --label_left_white
      position: 2
  label_left_ribbon:
    type: int
    default: 3
    inputBinding:
      prefix: --label_left_ribbon
      position: 3
  label_right_white:
    type: int
    default: 41
    inputBinding:
      prefix: --label_right_white
      position: 4
  label_right_ribbon:
    type: int
    default: 42
    inputBinding:
      prefix: --label_right_ribbon
      position: 5
  save_ribbon:
    type: boolean
    default: true
    inputBinding:
      prefix: --save_ribbon
      position: 6
  subname:
    type: string
    inputBinding:
      position: 7
  surf_lh_white:
    type: File
  surf_rh_white:
    type: File
  surf_lh_pial:
    type: File
  surf_rh_pial:
    type: File

outputs:
  output_file_lh_ribbon:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.subname + "/mri/lh.ribbon.mgz")
  output_file_rh_ribbon:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.subname + "/mri/rh.ribbon.mgz")
  output_file_ribbon:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.subname + "/mri/ribbon.mgz")