# Data to recrate figure from VOX, published here:
# https://www.vox.com/policy-and-politics/2017/12/21/16803312/chip-extension-congress-tax-cuts-obamacare-repeal
# (accessed: 12/23/2017)

CHIP_tax <- data.frame(
  amount = c(8, 1300, 415, 83),
  amount_text = c("$8 billion", "$1.3 trillion", "$415 billion", "$83 billion"),
  purpose = c("Extend CHIP for five years", "Cut the corporate tax rate to 21 percent",
              "Cut pass-through business taxes", "Roll back estate tax"),
  color = c("#64AD93", "#F77551", "#FFB440", "#FDCD43"),
  stringsAsFactors = FALSE)

devtools::use_data(CHIP_tax)
