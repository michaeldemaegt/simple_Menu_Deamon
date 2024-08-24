#' fct_create_menu_week - Create a menu data structure by taking the
#' list of recipes and adding a date column and a lunch_dinner column.
#' The date column will store the date this menu will be prepared and
#' the lunch_dinner column defines if this menu is for lunch or dinner.
#' This choice of structure automatically also implies that
#' you can only use each menu ones.
#'
#' @param recipes_list
#'
#' @return recipes_list
#' @export
#'
#' @examples
fct_create_menu_week <- function(recipes_list) {

  recipes_list <-
    recipes_list %>%

    #' Add the date and lunch_dinner column.
    mutate(date = "NA",
           lunch_dinner = NA)

  return(recipes_list)

}
