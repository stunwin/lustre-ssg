import lustre/element.{type Element, html}
import app/component/header

pub fn view() -> Element(a) {
  html.div([], [
    header.view(),
    html.h1([], [html.text("About")]),
    html.p([], [html.text("This is a small example blog using lustre_ssg")])
  ])
}
