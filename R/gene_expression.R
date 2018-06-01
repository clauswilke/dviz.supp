#' Gene-expression measurements for various mutants of bacteriophage T7
#'
#' This dataset contains gene expression measurements for 59 genes of bacteriophage T7,
#' measured for various modified T7 genomes.
#' 
#' @source 
#' M. L. Paff, B. R. Jack, B. L. Smith, J. J. Bull, C. O. Wilke (2018). Combinatorial
#' approaches to viral attenuation. bioRxiv 299180. http://dx.doi.org/10.1101/299180
#' @examples 
#' gene_expression %>% 
#'   filter(strain == "phi9v2" & background == "wt") %>%
#'   ggplot(aes(x=tpm_wt, y=tpm_mutant)) +
#'   geom_abline(slope = 1, color = "grey") +
#'   geom_text_repel(
#'     aes(label = label),
#'     nudge_y = -0.005,
#'     fontface = "italic",
#'     segment.color = NA) +
#'   geom_point() +
#'   scale_x_log10(limits = c(3e-4, .3), name = "wild-type RNA abundance (TPM)") + 
#'   scale_y_log10(limits = c(3e-4, .3), name = "mutant RNA abundance (TPM)") +
#'   coord_fixed()
"gene_expression"