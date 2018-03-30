cwlVersion: v1.0
class: CommandLineTool
baseCommand: itkimage2segimage
# itkimage2segimage \
#      --inputDICOMDirectory /home/paul/cmet/for-mccoy/packaged/input-anon \
#      --outputDICOM /home/paul/cmet/for-mccoy/packaged/aseg-rawavg.dcm \
#      --inputMetadata /home/paul/cmet/for-mccoy/temp/fs-aseg.json \
#      --inputImageList /home/paul/cmet/for-mccoy/temp/aseg-rawavg.nii.gz

requirements:
  - class: InlineJavascriptRequirement

inputs:
  input_dicom:
    type: Directory
    inputBinding:
      prefix: --inputDICOMDirectory
      position: 1
  output_filename:
    type: string
    inputBinding:
      prefix: --outputDICOM
      position: 2
  input_metadata:
    type: File
    inputBinding:
      prefix: --inputMetadata
      position: 3 
  input_image:
    type: File
    inputBinding:
      prefix: --inputImageList
      position: 4 

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.output_filename)