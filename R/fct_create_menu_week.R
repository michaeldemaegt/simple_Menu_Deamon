

fct_create_menu_week <- function(recipes_list) {

  recipes_list <-
    recipes_list %>%
    mutate(date = "NA",
           lunch_dinner = NA)

  return(recipes_list)

}
