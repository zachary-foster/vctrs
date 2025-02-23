#' Combine many vectors into one vector
#'
#' Combine all arguments into a new vector of common type.
#'
#' @section Invariants:
#' * `vec_size(vec_c(x, y)) == vec_size(x) + vec_size(y)`
#' * `vec_type(vec_c(x, y)) == vec_type_common(x, y)`.
#'
#' @param ... Vectors to coerce.
#' @return A vector with class given by `.ptype`, and length equal to the
#'   sum of the `vec_size()` of the contents of `...`.
#'
#'   The vector will have names if the individual components have names
#'   (inner names) or if the arguments are named (outer names). If both
#'   inner and outer names are present, they are combined with a `.`.
#' @inheritParams vec_ptype
#' @seealso [vec_cbind()]/[vec_rbind()] for combining data frames by rows
#'   or columns.
#' @export
#' @examples
#' vec_c(FALSE, 1L, 1.5)
#' vec_c(FALSE, 1L, "x", .ptype = character())
#'
#' # Date/times --------------------------
#' c(Sys.Date(), Sys.time())
#' c(Sys.time(), Sys.Date())
#'
#' vec_c(Sys.Date(), Sys.time())
#' vec_c(Sys.time(), Sys.Date())
#'
#' # Factors -----------------------------
#' c(factor("a"), factor("b"))
#' vec_c(factor("a"), factor("b"))
vec_c <- function(..., .ptype = NULL) {
  .External2(vctrs_c, .ptype)
}
