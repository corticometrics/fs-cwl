cwlVersion: v1.0
class: CommandLineTool
baseCommand: mri_edit_wm_with_aseg
# mri_edit_wm_with_aseg -keep-in wm.seg.mgz brain.mgz aseg.presurf.mgz wm.asegedit.mgz

inputs:
  initial_wm:
    type: File
    inputBinding:
      prefix: -keep-in
      position: 1
  brain:
    type: File
    inputBinding:
      position: 2
  aseg_presurf:
    type: File
    inputBinding:
      position: 3
  output_filename:
    type: string
    default: "wm.asegedit.mgz"
    inputBinding:
      position: 4

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)