# https://github.com/dgrtwo/adventdrob/blob/db9dfb198cebfe1bd578fdbb0135a4925f0e3977/R/utils.R
parse_txt <- function(s, ...) {
  readr::parse_guess(s, locale = readr::locale("en", grouping_mark = ""))
}

split_txt <- function(s, sep = ",", parse = TRUE) {
  if (is.tbl(s)) {
    s <- s[[1]]
  }
  if (length(s) != 1) {
    stop("Expected a character vector of length 1, or table with one row")
  }

  ret <- stringr::str_split(s, sep)[[1]]

  if (parse) {
    ret <- parse_txt(ret)
  }
  ret
}

read_input <- function(input, parse = FALSE){
  txt <- readr::read_file(input)
  lines <- stringr::str_split(txt, "\n")[[1]]
  if (parse) {
    lines <- parse_txt(lines)
  }
  tibble::tibble(x = lines)
}
