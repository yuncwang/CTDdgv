
library(tidyr)
library(car)


cfDNA_mutation<-read.table(readTablePath,header = T,sep = "\t",stringsAsFactors = F,quote = "")
cfDNA_mutation_result<-data.frame(cfDNA_mutation$Hugo_Symbol,cfDNA_mutation$Chromosome,
                                  cfDNA_mutation$Start_Position,cfDNA_mutation$End_Position,
                                  cfDNA_mutation$Tumor_Sample_Barcode,stringsAsFactors = F);
colnames(cfDNA_mutation_result)<-gsub("cfDNA_mutation\\.","",colnames(cfDNA_mutation_result))
write.table(cfDNA_mutation_result,writeTablePath,sep="\t",quote=FALSE,row.names = F)