import gleam/io
import gleam/list
import gleam/dict
import lustre/ssg
import app/data/posts
import app/page/index
import app/page/about
import app/page/post

pub fn main() {
  let posts = posts.all()
  let post_map =
    list.map(posts, fn(p) { #(p.id, p) })
    |> dict.from_list()

  let result =
    ssg.new("./priv")
    |> ssg.add_static_route("/", index.view(posts))
    |> ssg.add_static_route("/about", about.view())
    |> ssg.add_dynamic_route("/blog", post_map, post.view)
    |> ssg.build

  case result {
    Ok(_) -> io.println("Build succeeded")
    Error(e) -> io.debug(e)
  }
}
