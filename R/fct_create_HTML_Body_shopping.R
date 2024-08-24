#' fct_create_HTML_Body_shopping
#'
#' @param msg - Short message you want to add on top of the mail.
#' Will be inserted as an <h3>.
#' @param df - The actual dataframe containing the list of ingredients
#' planned for the week
#'
#' @return html_body
#' @export
#'
#' @examples
fct_create_HTML_Body_shopping <- function(msg, df) {
  html_body <-
    df %>%

    #' Rename the columns to be presentable and stream the dataframe
    #' throught gt()
    rename("Prefered Shop" = prefered_shop) %>%
    rename(Ingredient = ingredient) %>%
    rename(Amount = amount) %>%
    rename(Unit = unit) %>%
    rename(Servings = servings) %>%
    gt() %>%

    #' Improve the look and feel of the table.
    tab_header(title = "Shopping list for the week") %>%
    cols_align(align = "center", columns = Servings)

  #' Convert df to raw HTML as we want to concatenate
  #' HTM afterwards and that doesn't work with the df()
  #' datasructure

  html_body <- as_raw_html(html_body, inline_css = TRUE)

  #' Add the message (if any) on top op de html body
  html_body <- paste("<h3>", msg, "</h3>", html_body)

  #' Return the result after everythingis done
  return(html_body)
}
