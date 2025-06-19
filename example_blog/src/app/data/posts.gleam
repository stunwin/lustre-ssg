import gleam/list
import gleam/dict
import lustre/ssg/djot
import simplifile
import lustre/element.{Element}
import tom

pub type Post {
  Post(
    id: String,
    title: String,
    date: String,
    content: List(Element(Nil))
  )
}

pub fn all() -> List(Post) {
  case simplifile.read_directory("./posts") {
    Ok(files) ->
      files
      |> list.filter(fn(name) { string.ends_with(name, ".dj") })
      |> list.map(load_post)
    Error(_) -> []
  }
}

fn load_post(filename: String) -> Post {
  let assert Ok(content) = simplifile.read("./posts/" <> filename)
  let assert Ok(elements) = djot.render_with_metadata(content, fn(metadata) {
    djot.default_renderer()
  })

  let Ok(meta) = djot.metadata(content)
  let title = case dict.get(meta, "title") { Ok(t) -> tom.to_string(t); _ -> "" }
  let date = case dict.get(meta, "date") { Ok(t) -> tom.to_string(t); _ -> "" }
  let id = string.drop_end(filename, 3) // remove .dj

  Post(id, title, date, elements)
}
