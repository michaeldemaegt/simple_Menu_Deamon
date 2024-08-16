#' fct_send_mail : Send an email
#'
#' @param to
#' @param html_body
#'
#' @return
#' @export
#'
#' @examples
fct_send_email <- function(to,subject, html_body) {
  # Paste the header, the html_body and the footer together
  # The header and the footer are defined in the "Global Variables.R" file.
  msg <- paste(header, html_body, footer)

  # Convert the message into a mime_part
  msg <- mime_part(msg)

  ## Override content type.
  msg[["headers"]][["Content-Type"]] <- "text/html"


  # Send email
  sendmail(
    from = "info@savvyzebra.com",
    to = to,
    subject = subject,
    msg = list(msg),
    engine = "curl",
    control = list(smtpServer = "smtp://send.one.com:587", verbose = FALSE),
    engineopts = list(username = "info@savvyzebra.com", password = "Md:mi:vh:1969")
  )

}
