#' Data input for `teal` app
#'
#' @description
#' `r lifecycle::badge("stable")`
#'
#' Function is a wrapper around [teal_data()] and guesses `join_keys`
#' for given datasets whose names match ADAM datasets names.
#'
#' @inheritParams teal_data
#' @param join_keys (`join_keys` or single `join_key_set`)
#' optional object with datasets column names used for joining.
#' If empty then it would be automatically derived basing on intersection of datasets primary keys.
#' For ADAM datasets it would be automatically derived.
#'
#' @return A `teal_data` object.
#'
#' @details This function checks if there were keys added to all data sets.
#'
#' @examples
#' data <- cdisc_data(
#'   join_keys = join_keys(
#'     join_key("ADSL", "ADTTE", c("STUDYID" = "STUDYID", "USUBJID" = "USUBJID"))
#'   )
#' )
#'
#' data <- within(data, {
#'   ADSL <- example_cdisc_data("ADSL")
#'   ADTTE <- example_cdisc_data("ADTTE")
#' })
#'
#' @export
#'
cdisc_data <- function(...,
                       join_keys = teal.data::default_cdisc_join_keys[names(rlang::list2(...))],
                       code = character(0)) {
  teal_data(..., join_keys = join_keys, code = code)
}
