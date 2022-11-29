# Tell the aoc package which defaults to use ----
# aoc is a usethis-style functions for Advent of Code puzzles
# (see dev/02_dev.R for dependencies)
# Edit .RProfile and add options lines
usethis::edit_r_profile(scope = "project")
# example: options(aoc.year = 2017, aoc.package = "awesomeadvent2017")

## Create Common Files ----
## See ?usethis for more information
usethis::use_gpl_license(version = 3)  # You can set another license here

## Use git ----
usethis::use_git()

# You're now set! ----

# go to dev/02_dev.R
rstudioapi::navigateToFile( "dev/02_dev.R" )
