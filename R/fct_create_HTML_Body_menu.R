

fct_create_HTML_Body_menu <- function(msg,df) {


  start_date = min(df$date)
  stop_date = max(df$date)


html_body<-
  df %>%
  mutate(lunch_dinner = str_to_title(lunch_dinner)) %>%
  select(-weekday) %>%
  rename(Date = date) %>%
  rename("Lunch or Dinner" = lunch_dinner) %>%
  rename("Recipe" = recipe_name) %>%
  gt() %>%
  tab_header(
    title = "Menus for the week",
    subtitle = paste(start_date,stop_date,sep=" <-> ")
  ) %>%
  fmt_date(columns = Date,
           date_style = "wd_m_day_year") %>%
  cols_align(
    align = "left",
    columns = Date
  ) %>%
  cols_align(
    align = "center",
    columns = "Lunch or Dinner"
  )

# Convert df to raw HTML
html_body <- as_raw_html(html_body, inline_css = TRUE)
html_body <- paste("<h3>",msg,"</h3>",html_body)


return(html_body)

}



# Debug
if(FALSE) {

  df <- my_food_week

}
