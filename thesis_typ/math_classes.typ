#let sees = math.class(
  "relation",
  sym.lt.tri
)

#let sharesscope = math.class(
  "relation",
  sym.eq.delta
)

#let blindto = math.class(
  "relation",
  sym.lt.tri.not
)

#let selects = math.class(
  "relation",
  sym.lt.tri.eq
)

#let success = math.class(
  "normal",
  sym.circle.filled
)

#let semisuccess = math.class(
  "normal",
  sym.ast.circle
)

#let failure = math.class(
  "normal",
  sym.circle.stroked
)