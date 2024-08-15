#' Create a table with the name of the days to forecast
#'
#' @param nr_of_day_to_fcst
#'
#' @return
#' @export
#'
#' @examples
fct_create_week <-
  function(nr_of_day_to_fcst) {

 days_vector <-
   seq(today(), today()+nr_of_day_to_fcst, by="days") %>%
   tibble(raw_date = .) %>%
   mutate(week_day_nr = wday(raw_date)) %>%
   mutate(week_day=week_day_name$day_name[wday(raw_date)])

 return(days_vector)
}
