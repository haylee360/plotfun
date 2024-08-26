# First, create a named vector of color list. Any editing of colors will be done here.
# Tip: use back ticks to remove naming restrictions (e.g., to include spaces for `light grey` and `dark grey`).
aoba_colors <- c(
  `white` = "#ffffff",
  `bright aqua` = "#00fffb",
  `aqua` = "#a5f9f1",
  `aqua2` = "#79c6c6",
  `aqua3` = "#277a79",
  `light brown` = "#612c21",
  `brown` = "#49212a",
  `grey` = "#343434",
  `black` = "#141414")

#' Function to extract aoba johsai colors as hex codes
#'
#' @param ... character names of aoba johsai colors
#'
#' @return color hex code
#' @export
#'
#' @examples aoba_color("aqua")
aoba_color <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return (aoba_colors)

  aoba_colors[cols]
}

# Combine colors into palettes
aoba_palettes <- list(
  `main`  = aoba_color("white", "aqua", "aqua2"),

  `cool`  = aoba_color("white", "aqua"),

  `warm`   = aoba_color("white", "light brown", "brown"),

  `bright` = aoba_color("white", "bright aqua", "black"),

  `grey`  = aoba_color("white", "grey", "black,"),

  `aqua` = aoba_color("bright aqua", "aqua", "aqua2", "aqua3")
)


#' Color scale constructor for Aoba Johsai colors
#'
#' @param palette Character name of palette aoba_palette
#' @param reverse  Boolean indicating whether palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette
#'
#' @return color palette hex codes
#' @export
#'
#' @examples aoba_pal("cool")
#' aoba_pal("warm")(5)
aoba_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- aoba_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)
}

#' Color scale constructor for Aoba Johsai colors
#'
#' @param palette Character name of palette in aoba_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#' scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#'
#' @examples  p + scale_color_aoba()
#' p + scale_color_aoba(discrete = FALSE, palette = "cool")
scale_color_aoba <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- aoba_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("aoba_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale constructor for aoba colors
#'
#' @param palette Character name of palette in aoba_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'  scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#'
#' @examples p + scale_fill_aoba(palette = "bright", guide = "none")
scale_fill_aoba <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- aoba_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("aoba_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}
