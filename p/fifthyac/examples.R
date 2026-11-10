ggplot(vcc) +
  geom_sf(aes(fill = pm2_5_in_the_air)) +
  scale_fill_viridis_c(option = "viridis") +
  geom_text(
    data = csuci_point,
    aes(X, Y, label = label),
    size = 5
  ) +
  geom_text(
    data = vc_point,
    aes(X, Y, label = label),
    size = 5
  ) +
  geom_text(
    data = hueneme_point,
    aes(X, Y, label = label),
    size = 5
  ) +
  theme_bw() +
  ggtitle("PM 2.5 In the Air") +
  theme(
    legend.position = "bottom",
    legend.title = element_blank(),
    axis.text = element_text(size = 24),
    legend.text = element_text(size = 24),
    #title = element_text(size = 18),
    legend.key.width = grid::unit(6, "cm"),
  ) +
  xlab("") +
  ylab("") +
  guides(size = "none")


ggplot(vcc) +
  geom_sf(aes(fill = traffic_proximity_and_volume)) +
  scale_fill_viridis_c(option = "viridis") +
  geom_text(
    data = csuci_point,
    aes(X, Y, label = label),
    size = 5
  ) +
  geom_text(
    data = vc_point,
    aes(X, Y, label = label),
    size = 5
  ) +
  geom_text(
    data = hueneme_point,
    aes(X, Y, label = label),
    size = 5
  ) +
  theme_bw() +
  ggtitle("Traffic Proximity and Volume") +
  theme(
    legend.position = "bottom",
    legend.title = element_blank(),
    axis.text = element_text(size = 24),
    legend.text = element_text(size = 24),
    #title = element_text(size = 18),
    legend.key.width = grid::unit(6, "cm"),
  ) +
  xlab("") +
  ylab("") +
  guides(size = "none")
