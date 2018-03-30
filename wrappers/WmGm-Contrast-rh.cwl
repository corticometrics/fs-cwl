cwlVersion: v1.0
class: CommandLineTool
baseCommand: pctsurfcon
# pctsurfcon --s bert --rh-only

requirements:
  - class: EnvVarRequirement
    envDef:
       SUBJECTS_DIR: $(runtime.outdir)
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.orig)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/orig.mgz")
    - entry: $(inputs.rawavg)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/rawavg.mgz")
    - entry: $(inputs.aparc)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/label/" + "rh.aparc.annot")
    - entry: $(inputs.cortex)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/label/" + "rh.cortex.label")
    - entry: $(inputs.surf_white)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/" + "rh.white")
    - entry: $(inputs.thickness)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/" + "rh.thickness")
    - entry: "scriptsdir"
      entryname: $(runtime.outdir + "/" + inputs.subname + "/scripts/pctsurfcon.log.touch")
    - entry: "statsdir"
      entryname: $(runtime.outdir + "/" + inputs.subname + "/stats/pctsurfcon.stats.touch")

inputs:
  subname:
    type: string
    inputBinding:
      position: 1
      prefix: --s
  rh_only:
    type: boolean
    default: true
    inputBinding:
      position: 2
      prefix: --rh-only      
  orig:
    type: File
  rawavg:
    type: File
  aparc:
    type: File
  cortex:
    type: File
  surf_white:
    type: File
  thickness:
    type: File

outputs:
  output_file_mgh:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.subname + "/surf/rh.w-g.pct.mgh")
  output_file_stats:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.subname + "/stats/rh.w-g.pct.stats")
  output_file_log:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.subname + "/scripts/pctsurfcon.log")