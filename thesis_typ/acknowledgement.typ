#let acknowledgement() = {
  set page(
    margin: (left: 30mm, right: 30mm, top: 40mm, bottom: 40mm),
    numbering: none,
    number-align: center,
  )

  let body-font = "New Computer Modern"
  let sans-font = "New Computer Modern Sans"

  set text(
    font: body-font, 
    size: 12pt, 
    lang: "en"
  )

  set par(leading: 1em)

  
  // --- Acknowledgements ---
  align(left, text(font: sans-font, 2em, weight: 700,"Acknowledgements"))
  text[
    I would like to sincerely thank my supervisor Prof. Dr. Stephan Krusche for enabling and supporting this work. I would also like to thank the whole Artemis team for direct and indirect help and support throughout this thesis, and for having created such a vibrant environment where a constant influx of passionate students can contribute to real-world projects used by thousands of other students and instructors through their work and research. I would like to specifically mention members of the Apollon team Matthias Lehner and Alexander Görtzen for their continuous support and feedback.

    I would also express my sincere gratitude to my family and friends for their ever-present support and encouragement throughout my studies, specifically my fiancee Dr. Niyousha Karimi Paridari for accompanying me on this journey and making it a lot more enjoyable and memorable.
  ]
  v(15mm)
}