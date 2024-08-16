

fct_generate_screen <- function(my_food_week,my_week) {

  # How long is the longest line in the list of available menu?
  max_rows <-
    max(nrow(my_food_week),nrow(my_week))

  max_length_menu_name <- max(str_length(my_food_week$recipe_name)) + 15
  cte_max_length_menu_name <- max_length_menu_name

   # Clear Screen
  cat("\f")

  first_line <- str_pad("Available Menus",
                        max_length_menu_name,
                        side= "right",
                        pad=" ")
  first_line <- paste0(first_line,"Your Week\n\n")

  cat(first_line)



  for(i in 1:max_rows) {

    # Check what recipe has been chose for lunch
    # if any
    lunch <-
      my_food_week %>%
      filter(lunch_dinner=="lunch") %>%
      filter(date==as.character(my_week$raw_date[i])) %>%
      select(recipe_name) %>%
      pull(recipe_name)

        if(identical(lunch, character(0))) {
      lunch = ""
    }

    # Check what recipe has been chose for dinner
    # if any
    dinner <-
      my_food_week %>%
      filter(lunch_dinner=="dinner") %>%
      filter(date==as.character(my_week$raw_date[i])) %>%
      select(recipe_name) %>%
      pull(recipe_name)

    if(identical(dinner, character(0))) {
      dinner = ""
    }


    if(i==10) {max_length_menu_name = max_length_menu_name-1}

    this_line <- paste0(i,". ")

    if(i>nrow(my_food_week))
    {
      this_line <- paste0(this_line,
                          str_pad(this_line,max_length_menu_name))
    } else {
      this_line <- paste0(this_line,
                          str_pad(my_food_week$recipe_name[i],
                           max_length_menu_name,
                           side= "right",
                           pad=" "))
    }

    if(i>nrow(my_week))
    {
    } else {
      this_line <- paste0(this_line,LETTERS[i],". ",
                          str_pad(my_week$week_day[i],
                                  10,
                                  side = "right",
                                  pad=" "),
                          "\t",
                          str_pad(paste0("Lunch: ",
                                         lunch),
                                  cte_max_length_menu_name,
                                  side= "right",
                                  pad=" "),
                          str_pad(paste0("Dinner: ",
                                         dinner),
                                  cte_max_length_menu_name,
                                  side= "right",
                                  pad=" "))
    }

    # Add a cariage return at the end of the line
    this_line <- paste0(this_line,"\n")

   cat(this_line)
  }
}



# Debug

if(FALSE) {


  str_pad(my_food_week$recipe_name[i],50,
          side= "right",
          pad=" ")

}
