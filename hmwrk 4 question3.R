cars93 <- MASS::Cars93
ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(se = FALSE, method = "loess", formula = y ~ x, color = "#0072B2") +
  scale_x_continuous(
    name = "price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  ) +
  scale_y_continuous(name = "fuel-tank capacity\n(US gallons)")

library(MASS)
library(ggplot2)
library(mgcv)

cars93 <- MASS::Cars93

plot_with_smoothing <- function(method, color, title) {
  p <- ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
    geom_point(color = "grey60") +
    geom_smooth(se = TRUE, method = method, formula = y ~ x, color = color) +
    scale_x_continuous(
      name = "price (USD)",
      breaks = c(20, 40, 60),
      labels = c("$20,000", "$40,000", "$60,000")
    ) +
    scale_y_continuous(name = "fuel-tank capacity\n(US gallons)") +
    ggtitle(title) +
    theme(plot.title = element_text(size = 14, color = color))
  
  print(p)
}
methods_colors_titles <- list(
  list(method = "lm", color = "#8fe388", title = "Linear Model Smoothing"),
  list(method = "glm", color = "#fe8d6d", title = "Generalized Linear Model Smoothing"),
  list(method = "gam", color = "#7c6bea", title = "Generalized Additive Model Smoothing")
)

for (mct in methods_colors_titles) {
  plot_with_smoothing(mct$method, mct$color, mct$title)
}

