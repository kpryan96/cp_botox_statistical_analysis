library(tidyverse)
library(tidyselect)
library(openxlsx)
library(ggplot2)
library(janitor)

# Reading in Data 
patient_char <- readWorkbook("Dataset_CP_prepostBTXA.xlsx", sheet = 1)
pars_pre_BTX <- readWorkbook("Dataset_CP_prepostBTXA.xlsx", sheet = 2)
pars_post_BTX <- readWorkbook("Dataset_CP_prepostBTXA.xlsx", sheet = 3)

# Summarizing Patient Characteristics - Categorical Features
t_diag <- patient_char %>% 
  tabyl(Diagnosis)

t_sex <- patient_char %>% 
  tabyl(sex)

t_walkaids <- patient_char %>% 
  tabyl(walking.aids)

t_gmfcs <- patient_char %>% 
  tabyl(GMFCS)

t_sexdiag <- patient_char %>% 
  tabyl(sex, Diagnosis)

t_sexgmfcs <- patient_char %>% 
  tabyl(sex, GMFCS)

df_sexdiag <- patient_char %>% 
  group_by(sex, Diagnosis) %>% 
  summarize(n = n())

df_sexgmfcs <- patient_char %>% 
  group_by(sex, GMFCS) %>% 
  summarize(Count = n())

df_sexwalkaids <- patient_char %>% 
  group_by(sex, walking.aids) %>% 
  summarize(Count = n())

# Plotting Categorical Features
ggplot(df_sexdiag, aes(x = Diagnosis, y = n, fill = sex)) + 
  geom_bar(stat="identity", width=0.7, position=position_dodge(width=0.8)) + 
  geom_text(aes(y = n+0.5, label=n),position=position_dodge(0.8)) + 
  labs(x="Diagnosis",y="Count") + 
  scale_fill_grey()

ggplot(df_sexgmfcs, aes(x = GMFCS, y = Count, fill = sex)) + 
  geom_bar(stat="identity", width=0.7, position=position_dodge(width=0.8)) + 
  geom_text(aes(y = Count+0.5, label=Count),position=position_dodge(0.8)) + 
  scale_fill_grey()

ggplot(df_sexwalkaids, aes(x = walking.aids, y = Count, fill = sex)) + 
  geom_bar(stat="identity", width=0.7, position=position_dodge(width=0.8)) + 
  geom_text(aes(y = Count+0.5, label=Count),position=position_dodge(0.8)) + 
  scale_fill_grey()+
  labs(x = "Walking Aids")

# Summarizing Patient Characteristics - Numeric Features
summary(patient_char$`Pre-3DGA./.BTX-A.(days)`)
summary(patient_char$`BTX-A./.Post-3DGA.(days)`)


# Getting summary statistics for parametric measurements

kin_summary <- data.frame(matrix(ncol = 6, nrow = 43))
colnames(kin_summary) <- c("Feature", "Pre-Mean", "Pre-SD", "Post-Mean", 'Post-SD')

kin_summary$Feature <- colnames(pars_pre_BTX)
kin_summary <- kin_summary[-1,]
rownames(kin_summary) <- 1:nrow(kin_summary)

col_names <- colnames(pars_pre_BTX)

kin_summary$Feature[1]
col_names[1]

feat_pre_means <- c()
feat_pre_sd <- c()
feat_post_means <- c()
feat_post_sd <- c()
for(i in 1:42) {       
  if(col_names[[i+1]] == kin_summary$Feature[i]){
    feat_pre_means[[i]] <- mean(pars_pre_BTX[,i+1])
    feat_pre_sd[[i]] <- sd(pars_pre_BTX[,i+1])
    feat_post_means[[i]] <- mean(pars_post_BTX[,i+1])
    feat_post_sd[[i]] <- sd(pars_post_BTX[,i+1])
    
  }
}

kin_summary$"Pre-Mean" <- feat_pre_means
kin_summary$"Pre-SD" <- feat_pre_sd
kin_summary$"Post-Mean" <- feat_post_means
kin_summary$"Post-SD" <- feat_post_sd

kin_summary[[6]] <- NULL


# Performing Paired T-Test to get p-value for each Feature

p_value <- c()

for(i in 2:43){
  t_test <-t.test(x= pars_pre_BTX[,i], y = pars_post_BTX[,i], paired = TRUE, u = 0, alternative = "two.sided")
  p_value[[i-1]] <- t_test$p.value
}


# Applying Holm-Bonferroni Method to account for multiple comparisons 
feat_sig <- data.frame(matrix(ncol =5, nrow = 42))
colnames(feat_sig) <- c("Feature", "p-value", "Rank", "new_alpha", "signifigant")


feat_sig$Feature <- col_names[2:43]
feat_sig$`p-value` <- p_value
feat_sig <- feat_sig %>% 
  arrange(desc(`p-value`))

feat_sig$Rank <- c(1:42)

alpha <- .05 
n = 42 

feat_sig$new_alpha <- alpha / (n - feat_sig$Rank + 1) 

feat_sig$signifigant <- ifelse(feat_sig$`p-value` <= feat_sig$new_alpha, "Yes", "No") 

feat_final <- feat_sig[feat_sig$signifigant == "Yes",]

feat_final$Feat_Name <- c("Mean Foot Progression During Stance",
                          "Sag Range of Motion", 
                          "Max Plantarflexion Angle", 
                          "Angle at 50% of SW Plane",
                          "Range of Motion during Push off", 
                          "Max Plantarflexion Angle During SW", 
                          "Max Dorsiflexion Angle During SW",
                          "Range of Motion During SW",
                          "Timing of Max Angle during ST", 
                          "Max Angle During ST", 
                          "Angle at 50% ST Phase", 
                          "Angle at Initial Contact")
