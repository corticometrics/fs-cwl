cwlVersion: v1.0
class: CommandLineTool
baseCommand: mris_jacobian
# mris_jacobian ../surf/lh.white.preaparc ../surf/lh.sphere.reg ../surf/lh.jacobian_white

# PW 2017/01/05: Stage cause of mris_write() quirk
requirements:
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.white_preaparc)
      entryname: $(runtime.outdir + "/" + inputs.white_preaparc.basename)
    - entry: $(inputs.sphere_reg)
      entryname: $(runtime.outdir + "/" + inputs.sphere_reg.basename)

inputs:
  white_preaparc:
    type: File
    inputBinding:
      position: 1
      valueFrom: $(runtime.outdir + "/" + inputs.white_preaparc.basename)
  sphere_reg:
    type: File
    inputBinding:
      position: 2
      valueFrom: $(runtime.outdir + "/" + inputs.sphere_reg.basename)
  output_filename:
    type: string
    default: ""
    inputBinding:
      position: 3
      valueFrom: $(inputs.hemi + ".jacobian_white")
  hemi:
    type: string

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(inputs.hemi + ".jacobian_white")