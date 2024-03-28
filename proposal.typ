#import "proposal_template.typ": *
#import "common/titlepage.typ": *
#import "common/metadata.typ": *


#titlepage(
  title: titleEnglish,
  titleGerman: titleGerman,
  degree: degree,
  program: program,
  supervisor: supervisor,
  advisors: advisors,
  author: author,
  startDate: startDate,
  submissionDate: submissionDate
)

#show: project.with(
  title: titleEnglish,
  titleGerman: titleGerman,
  degree: degree,
  program: program,
  supervisor: supervisor,
  advisors: advisors,
  author: author,
  startDate: startDate,
  submissionDate: submissionDate
)


#set heading(numbering: none)
= Abstract

//   - Provide a brief summary of the proposed work 
//   - What is the main content, the main contribution?
//   - What is your methodology? How do you proceed?

Proposed thesis investigates a simplified approach for enhancing realtime collaboration on structured diagrams, implementing the solution in Apollon, an open-source UML modeling editor. Inspired by methodologies like $delta$-CRDTs, this work aims to utilise insights from these approaches for the specific case of structured diagrams in general and UML diagrams in particular. This work also aims to provide a pluggable solution for scalability of realtime collaboration in Apollon, which can be viewed as a schematic solution for any such distributed system. Throughout this exploration, this thesis briefly touches on other known methods, such as CRDTs, shedding light on the chosen approach for structured diagrams.
  
#set heading(numbering: "1.1")
= Introduction
  
//   - Introduce the reader to the general setting 
//   - What is the environment?
//   - What are the tools in use?

Diagrams hold a central position in software development and design. Among the various types, UML diagrams in particular are considered 'the de-facto standard' for representing software architectures and workflows @uml-empirical. UML, however, has proven diffcult to adopt both by professionals in the industry @uml-in-practice and by students and instructors in academia @uml-learning. This diffuclty underscores the need for easy-to-use and learning-focused UML modeling tools such as Apollon #footnote("https://github.com/ls1intum/Apollon"), which have shown to be effective in improving learning outcomes in modelling @uml-learning.

A key feature of such tools is realtime collaboration. Collaborative settings are shown to have a positive impact on contribution amongst participants specifically during modeling using UML @collab-on-table. Combined with a rising trend in remote work and study, realtime collaboration is becoming a necessity for making the gains of a collaborative working/learning environments for modeling readily available to a wider audience, while further shortening assessment, evaluation and feedback cycles, hence further increasing engagement of such tools.

= Problem
  
//   - What is/are the problem(s)?
//   - Identify the actors and use these to describe how the problem negatively influences them.
//   - Do not present solutions or alternatives yet!
//   - Present the negative consequences in detail

A key challenge for implementing realtime collaboration for UML modeling tools such as Apollon (or any other realtime collaboration program), is ensuring that every user is working with the same data. When network is prone to disconnection or delay, it is impossible to guarantee a strong consistency and constant availability @cap. Practically, for example in an educational setting, this would either mean constant interuption for the students while tutors attempt to provide feedback, or tutors providing feedback on diagrams that the students have already changed.

A common-place solution to this is adopting a weaker consistency model, _eventual consistency_, allowing for more optimistic systems that would apply user changes immediately to their local replica and then synchronise with other clients @eventually-consistent. Such solutions however require complex and error-prone reconcilliation mechanisms @crdt-list. Even newer refinements such as conflict-free data types (CRDTs) have unnecessary complexity and inefficient consumption of bandwidth and memory, even for cases as simple as a one-way counter @crdt-list, @delta-crdt, as shown in #link(<figure-1>)[Figure 1].

#figure(
  image("figures/g-counter-cvrdt.png", width: 80%),
  caption: [
    A G-Counter CRDT, where each replica must maintain a separate counter for each other replica, and sync the whole array periodically.
  ]
) <figure-1>

Scaling realtime collaboration systems proposes another key challenge for implementation. A non-scaling system will have lower availability under unexpected load, hindering larger work / educational settings, or settings with participants from across different geographical regions.

= Motivation
  
//   - Outline why it is important to solve the problem
//   - Again use the actors to present your solution, but don’t be to specific
//   - Be visionary!
//   - If applicable, motivate with existing research, previous work

Solving the challenges of implementing realtime collaboration for diagrams in general and UML diagrams in particular, can not only further help alleviate the diffculties of adopting UML, but also act as a recipe for other similarly structured replicated data, without the need for complex reconcilliation mechanisms or inefficient data types. In practice, such a solution has the potential to act as a theoretical framework for conflict free replicated documents in suitable industrial domains, including distributed and highly structured NoSQL data.

Additional implementation of a pluggable scalability layer then can not only future-proof projects such as Apollon, but also provide a schematic solution for any such distributed system or application, with architectural design that is simple to start with while capable at higher usage volumes.

= Objective

// - What are the main goals of your thesis?

The objectives of the proposed thesis are as follows (in order of priority):

- Restructure Apollon data model to enable use of standard-compliant patching mechanisms producing commutative patches on independent changes and idempotent patches on overlapping changes.
- Implement a realtime collaboration solution for Apollon, using the proposed data model and patching standards.
- Evaluate the proposed solution for correctness.
- Implement a pluggable scalability layer for Apollon, using a simple and scalable architecture.
- Explore theoretically sufficient conditions for applicability of the proposed solutions for the general case.

#figure(
  image("figures/client-server-uml.png", width: 60%),
  caption: [
    Schematic overview of how the realtime collaboration that is to be implemented.
  ]
) <figure-2>

= Schedule
  
// - When will the thesis Start (Always 15th of Month)
// - Create a rough plan for your thesis (separate the time in sprints with a length of 2-4 Weeks)
// - Each sprint should contain several work items - Again keep it high-level and make to keep your plan realistic
// - Make sure the work-items are measurable and deliverable
// - No writing related tasks! (e.g. ”Write Analysis Chapter”)

*Start Date*: 15.10.2023 \
*End Date*: 15.04.2024

#table(
  columns: (auto, 1fr, auto, auto),
  [\#], [goals], [date], [duration],
  [1], [Literature review, initial impl. of realtime collab.], [15.10 - 28.10], [2 weeks],
  [2], [Final impl. of realtime collaboration], [29.10 - 18.11], [3 weeks],
  [3], [Coverage and Documentation], [19.11 - 02.12], [2 weeks],
  [4], [Theoretical analysis & evaluation], [03.12 - 17.12], [2 weeks],
  [5], [Initial impl. of pluggable scalability layer], [02.01 - 15.01], [2 weeks],
  [6], [Impl. prototype of scalable broadcast / storage], [16.01 - 5.02], [3 weeks],
  [7], [Literature review for scalability], [06.02 - 19.02], [2 weeks],
  [8], [Final impl. of scalability layer / coverage & docs], [20.02 - 04.03], [2 weeks],
  [9], [Thesis finalisation], [05.03 - 01.04], [4 weeks]
)


