cwlVersion: v1.0
class: CommandLineTool
baseCommand: mris_make_surfaces
# mris_make_surfaces -orig_white white.preaparc -orig_pial white.preaparc -aseg ../mri/aseg.presurf -mgz -T1 brain.finalsurfs bert lh

# PW 2016/12/23:
#  mris_make_sufaces assumes the standard freesurfer directory structure
#  so call the cwl 'outdir' the freesurfer 'SUBJECTS_DIR' and stage
#  the input files accordingly
# PW 2017/01/03
#  It looks like -aseg and -T1 want the filname without the path and without
#  The .mgz at the end.  This is hard-coded for now.

requirements:
  - class: EnvVarRequirement
    envDef:
       SUBJECTS_DIR: $(runtime.outdir)
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.aseg_presurf)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/"   + "aseg.presurf.mgz")
    - entry: $(inputs.T1_file)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/"   + "brain.finalsurfs.mgz")
    - entry: $(inputs.wm)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/"   + "wm.mgz")
    - entry: $(inputs.filled)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/"   + "filled.mgz")
    - entry: $(inputs.surf_orig)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/"  + inputs.hemi + ".orig")
    - entry: $(inputs.orig_white)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/" + inputs.hemi + ".white.preaparc")
    - entry: $(inputs.aparc)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/label/" + inputs.hemi + ".aparc.annot")
    - entry: $(inputs.talairach_xfm)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/transforms/talairach.xfm")

inputs:
  orig_white:
    type: File
    inputBinding:
      prefix: -orig_white
      position: 1
      valueFrom: $("white.preaparc")
  orig_pial:
    type: File
    inputBinding:
      prefix: -orig_pial
      position: 2
      valueFrom: $("white.preaparc")
  aseg_presurf:
    type: File
    inputBinding:
      prefix: -aseg
      position: 3
      valueFrom: $("aseg.presurf")   
  mgz:
    type: boolean
    default: true
    inputBinding:
      position: 4
      prefix: -mgz
  T1_file:
    type: File
    inputBinding:
      prefix: -T1
      position: 5
      valueFrom: $("brain.finalsurfs") 
  subname:
    type: string
    inputBinding:
      position: 6
  hemi:
    type: string
    inputBinding:
      position: 7
  wm:
    type: File
  filled:
    type: File
  surf_orig:
    type: File
  aparc:
    type: File
  talairach_xfm:
    type: File


outputs:
  output_file_area_pial:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.subname + "/surf/" + inputs.hemi + ".area.pial")
  output_file_curv_pial:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.subname + "/surf/" + inputs.hemi + ".curv.pial")
  output_file_pial:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.subname + "/surf/" + inputs.hemi + ".pial")
  output_file_white:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.subname + "/surf/" + inputs.hemi + ".white")
  output_file_thickness:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.subname + "/surf/" + inputs.hemi + ".thickness")