cwlVersion: v1.0
class: CommandLineTool
baseCommand: mri_convert
# mri_convert -odt uchar --no_scale 1 $samsegdir/crispSegmentation.nii $mdir/aseg.auto_noCCseg.mgz

requirements:
  - class: InlineJavascriptRequirement

inputs:
  out_data_type:
    type: string
    default: uchar
    inputBinding:
      position: 1
      prefix: -odt
  no_scale:
    type: int
    default: 1
    inputBinding:
      position: 2
      prefix: --no_scale
  samseg:
    type: File
    inputBinding:
      position: 3
  output_filename:
    type: string
    default: aseg.auto_noCCseg.mgz
    inputBinding:
      position: 4

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.output_filename)
