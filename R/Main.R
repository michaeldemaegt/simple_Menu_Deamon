source("R/Load Libraries.R")
source("R/Global Variables.R")
source("R/Load Functions.R")


recipe_list <- fct_get_ingredient_list()

my_food_week <-
  fct_create_menu_week(get_recipes_list()) %>%
  mutate(recipe_name = paste0(recipe_name, " [", source, "]")) %>%
  select(-source)


cat("\f")
nr_of_day_to_fcst <-
  as.integer(readline("For how many days do you want to define the menu (including today)? :"))

my_week <-
  fct_create_week(nr_of_day_to_fcst)

my_food_week <-
  fct_get_choices_user(my_food_week, my_week) %>%
  filter(date != "NA") %>%
  mutate(weekday = wday(date))


shopping_list <-
  my_food_week %>%
  filter(date != "NA") %>%

  mutate(recipe_name = str_trim(str_replace(recipe_name, "\\[.*", ""), side =
                                  "both")) %>%
  left_join(recipe_list,by = join_by(recipe_name)) %>%
  group_by(location, ingredient, prefered_shop, unit) %>%
  summarise(amount = sum(amount, na.rm = TRUE), servings = n()) %>%
  ungroup() %>%
  arrange(location,prefered_shop,ingredient) %>%
  select(prefered_shop, ingredient, amount, unit, servings)

write.xlsx(shopping_list, file = "Shopping List.xlsx", overwrite = TRUE)


my_food_week$lunch_dinner <- factor(my_food_week$lunch_dinner, levels = c("lunch", "dinner"))

my_food_week <-
  my_food_week %>%
  filter(date != "NA") %>%
  mutate(weekday = wday(date)) %>%
  arrange(date, lunch_dinner) %>%
  mutate(weekday = week_day_name$day_name[weekday]) %>%
  select(weekday, date, lunch_dinner, recipe_name)

write.xlsx(my_food_week, file = "What do we eat.xlsx", overwrite = TRUE)


### Create the email telling what we are going to eat
print("Mailing Menu List")
to <- c("mdemaegt@yahoo.com","mdemaegt@icloud.com")
msg <- ""

# Create subject line
start_date = min(my_food_week$date)
stop_date = max(my_food_week$date)
subject = paste0("Menu from ", start_date, " to ", stop_date)


html_body <-
  fct_create_HTML_Body_menu(msg, my_food_week)

x <- fct_send_email(to, subject = subject, html_body)



### Create the email telling what to shop for
print("Mailing Shopping List")
to <- c("mdemaegt@yahoo.com","mdemaegt@icloud.com")
msg <- ""

# Create subject line
start_date = min(my_food_week$date)
stop_date = max(my_food_week$date)

subject = paste0("Shopping List from ", start_date, " to ", stop_date)


html_body <-
  fct_create_HTML_Body_shopping(msg, shopping_list)

x <- fct_send_email(to, subject = subject, html_body)






