## Four digit codes that are sometimes reported but mess up the dataset
four_digit_codes <- list(
  `HLA-A`    = c("02:01", "02:17", "02:20", "02:211", "02:24", "02:35", "03:01",
                 "03:02", "24:02", "24:07", "24:10", "30:04", "32:01", "33:01",
                 "34:02", "68:01", "68:02", "68:13", "80:01"),
  `HLA-B`    = c("07:02", "07:33", "08:01", "14:01", "14:02", "14:06", "15:01",
                 "15:04", "15:05", "15:07", "15:08", "15:10", "15:11", "15:13",
                 "15:16", "15:17", "15:24", "15:25", "15:27", "15:32", "15:39",
                 "18:01", "18:07", "27:02", "27:05", "27:07", "35:02", "35:05",
                 "35:08", "35:09", "35:17", "35:32", "35:64", "38:01", "38:02",
                 "39:06", "39:09", "39:10", "39:24", "40:06", "41:01", "41:02",
                 "42:01", "44:02", "44:03", "44:05", "47:01", "48:03", "49:01",
                 "50:01", "51:01", "51:07", "51:08", "53:01", "55:01", "57:03",
                 "82:02"),
  `HLA-C`    = c("01:02", "02:02", "02:26", "03:02", "03:03", "03:04", "04:01",
                 "04:03", "04:04", "05:01", "05:09", "07:01", "07:17", "07:27",
                 "12:02", "12:04", "16:01", "16:02", "16:04"),
  `HLA-DPB1` = c("01:01", "02:01", "03:01", "04:01", "04:02", "05:01", "09:01",
                 "11:01", "13:01", "15:01", "16:01", "20:01", "23:01", "26:01",
                 "35:01", "41:01", "46:01"),
  `HLA-DQB1` = c("02:01", "02:02", "02:07", "03:01", "03:02", "03:03", "03:04",
                 "05:01", "05:02", "05:03", "05:05", "05:11", "06:01", "06:02",
                 "06:03", "06:04", "06:07", "06:09", "06:11", "06:13", "06:15",
                 "06:18", "06:27", "06:79"),
  `HLA-DRB1` = c("01:01", "01:02", "01:11", "01:44", "03:01", "03:02", "03:04",
                 "03:05", "04:01", "04:02", "04:03", "04:04", "04:05", "04:06",
                 "04:07", "04:08", "04:10", "04:11", "04:56", "07:01", "08:01",
                 "08:02", "08:03", "08:04", "09:01", "10:01", "11:01", "11:02",
                 "11:04", "11:06", "11:08", "11:10", "11:11", "11:12", "11:13",
                 "11:14", "11:27", "12:02", "13:02", "13:03", "13:05", "13:33",
                 "13:61", "14:02", "14:05", "14:06", "14:07", "14:23", "15:01",
                 "15:03", "16:01")
)

#' Remove low resolution four-digit codes and cases of unknown alleles
#'
#' @param x A \code{\link{HLA}} object
#'
#' @export
clean_hla_data <- function(x) {
  assertive::assert_is_any_of(x, "HLA")
  #x <- x[!HLAsim:::chin(allele1, HLAsim:::four_digit_codes[[x$gene]]) &
  #         !HLAsim:::chin(allele2, HLAsim:::four_digit_codes[[x$gene]])]
  x <- x[field2(allele1) != "XXX" & field2(allele2) != "XXX"]
  x <- x[toupper(allele1) != "NEW" & toupper(allele2) != "NEW"]
  x
}

