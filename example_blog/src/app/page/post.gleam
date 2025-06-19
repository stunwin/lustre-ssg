import lustre/element.{type Element, html}
import app/component/header
import app/data/posts.{Post}

pub fn view(post: Post) -> Element(a) {
  html.div([], [
    header.view(),
    html.h1([], [html.text(post.title)]),
    html.p([], [html.text(post.date)]),
    html.div([], post.content)
  ])
}
