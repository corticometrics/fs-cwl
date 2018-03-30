cwlVersion: v1.0
class: CommandLineTool
baseCommand: mris_remove_intersection
# mris_remove_intersection ../surf/lh.orig ../surf/lh.orig

# PW 2016/12/23:
#  mris_remove_intersection calls mris_write() to write the ouput file.  
#  mris_write() writes the output file to the same directory as the input file 
#  and not to pwd.  We therefore need to stage the input file into the output 
#  dir so we can glob the output

requirements:
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.surf_orig_with_intersections)
      entryname: $(runtime.outdir + "/" + inputs.surf_orig_with_intersections.basename)

inputs:
  surf_orig_with_intersections:
    type: File
    inputBinding:
      position: 1
      valueFrom: $(runtime.outdir + "/" + inputs.surf_orig_with_intersections.basename)
  output_filename:
    type: string
    default: ""
    inputBinding:
      position: 2
      valueFrom: $(runtime.outdir + "/" + inputs.hemi + ".orig")
  hemi:
    type: string

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.hemi + ".orig")