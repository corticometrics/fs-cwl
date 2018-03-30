cwlVersion: v1.0
class: CommandLineTool
baseCommand: mri_segstats
# mri_segstats --seg mri/aseg.mgz --sum stats/aseg.stats --pv mri/norm.mgz --empty --brainmask mri/brainmask.mgz --brain-vol-from-seg --excludeid 0 --excl-ctxgmwm --supratent --subcortgray --in mri/pv.mgz --in-intensity-name norm --in-intensity-units MR --etiv --surf-wm-vol --surf-ctx-vol --totalgray --euler --ctab $FREESURFER_HOME/ASegStatsLUT.txt --subject bert

requirements:
  - class: EnvVarRequirement
    envDef:
       SUBJECTS_DIR: $(runtime.outdir)
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.talairach_xfm)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/transforms/talairach.xfm")
    - entry: $(inputs.ribbon)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/ribbon.mgz")
# PW 2017/01/17: Even though brainmask isn't a stealh input, it assumes it's in the standard
#                Freesurfer location, and not what's passed on the command line
    - entry: $(inputs.mask)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/brainmask.mgz")
    - entry: $(inputs.aseg_presurf)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/aseg.presurf.mgz")
    - entry: $(inputs.lh_orig_nofix)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/lh.orig.nofix")
    - entry: $(inputs.rh_orig_nofix)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/rh.orig.nofix")
    - entry: $(inputs.lh_white)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/lh.white")
    - entry: $(inputs.rh_white)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/rh.white")
    - entry: $(inputs.lh_pial)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/lh.pial")
    - entry: $(inputs.rh_pial)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/rh.pial")

inputs:
  aseg:
    type: File
    inputBinding:
      position: 1
      prefix: --seg
  output_filename:
    type: string
    default: "aseg.stats"
    inputBinding:
      position: 2
      prefix: --sum  
  pv:
    type: File
    inputBinding:
      position: 3
      prefix: --pv
  empty:
    type: boolean
    default: true
    inputBinding:
      position: 4
      prefix: "--empty"      
  mask:
    type: File
    inputBinding:
      position: 5
      prefix: --brainmask
      valueFrom: $(runtime.outdir + "/" + inputs.subname + "/mri/brainmask.mgz")
  brain-vol-from-seg:
    type: boolean
    default: true
    inputBinding:
      position: 6
      prefix: "--brain-vol-from-seg"
  excludeid:
    type: int
    default: 0
    inputBinding:
      position: 7
      prefix: "--excludeid"
  excl-ctxgmwm:
    type: boolean
    default: true
    inputBinding:
      position: 8
      prefix: "--excl-ctxgmwm"
  supratent:
    type: boolean
    default: true
    inputBinding:
      position: 9
      prefix: "--supratent"
  subcortgray:
    type: boolean
    default: true
    inputBinding:
      position: 10
      prefix: "--subcortgray"
  norm:
    type: File
    inputBinding:
      position: 11
      prefix: --in
  in-intensity-name:
    type: string
    default: norm
    inputBinding:
      position: 12
      prefix: "--in-intensity-name"
  in-intensity-units:
    type: string
    default: MR
    inputBinding:
      position: 13
      prefix: "--in-intensity-units"
  etiv:
    type: boolean
    default: true
    inputBinding:
      position: 14
      prefix: "--etiv"
  surf-wm-vol:
    type: boolean
    default: true
    inputBinding:
      position: 15
      prefix: "--surf-wm-vol"
  surf-ctx-vol:
    type: boolean
    default: true
    inputBinding:
      position: 16
      prefix: "--surf-ctx-vol"
  totalgray:
    type: boolean
    default: true
    inputBinding:
      position: 17
      prefix: "--totalgray"
  euler:
    type: boolean
    default: true
    inputBinding:
      position: 18
      prefix: "--euler"
  aseg_ctab:
    type: File
    inputBinding:
      position: 19
      prefix: --ctab
  subname:
    type: string
    inputBinding:
      position: 20
      prefix: "--subject"
  talairach_xfm:
    type: File
  aseg_presurf:
    type: File
  ribbon:
    type: File
  lh_orig_nofix:
    type: File
  rh_orig_nofix:
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
      glob: $(inputs.output_filename)
