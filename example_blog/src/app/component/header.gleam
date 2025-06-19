import lustre/element.{element, type Element, html}
import lustre/attribute.{attribute}

pub fn view() -> Element(a) {
  html.nav([], [
    html.a([attribute.href("/index.html")], [html.text("Home")]),
    html.text(" | "),
    html.a([attribute.href("/about.html")], [html.text("About")])
  ])
}
