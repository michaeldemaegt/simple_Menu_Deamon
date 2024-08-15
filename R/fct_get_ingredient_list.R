fct_get_ingredient_list <-function()
{

  xlsxFile <- "Data/Source recepten.xlsx"

  raw_data <-
    openxlsx::read.xlsx(
      xlsxFile = xlsxFile, sheet = 1, skipEmptyRows = TRUE,
      detectDates = TRUE
    ) %>%
    janitor::clean_names() %>%
    dplyr::mutate(index_recipe_name = stringr::str_to_lower(recipe_name))

  return(raw_data)
}
