#' Assign Template ID to a Batch
#' 
#' To digitize documents, create a template using the Captricity Web UI at \url{https://shreddr.captricity.com/job/} 
#' The template tells Captricity which data to get from where in the document.
#' Set the relevant document id using this function
#' 
#' @param batch_id Batch ID
#' @param template_id ID for the template
#' @export
#' @references \url{https://shreddr.captricity.com/developer/}
#' @examples \dontrun{
#' set_template_id("batch_id", "template_id)
#' }

set_batch_template <- function(batch_id="", template_id="")
{
    app_token = getOption("CaptricityToken")
    if( is.null(app_token)) stop("Please set application token using set_token('app_token').")
    
    if ( is.null(template_id) | template_id=="") stop("Provide a Valid Template ID.")
    if ( is.null(batch_id) | batch_id=="") stop("Provide a Valid Batch ID.")

    h <- new_handle()
    handle_setopt(h,  customrequest = "PUT")
    handle_setheaders(h, "Captricity-API-Token" = app_token)
    handle_setform(h, documents=as.character(template_id))

    tag_con    <- curl_fetch_memory(paste0("https://shreddr.captricity.com/api/v1/batch/", batch_id), handle=h)
    tag        <- rawToChar(tag_con$content)
    cat(tag)
    status     <- ifelse(tag_con$status_code==200, "Successfully Assigned", "Problem with the request")
    return(status)

}

