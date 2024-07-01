library(tidyverse)

dates <- tibble(
  Dates = seq(
    as.Date("2024-07-01"),
    as.Date("2024-12-31"),
    by = "days"
  )
) |>
  mutate(
    formated_date = format(Dates, format = "%d/%m/%y"),
    Weekdays = wday(Dates, label = TRUE, abbr = FALSE) |> as.character()
  ) |> 
  filter(Weekdays != "samedi",  Weekdays != "dimanche")

copypaste <- paste(dates$Weekdays, dates$formated_date, ":") |> 
  paste(sep = "\n")
