```{r}
marchpca<- read.csv("Marchpcadata.csv")
X <- data.frame(subset(marchpca, select = c(-1, -2, -3,-13, -14, -16,-15)))
prin_comp <- prcomp(X, rank. = 3)


components <- prin_comp[["x"]]
components <- data.frame(components)
components$PC2 <- -components$PC2
components$PC3 <- -components$PC3
components = cbind(components, marchpca$scmmodes)
library(plotly)
fig <- plot_ly(components, x = ~PC1, y = ~PC2, z = ~PC3, color = ~marchpca$scmmodes,
               colors = c('#636EFA','#EF553B','#00CC96') ) %>%
  add_markers(size = 12)


fig <- fig %>%
  layout(
    title = "tit",
    scene = list(bgcolor = "#fff")
  )

fig
```