

fct_create_HTML_Body_shopping <- function(msg,df) {


html_body<-
  df %>%
  rename("Prefered Shop" = prefered_shop) %>%
  rename(Ingredient = ingredient) %>%
  rename(Amount = amount) %>%
  rename(Unit = unit) %>%
  rename(Servings = servings) %>%
  gt() %>%
  tab_header(
    title = "Shopping list for the week") %>%
  cols_align(
    align = "center",
    columns = Servings
  )

# Convert df to raw HTML
html_body <- as_raw_html(html_body, inline_css = TRUE)
html_body <- paste("<h3>",msg,"</h3>",html_body)


return(html_body)

}



# Debug
if(FALSE) {

  df <- shopping_list

}
