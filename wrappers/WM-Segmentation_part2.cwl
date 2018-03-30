cwlVersion: v1.0
class: CommandLineTool
baseCommand: mri_pretess
# mri_pretess wm.asegedit.mgz wm norm.mgz wm.mgz

inputs:
  aseg_edit_wm:
    type: File
    inputBinding:
      position: 1
  labelstring:
    type: string
    default: "wm"
    inputBinding:
      position: 2
  norm:
    type: File
    inputBinding:
      position: 3
  output_filename:
    type: string
    default: "wm.mgz"
    inputBinding:
      position: 4

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)