cwlVersion: v1.0
class: CommandLineTool
baseCommand: mris_anatomical_stats
# mris_anatomical_stats -th3 -mgz -cortex ../label/${hemi}.cortex.label -f ../stats/${hemi}.aparc.stats -b -a ../label/${hemi}.aparc.annot -c ../label/aparc.annot.ctab bert ${hemi} ${surf_type}
# mris_anatomical_stats -th3 -mgz -cortex ../label/lh.cortex.label -f ../stats/lh.aparc.pial.stats -b -a ../label/lh.aparc.annot -c ../label/aparc.annot.ctab bert lh pial
# mris_anatomical_stats -th3 -mgz -cortex ../label/${hemi}.cortex.label -f ../stats/${hemi}.aparc.a2009s.stats -b -a ../label/${hemi}.aparc.a2009s.annot -c ../label/aparc.annot.a2009s.ctab bert ${hemi} ${surf_type}
# mris_anatomical_stats -th3 -mgz -cortex ../label/${hemi}.cortex.label -f ../stats/${hemi}.aparc.DKTatlas.stats -b -a ../label/${hemi}.aparc.DKTatlas.annot -c ../label/aparc.annot.DKTatlas.ctab bert ${hemi} ${surf_type}

requirements:
  - class: EnvVarRequirement
    envDef:
       SUBJECTS_DIR: $(runtime.outdir)
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.cortex)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/label/" + inputs.hemi + ".cortex.label")
    - entry: $(inputs.annot)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/label/" + inputs.hemi + "." + inputs.annot_basename)
    - entry: $(inputs.mask)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/brainmask.mgz")
    - entry: $(inputs.aseg_presurf)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/aseg.presurf.mgz")
    - entry: $(inputs.talairach_xfm)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/transforms/talairach.xfm")
    - entry: $(inputs.ribbon)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/ribbon.mgz")
    - entry: $(inputs.wm)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/wm.mgz")
    - entry: $(inputs.thickness)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/" + inputs.hemi + ".thickness")
    - entry: $(inputs.surf_lh_white)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/lh.white")
    - entry: $(inputs.surf_rh_white)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/rh.white")
    - entry: $(inputs.surf_lh_pial)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/lh.pial")
    - entry: $(inputs.surf_rh_pial)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/rh.pial")

inputs:
  th3:
    type: boolean
    default: true
    inputBinding:
      prefix: -th3
      position: 1 
  mgz:
    type: boolean
    default: true
    inputBinding:
      prefix: -mgz
      position: 2 
  cortex:
    type: File
    inputBinding:
      prefix: -cortex
      position: 3
      valueFrom: $(runtime.outdir + "/" + inputs.subname + "/label/" + inputs.hemi + ".cortex.label")
  stats_filename:
    type: string
    inputBinding:
      prefix: -f
      position: 4
      valueFrom: $(inputs.hemi + "." + inputs.stats_filename)
  tabular_output:
    type: boolean
    default: true
    inputBinding:
      prefix: -b
      position: 5 
  annot:
    type: File
    inputBinding:
      prefix: -a
      position: 6
      valueFrom: $(runtime.outdir + "/" + inputs.subname + "/label/" + inputs.hemi + "." + inputs.annot_basename)
  ctab_filename:
    type: string
    inputBinding:
      prefix: -c
      position: 7
  subname:
    type: string
    inputBinding:
      position: 8
  hemi:
    type: string
    inputBinding:
      position: 9
  surf_type:
    type: string
    inputBinding: 
      position: 10
  annot_basename:
    type: string
  mask:
    type: File
  aseg_presurf:
    type: File
  talairach_xfm:
    type: File
  ribbon:
    type: File
  wm:
    type: File
  thickness:
    type: File
  surf_lh_white:
    type: File
  surf_rh_white:
    type: File
  surf_lh_pial:
    type: File
  surf_rh_pial:
    type: File

outputs:
  output_file_stats:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.hemi + "." + inputs.stats_filename)
  output_file_ctab:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.ctab_filename)