#' Theme to pair with aoba johsai color palette
#'
#'
#' @examples
theme_aoba <- function() {
  theme(
    # add border 1)
    panel.border = element_rect(colour = aoba_color("aqua2"), fill = NA, linetype = 1, linewidth = 0.1),
    # color background 2)
    panel.background = element_rect(fill = "white"),
    # change entire background
    plot.background = element_rect(fill = "white"),
    # modify grid 3)
    panel.grid.major.x = element_line(colour = aoba_color("aqua2"), linetype = 1, linewidth = 0.2),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.y =  element_line(colour = aoba_color("aqua2"), linetype = 1, linewidth = 0.2),
    panel.grid.minor.y = element_blank(),
    # modify text, axis and colour 4) and 5)
    axis.text = element_text(colour = aoba_color("aqua2"), face = "italic", family = "Times New Roman"),
    axis.title = element_text(colour = aoba_color("aqua2"), family = "Times New Roman", size = 13),
    axis.ticks = element_line(colour = aoba_color("aqua2"), linewidth = 0.2),
    # legend at the bottom 6)
    legend.position = "bottom",
    # title
    title = element_text(colour = aoba_color("aqua3"), family = "Times New Roman", size = 14, face = "bold")
  )
}
