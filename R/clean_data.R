library(tidyverse)

happiness <- read_csv("../data/world_happiness.csv") |> 
  mutate(latin_america = region == "Latin America & Caribbean") |> 
  mutate(happiness_binary = happiness_score >= 5)
write_csv(happiness, "../data/happiness.csv")

library(bayesrules)


# Equality for Poisson
data(equality_index, package = "bayesrules")

equality <- equality_index |> 
  # Omit California because it has so many laws already
  filter(state != "california")

write_csv(equality, "../data/equality.csv")


penguins <- palmerpenguins::penguins |> 
  drop_na(sex)
write_csv(penguins, "../data/penguins.csv")

# impartial <- read_csv("https://marginaleffects.com/data/impartiality.csv")

# penguins <- palmerpenguins::penguins |> 
#   tidyr::drop_na(sex) |> 
#   dplyr::mutate(is_gentoo = species == "Gentoo")



# model <- glm(
#   is_gentoo ~ bill_length_mm + body_mass_g + sex,
#   data = penguins,
#   family = binomial(link = "logit")
# )
# parameters::model_parameters(model)

# plot_predictions(model, condition = c("body_mass_g", "sex"))
