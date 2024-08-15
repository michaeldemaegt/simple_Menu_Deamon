get_recipes_list <-function()
{

  xlsxFile <- "Data/Source recepten.xlsx"

  raw_data <-
    openxlsx::read.xlsx(
      xlsxFile = xlsxFile, sheet = 1, skipEmptyRows = TRUE,
      detectDates = TRUE
    ) %>%
    janitor::clean_names() %>%
    dplyr::mutate(index_recipe_name = stringr::str_to_lower(recipe_name))



  recipes_list <-
    raw_data %>%
    dplyr::select(recipe_name) %>%
    unique() %>%
    dplyr::arrange(recipe_name)


  return(recipes_list)
}
