cwlVersion: v1.0
class: CommandLineTool
baseCommand: mri_convert 

# mri_convert $SUBJECTS_DIR/bert/mri/rawavg.mgz $SUBJECTS_DIR/bert/mri/orig.mgz --conform

inputs:
  rawavg:
    type: File
    inputBinding:
      position: 1
  output_filename:
    type: string
    default: "orig.mgz"
    inputBinding:
      position: 2
  conform:
    type: boolean
    default: true
    inputBinding:
      prefix: --conform
      position: 3

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)