#' Add nhs theme to ggplot chart
#'
#' @keywords nhs_style
#' @export
#' @examples
#' line <- ggplot(line_df, aes(x = year, y = lifeExp)) +
#' geom_line(colour = "#007f7f", size = 1) +
#' geom_hline(yintercept = 0, size = 1, colour="#333333") +
#' nhs_style()

nhs_style <- function() {
  font <- "Helvetica"

  ggplot2::theme(

  # chart title options
  plot.title = ggplot2::element_text(family = font,
                            size = 20,
                            face = "bold",
                            color = "#222222"),
  # chart sub-title options
  plot.subtitle = ggplot2::element_text(family = font,
                               size = 16,
                               margin = ggplot2::margin(9, 0, 9, 0)),
  plot.caption = ggplot2::element_blank(),
  # leave caption text empty

  # legend options
  legend.position = "top",
  legend.text.align = 0,
  legend.background = ggplot2::element_blank(),
  legend.title = ggplot2::element_blank(),
  legend.key = ggplot2::element_blank(),
  legend.text = ggplot2::element_text(family = font,
                             size = 16,
                             color = "#222222"),

  # axis options
  axis.title = ggplot2::element_text(family = font,
                           size = 14,
                           color = "#222222"),
  axis.text = ggplot2::element_text(family = font,
                           size = 12,
                           color = "#425563"),
  axis.text.x = ggplot2::element_text(margin = ggplot2::margin(5, b = 10)),
  axis.ticks = ggplot2::element_blank(),
  axis.line = ggplot2::element_blank(),

  # grid line options
  panel.grid.minor = ggplot2::element_blank(),
  panel.grid.major.y = ggplot2::element_line(color = "#cbcbcb"),
  panel.grid.major.x = ggplot2::element_blank(),

  # background options
  panel.background = ggplot2::element_blank(),
  strip.background = ggplot2::element_rect(fill = "white"),
  strip.text = ggplot2::element_text(size  = 18,  hjust = 0)
  )
  }

nhs_palettes <- list(
  nhs_blues = c("#005EB8", "#003087", "#0072CE", "#41B6E6", "#00A9CE"),
  nhs_regions = c("#FAD510", "#CB2314", "#273046", "#354823", "#1E1E1E")
)

# source: https://github.com/karthik/wesanderson
nhs_palette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)

  pal <- nhs_palettes[[name]]
  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what palette can offer")
  }

  out <- switch(type,
    continuous = grDevices::colorRampPalette(pal)(n),
    discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}
