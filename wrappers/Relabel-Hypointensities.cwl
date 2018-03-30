cwlVersion: v1.0
class: CommandLineTool
baseCommand: mri_relabel_hypointensities
# mri_relabel_hypointensities aseg.presurf.mgz ../surf aseg.presurf.hypos.mgz
requirements:
  - class: EnvVarRequirement
    envDef:
       SUBJECTS_DIR: $(runtime.outdir)
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.lh_white)
      entryname: $(runtime.outdir + "/" + inputs.surf_dir + "/lh.white")
    - entry: $(inputs.rh_white)
      entryname: $(runtime.outdir + "/" + inputs.surf_dir + "/rh.white")

inputs:
  aseg_presurf:
    type: File
    inputBinding:
      position: 1
  surf_dir:
    type: string
    default: "."
    inputBinding:
      position: 2    
  output_filename:
    type: string
    default: "aseg.presurf.hypos.mgz"
    inputBinding:
      position: 3
  lh_white:
    type: File
  rh_white:
    type: File

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)