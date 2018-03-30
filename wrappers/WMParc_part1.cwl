cwlVersion: v1.0
class: CommandLineTool
baseCommand: mri_segstats
# mri_segstats --seg mri/wmparc.mgz --sum stats/wmparc.stats --pv mri/norm.mgz --excludeid 0 --brainmask mri/brainmask.mgz --in mri/norm.mgz --in-intensity-name norm --in-intensity-units MR --subject bert --surf-wm-vol --ctab $FREESURFER_HOME/WMParcStatsLUT.txt --etiv

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
# PW 2017/01/17: Even though brainmask_file isn't a stealh input, it assumes it's in the standard
#                Freesurfer location, and not what's passed on the command line
    - entry: $(inputs.mask)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/brainmask.mgz")
    - entry: $(inputs.aseg_presurf)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/aseg.presurf.mgz")
    - entry: $(inputs.aseg)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/aseg.mgz")
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
  wmparc:
    type: File
    inputBinding:
      position: 1
      prefix: --seg
  output_filename:
    type: string
    default: "wmparc.stats"
    inputBinding:
      position: 2
      prefix: --sum  
  pv:
    type: File
    inputBinding:
      position: 3
      prefix: --pv
  excludeid:
    type: int
    default: 0
    inputBinding:
      position: 4
      prefix: "--excludeid"    
  mask:
    type: File
    inputBinding:
      position: 5
      prefix: --brainmask
      valueFrom: $(runtime.outdir + "/" + inputs.subname + "/mri/brainmask.mgz")
  norm:
    type: File
    inputBinding:
      position: 6
      prefix: --in
  in-intensity-name:
    type: string
    default: "norm"
    inputBinding:
      position: 7
      prefix: "--in-intensity-name"
  in-intensity-units:
    type: string
    default: "MR"
    inputBinding:
      position: 8
      prefix: "--in-intensity-units"
  subname:
    type: string
    inputBinding:
      position: 9
      prefix: "--subject"      
  surf-wm-vol:
    type: boolean
    default: true
    inputBinding:
      position: 10
      prefix: "--surf-wm-vol"
  wmparc_ctab:
    type: File
    inputBinding:
      position: 11
      prefix: --ctab
  etiv:
    type: boolean
    default: true
    inputBinding:
      position: 12
      prefix: "--etiv"
  talairach_xfm:
    type: File
  aseg_presurf:
    type: File
  aseg: 
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
