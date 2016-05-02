#!/bin/bash
usage() {
      echo ""
      echo "Usage : sh $0 -i input_sam -q output_sorted_bam"
      echo ""

cat <<'EOF'
  -i </path/to/sam file>

  -o </path/to/sorted_bam file>

  -h Show this usage information

EOF
    exit 0
}

while getopts ":hi:o:" opt; do
  case $opt in
    i)
     input_file=$OPTARG
     ;;
    o)
     output_file=$OPTARG
     ;;
     h)
     usage
     ;;
    \?)
     echo "Invalid option: -$OPTARG" >&2
     exit 1
     ;;
    :)
     echo "Option -$OPTARG requires an argument." >&2
     exit 1
     ;;
  esac
done

SAMTOOLS_BASE="/samtools-0.1.19"
fbname=$(basename $input_file .sam)
${SAMTOOLS_BASE}/samtools-0.1.19 view -bS $input_file > $fbname.bam
${SAMTOOLS_BASE}/samtools-0.1.19 sort -m 2000000000 $fbname.bam $output_file
${SAMTOOLS_BASE}/samtools-0.1.19 index $output_file.bam
rm $fbname.bam
