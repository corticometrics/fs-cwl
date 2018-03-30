cwlVersion: v1.0
class: CommandLineTool
baseCommand: run_samseg
# run_samseg --o outdir --threads 8 --i path/to/mri/orig.mgz

requirements:
  - class: EnvVarRequirement
    envDef:
       LD_LIBRARY_PATH: /opt/mcr/v92/runtime/glnxa64:/opt/mcr/v92/bin/glnxa64:/opt/mcr/v92/sys/os/glnxa64:/opt/gems:/opt/itk_4.9.1_build/lib:/usr/lib/libstdc++.so.6:/opt/mcr/v92/sys/java/jre/glnxa64/jre/lib/amd64/native_threads:/opt/mcr/v92/sys/java/jre/glnxa64/jre/lib/amd64/server:/opt/mcr/v92/sys/java/jre/glnxa64/jre/lib/amd64
  - class: InlineJavascriptRequirement

inputs:
  output_dir:
    type: string
    default: .
    inputBinding:
      position: 1
      prefix: --o
  threads:
    type: int
    default: 16
    inputBinding:
      position: 2
      prefix: --threads
  orig:
    type: File
    inputBinding:
      position: 3
      prefix: --i

outputs:
  output_file_seg:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/crispSegmentation.nii")
  output_file_bias_corrected:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/orig_biasCorrected.nii")
  output_file_talairach:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/samseg.talairach.lta")
