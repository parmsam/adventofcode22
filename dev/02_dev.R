## Dependencies ----
## Add one line by package you want to add as dependency
usethis::use_dev_package( "aoc", remote = "github::tjmahr/aoc" )
usethis::use_package( "readr" )
usethis::use_package( "dplyr" )
usethis::use_package( "stringr" )
usethis::use_package( "lubridate" )
usethis::use_package( "glue" )
usethis::use_package( "purrr" )

## Use pipe ----
usethis::use_pipe(export = TRUE)

# Use cookie file ----
# Store your aoc cookie in file named .aoccookie
# use_day() will automatically use this cookie when downloading puzzle input.
# add .aoccookie file to your gitignore dotfile
usethis::use_git_ignore(".aoccookie")

# Setup each aoc day as you work ----
aoc::use_day(1)

## Setup Github ----
usethis::use_github()
