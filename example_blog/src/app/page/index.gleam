import gleam/list
import lustre/attribute.{attribute}
import lustre/element.{type Element, html}
import app/component/header
import app/data/posts.{Post}

pub fn view(posts: List(Post)) -> Element(a) {
  let post_links = posts
    |> list.map(fn(post) {
        html.li([], [
          html.a([attribute.href("/blog/" <> post.id <> ".html")], [html.text(post.title)])
        ])
    })

  html.div([], [
    header.view(),
    html.h1([], [html.text("My Blog")]),
    html.ul([], post_links)
  ])
}
