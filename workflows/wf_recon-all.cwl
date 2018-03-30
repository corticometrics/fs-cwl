cwlVersion: v1.0
class: Workflow

inputs:
  ## Most parameters are set to default to usual value in cwl files
  #  hard-coded paths to files (atlases, lookup tables, etc)
  aseg_atlas_with_skull: File
  aseg_atlas: File
  folding_atlas_lh: File
  folding_atlas_rh: File
  aparc_atlas_lh: File
  aparc_atlas_rh: File
  a2009s_atlas_lh: File
  a2009s_atlas_rh: File
  dkt_atlas_lh: File
  dkt_atlas_rh: File
  aseg_ctab: File
  wmparc_ctab: File

  ## Main variables used frequently
  #  initial input
  input_image: File
  dicom_input: Directory
  input_metadata: File
  # subject name
  subject: string
  # hemis
  lh: string
  rh: string
  white: string
  pial: string

  ## Values not set by default in cwl files
  #  Fix-Topology-Copy
  lh_orig_nofix_copy: string
  lh_inflated_nofix_copy: string
  rh_orig_nofix_copy: string
  rh_inflated_nofix_copy: string
  # Cortical-Parc-aparc
  lh_aparc_annot: string
  rh_aparc_annot: string
  #  Cortical-Parc-Lobes
  lh_aparc_lobes_annot: string
  rh_aparc_lobes_annot: string
  # Cortical-Parc-a2009s
  lh_aparc_a2009s_annot: string
  rh_aparc_a2009s_annot: string
  # Cortical-Parc-DKTatlas
  lh_aparc_DKTatlas_annot: string
  rh_aparc_DKTatlas_annot: string
  # Parcellation-Stats-aparc
  aparc_stats: string
  aparc_annot: string
  aparc_ctab: string
  # Parcellation-Stats-pial
  aparc_pial_stats: string
  #  Parcellation-Stats_lobes
  aparc_lobes_stats: string
  aparc_lobes_annot: string
  aparc_lobes_ctab: string
  # Parcellation-Stats-a2009s
  aparc_a2009s_stats: string
  aparc_a2009s_annot: string
  aparc_a2009s_ctab: string
  # Parcellation-Stats-DKTatlas
  aparc_DKT_stats: string
  aparc_DKT_annot: string
  aparc_DKT_ctab: string
  # Aseg-to-DICOM_part0
  aseg_rawavg: string
  # Aseg-to-DICOM_part1
  aseg_dicom: string
  # AParcAseg-aparc-to-DICOM_part0
  aparc_aseg_rawavg: string
  # AParcAseg-aparc-to-DICOM_part1
  aparc_aseg_dicom: string
  # AParcLobesAseg-to-DICOM_part0
  aparc_lobes_aseg_rawavg: string
  # AParcLobesAseg-to-DICOM_part1
  aparc_lobes_aseg_dicom: string


outputs:
  # Stats
  aseg_stats_output:
    type: File
    outputSource: ASeg-Stats/output_file
  lh_aparc_stats_output:
    type: File
    outputSource: Parcellation-Stats-aparc-lh/output_file_stats
  lh_aparc_a2009s_stats_output:
    type: File
    outputSource: Parcellation-Stats-a2009s-lh/output_file_stats
  lh_aparc_DKT_stats_output:
    type: File
    outputSource: Parcellation-Stats-DKTatlas-lh/output_file_stats
  lh_lobes_stats_output:
    type: File
    outputSource: Parcellation-Stats-lobes-lh/output_file_stats
  rh_aparc_stats_output:
    type: File
    outputSource: Parcellation-Stats-aparc-rh/output_file_stats
  rh_aparc_a2009s_stats_output:
    type: File
    outputSource: Parcellation-Stats-a2009s-rh/output_file_stats
  rh_aparc_DKT_stats_output:
    type: File
    outputSource: Parcellation-Stats-DKTatlas-rh/output_file_stats
  rh_lobes_stats_output:
    type: File
    outputSource: Parcellation-Stats-lobes-rh/output_file_stats
  wmparc_stats_output:
    type: File
    outputSource: WMParc_part1/output_file
  # Volumes
  aseg_output:
    type: File
    outputSource: APas-to-ASeg/output_file
  aparc_aseg_output:
    type: File
    outputSource: AParc-to-ASeg-aparc/output_file
  aparc_a2009s_plus_aseg_output:
    type: File
    outputSource: AParc-to-ASeg-a2009s/output_file
  aparc_DKT_plus_aseg_output:
    type: File
    outputSource: AParc-to-ASeg-DKTatlas/output_file
  lobes_aseg_output:
    type: File
    outputSource: AParc-to-ASeg-lobes/output_file
  wmparc_output:
    type: File
    outputSource: WMParc_part0/output_file
  brainmask_output:
    type: File
    outputSource: Skull-Stripping_part1/output_file
  wm_output:
    type: File
    outputSource:  WM-Segmentation_part2/output_file
  orig_output:
    type: File
    outputSource: Conform/output_file
  T1_output:
    type: File
    outputSource: Intensity-Normalization/output_file
  ribbon_output:
    type: File
    outputSource: Cortical-ribbon-mask/output_file_ribbon
  # Surfs
  lh_white_output:
    type: File
    outputSource: Make-Pial-Surf-lh/output_file_white
  rh_white_output:
    type: File
    outputSource: Make-Pial-Surf-rh/output_file_white
  lh_pial_output:
    type: File
    outputSource: Make-Pial-Surf-lh/output_file_pial
  rh_pial_output:
    type: File
    outputSource: Make-Pial-Surf-rh/output_file_pial
  # Annotations
  lh_aparc_annot_output:
    type: File
    outputSource: Cortical-Parc-aparc-lh/output_file
  rh_aparc_annot_output:
    type: File
    outputSource: Cortical-Parc-aparc-rh/output_file
  lh_lobes_annot_output:
    type: File
    outputSource: Cortical-Parc-lobes-lh/output_file
  rh_lobes_annot_output:
    type: File
    outputSource: Cortical-Parc-lobes-rh/output_file
  # DICOM outputs
  aseg_dicom_output:
    type: File
    outputSource: Aseg-to-DICOM_part1/output_file
  aparc_aseg_dicom_output:
    type: File
    outputSource: AParcAseg-aparc-to-DICOM_part1/output_file
  lobes_aseg_dicom_output:
    type: File
    outputSource: AParcLobesAseg-to-DICOM_part1/output_file


steps:
  Conform:
    run: Conform.cwl
    in:
      rawavg: input_image
    out: [output_file]

  Talairach_part0:
    run: Talairach_part0.cwl
    in:
      orig: Conform/output_file
    out: [output_file]
  Talairach_part1:
    run: Talairach_part1.cwl
    in:
      orig_nu: Talairach_part0/output_file
    out: [output_file]

  Talairach-Failure-Detection:
    run: Talairach-Failure-Detection.cwl
    in:
      talairach_xfm: Talairach_part1/output_file
    out: []

  Nu-Intensity-Correction_part0:
    run: Nu-Intensity-Correction_part0.cwl
    in:
      orig: Conform/output_file
      uchar: Talairach_part1/output_file
    out: [output_file]

  Nu-Intensity-Correction_part1:
    run: Nu-Intensity-Correction_part1.cwl
    in:
      talairach_xfm: Talairach_part1/output_file
      nu_no-tal: Nu-Intensity-Correction_part0/output_file
      subname: subject
    out: [output_file]

  Intensity-Normalization:
    run: Intensity-Normalization.cwl
    in:
      nu: Nu-Intensity-Correction_part1/output_file
      talairach_xfm: Talairach_part1/output_file
      subname: subject
    out: [output_file]

  Skull-Stripping_part0:
    run: Skull-Stripping_part0.cwl
    in:
      nu: Nu-Intensity-Correction_part1/output_file
      aseg_atlas_with_skull: aseg_atlas_with_skull
    out: [output_file]
  Skull-Stripping_part1:
    run: Skull-Stripping_part1.cwl
    in:
      talairach_with_skull: Skull-Stripping_part0/output_file
      T1: Intensity-Normalization/output_file
      aseg_atlas_with_skull: aseg_atlas_with_skull
    out: [output_file]

  EM-Registration:
    run: EM-Registration.cwl
    in:
      mask: Skull-Stripping_part1/output_file
      nu: Nu-Intensity-Correction_part1/output_file
      aseg_atlas: aseg_atlas
    out: [output_file]

  CA-Normalize:
    run: CA-Normalize.cwl
    in:
      mask: Skull-Stripping_part1/output_file
      nu: Nu-Intensity-Correction_part1/output_file
      aseg_atlas: aseg_atlas
      talairach_lta: EM-Registration/output_file
    out: [output_file, control_points_file]

  CA-Reg:
    run: CA-Reg.cwl
    in:
      talairach_lta: EM-Registration/output_file
      mask: Skull-Stripping_part1/output_file
      norm: CA-Normalize/output_file
      aseg_atlas: aseg_atlas
    out: [output_file]

  SubCort-Seg_part0:
    run: SubCort-Seg_part0.cwl
    in:
      norm: CA-Normalize/output_file
      talairach_m3z: CA-Reg/output_file
      aseg_atlas: aseg_atlas
    out: [output_file, label_intensities_file]
  SubCort-Seg_part1:
    run: SubCort-Seg_part1.cwl
    in:
      aseg_no_cc: SubCort-Seg_part0/output_file
      subname: subject
      norm: CA-Normalize/output_file
    out: [output_file]

  Intensity-Normalization2:
    run: Intensity-Normalization2.cwl
    in:
      aseg_presurf: SubCort-Seg_part1/output_file
      mask: Skull-Stripping_part1/output_file
      norm: CA-Normalize/output_file
    out: [output_file]

  Mask-BFS:
    run: Mask-BFS.cwl
    in:
      brain: Intensity-Normalization2/output_file
      mask: Skull-Stripping_part1/output_file
    out: [output_file]

  WM-Segmentation_part0:
    run: WM-Segmentation_part0.cwl
    in:
      brain: Intensity-Normalization2/output_file
    out: [output_file]
  WM-Segmentation_part1:
    run: WM-Segmentation_part1.cwl
    in:
      initial_wm: WM-Segmentation_part0/output_file
      brain: Intensity-Normalization2/output_file
      aseg_presurf: SubCort-Seg_part1/output_file
    out: [output_file]
  WM-Segmentation_part2:
    run: WM-Segmentation_part2.cwl
    in:
      aseg_edit_wm: WM-Segmentation_part1/output_file
      norm: CA-Normalize/output_file
    out: [output_file]   

  Fill:
    run: Fill.cwl
    in:
      talairach_lta: EM-Registration/output_file
      aseg_no_cc: SubCort-Seg_part0/output_file
      wm: WM-Segmentation_part2/output_file
    out: [output_file]

  Tessellate-lh_part0:
    run: Tessellate-lh_part0.cwl
    in:
      filled: Fill/output_file
      norm: CA-Normalize/output_file
    out: [output_file]
  Tessellate-lh_part1:
    run: Tessellate-lh_part1.cwl
    in:
      filled_pretess: Tessellate-lh_part0/output_file
    out: [output_file]
  Tessellate-lh_part2:
    run: Tessellate-lh_part2.cwl
    in:
      orig_nofix_preextract: Tessellate-lh_part1/output_file
    out: [output_file]

  Tessellate-rh_part0:
    run: Tessellate-rh_part0.cwl
    in:
      filled: Fill/output_file
      norm: CA-Normalize/output_file
    out: [output_file]
  Tessellate-rh_part1:
    run: Tessellate-rh_part1.cwl
    in:
      filled_pretess: Tessellate-rh_part0/output_file
    out: [output_file]
  Tessellate-rh_part2:
    run: Tessellate-rh_part2.cwl
    in:
      orig_nofix_preextract: Tessellate-rh_part1/output_file
    out: [output_file]

  Smooth1-lh:
    run: Smooth1.cwl
    in:
      orig_nofix: Tessellate-lh_part2/output_file
      hemi: lh
    out: [output_file]

  Smooth1-rh:
    run: Smooth1.cwl
    in:
      orig_nofix: Tessellate-rh_part2/output_file
      hemi: rh
    out: [output_file]

  Inflation1-lh:
    run: Inflation1.cwl
    in:
      smoothwm_nofix: Smooth1-lh/output_file
      hemi: lh
    out: [output_file]

  Inflation1-rh:
    run: Inflation1.cwl
    in:
      smoothwm_nofix: Smooth1-rh/output_file
      hemi: rh
    out: [output_file]

  QSphere-lh:
    run: QSphere.cwl
    in:
      inflated_nofix: Inflation1-lh/output_file
      hemi: lh
    out: [output_file]

  QSphere-rh:
    run: QSphere.cwl
    in:
      inflated_nofix: Inflation1-rh/output_file
      hemi: rh
    out: [output_file]

  Fix-Topology-Copy-lh_part0:
    run: Fix-Topology-Copy.cwl
    in:
      input_file: Tessellate-lh_part2/output_file
      output_filename: lh_orig_nofix_copy
    out: [output_file]
  Fix-Topology-Copy-lh_part1:
    run: Fix-Topology-Copy.cwl
    in:
      input_file: Inflation1-lh/output_file
      output_filename: lh_inflated_nofix_copy
    out: [output_file]

  Fix-Topology-Copy-rh_part0:
    run: Fix-Topology-Copy.cwl
    in:
      input_file: Tessellate-rh_part2/output_file
      output_filename: rh_orig_nofix_copy
    out: [output_file]
  Fix-Topology-Copy-rh_part1:
    run: Fix-Topology-Copy.cwl
    in:
      input_file: Inflation1-rh/output_file
      output_filename: rh_inflated_nofix_copy
    out: [output_file]

  Fix-Topology-lh_part0:
    run: Fix-Topology_part0.cwl
    in:
      qsphere: QSphere-lh/output_file
      subname: subject
      hemi: lh
      brain: Intensity-Normalization2/output_file
      wm: WM-Segmentation_part2/output_file
      surf_orig_with_topo_defects: Fix-Topology-Copy-lh_part0/output_file
      surf_inflated: Fix-Topology-Copy-lh_part1/output_file
    out: [output_file]
  Fix-Topology-lh_part1:
    run: Fix-Topology_part1.cwl
    in:
      surf_orig_with_intersections: Fix-Topology-lh_part0/output_file
      hemi: lh  
    out: [output_file]    

  Fix-Topology-rh_part0:
    run: Fix-Topology_part0.cwl
    in:
      qsphere: QSphere-rh/output_file
      subname: subject
      hemi: rh
      brain: Intensity-Normalization2/output_file
      wm: WM-Segmentation_part2/output_file
      surf_orig_with_topo_defects:  Fix-Topology-Copy-rh_part0/output_file
      surf_inflated: Fix-Topology-Copy-rh_part1/output_file    
    out: [output_file]
  Fix-Topology-rh_part1:
    run: Fix-Topology_part1.cwl
    in:
      surf_orig_with_intersections: Fix-Topology-rh_part0/output_file
      hemi: rh
    out: [output_file]    

  Make-White-Surf-lh:
    run: Make-White-Surf.cwl
    in:
      aseg_presurf: SubCort-Seg_part1/output_file
      T1_file: Mask-BFS/output_file
      subname: subject
      hemi: lh
      wm: WM-Segmentation_part2/output_file
      filled: Fill/output_file
      surf_orig: Fix-Topology-lh_part1/output_file
      talairach_xfm: Talairach_part1/output_file
    out: [output_file_area, output_file_curv, output_file_white_preaparc, output_file_cortex]

  Make-White-Surf-rh:
    run: Make-White-Surf.cwl
    in:
      aseg_presurf: SubCort-Seg_part1/output_file
      T1_file: Mask-BFS/output_file
      subname: subject
      hemi: rh
      wm: WM-Segmentation_part2/output_file
      filled: Fill/output_file
      surf_orig: Fix-Topology-rh_part1/output_file
      talairach_xfm: Talairach_part1/output_file
    out: [output_file_area, output_file_curv, output_file_white_preaparc, output_file_cortex]

  Smooth2-lh:
    run: Smooth2.cwl
    in:
      white_preaparc: Make-White-Surf-lh/output_file_white_preaparc
      hemi: lh
    out: [output_file]

  Smooth2-rh:
    run: Smooth2.cwl
    in:
      white_preaparc: Make-White-Surf-rh/output_file_white_preaparc
      hemi: rh
    out: [output_file]

  Inflation2-lh:
    run: Inflation2.cwl
    in:
      smoothwm: Smooth2-lh/output_file
      hemi: lh
    out: [output_file_inflated, output_file_sulc]

  Inflation2-rh:
    run: Inflation2.cwl
    in:
      smoothwm: Smooth2-rh/output_file
      hemi: rh
    out: [output_file_inflated, output_file_sulc]

  Curv-.H-and-.K-lh_part0:
    run: Curv-.H-and-.K_part0.cwl
    in:
      white_preaparc: Make-White-Surf-lh/output_file_white_preaparc
    out: [output_file_H, output_file_K]
  Curv-.H-and-.K-lh_part1:
    run: Curv-.H-and-.K_part1.cwl
    in:
      inflated: Inflation2-lh/output_file_inflated
    out: [output_file_H, output_file_K]

  Curv-.H-and-.K-rh_part0:
    run: Curv-.H-and-.K_part0.cwl
    in:
      white_preaparc: Make-White-Surf-rh/output_file_white_preaparc
    out: [output_file_H, output_file_K]
  Curv-.H-and-.K-rh_part1:
    run: Curv-.H-and-.K_part1.cwl
    in:
      inflated: Inflation2-rh/output_file_inflated
    out: [output_file_H, output_file_K]

  Sphere-lh:
    run: Sphere.cwl
    in:
      inflated: Inflation2-lh/output_file_inflated
      smoothwm: Smooth2-lh/output_file
      hemi: lh
    out: [output_file]

  Sphere-rh:
    run: Sphere.cwl
    in:
      inflated: Inflation2-rh/output_file_inflated
      smoothwm: Smooth2-rh/output_file
      hemi: rh
    out: [output_file]

  Surf-Reg-lh:
    run: Surf-Reg.cwl
    in:
      sphere: Sphere-lh/output_file
      folding_atlas: folding_atlas_lh
      smoothwm: Smooth2-lh/output_file
      sulc: Inflation2-lh/output_file_sulc
      hemi: lh
    out: [output_file]

  Surf-Reg-rh:
    run: Surf-Reg.cwl
    in:
      sphere: Sphere-rh/output_file
      folding_atlas: folding_atlas_rh
      smoothwm: Smooth2-rh/output_file
      sulc: Inflation2-rh/output_file_sulc
      hemi: rh
    out: [output_file]

  Jacobian-white-lh:
    run: Jacobian-white.cwl
    in:
      white_preaparc: Make-White-Surf-lh/output_file_white_preaparc
      sphere_reg: Surf-Reg-lh/output_file
      hemi: lh
    out: [output_file]

  Jacobian-white-rh:
    run: Jacobian-white.cwl
    in:
      white_preaparc: Make-White-Surf-rh/output_file_white_preaparc
      sphere_reg: Surf-Reg-rh/output_file
      hemi: rh
    out: [output_file]

  AvgCurv-lh:
    run: AvgCurv.cwl
    in:
      folding_atlas: folding_atlas_lh
      sphere_reg: Surf-Reg-lh/output_file
      hemi: lh
    out: [output_file]

  AvgCurv-rh:
    run: AvgCurv.cwl
    in:
      folding_atlas: folding_atlas_rh
      sphere_reg: Surf-Reg-lh/output_file
      hemi: rh
    out: [output_file]

  Cortical-Parc-aparc-lh:
    run: Cortical-Parc.cwl
    in:
      cortex: Make-White-Surf-lh/output_file_cortex
      aseg_presurf: SubCort-Seg_part1/output_file
      subname: subject
      hemi: lh
      atlas: aparc_atlas_lh
      sphere_reg: Surf-Reg-lh/output_file
      smoothwm: Smooth2-lh/output_file
      sulc: Inflation2-lh/output_file_sulc
      output_filename: lh_aparc_annot
    out: [output_file]

  Cortical-Parc-aparc-rh:
    run: Cortical-Parc.cwl
    in:
      cortex: Make-White-Surf-rh/output_file_cortex
      aseg_presurf: SubCort-Seg_part1/output_file
      subname: subject
      hemi: rh
      atlas: aparc_atlas_rh
      sphere_reg: Surf-Reg-rh/output_file
      smoothwm: Smooth2-rh/output_file
      sulc: Inflation2-rh/output_file_sulc
      output_filename: rh_aparc_annot
    out: [output_file]

  Make-Pial-Surf-lh:
    run:  Make-Pial-Surf.cwl
    in:
      orig_white: Make-White-Surf-lh/output_file_white_preaparc
      orig_pial: Make-White-Surf-lh/output_file_white_preaparc
      aseg_presurf: SubCort-Seg_part1/output_file
      T1_file: Mask-BFS/output_file
      subname: subject
      hemi: lh
      wm: WM-Segmentation_part2/output_file
      filled: Fill/output_file
      surf_orig: Fix-Topology-lh_part1/output_file
      aparc: Cortical-Parc-aparc-lh/output_file
      talairach_xfm: Talairach_part1/output_file
    out: [output_file_area_pial, output_file_curv_pial, output_file_pial, output_file_white, output_file_thickness]

  Make-Pial-Surf-rh:
    run:  Make-Pial-Surf.cwl
    in:
      orig_white: Make-White-Surf-rh/output_file_white_preaparc
      orig_pial: Make-White-Surf-rh/output_file_white_preaparc
      aseg_presurf: SubCort-Seg_part1/output_file
      T1_file: Mask-BFS/output_file
      subname: subject
      hemi: rh
      wm: WM-Segmentation_part2/output_file
      filled: Fill/output_file
      surf_orig: Fix-Topology-rh_part1/output_file
      aparc: Cortical-Parc-aparc-rh/output_file
      talairach_xfm: Talairach_part1/output_file
    out: [output_file_area_pial, output_file_curv_pial, output_file_pial, output_file_white, output_file_thickness]

  Surf-Volume-lh:
    run: Surf-Volume.cwl
    in:
      subname: subject
      hemi: lh
      cortex: Make-White-Surf-lh/output_file_cortex
      surf_white: Make-Pial-Surf-lh/output_file_white
      surf_pial: Make-Pial-Surf-lh/output_file_pial
      area: Make-White-Surf-lh/output_file_area
      area_pial: Make-Pial-Surf-lh/output_file_area_pial
    out: [output_file_volume, output_file_area_mid]

  Surf-Volume-rh:
    run: Surf-Volume.cwl
    in:
      subname: subject
      hemi: rh
      cortex: Make-White-Surf-rh/output_file_cortex
      surf_white: Make-Pial-Surf-rh/output_file_white
      surf_pial: Make-Pial-Surf-rh/output_file_pial
      area: Make-White-Surf-rh/output_file_area
      area_pial: Make-Pial-Surf-rh/output_file_area_pial
    out: [output_file_volume, output_file_area_mid]

  Cortical-ribbon-mask:
    run: Cortical-ribbon-mask.cwl
    in:
      aseg_presurf: SubCort-Seg_part1/output_file
      subname: subject
      surf_lh_white: Make-Pial-Surf-lh/output_file_white
      surf_rh_white: Make-Pial-Surf-rh/output_file_white
      surf_lh_pial: Make-Pial-Surf-lh/output_file_pial
      surf_rh_pial: Make-Pial-Surf-rh/output_file_pial
    out: [output_file_lh_ribbon, output_file_rh_ribbon, output_file_ribbon]

  Parcellation-Stats-aparc-lh:
    run: Parcellation-Stats.cwl
    in:
      cortex: Make-White-Surf-lh/output_file_cortex
      stats_filename: aparc_stats
      annot: Cortical-Parc-aparc-lh/output_file
      ctab_filename: aparc_ctab
      subname: subject
      hemi: lh
      surf_type: white
      annot_basename: aparc_annot
      mask: Skull-Stripping_part1/output_file
      aseg_presurf: SubCort-Seg_part1/output_file
      talairach_xfm: Talairach_part1/output_file
      ribbon: Cortical-ribbon-mask/output_file_ribbon
      wm: WM-Segmentation_part2/output_file
      thickness: Make-Pial-Surf-lh/output_file_thickness
      surf_lh_white: Make-Pial-Surf-lh/output_file_white
      surf_rh_white: Make-Pial-Surf-rh/output_file_white
      surf_lh_pial: Make-Pial-Surf-lh/output_file_pial
      surf_rh_pial: Make-Pial-Surf-rh/output_file_pial
    out: [output_file_stats, output_file_ctab]

  Parcellation-Stats-aparc-pial-lh:
    run: Parcellation-Stats.cwl
    in:
      cortex: Make-White-Surf-lh/output_file_cortex
      stats_filename: aparc_pial_stats
      annot: Cortical-Parc-aparc-lh/output_file
      ctab_filename: aparc_ctab
      subname: subject
      hemi: lh
      surf_type: pial
      annot_basename: aparc_annot
      mask: Skull-Stripping_part1/output_file
      aseg_presurf: SubCort-Seg_part1/output_file
      talairach_xfm: Talairach_part1/output_file
      ribbon: Cortical-ribbon-mask/output_file_ribbon
      wm: WM-Segmentation_part2/output_file
      thickness: Make-Pial-Surf-lh/output_file_thickness
      surf_lh_white: Make-Pial-Surf-lh/output_file_white
      surf_rh_white: Make-Pial-Surf-rh/output_file_white
      surf_lh_pial: Make-Pial-Surf-lh/output_file_pial
      surf_rh_pial: Make-Pial-Surf-rh/output_file_pial
    out: [output_file_stats, output_file_ctab]

  Parcellation-Stats-aparc-rh:
    run: Parcellation-Stats.cwl
    in:
      cortex: Make-White-Surf-rh/output_file_cortex
      stats_filename: aparc_stats
      annot: Cortical-Parc-aparc-rh/output_file
      ctab_filename: aparc_ctab
      subname: subject
      hemi: rh
      surf_type: white
      annot_basename: aparc_annot
      mask: Skull-Stripping_part1/output_file
      aseg_presurf: SubCort-Seg_part1/output_file
      talairach_xfm: Talairach_part1/output_file
      ribbon: Cortical-ribbon-mask/output_file_ribbon
      wm: WM-Segmentation_part2/output_file
      thickness: Make-Pial-Surf-rh/output_file_thickness
      surf_lh_white: Make-Pial-Surf-lh/output_file_white
      surf_rh_white: Make-Pial-Surf-rh/output_file_white
      surf_lh_pial: Make-Pial-Surf-lh/output_file_pial
      surf_rh_pial: Make-Pial-Surf-rh/output_file_pial
    out: [output_file_stats, output_file_ctab]

  Parcellation-Stats-aparc-pial-rh:
    run: Parcellation-Stats.cwl
    in:
      cortex: Make-White-Surf-rh/output_file_cortex
      stats_filename: aparc_pial_stats
      annot: Cortical-Parc-aparc-rh/output_file
      ctab_filename: aparc_ctab
      subname: subject
      hemi: rh
      surf_type: pial
      annot_basename: aparc_annot
      mask: Skull-Stripping_part1/output_file
      aseg_presurf: SubCort-Seg_part1/output_file
      talairach_xfm: Talairach_part1/output_file
      ribbon: Cortical-ribbon-mask/output_file_ribbon
      wm: WM-Segmentation_part2/output_file
      thickness: Make-Pial-Surf-rh/output_file_thickness
      surf_lh_white: Make-Pial-Surf-lh/output_file_white
      surf_rh_white: Make-Pial-Surf-rh/output_file_white
      surf_lh_pial: Make-Pial-Surf-lh/output_file_pial
      surf_rh_pial: Make-Pial-Surf-rh/output_file_pial
    out: [output_file_stats, output_file_ctab]

  Cortical-Parc-lobes-lh:
    run: Create-Lobes.cwl
    in:
      subname: subject
      hemi: lh
      annot: Cortical-Parc-aparc-lh/output_file
      annot_basename: aparc_annot
      output_filename: lh_aparc_lobes_annot
      surf_lh_white: Make-Pial-Surf-lh/output_file_white
      surf_rh_white: Make-Pial-Surf-rh/output_file_white
    out: [output_file]

  Cortical-Parc-lobes-rh:
    run: Create-Lobes.cwl
    in:
      subname: subject
      hemi: rh
      annot: Cortical-Parc-aparc-rh/output_file
      annot_basename: aparc_annot
      output_filename: rh_aparc_lobes_annot
      surf_lh_white: Make-Pial-Surf-lh/output_file_white
      surf_rh_white: Make-Pial-Surf-rh/output_file_white
    out: [output_file]

  Parcellation-Stats-lobes-lh:
    run: Parcellation-Stats.cwl
    in:
      cortex: Make-White-Surf-lh/output_file_cortex
      stats_filename: aparc_lobes_stats
      annot: Cortical-Parc-lobes-lh/output_file
      ctab_filename: aparc_lobes_ctab
      subname: subject
      hemi: lh
      surf_type: white
      annot_basename: aparc_lobes_annot
      mask: Skull-Stripping_part1/output_file
      aseg_presurf: SubCort-Seg_part1/output_file
      talairach_xfm: Talairach_part1/output_file
      ribbon: Cortical-ribbon-mask/output_file_ribbon
      wm: WM-Segmentation_part2/output_file
      thickness: Make-Pial-Surf-lh/output_file_thickness
      surf_lh_white: Make-Pial-Surf-lh/output_file_white
      surf_rh_white: Make-Pial-Surf-rh/output_file_white
      surf_lh_pial: Make-Pial-Surf-lh/output_file_pial
      surf_rh_pial: Make-Pial-Surf-rh/output_file_pial
    out: [output_file_stats, output_file_ctab]

  Parcellation-Stats-lobes-rh:
    run: Parcellation-Stats.cwl
    in:
      cortex: Make-White-Surf-rh/output_file_cortex
      stats_filename: aparc_lobes_stats
      annot: Cortical-Parc-lobes-rh/output_file
      ctab_filename: aparc_lobes_ctab
      subname: subject
      hemi: rh
      surf_type: white
      annot_basename: aparc_lobes_annot
      mask: Skull-Stripping_part1/output_file
      aseg_presurf: SubCort-Seg_part1/output_file
      talairach_xfm: Talairach_part1/output_file
      ribbon: Cortical-ribbon-mask/output_file_ribbon
      wm: WM-Segmentation_part2/output_file
      thickness: Make-Pial-Surf-rh/output_file_thickness
      surf_lh_white: Make-Pial-Surf-lh/output_file_white
      surf_rh_white: Make-Pial-Surf-rh/output_file_white
      surf_lh_pial: Make-Pial-Surf-lh/output_file_pial
      surf_rh_pial: Make-Pial-Surf-rh/output_file_pial
    out: [output_file_stats, output_file_ctab]

  Cortical-Parc-a2009s-lh:
    run: Cortical-Parc.cwl
    in:
      cortex: Make-White-Surf-lh/output_file_cortex
      aseg_presurf: SubCort-Seg_part1/output_file
      subname: subject
      hemi: lh
      atlas: a2009s_atlas_lh
      sphere_reg: Surf-Reg-lh/output_file
      smoothwm: Smooth2-lh/output_file
      sulc: Inflation2-lh/output_file_sulc
      output_filename: lh_aparc_a2009s_annot
    out: [output_file]

  Cortical-Parc-a2009s-rh:
    run: Cortical-Parc.cwl
    in:
      cortex: Make-White-Surf-rh/output_file_cortex
      aseg_presurf: SubCort-Seg_part1/output_file
      subname: subject
      hemi: rh
      atlas: a2009s_atlas_rh
      sphere_reg: Surf-Reg-rh/output_file
      smoothwm: Smooth2-rh/output_file
      sulc: Inflation2-rh/output_file_sulc
      output_filename: rh_aparc_a2009s_annot
    out: [output_file]

  Parcellation-Stats-a2009s-lh:
    run: Parcellation-Stats.cwl
    in:
      cortex: Make-White-Surf-lh/output_file_cortex
      stats_filename: aparc_a2009s_stats
      annot: Cortical-Parc-a2009s-lh/output_file
      ctab_filename: aparc_a2009s_ctab
      subname: subject
      hemi: lh
      surf_type: white
      annot_basename: aparc_a2009s_annot
      mask: Skull-Stripping_part1/output_file
      aseg_presurf: SubCort-Seg_part1/output_file
      talairach_xfm: Talairach_part1/output_file
      ribbon: Cortical-ribbon-mask/output_file_ribbon
      wm: WM-Segmentation_part2/output_file
      thickness: Make-Pial-Surf-lh/output_file_thickness
      surf_lh_white: Make-Pial-Surf-lh/output_file_white
      surf_rh_white: Make-Pial-Surf-rh/output_file_white
      surf_lh_pial: Make-Pial-Surf-lh/output_file_pial
      surf_rh_pial: Make-Pial-Surf-rh/output_file_pial    
    out: [output_file_stats, output_file_ctab]

  Parcellation-Stats-a2009s-rh:
    run: Parcellation-Stats.cwl
    in:
      cortex: Make-White-Surf-rh/output_file_cortex
      stats_filename: aparc_a2009s_stats
      annot: Cortical-Parc-a2009s-rh/output_file
      ctab_filename: aparc_a2009s_ctab
      subname: subject
      hemi: rh
      surf_type: white
      annot_basename: aparc_a2009s_annot
      mask: Skull-Stripping_part1/output_file
      aseg_presurf: SubCort-Seg_part1/output_file
      talairach_xfm: Talairach_part1/output_file
      ribbon: Cortical-ribbon-mask/output_file_ribbon
      wm: WM-Segmentation_part2/output_file
      thickness: Make-Pial-Surf-rh/output_file_thickness
      surf_lh_white: Make-Pial-Surf-lh/output_file_white
      surf_rh_white: Make-Pial-Surf-rh/output_file_white
      surf_lh_pial: Make-Pial-Surf-lh/output_file_pial
      surf_rh_pial: Make-Pial-Surf-rh/output_file_pial
    out: [output_file_stats, output_file_ctab]

  Cortical-Parc-DKTatlas-lh:
    run: Cortical-Parc.cwl
    in:
      cortex: Make-White-Surf-lh/output_file_cortex
      aseg_presurf: SubCort-Seg_part1/output_file
      subname: subject
      hemi: lh
      atlas: dkt_atlas_lh
      smoothwm: Smooth2-lh/output_file
      sphere_reg: Surf-Reg-lh/output_file
      sulc: Inflation2-lh/output_file_sulc
      output_filename: lh_aparc_DKTatlas_annot
    out: [output_file]

  Cortical-Parc-DKTatlas-rh:
    run: Cortical-Parc.cwl
    in:
      cortex: Make-White-Surf-rh/output_file_cortex
      aseg_presurf: SubCort-Seg_part1/output_file
      subname: subject
      hemi: rh
      atlas: dkt_atlas_rh
      smoothwm: Smooth2-rh/output_file
      sphere_reg: Surf-Reg-rh/output_file
      sulc: Inflation2-rh/output_file_sulc
      output_filename: rh_aparc_DKTatlas_annot
    out: [output_file]

  Parcellation-Stats-DKTatlas-lh:
    run: Parcellation-Stats.cwl
    in:
      cortex: Make-White-Surf-lh/output_file_cortex
      stats_filename: aparc_DKT_stats
      annot: Cortical-Parc-DKTatlas-lh/output_file
      ctab_filename: aparc_DKT_ctab
      subname: subject
      hemi: lh
      surf_type: white
      annot_basename: aparc_DKT_annot
      mask: Skull-Stripping_part1/output_file
      aseg_presurf: SubCort-Seg_part1/output_file
      talairach_xfm: Talairach_part1/output_file
      ribbon: Cortical-ribbon-mask/output_file_ribbon
      wm: WM-Segmentation_part2/output_file
      thickness: Make-Pial-Surf-lh/output_file_thickness
      surf_lh_white: Make-Pial-Surf-lh/output_file_white
      surf_rh_white: Make-Pial-Surf-rh/output_file_white
      surf_lh_pial: Make-Pial-Surf-lh/output_file_pial 
      surf_rh_pial: Make-Pial-Surf-rh/output_file_pial   
    out: [output_file_stats, output_file_ctab]

  Parcellation-Stats-DKTatlas-rh:
    run: Parcellation-Stats.cwl
    in:
      cortex: Make-White-Surf-rh/output_file_cortex
      stats_filename: aparc_DKT_stats
      annot: Cortical-Parc-DKTatlas-rh/output_file
      ctab_filename: aparc_DKT_ctab
      subname: subject
      hemi: rh
      surf_type: white
      annot_basename: aparc_DKT_annot
      mask: Skull-Stripping_part1/output_file
      aseg_presurf: SubCort-Seg_part1/output_file
      talairach_xfm: Talairach_part1/output_file
      ribbon: Cortical-ribbon-mask/output_file_ribbon
      wm: WM-Segmentation_part2/output_file
      thickness: Make-Pial-Surf-rh/output_file_thickness
      surf_lh_white: Make-Pial-Surf-lh/output_file_white
      surf_rh_white: Make-Pial-Surf-rh/output_file_white
      surf_lh_pial: Make-Pial-Surf-lh/output_file_pial
      surf_rh_pial: Make-Pial-Surf-rh/output_file_pial
    out: [output_file_stats, output_file_ctab]

  WmGm-Contrast-lh:
    run: WmGm-Contrast-lh.cwl
    in:
      subname: subject
      orig: Conform/output_file
      rawavg: input_image
      aparc: Cortical-Parc-aparc-lh/output_file
      cortex: Make-White-Surf-lh/output_file_cortex
      surf_white: Make-Pial-Surf-lh/output_file_white
      thickness: Make-Pial-Surf-lh/output_file_thickness
    out: [output_file_mgh, output_file_stats, output_file_log]

  WmGm-Contrast-rh:
    run: WmGm-Contrast-rh.cwl
    in:
      subname: subject
      orig: Conform/output_file
      rawavg: input_image
      aparc: Cortical-Parc-aparc-rh/output_file
      cortex: Make-White-Surf-rh/output_file_cortex
      surf_white: Make-Pial-Surf-rh/output_file_white
      thickness: Make-Pial-Surf-rh/output_file_thickness
    out: [output_file_mgh, output_file_stats, output_file_log]

  Relabel-Hypointensities:
    run: Relabel-Hypointensities.cwl
    in:
      aseg_presurf: SubCort-Seg_part1/output_file
      lh_white: Make-Pial-Surf-lh/output_file_white
      rh_white: Make-Pial-Surf-rh/output_file_white
    out: [output_file]

  AParc-to-ASeg-aparc:
    run: AParc-to-ASeg-aparc.cwl
    in:
      subname: subject
      aseg_presurf_hypos: Relabel-Hypointensities/output_file
      norm: CA-Normalize/output_file
      talairach_m3z: CA-Reg/output_file
      aseg_atlas: aseg_atlas
      label_intensities_file: SubCort-Seg_part0/label_intensities_file
      ribbon: Cortical-ribbon-mask/output_file_ribbon
      lh_aparc_annot: Cortical-Parc-aparc-lh/output_file
      rh_aparc_annot: Cortical-Parc-aparc-rh/output_file
      lh_white: Make-Pial-Surf-lh/output_file_white
      rh_white: Make-Pial-Surf-rh/output_file_white
      lh_pial: Make-Pial-Surf-lh/output_file_pial
      rh_pial: Make-Pial-Surf-rh/output_file_pial
    out: [output_file]

  AParc-to-ASeg-a2009s:
    run: AParc-to-ASeg-a2009s.cwl
    in:
      subname: subject
      aseg_presurf_hypos: Relabel-Hypointensities/output_file
      norm: CA-Normalize/output_file
      talairach_m3z: CA-Reg/output_file
      aseg_atlas: aseg_atlas
      label_intensities_file: SubCort-Seg_part0/label_intensities_file
      ribbon: Cortical-ribbon-mask/output_file_ribbon
      lh_aparc_a2009s_annot: Cortical-Parc-a2009s-lh/output_file
      rh_aparc_a2009s_annot: Cortical-Parc-a2009s-rh/output_file
      lh_white: Make-Pial-Surf-lh/output_file_white
      rh_white: Make-Pial-Surf-rh/output_file_white
      lh_pial: Make-Pial-Surf-lh/output_file_pial
      rh_pial: Make-Pial-Surf-rh/output_file_pial
    out: [output_file]

  AParc-to-ASeg-DKTatlas:
    run: AParc-to-ASeg-DKTatlas.cwl
    in:
      subname: subject
      aseg_presurf_hypos: Relabel-Hypointensities/output_file
      norm: CA-Normalize/output_file
      talairach_m3z: CA-Reg/output_file
      aseg_atlas: aseg_atlas
      label_intensities_file: SubCort-Seg_part0/label_intensities_file
      ribbon: Cortical-ribbon-mask/output_file_ribbon
      lh_aparc_DKTatlas_annot: Cortical-Parc-DKTatlas-lh/output_file
      rh_aparc_DKTatlas_annot: Cortical-Parc-DKTatlas-rh/output_file
      lh_white: Make-Pial-Surf-lh/output_file_white
      rh_white: Make-Pial-Surf-rh/output_file_white
      lh_pial: Make-Pial-Surf-lh/output_file_pial
      rh_pial: Make-Pial-Surf-rh/output_file_pial
    out: [output_file]

  AParc-to-ASeg-lobes:
    run: AParc-to-ASeg-lobes.cwl
    in:
      subname: subject
      aseg_presurf_hypos: Relabel-Hypointensities/output_file
      norm: CA-Normalize/output_file
      talairach_m3z: CA-Reg/output_file
      aseg_atlas: aseg_atlas
      label_intensities_file: SubCort-Seg_part0/label_intensities_file
      ribbon: Cortical-ribbon-mask/output_file_ribbon
      lh_aparc_lobes_annot: Cortical-Parc-lobes-lh/output_file
      rh_aparc_lobes_annot: Cortical-Parc-lobes-rh/output_file
      lh_white: Make-Pial-Surf-lh/output_file_white
      rh_white: Make-Pial-Surf-rh/output_file_white
      lh_pial: Make-Pial-Surf-lh/output_file_pial
      rh_pial: Make-Pial-Surf-rh/output_file_pial
    out: [output_file]

  APas-to-ASeg:
    run: APas-to-ASeg.cwl
    in:
      aparc_aseg: AParc-to-ASeg-aparc/output_file
    out: [output_file]

  ASeg-Stats:
    run: ASeg-Stats.cwl
    in:
      aseg: APas-to-ASeg/output_file
      pv: CA-Normalize/output_file
      mask: Skull-Stripping_part1/output_file
      norm: CA-Normalize/output_file
      aseg_ctab: aseg_ctab
      subname: subject
      talairach_xfm: Talairach_part1/output_file
      aseg_presurf: SubCort-Seg_part1/output_file
      ribbon: Cortical-ribbon-mask/output_file_ribbon
      lh_orig_nofix: Tessellate-lh_part1/output_file
      rh_orig_nofix: Tessellate-rh_part1/output_file
      lh_white: Make-Pial-Surf-lh/output_file_white
      rh_white: Make-Pial-Surf-rh/output_file_white
      lh_pial: Make-Pial-Surf-lh/output_file_pial
      rh_pial: Make-Pial-Surf-rh/output_file_pial
    out: [output_file]

  WMParc_part0:
    run: WMParc_part0.cwl
    in:
      subname: subject
      aseg: APas-to-ASeg/output_file
      ribbon: Cortical-ribbon-mask/output_file_ribbon
      aparc_aseg: AParc-to-ASeg-aparc/output_file
      lh_orig_nofix: Tessellate-lh_part1/output_file
      rh_orig_nofix: Tessellate-rh_part1/output_file
      lh_aparc_annot: Cortical-Parc-aparc-lh/output_file
      rh_aparc_annot: Cortical-Parc-aparc-rh/output_file
      lh_white: Make-Pial-Surf-lh/output_file_white
      rh_white: Make-Pial-Surf-rh/output_file_white
      lh_pial: Make-Pial-Surf-lh/output_file_pial
      rh_pial: Make-Pial-Surf-rh/output_file_pial
    out: [output_file]
  WMParc_part1:
    run: WMParc_part1.cwl
    in:
      wmparc: WMParc_part0/output_file
      pv: CA-Normalize/output_file
      mask: Skull-Stripping_part1/output_file
      norm: CA-Normalize/output_file
      subname: subject
      wmparc_ctab: wmparc_ctab
      talairach_xfm: Talairach_part1/output_file
      aseg_presurf: SubCort-Seg_part1/output_file
      aseg: APas-to-ASeg/output_file
      ribbon: Cortical-ribbon-mask/output_file_ribbon
      lh_orig_nofix: Tessellate-lh_part1/output_file
      rh_orig_nofix: Tessellate-rh_part1/output_file
      lh_white: Make-Pial-Surf-lh/output_file_white
      rh_white: Make-Pial-Surf-rh/output_file_white
      lh_pial: Make-Pial-Surf-lh/output_file_pial
      rh_pial: Make-Pial-Surf-rh/output_file_pial
    out: [output_file]

  Aseg-to-DICOM_part0:
    run: Dicom-Conversion_part0.cwl
    in: 
      mov: APas-to-ASeg/output_file
      targ: input_image 
      output_filename: aseg_rawavg
    out: [output_file]
  Aseg-to-DICOM_part1:
    run: Dicom-Conversion_part1.cwl
    in:
      input_dicom: dicom_input 
      output_filename: aseg_dicom
      input_metadata: input_metadata 
      input_image: Aseg-to-DICOM_part0/output_file
    out: [output_file]

  AParcAseg-aparc-to-DICOM_part0:
    run: Dicom-Conversion_part0.cwl
    in: 
      mov: AParc-to-ASeg-aparc/output_file
      targ: input_image
      output_filename: aparc_aseg_rawavg
    out: [output_file]
  AParcAseg-aparc-to-DICOM_part1:
    run: Dicom-Conversion_part1.cwl
    in:
      input_dicom: dicom_input 
      output_filename: aparc_aseg_dicom
      input_metadata: input_metadata 
      input_image: AParcAseg-aparc-to-DICOM_part0/output_file
    out: [output_file]

  AParcLobesAseg-to-DICOM_part0:
    run: Dicom-Conversion_part0.cwl
    in: 
      mov: AParc-to-ASeg-lobes/output_file
      targ: input_image
      output_filename: aparc_lobes_aseg_rawavg
    out: [output_file]
  AParcLobesAseg-to-DICOM_part1:
    run: Dicom-Conversion_part1.cwl
    in:
      input_dicom: dicom_input 
      output_filename: aparc_lobes_aseg_dicom
      input_metadata: input_metadata 
      input_image: AParcLobesAseg-to-DICOM_part0/output_file
    out: [output_file]
