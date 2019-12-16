#!/usr/bin/env cwl-runner
# Generated from: stringtie --merge -p 8 -G genes/chrX.gtf -o stringtie_merged.gtf mergelist.txt
class: CommandLineTool
cwlVersion: v1.0
baseCommand: stringtie
arguments:
  - --merge
  - -p
  - $(inputs.nthreads)
  - -G
  - $(inputs.guide)
  - -o
  - $(inputs.o_name)
  - $(inputs.mergelist_txt)
inputs:
  - id: nthreads
    type: int
  - id: guide
    type: File
  - id: o_name
    type: string
  - id: mergelist_txt
    type: File
outputs:
#  - id: all-for-debugging
#    type:
#      type: array
#      items: [File, Directory]
#    outputBinding:
#      glob: "*"
  - id: o
    type: File
    outputBinding:
      glob: "$(inputs.o_name)"
hints:
  - class: DockerRequirement
    dockerPull: quay.io/biocontainers/stringtie:2.0--hc900ff6_0
