# Modified from code taken from:
# Paff et al., Combinatorial Approaches to Viral Attenuation, https://doi.org/10.1101/299180
# Code and data available here: https://github.com/mlpaff/t7-attenuation/blob/master/code/R/hisat2_plotting.R
library(tidyverse)
library(cowplot)
library(broom)
library(colorspace)
library(ggrepel)
library(here)

rna <- read.csv(here("data-raw", "gene_expression", "counts_rna_abundance.csv"))

# vectors for labels to be used for plots
knockout_labs <- c('wt' = 'wt',
                   'phi9' = expression(paste(Delta, phi, '9')),
                   'phi10' = expression(paste(Delta, phi, '10')),
                   'phi910' = expression(paste(Delta, phi, '9/', phi, '10')))
strain_labs <- c(
  'T7Hi' = 'wt',
  'phi9v2' = expression(paste(Delta, phi, '9'['wt'])),
  'phi910v2' = expression(paste(Delta, phi, '9/', phi, '10'['wt'])),
  'phi10' = expression(paste(Delta, phi, '10'['wt'])),
  '11-44' = expression(paste('10'['deop'])),
  '11-44-phi9v2' = expression(paste(Delta, phi, '9'['10'['deop']])),
  '11-44-phi10' = expression(paste(Delta, phi, '10'['10'['deop']])),
  '8st-9' = expression(paste(Delta, phi, '9'['8'[Delta]['stop']])),
  '8st-910' = expression(paste(Delta, phi, '9/', phi, '10'['8'[Delta]['stop']])),
  '910L2evo' = expression(paste(Delta, phi, '9/', phi, '10evo'['wt-L2'])),
  '8st-910evo' = expression(paste(Delta, phi, '9/', phi, '10evo'['8'[Delta]['stop']]))
)
back_labs <- c(
  'wt' = 'wt',
  '10deop'=expression(paste('10'['deop'])),
  '8st'=expression(paste('8'[Delta]['stop']))
)
# Set levels for genes and strain
rna$gene <- factor(rna$gene, levels=unique(rna$gene), ordered=TRUE)
rna$strain <- factor(rna$strain, 
                     levels=c('T7Hi', 'phi9v2', 'phi10', 'phi910v2', '910L2evo', 
                              '11-44', '11-44-phi9v2', '11-44-phi10', 
                              '8st-9', '8st-910', '8st-910evo'))


# Set levels for knockout and background for labeling purposes. 
rna$knockout <- factor(rna$knockout, 
                       levels=c('wt', 'phi9', 'phi10', 'phi910'))
rna$knockout1 <- factor(rna$knockout, 
                        levels=c('wt', 'phi9', 'phi10', 'phi910'),
                        labels=c(
                          'wt' = 'wt',
                          'phi9' = expression(paste(Delta, phi, '9')),
                          'phi10' = expression(paste(Delta, phi, '10')),
                          'phi910' = expression(paste(Delta, phi, '9/', phi, '10'))))
rna$background <- factor(rna$background, 
                         levels=c('wt', '10deop', '8st'),
                         labels=back_labs)


# Scatter plots of mean RNA abundance for mutants vs. wt
# calculate mean tpm for each gene grouped by strain, label gene 9 and 10A, output data frame
rna %>% filter(!gene=='10B', !grepl("evo|^11-44$", strain)) %>% 
  select(rep, background, gene, strain, tpm) %>% 
  group_by(strain, gene) %>% 
  summarize(mean_tpm = mean(tpm)) %>% 
  ungroup() %>%
  spread(strain, mean_tpm) %>% 
  mutate(label=if_else(grepl('^8|^9$|^10A$', gene), paste0(gene), '')) %>%
  gather(strain, tpm, phi9v2:`8st-910`) -> tpm_scatter

# lable information to be joined to tpm_scatter
labels <-data.frame(
  strain=c('phi9v2', 'phi910v2','phi10', '11-44', '11-44-phi9v2', '11-44-phi10', '8st-9', '8st-910', '8st-910evo', '910L2evo'),
  background=c('wt', 'wt', 'wt', '10deop', '10deop', '10deop', '8st', '8st', '8st', 'wt'),
  knockout=c('phi9', 'phi910', 'phi10', 'wt', 'phi9', 'phi10', 'phi9', 'phi910', 'phi910', 'phi910')
)

tpm_scatter <- tpm_scatter %>% left_join(labels)
tpm_scatter$background <- factor(tpm_scatter$background, 
                                 levels=c('wt', '10deop', '8st'),
                                 labels=back_labs)
tpm_scatter$knockout <- factor(tpm_scatter$knockout, 
                               levels=c('phi9', 'phi10', 'phi910'),
                               labels=c(
                                 'phi9' = expression(paste(Delta, phi, '9')),
                                 'phi10' = expression(paste(Delta, phi, '10')),
                                 'phi910' = expression(paste(Delta, phi, '9/', phi, '10'))))

tpm_scatter <- rename(
  tpm_scatter,
  tpm_wt = T7Hi,
  tpm_mutant = tpm
)

gene_expression <- tpm_scatter
devtools::use_data(gene_expression, overwrite = TRUE)
