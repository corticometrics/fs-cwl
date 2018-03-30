cwlVersion: v1.0
class: CommandLineTool
baseCommand: mri_aparc2aseg
# mri_aparc2aseg --s bert --labelwm --hypo-as-wm --rip-unknown --volmask --o mri/wmparc.mgz --ctxseg aparc_plus_aseg.mgz

requirements:
  - class: EnvVarRequirement
    envDef:
       SUBJECTS_DIR: $(runtime.outdir)
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.aseg)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/aseg.mgz")
    - entry: $(inputs.ribbon)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/ribbon.mgz")
    - entry: $(inputs.aparc_aseg)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/aparc_plus_aseg.mgz")
    - entry: $(inputs.lh_aparc_annot)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/label/lh.aparc.annot")
    - entry: $(inputs.rh_aparc_annot)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/label/rh.aparc.annot")
    - entry: $(inputs.lh_white)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/lh.white")
    - entry: $(inputs.rh_white)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/rh.white")
    - entry: $(inputs.lh_pial)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/lh.pial")
    - entry: $(inputs.rh_pial)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/rh.pial")

inputs:
  subname:
    type: string
    inputBinding:
      position: 1
      prefix: "--s"
  labelwm:
    type: boolean
    default: true
    inputBinding:
      position: 2
      prefix: --labelwm
  hypo:
    type: boolean
    default: true
    inputBinding:
      position: 3
      prefix: --hypo-as-wm
  rip:
    type: boolean
    default: true
    inputBinding:
      position: 4
      prefix: --rip-unknown      
  volmask:
    type: boolean
    default: true
    inputBinding:
      position: 5
      prefix: --volmask
  output_filename:
    type: string
    default: "wmparc.mgz"
    inputBinding:
      position: 6
      prefix: --o
  aparc_aseg_filename:
    type: string
    default: "aparc_plus_aseg.mgz"
    inputBinding:
      position: 8
      prefix: --ctxseg
  aseg:
    type: File
  ribbon:
    type: File
  aparc_aseg:
    type: File
  lh_aparc_annot:
    type: File
  rh_aparc_annot:
    type: File
  lh_white:
    type: File
  rh_white:
    type: File
  lh_pial:
    type: File
  rh_pial:
    type: File

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.output_filename)