
library(plotly) 

#Constants 
img_width = 1600 
img_height = 900 
scale_factor = 0.5 

fig <- plot_ly() %>% 
  add_trace( x= c(0, img_width ), 
             y= c(0, img_height ), 
             type = 'scatter',  mode = 'markers', alpha = 0)%>% 
  layout(images = list(  
    list(  
      source =  "figures/ocm_chl_anomaly.png",  
      x=0, 
      sizex=img_width, 
      y=0, 
      sizey=img_height, 
      xref="x", 
      yref="y", 
      opacity=1.0, 
      layer="below" 
    )  
  )) 

xconfig <- list( 
  title = "", 
  showgrid = FALSE, 
  range = c(0, img_width) 
) 

yconfig <- list( 
  title = "", 
  showgrid = FALSE, 
  range = c(img_height,0), 
  scaleanchor="x" 
) 

fig <- fig %>% layout(xaxis = xconfig, yaxis = yconfig) 

#Add lineshape 
#fig <- fig %>%  
#  add_segments(x = 650, xend = 1080, y = 380, yend = 180, line = list( color = #'cyan'),inherit = FALSE, showlegend = FALSE) 

fig <- fig %>% layout(dragmode='drawrect', 
                      newshape=list(line = list(color='cyan')), 
                      title = '') 

#Add modebar buttons 
fig <- fig %>%  
  config(modeBarButtonsToAdd = c('drawline', 
                                 'drawopenpath', 
                                 'drawclosedpath', 
                                 'drawcircle', 
                                 'drawrect', 
                                 'eraseshape',
                                 'drawarrow')) %>%
  layout(plot_bgcolor='#e5ecf6',  
         xaxis = list(  
           zerolinecolor = '#ffff',  
           zerolinewidth = 2,  
           gridcolor = 'ffff'),  
         yaxis = list(  
           zerolinecolor = '#ffff',  
           zerolinewidth = 2,  
           gridcolor = 'ffff')  
  )

fig


