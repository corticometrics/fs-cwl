cwlVersion: v1.0
class: CommandLineTool
baseCommand: mri_annotation2label
# mri_annotation2label --subject <sub> --hemi <hemi> --lobesStrict aparc.lobes

requirements:
  - class: EnvVarRequirement
    envDef:
       SUBJECTS_DIR: $(runtime.outdir)
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.annot)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/label/" + inputs.hemi + "." + inputs.annot_basename)
    - entry: $(inputs.surf_lh_white)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/lh.white")
    - entry: $(inputs.surf_rh_white)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/rh.white")

inputs:
  subname:
    type: string
    inputBinding:
      prefix: --subject
      position: 1
  hemi:
    type: string
    inputBinding:
      prefix: --hemi
      position: 2
  lobe_definition:
    type: boolean
    default: true
    inputBinding:
      prefix: --lobesStrict
      position: 3
  output_filename:
    type: string
    inputBinding:
      position: 4
  annot:
    type: File
  annot_basename:
    type: string
  surf_lh_white:
    type: File
  surf_rh_white:
    type: File


outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.subname + "/label/" + inputs.output_filename)