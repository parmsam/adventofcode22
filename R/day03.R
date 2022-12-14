#' Day 03: Rucksack Reorganization
#'
#' [Rucksack Reorganization](https://adventofcode.com/2022/day/3)
#'
#' @name day03
#' @rdname day03
#' @details
#'
#' **Part One**
#'
#' One Elf has the important job of loading all of the
#' [rucksacks](https://en.wikipedia.org/wiki/Rucksack){target="_blank"}
#' with supplies for the
#' [jungle]{title="Where there's jungle, there's hijinxs."} journey.
#' Unfortunately, that Elf didn\'t quite follow the packing instructions,
#' and so a few items now need to be rearranged.
#'
#' Each rucksack has two large *compartments*. All items of a given type
#' are meant to go into exactly one of the two compartments. The Elf that
#' did the packing failed to follow this rule for exactly one item type per
#' rucksack.
#'
#' The Elves have made a list of all of the items currently in each
#' rucksack (your puzzle input), but they need your help finding the
#' errors. Every item type is identified by a single lowercase or uppercase
#' letter (that is, `a` and `A` refer to different types of items).
#'
#' The list of items for each rucksack is given as characters all on a
#' single line. A given rucksack always has the same number of items in
#' each of its two compartments, so the first half of the characters
#' represent items in the first compartment, while the second half of the
#' characters represent items in the second compartment.
#'
#' For example, suppose you have the following list of contents from six
#' rucksacks:
#'
#'     vJrwpWtwJgWrhcsFMMfFFhFp
#'     jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
#'     PmmdzqPrVvPwwTWBwg
#'     wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
#'     ttgJtRGJQctTZtZT
#'     CrZsJsPPZsGzwwsLwLmpwMDw
#'
#' -   The first rucksack contains the items `vJrwpWtwJgWrhcsFMMfFFhFp`,
#'     which means its first compartment contains the items `vJrwpWtwJgWr`,
#'     while the second compartment contains the items `hcsFMMfFFhFp`. The
#'     only item type that appears in both compartments is lowercase *`p`*.
#' -   The second rucksack\'s compartments contain `jqHRNqRjqzjGDLGL` and
#'     `rsFMfFZSrLrFZsSL`. The only item type that appears in both
#'     compartments is uppercase *`L`*.
#' -   The third rucksack\'s compartments contain `PmmdzqPrV` and
#'     `vPwwTWBwg`; the only common item type is uppercase *`P`*.
#' -   The fourth rucksack\'s compartments only share item type *`v`*.
#' -   The fifth rucksack\'s compartments only share item type *`t`*.
#' -   The sixth rucksack\'s compartments only share item type *`s`*.
#'
#' To help prioritize item rearrangement, every item type can be converted
#' to a *priority*:
#'
#' -   Lowercase item types `a` through `z` have priorities 1 through 26.
#' -   Uppercase item types `A` through `Z` have priorities 27 through 52.
#'
#' In the above example, the priority of the item type that appears in both
#' compartments of each rucksack is 16 (`p`), 38 (`L`), 42 (`P`), 22 (`v`),
#' 20 (`t`), and 19 (`s`); the sum of these is *`157`*.
#'
#' Find the item type that appears in both compartments of each rucksack.
#' *What is the sum of the priorities of those item types?*
#'
#' **Part Two**
#'
#' *(Use have to manually add this yourself.)*
#'
#' *(Try using `convert_clipboard_html_to_roxygen_md()`)*
#'
#' @param x some data
#' @return For Part One, `f03a(x)` returns .... For Part Two,
#'   `f03b(x)` returns ....
#' @export
#' @examples
#' f03a(example_data_03())
#' f03b()
f03a <- function(x) {
  x %>%
    mutate(y = map(x, function(x) c(substr(x, 1, nchar(x)/2),
                                    substr(x, nchar(x)/2+1, nchar(x))) )) %>%
    separate(y, into= c("a", "b", "c")) %>%
    mutate(z = map2(b, c, function(b,c) intersect(str_split(b, "")[[1]],
                                                  str_split(c, "")[[1]]) )) %>%
    mutate(z = unlist(z)) %>%
    mutate(score = priority_dict[z]) %>%
    summarize(sum(score))
}


#' @rdname day03
#' @export
f03b <- function(x) {
  x %>%
    mutate(grp = rep(c("b","c","d"), length.out = nrow(.))) %>%
    pivot_wider(names_from = grp, values_from = x) %>%
    unnest(cols = c(b, c, d)) %>%
    rowwise() %>%
    mutate(z = intersect_all(str_split(b, "")[[1]],
                             str_split(c, "")[[1]],
                             str_split(d, "")[[1]])) %>%
    ungroup() %>%
    mutate(score = priority_dict[z]) %>%
    summarize(sum(score))


}

f03_helper <- function(x) {

}

intersect_all <- function(a,b,...){
  Reduce(intersect, list(a,b,...))
}

priority_dict <- c(1:52)
names(priority_dict) <-c(str_to_lower(LETTERS), LETTERS)

#' @param example Which example data to use (by position or name). Defaults to
#'   1.
#' @rdname day03
#' @export
example_data_03 <- function(example = 1) {
  l <- list(
    a = c(


    )
  )
  l[[example]]
}
