#let abstract_en() = {
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

  set par(
    leading: 1em,
    justify: true
  )

  
  // --- Abstract (DE) ---
  v(1fr)
  align(center, text(font: body-font, 1em, weight: "semibold", "Abstract"))
  
  text[
    // 1. *paragraph:* What is the motivation of your thesis? Why is it interesting from a scientific point of view? Which main problem do you like to solve?
    UML diagrams play a pivotal role in design and development of software systems. Inherent difficulties in adoption of UML diagrams underscore the need for modeling tools with a strong learning focus. Apollon is such a project, an open-source web-based tool, designed to be integrated into other projects such as other online educational platforms, and developed and maintained mostly by students in the context of bachelor's or master's thesis. It is, however, lacking in features that would allow realtime collaboration either in an educational or an industrial setting.

    // 2. *paragraph:* What is the purpose of the document? What is the main content, the main contribution?
    This thesis outlines a solution to extend Apollon with realtime collaboration capabilities, allowing multiple users to work on the same diagram simultaneously. The main contribution of this thesis is the design and implementation of realtime collaboration features for Apollon, keeping integration of Apollon and use of these features straightforward for platforms aiming to integrate it, while also retaining a simple and maintainable architecture suitable to Apollon's unique development process. Present work also includes a theoretical analysis of the implemented solution, proposing sufficient theoretical conditions for its application beyond the scope of Apollon and UML diagrams.

    // 3. *paragraph:* What is your methodology? How do you proceed?
    To achieve this, classic and modern approaches to realtime collaboration and distributed state management are studied. In particular, Conflict-free replicated data types (CRDTs) are considered as their distributed design perfectly matches the requirement of simplicity of integration into other platforms. A solution inspired by these approaches is proposed, resulting from relaxing some constraints in favor of simpler architectural design and lower resource overhead. The solution is then implemented and tested in Apollon, and its theoretical properties are analysed.
  ]
  
  v(1fr)
}