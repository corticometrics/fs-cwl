cwlVersion: v1.0
class: CommandLineTool
baseCommand: vertexvol
# vertexvol --s bert --lh --th3

# PW 2017/01/08:
#  mris_volmask assumes the standard freesurfer directory structure
#  so call the cwl 'outdir' the freesurfer 'SUBJECTS_DIR' and stage
#  the input files accordingly
requirements:
  - class: EnvVarRequirement
    envDef:
       SUBJECTS_DIR: $(runtime.outdir)
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.surf_white)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/" +  inputs.hemi + ".white")
    - entry: $(inputs.surf_pial)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/" + inputs.hemi + ".pial")
    - entry: $(inputs.area)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/" + inputs.hemi + ".area")
    - entry: $(inputs.area_pial)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/" + inputs.hemi + ".area.pial")
    - entry: $(inputs.cortex)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/label/" + inputs.cortex.basename)

inputs:
  subname:
    type: string
    inputBinding:
      position: 1
      prefix: --s
  hemi:
    type: string
    inputBinding:
      position: 2
      separate: false
      prefix: --
  th3:
    type: boolean
    default: true
    inputBinding:
      position: 3
      prefix: --th3
  cortex:
    type: File
  surf_white:
    type: File
  surf_pial:
    type: File
  area:
    type: File
  area_pial:
    type: File

outputs:
  output_file_volume:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.subname + "/surf/" + inputs.hemi + ".volume")
  output_file_area_mid:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" +  inputs.subname + "/surf/" + inputs.hemi + ".area.mid")