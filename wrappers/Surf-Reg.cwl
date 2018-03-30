cwlVersion: v1.0
class: CommandLineTool
baseCommand: mris_register
# mris_register -curv ../surf/lh.sphere $FREESURFER_HOME/average/lh.folding.atlas.acfb40.noaparc.i12.2016-08-02.tif ../surf/lh.sphere.reg

# PW 2017/01/05: Stealth input file (smoothwm, sulc) requires staging
requirements:
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.sphere)
      entryname: $(runtime.outdir + "/" + inputs.sphere.basename)
    - entry: $(inputs.smoothwm)
      entryname: $(runtime.outdir + "/" + inputs.smoothwm.basename)
    - entry: $(inputs.sulc)
      entryname: $(runtime.outdir + "/" + inputs.sulc.basename)

inputs:
  curv:
    type: boolean
    default: true
    inputBinding:
      position: 1
      prefix: -curv
  sphere:
    type: File
    inputBinding:
      position: 2
      valueFrom: $(runtime.outdir + "/" + inputs.sphere.basename)    
  folding_atlas:
    type: File
    inputBinding:
      position: 3
  output_filename:
    type: string
    default: ""
    inputBinding:
      position: 4
      valueFrom: $(inputs.hemi + ".sphere.reg")
  smoothwm:
    type: File
  sulc:
    type: File
  hemi:
    type: string

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(inputs.hemi + ".sphere.reg")