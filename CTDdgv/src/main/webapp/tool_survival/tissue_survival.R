#### 示例癌症
library(dplyr)
library(ggplot2)
library(survival)
library(survminer)

P_D_condition = read.table(readTablePath_MC, quote = "", sep = "\t", header = TRUE)
clinicData_survival = read.table(readTablePath_CL, quote = "", sep = "\t", header = TRUE)
### 获取患者生存信息
patients <- unique( P_D_condition$patient_id)
patients_inf <- clinicData_survival %>% filter(bcr_patient_barcode %in% patients) %>% mutate(patient_id = bcr_patient_barcode) %>%
  dplyr::select(patient_id, OS, OS.time)
### 合并突变情况表和生存数据
merge_result <- merge(patients_inf,  P_D_condition, "patient_id")
### 求生存并作图

group <- sapply(merge_result[[driver_gene]],function(x){
  if(x==1){return("variant")}else{return("non_variant")}
})

result <- survfit(Surv(OS.time, OS)~group,data=data.frame(merge_result,data.frame(merge_result,group)))
# 确定 legend.labs
group_table <- table(group)
if ("variant" %in% names(group_table) && "non_variant" %in% names(group_table)) {
    legend_labs <-  c("non_variant", "variant") ## 这里的顺序和下边画图的颜色是对应的，既variant组是#1f77b4
  } else if ("non_variant" %in% names(group_table)) {
    legend_labs <- "non_variant"
  } else if ("variant" %in% names(group_table)) {
    legend_labs <- "variant"
  }
# 自定义主题，包括白色背景
custom_theme <- theme_minimal() +
  theme(
    panel.background = element_rect(fill = "white"), # 曲线的背景
    plot.background = element_rect(fill = "white", color = NA),  # 整个图的背景
    panel.grid.major = element_line(color = "gray90"), # 网格线颜色
    panel.grid.minor = element_line(color = "gray90")  # 次要网格线颜色
  )

# 绘制生存曲线
sur = ggsurvplot(
  result,
  pval = TRUE,
  xlab = "Time(Days)",
  ylab = "Survival probability (OS)",
  pval.method = TRUE,
  legend.title = paste(driver_gene, "Variant condition"),
  legend.labs = legend_labs,
  palette = c("#1f77b4", "#ff7f0e"),  # Customize colors
  linetype = c("solid", "dashed"),    # Customize line types
  ggtheme = custom_theme,          # Use a minimal theme
  conf.int = TRUE                   # Show confidence intervals
)
filename<- paste0(writeTablePath, "TCGA_",disease_type,"_",driver_gene,".png")
png(filename, width = 600,height = 500)
# 绘制生存曲线
print(sur$plot)  # 使用 print() 将图形输出到设备
dev.off()

# ggsave(filename,width = 6,height = 5, plot = sur$plot, path = writeTablePath)  ##ggplot 中直接保存
