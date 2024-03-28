#let abstract_de() = {
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

  
  // --- Abstract (EN) ---
  v(1fr)
  align(center, text(font: body-font, 1em, weight: "semibold", "Zusammenfassung"))
  
  text[
    UML-Diagramme spielen eine zentrale Rolle bei der Konzeption und Entwicklung von Softwaresystemen. Die inhärenten Schwierigkeiten bei der Übernahme von UML-Diagrammen unterstreichen den Bedarf an Modellierungswerkzeugen mit einem starken Lernfokus. Apollon ist ein solches Projekt, ein quelloffenes, webbasiertes Werkzeug, das so konzipiert ist, dass es in andere Projekte, wie z. B. andere Bildungsplattformen, integriert werden kann, und das hauptsächlich von Studenten im Rahmen von Bachelor- oder Masterarbeiten entwickelt und gepflegt wird. Es fehlt jedoch an Funktionen, die eine Echtzeit-Zusammenarbeit entweder in der Ausbildung oder in der Industrie ermöglichen würden.

    Diese Arbeit skizziert eine Lösung zur Erweiterung von Apollon um Echtzeit-Kollaborationsfunktionen, die es mehreren Benutzern ermöglichen, gleichzeitig an demselben Diagramm zu arbeiten. Der Hauptbeitrag dieser Arbeit ist der Entwurf und die Implementierung von Echtzeit-Kollaborationsfunktionen für Apollon, wobei die Integration von Apollon und die Nutzung dieser Funktionen für Plattformen, die es integrieren wollen, einfach gehalten wird, während gleichzeitig eine einfache und wartbare Architektur beibehalten wird, die für den einzigartigen Entwicklungsprozess von Apollon geeignet ist. Die vorliegende Arbeit beinhaltet auch eine theoretische Analyse der implementierten Lösung und schlägt ausreichende theoretische Bedingungen für ihre Anwendung über den Rahmen von Apollon und UML-Diagrammen hinaus vor.

    Um dies zu erreichen, werden klassische und moderne Ansätze zur Echtzeit-Zusammenarbeit und verteilten Zustandsverwaltung untersucht. Insbesondere werden konfliktfrei replizierte Datentypen (Conflict-free replicated data types, CRDTs) betrachtet, da ihr verteiltes Design perfekt zu den Anforderungen einer einfachen Integration in andere Plattformen passt. Es wird eine von diesen Ansätzen inspirierte Lösung vorgeschlagen, die sich aus der Lockerung einiger Einschränkungen zugunsten eines einfacheren Architekturdesigns und eines geringeren Ressourcen-Overheads ergibt. Die Lösung wird dann in Apollon implementiert und getestet, und ihre theoretischen Eigenschaften werden analysiert.
  ]
  
  v(1fr)
}