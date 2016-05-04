FROM ubuntu:14.04.3
MAINTAINER Upendra Devisetty <upendra@cyverse.org>
LABEL Descritpion "This tool accepts a bam file and returns a sorted bam file"

RUN apt-get update && apt-get install -y wget samtools git

# script
ENV SAM https://github.com/upendrak/samtools_sam_to_sorted_bam-1.19_mod.git
RUN git clone $SAM
RUN chmod +x /samtools_sam_to_sorted_bam-1.19_mod/samtools_sam_to_sorted_bam-1.19_mod.sh && cp /samtools_sam_to_sorted_bam-1.19_mod/samtools_sam_to_sorted_bam-1.19_mod.sh /usr/bin

ENTRYPOINT ["samtools_sam_to_sorted_bam-1.19_mod.sh"]
CMD ["-h"]
