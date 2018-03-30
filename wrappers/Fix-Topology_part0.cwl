cwlVersion: v1.0
class: CommandLineTool
baseCommand: mris_fix_topology
# mris_fix_topology -mgz -sphere qsphere.nofix -ga -seed 1234 bert rh

# PW 2016/12/23:
#  mris_fix_topology assumes the standard freesurfer directory structure
#  so call the cwl 'outdir' the freesurfer 'SUBJECTS_DIR' and stage
#  the input files accordingly

requirements:
  - class: EnvVarRequirement
    envDef:
       SUBJECTS_DIR: $(runtime.outdir)
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.qsphere)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/" + inputs.hemi + ".qsphere.nofix")
    - entry: $(inputs.brain)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/" + "brain.mgz")
    - entry: $(inputs.wm)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/" + "wm.mgz")
    - entry: $(inputs.surf_orig_with_topo_defects)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/" + inputs.hemi + ".orig")
    - entry: $(inputs.surf_inflated)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/" + inputs.hemi + ".inflated")

inputs:
  mgz:
    type: boolean
    default: true
    inputBinding:
      position: 1
      prefix: -mgz
  qsphere:
    type: File
    inputBinding:
      prefix: -sphere
      position: 2
      valueFrom: $("qsphere.nofix")
  ga:
    type: boolean
    default: true
    inputBinding:
      position: 3
      prefix: -ga
  seed:
    type: int
    default: 1234
    inputBinding:
      prefix: -seed
      position: 4
  subname:
    type: string
    inputBinding:
      position: 5   
  hemi:
    type: string
    inputBinding:
      position: 6
  brain:
    type: File
  wm:
    type: File
  surf_orig_with_topo_defects:
    type: File
  surf_inflated:
    type: File

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.subname + "/surf/" + inputs.hemi + ".orig")