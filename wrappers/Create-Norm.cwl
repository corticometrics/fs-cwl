cwlVersion: v1.0
class: CommandLineTool
baseCommand: create_norm.py
# Runs the following commands, from a python script:
#    mri_binarize --i samseg --match 2 41 --erode 2 --o wm_mask.mgz
#    mri_segstats --id 1 --i orig_bias_corrected --seg wm_mask.mgz --avgwf wm_mask_mean.dat
#    wm_mean = `cat wm_mask_mean.dat`
#    scale = 110/wm_mean
#    mri_concat orig_bias_corrected --mul scale --o nu.mgz
#    mri_mask nu.mgz aseg_no_cc norm.mgz
#
# create_norm.py samseg orig_bias_corrected norm.mgz

requirements:
  - class: InlineJavascriptRequirement

inputs:
  samseg:
    type: File
    inputBinding:
      position: 1
  orig_bias_corrected:
    type: File
    inputBinding:
      position: 2
  output_filename:
    type: string
    default: norm.mgz
    inputBinding:
      position: 3

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/norm.mgz")
