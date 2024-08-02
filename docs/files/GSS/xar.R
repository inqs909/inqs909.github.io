library(xaringanthemer)



extra_css<-list(
".size10"=list("font-size"= "10%"),
".size20"=list( "font-size"= "20%"),
".size30"=list("font-size"= "30%"),
".size40"=list("font-size"= "40%"),
".size50"=list( "font-size"= "50%"),
".size60"=list("font-size"= "60%"),
".size70"=list("font-size"= "70%"),
".size80"=list( "font-size"= "80%"),
".size90"=list("font-size"= "90%"),
".size100"=list("font-size"= "100%"),
".size110"=list( "font-size"= "110%"),
".size120"=list("font-size"= "120%"),
".size130"=list( "font-size"= "130%"),
".size140"=list("font-size"= "140%"),
".size150"=list( "font-size"= "150%"),
".size160"=list("font-size"= "160%"),
".size170"=list("font-size"= "170%"),
".size180"=list( "font-size"= "180%"),
".size190"=list("font-size"= "190%"),
".size200"=list("font-size"= "200%"))





style_mono_light(
  base_color = "#1c5253",
  header_font_google = google_font("Josefin Sans"),
  text_font_google   = google_font("Montserrat", "300", "300i"),
  code_font_google   = google_font("Droid Mono"),
  base_font_size = "28px",
  header_h1_font_size ="2rem",
  header_h2_font_size ="1.75rem",
  header_h3_font_size ="1.25rem",
  extra_css = extra_css
)






