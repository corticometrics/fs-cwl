cwlVersion: v1.0
class: CommandLineTool
baseCommand: mrisp_paint
# mrisp_paint -a 5 $FREESURFER_HOME/average/lh.folding.atlas.acfb40.noaparc.i12.2016-08-02.tif#6 ../surf/lh.sphere.reg ../surf/lh.avg_curv

# PW 2017/01/06: Stage cause of mris_write() quirk
requirements:
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.sphere_reg)
      entryname: $(runtime.outdir + "/" + inputs.sphere_reg.basename)

inputs:
  averages:
    type: int
    default: 5
    inputBinding:
      position: 1
      prefix: -a 
  folding_atlas:
    type: File
    inputBinding:
      position: 2
      valueFrom: $(inputs.folding_atlas.path + "#6")
  sphere_reg:
    type: File
    inputBinding:
      position: 3
      valueFrom: $(runtime.outdir + "/" + inputs.sphere_reg.basename)
  output_filename:
    type: string
    default: ""
    inputBinding:
      position: 4
      valueFrom: $(inputs.hemi + ".avg_curv")
  hemi:
    type: string
  
outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(inputs.hemi + ".avg_curv")
      