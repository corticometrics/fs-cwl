cwlVersion: v1.0
class: CommandLineTool
baseCommand: mris_make_surfaces
# mris_make_surfaces -aseg ../mri/aseg.presurf -white white.preaparc -noaparc -whiteonly -mgz -T1 brain.finalsurfs bert lh

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
    - entry: "labeldir"
      entryname: $(runtime.outdir + "/" + inputs.subname + "/label/labeldir.touch")
    - entry: $(inputs.talairach_xfm)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/transforms/talairach.xfm")

inputs:
  aseg_presurf:
    type: File
    inputBinding:
      prefix: -aseg
      position: 1
      valueFrom: $("aseg.presurf")   
  white_filename:
    type: string
    default: white.preaparc
    inputBinding:
      prefix: -white
      position: 2
  noaparc:
    type: boolean
    default: true
    inputBinding:
      prefix: -noaparc
      position: 3
  whiteonly:
    type: boolean
    default: true
    inputBinding:
      prefix: -whiteonly
      position: 4
  mgz:
    type: boolean
    default: true
    inputBinding:
      position: 5
      prefix: -mgz
  T1_file:
    type: File
    inputBinding:
      prefix: -T1
      position: 6
      valueFrom: $("brain.finalsurfs") 
  subname:
    type: string
    inputBinding:
      position: 7
  hemi:
    type: string
    inputBinding:
      position: 8
  wm:
    type: File
  filled:
    type: File
  surf_orig:
    type: File
  talairach_xfm:
    type: File

outputs:
  output_file_area:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.subname + "/surf/" + inputs.hemi + ".area")
  output_file_curv:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.subname + "/surf/" + inputs.hemi + ".curv")
  output_file_white_preaparc:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.subname + "/surf/" + inputs.hemi + "." + inputs.white_filename)
  output_file_cortex:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.subname + "/label/" + inputs.hemi + ".cortex.label")