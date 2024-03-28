#let dex = counter(label("Definition"))
#let definition(content) = {
  dex.step()
  block(
   width: 100%,
   [ *Definition #dex.display()*. #content ]
  )
}

#let pex = counter(label("Proposition"))
#let proposition(content) = {
  pex.step()
  block(
   width: 100%,
   [ *Proposition #pex.display()*. #content ]
  )
}

#let proved() = {
  text(dir: rtl, $square.filled$ + v(.2em))
}

#let proof(content, inline: false) = {
  if not inline [
    _Proof_.
  ]
  content
  proved()
}
