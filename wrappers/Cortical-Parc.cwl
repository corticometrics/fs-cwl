cwlVersion: v1.0
class: CommandLineTool
baseCommand: mris_ca_label
# mris_ca_label -l ../label/${hemi}.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 bert ${hemi} ../surf/${hemi}.sphere.reg $FREESURFER_HOME/average/${hemi}.DKaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/${hemi}.aparc.annot
# mris_ca_label -l ../label/${hemi}.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 bert ${hemi} ../surf/${hemi}.sphere.reg $FREESURFER_HOME/average/${hemi}.CDaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/${hemi}.aparc.a2009s.annot
# mris_ca_label -l ../label/${hemi}.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 bert ${hemi} ../surf/${hemi}.sphere.reg $FREESURFER_HOME/average/${hemi}.DKTaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/${hemi}.aparc.DKTatlas.annot

# PW 2017/01/06: Stage cause of mris_write() quirk and because of assumed directory structure
requirements:
  - class: EnvVarRequirement
    envDef:
       SUBJECTS_DIR: $(runtime.outdir)
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.sphere_reg)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/"  + inputs.sphere_reg.basename)
    - entry: $(inputs.aseg_presurf)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/"       + inputs.aseg_presurf.basename)
    - entry: $(inputs.cortex)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/label/" + inputs.cortex.basename)
    - entry: $(inputs.smoothwm)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/"  + inputs.smoothwm.basename)
    - entry: $(inputs.sulc)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/" + inputs.hemi + ".sulc")

inputs:
  cortex:
    type: File
    inputBinding:
      position: 1
      valueFrom: $(runtime.outdir + "/" + inputs.subname + "/label/" + inputs.cortex.basename)
      prefix: -l
  aseg_presurf:
    type: File
    inputBinding:
      position: 2
      valueFrom: $(runtime.outdir + "/" + inputs.subname + "/" + inputs.aseg_presurf.basename)
      prefix: -aseg
  seed:
    type: int
    default: 1234
    inputBinding:
      position: 3
      prefix: -seed    
  subname:
    type: string
    inputBinding:
      position: 4
  hemi:
    type: string
    inputBinding:
      position: 5
  sphere_reg:
    type: File
    inputBinding:
      position: 6
      valueFrom: $(runtime.outdir + "/" + inputs.subname + "/surf/"  + inputs.sphere_reg.basename)
  atlas:
    type: File
    inputBinding:
      position: 7
  output_filename:
    type: string
    inputBinding:
      position: 8
  # PW 2017/01/06: Stealth file
  smoothwm:
    type: File
  sulc:
    type: File

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.subname + "/label/" + inputs.output_filename)