#' fct_create_HTML_Body_menu
#'
#' @param msg - Short message you want to add on top of the mail.
#' Will be inserted as an <h3>.
#' @param df - The actual dataframe containing the list of menus
#' planned for the week
#'
#' @return html_body. Contains the table transformed and improved in HTML
#' with the msg on top.
#' @export
#'
#' @examples
fct_create_HTML_Body_menu <- function(msg, df) {

  #' We want to create a header op top of the table that lets the reader
  #' know from when till when the menus are for.
  #' That's why we extract the start and end date of the menu list.
  start_date = min(df$date)
  stop_date = max(df$date)


  #' Create the HTML based on the table
  html_body <-
    df %>%

    #' Make sure the first letter of the menu is always capital.
    mutate(lunch_dinner = str_to_title(lunch_dinner)) %>%

    # We are not interested in the weekdays, so they go out.
    select(-weekday) %>%

    # Rename the columns
    rename(Date = date) %>%
    rename("Lunch or Dinner" = lunch_dinner) %>%
    rename("Recipe" = recipe_name) %>%

    #' And stream the table through gt()
    gt() %>%

    #' Create the tab header
    #' Example: Menus for the week 2024-11-3 <-> 2024-11-8
    tab_header(title = "Menus for the week",
               subtitle = paste(start_date, stop_date, sep = " <-> ")) %>%

    #' Convert the date into a more agreeably format.
    fmt_date(columns = Date, date_style = "wd_m_day_year") %>%

    #' Align the different columns as preferred.
    cols_align(align = "left", columns = Date) %>%
    cols_align(align = "center", columns = "Lunch or Dinner")

  #' Convert df to raw HTML since the dt format can not be modified
  #' or appended to.
  html_body <- as_raw_html(html_body, inline_css = TRUE)
  html_body <- paste("<h3>", msg, "</h3>", html_body)

  #' Return the html_body wants to the job is done.
  return(html_body)

}

