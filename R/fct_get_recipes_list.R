#' get_recipes_list
#' Get the raw data file from excel, remove all the ingredients
#' since we only need the name of the recipes.
#' I only add the source and page number to the recipe list
#' since this makes it easier to see where to find the recipe in the book
#' afterwards.
#'
#' @return
#' @export
#'
#' @examples
get_recipes_list <-function()
{

  #' Get the excel file located in the data directory.
  #' The xlsxFile is determined in the Global Variables.R
  #' Clean the column names and mutate the recipe names to include
  #' the name and page of the book where the recipe is located.
  raw_data <-
    openxlsx::read.xlsx(
      xlsxFile = xlsxFile,
      sheet = 1,
      skipEmptyRows = TRUE,
      detectDates = TRUE
    ) %>%
    janitor::clean_names() %>%
    dplyr::mutate(index_recipe_name = stringr::str_to_lower(recipe_name)) %>%
    mutate(source = paste0(source," p.",page))

  #' Eliminate all the junk I don't need and sort by recipe name
  recipes_list <-
    raw_data %>%
    dplyr::select(source,recipe_name) %>%
    unique() %>%
    dplyr::arrange(recipe_name)

  # Return the finished job
  return(recipes_list)
}
