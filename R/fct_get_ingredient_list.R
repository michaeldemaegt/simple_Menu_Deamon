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



  raw_data$location <- factor(raw_data$location, levels = c("Wijn","Vlees","Droge Voeding","Groenten & Fruit","Kaas"))

  return(raw_data)
}
