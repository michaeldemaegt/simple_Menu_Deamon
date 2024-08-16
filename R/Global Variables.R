# Raw data file of the recipes
xlsxFile <- "Data/Source recepten.xlsx"


# Weekday name
week_day_name <- tribble(
  ~day_number,~day_name,
  1,"Sunday",
  2,"Monday",
  3,"Tueday",
  4,"Wednesday",
  5,"Thursday",
  6,"Friday",
  7,"Saturday"
)


#Email adress to send to
from = "info@savvyzebra.com"
to = "mdemaegt@yahoo.com"

# HTML Header and Footer
header <- '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0
Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>HTML demo</title>
        <style type="text/css">
          </style>
          </head>
          <body>'

footer <- '</body>
          </html>'


# HTML Header and Footer
test <- '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0
Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>HTML demo</title>
        <style type="text/css">
          </style>
          </head>
          <body>TEST</body>
          </html>'


mike <- paste0(header,"TEST",footer)

mike==test


