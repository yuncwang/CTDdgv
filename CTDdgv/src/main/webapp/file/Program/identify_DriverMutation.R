setwd(readTablePath_element_filter)

# 读入未标准化的突变文件(包含ref, alt, mutation_type)
origin_mutation <- read.table(readTablePath_origin_mutation,
                              header = TRUE, sep = "\t", stringsAsFactors = FALSE, quote = "")
origin_mutation <- origin_mutation[!duplicated(origin_mutation[c("Hugo_Symbol", "Start_Position", "End_Position")]), ]

# 获取所有文件名
list <- list.files(pattern = ".txt")
element <- gsub("_length.txt", "", list)

for (file in list) {
  element_filter <- read.table(file.path(readTablePath_element_filter, file),
                               header = TRUE, sep = "\t", stringsAsFactors = FALSE, quote = "")

  driver_mutation <- list()  # 初始化一个列表来存储结果

  for (j in 1:nrow(element_filter)) {
    gene <- element_filter[j, "gene"]
    minpos <- element_filter[j, "minpos"]
    maxpos <- element_filter[j, "maxpos"]

    # 筛选符合条件的突变
    temple <- origin_mutation[origin_mutation$Hugo_Symbol == gene &
                                origin_mutation$Start_Position >= minpos &
                                origin_mutation$End_Position <= maxpos, ]

    if (nrow(temple) > 0) {
      repeated_row <- element_filter[j, ]
      repeated_rows <- do.call(rbind, replicate(nrow(temple), repeated_row, simplify = FALSE))

      # 创建合并数据框
      combined_rows <- data.frame(repeated_rows,
                                  Start = temple$Start_Position,
                                  End = temple$End_Position,
                                  Reference = temple$Reference,
                                  Alteration = temple$Alteration,
                                  Mutation_type = temple$Mutation_type)

      # 将合并后的结果添加到列表
      driver_mutation <- append(driver_mutation, list(combined_rows))
    }
  }

  # 如果有数据，合并并写入文件
  if (length(driver_mutation) > 0) {
    driver_mutation_df <- do.call(rbind, driver_mutation)
    write.table(driver_mutation_df,
                file.path(writeTablePath, file),
                sep = "\t", quote = FALSE, row.names = FALSE)
  }
}