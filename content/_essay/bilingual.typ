// Chinese translations stay directly below the corresponding English block.
#let zh(id: none, content) = {
  set text(lang: "zh")
  let attrs = (class: "essay-translation", lang: "zh")
  if id != none { attrs.insert("id", "zh-" + id) }
  html.elem("div", attrs: attrs, content)
}

#let zh-caption(content) = {
  set text(lang: "zh")
  html.elem("span", attrs: (class: "essay-caption-translation", lang: "zh"), content)
}
