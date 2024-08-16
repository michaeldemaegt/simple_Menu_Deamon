fct_get_choices_user <- function(my_food_week, my_week)
{
  exit_loop = FALSE

  while (exit_loop == FALSE) {
    fct_generate_screen(my_food_week, my_week)

    day_to_update <- str_to_upper(readline("Day to update (q=quit): "))
    lunch_or_dinner <- str_sub(str_to_lower(readline("Lunch or Dinner: ")), 1, 1)
    chosen_menu <- as.integer(readline("Chosen Menu: "))


    choice_valid = (day_to_update %in% LETTERS) &
      (lunch_or_dinner %in% c("l", "d")) &
      (is.integer(chosen_menu))

    if (day_to_update == "Q") {
      exit_loop = TRUE
    }

    if (choice_valid) {


      if (lunch_or_dinner == "l") {
        my_food_week$lunch_dinner[chosen_menu] <- "lunch"
        lunch_or_dinner = "lunch"

      } else {
        my_food_week$lunch_dinner[chosen_menu] <- "dinner"
        lunch_or_dinner = "dinner"
      }

      row_nr_to_update <- match(day_to_update, LETTERS)

      for (i in 1:NROW(my_food_week)) {
        if ((my_food_week$date[i] == as.character(my_week$raw_date[row_nr_to_update])) &
            (my_food_week$lunch_dinner[i] == lunch_or_dinner)) {
          my_food_week$date[i] = "NA"
          my_food_week$lunch_dinner[i] = NA
        }
      }

      my_food_week$date[chosen_menu] <- as.character(my_week$raw_date[row_nr_to_update])

    }

  }

  return(my_food_week)
}

