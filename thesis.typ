#import "thesis_template.typ": *
#import "common/cover.typ": *
#import "common/titlepage.typ": *
#import "thesis_typ/disclaimer.typ": *
#import "thesis_typ/acknowledgement.typ": *
#import "thesis_typ/abstract_en.typ": *
#import "thesis_typ/abstract_de.typ": *
#import "common/metadata.typ": *
#import "common/math_utils.typ": *
#import "thesis_typ/math_classes.typ": *


#cover(
  title: titleEnglish,
  degree: degree,
  program: program,
  author: author,
)

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

#disclaimer(
  title: titleEnglish,
  degree: degree,
  author: author,
  submissionDate: submissionDate
)

#acknowledgement()

#abstract_en()

#abstract_de()

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

= Introduction <intro>

Diagrams play a pivotal role in software development and design. Among the various types, UML diagrams in particular are considered 'the de-facto standard' for representing software architectures and workflows @uml-empirical. UML, however, has proven diffcult to adopt both by professionals in the industry @uml-in-practice and by students and instructors in academia @uml-learning. This diffuclty underscores the need for easy-to-use and learning-focused UML modeling tools such as Apollon #footnote("https://github.com/ls1intum/Apollon"), which have shown to be effective in improving learning outcomes in modelling @uml-learning.

A key feature of such tools is realtime collaboration. Collaborative settings are shown to have a positive impact on contribution amongst participants specifically during modeling using UML @collab-on-table. Combined with a rising trend in remote work and study, realtime collaboration is becoming a necessity for making the gains of a collaborative working/learning environments for modeling readily available to a wider audience, while further shortening assessment, evaluation and feedback cycles, hence further increasing engagement of such tools.

== Problem

Though Apollon has proven successful in significantly improving learning of UML modeling amongst students, it still lacks proper support for realtime collaboration. This is a significant drawback as it limits the tool's potential to be used in collaborative settings, such as in group projects, or in remote learning environments, the later of which have become increasingly popular post the COVID-19 pandemic.

Such a limitation deprives the software and its users, including online educational platforms and learning management softwares such as Artemis #footnote("https://github.com/ls1intum/Artemis") which integrate Apollon, from the benefits of a collaborative learning environment, wherein students work in groups towards solving a problem or accomplishing a shared task. These collaborative learning techniques have been shown to increase academic motivation @collab-learning and peer contribution @collab-on-table, effects that specifically in a blended learning environment, become more pronouned based on how well the tools in use are optimised for collaboration @collab-learning-blended.

Implementation of such features, on the other hand, brings its own unique challenges. A key challenge in such a context is maintaining a consistent state between all peers: while working on the same UML diagram, all participants should see the same diagram, while being able to quickly and responsively modify the diagram without having to lock the diagram or wait for other peers, meaning occasionally changing the diagram simultaenously, resulting in conflicting states. Common solutions for such problems, such as Operation Transformation @ot, demand a lot of  complexity for conflict detection and reconcilliation, which have proven difficult and error-prone to even merely check for correctness @ot-issues, @ot-admis, @ot-proof, and demand strong network guarantees and low fault tolerance @diff-sync, @ot. Tools built around these approaches typically require tight server-client integration @sharedb, which increases the difficulty of integration and use for a tool such as Apollon, where third-party consumers should integrate the tool and handle server-side operations.

More recent solutions such as Conflict-free Replicated Data Types (CRDTs) @og-crdt, @crdts are more promising for the specific requirements of a project such as Apollon. The "conflict-free" nature of such solutions greatly simplifies complexity for integrators. However, they still incur noticeable trade-offs in terms of performance and complexity @yata, posing further challenges in design and implementation.

== Motivation

A straightforward solution for realtime collaboration in Apollon has potentially great benefits on effectiveness of learning UML modeling, specifically in online and collaborative environments. Furthermore, a solution with minimal server-side complexity enables a wide range of platforms and LMSs to easily integrate such capabilities, furthering access to benefits of collaborative learning to a much wider audience.

As Apollon is an open-source project, a simple architectural design can be adopted by the community on similar projects and use cases with relative ease. Moreover, a theoretical analysis of conditions wherein such a solution is applicable can simplify proof of correctness for such applications, and guide future research on boundaries within which similar solutions can be developed.

== Objectives
// #rect(
//   width: 100%,
//   radius: 10%,
//   stroke: 0.5pt,
//   fill: yellow,
// )[
//   Note: Describe the research goals and/or research questions and how you address them by summarizing what you want to achieve in your thesis, e.g. developing a system and then evaluating it.
// ]

Present thesis focuses on three main objectives: design and implementation of a realtime collaboration system for Apollon, integration into Apollon Standalone #footnote("https://github.com/ls1intum/Apollon_standalone") and Artemis, and theoretical analysis of the proposed solution.

#v(4mm)

1. *Design and Implementation* \
  The main aim of the thesis is to design and implement a realtime collaboration solution for Apollon. The solution should impose minimal complexities on potential consumers of Apollon intending to integrate the tool into their own platforms, and subsequently will draw inspiration from more distributed solutions such as CRDTs. At the same time, we intend to minimise the complexity incurred on Apollon's code base itself, providing a solution that works for the wide variety of diagram types supported by Apollon out of the box, working seamlessly for future diagram types without additional effort, and retaining a simple architecture maintainable considering the student-driven high-influx development process of Apollon.

#v(4mm)

2. *Integration* \
  The second objective would be to integrate the realtime collaboration features of Apollon into example consumers of the tool, namely Apollon Standalone, a standalone version of Apollon, and Artemis, an interactive learning management system. The unqiue constraints of each of these systems will act as a testbed for simplicity of adoption of the proposed solution, and helps in analysing potential challenges related to integration of realtime collaboration in different environments and for various use cases and in accordance with different persistence mechanisms.

#v(4mm)

3. *Theoretical Analysis* \
  The final objective of this work is to provide a theoretical analysis of the proposed solution, specifically focusing on the conditions under which the solution is applicable, and the boundaries within which the solution is correct. This analysis will describe consistency properties achievable using the proposed solution under various network topologies and constraints, and discuss the theoretical correlations of the proposed solution with established ones.
  

== Outline

The rest of the thesis is structured as follows:

@background provides some background information on Apollon editor and Artemis teaching platform. The concept of realtime collaboration is subsequently introduced, alongside consistency requirements often considered for such systems. An overview of the most commonly used techniques and solutions for satisfying these requirements and addressing associated challenges is given, namely Operational Transformation and Conflict-free Replicated Data Types.

@related-work provides a more in-depth review of these techniques and their suitability for the specific problems that are the focus of this thesis, providing insight into similarities and differences of the proposed solution with existing approaches, and the reasoning as to why a novel solution was designed and implemented.

In @requirements-analysis, functional and non-functional requirements for a realtime collaboration system for Apollon are outlined, as well as system models, following requirement ellicitation and analysis process recommended by @bruegge2004object.

@system-design describes the system design, including the architectural design of the proposed solution, the data format of diagrams and changes and their interactions with the realtime collaboration solution, the control flow of the subsystem, and an overview of example integrations of the proposed system into Apollon Standalone and Artemis projects.

@theoretical-analysis provides a theoretical analysis of the proposed solution, evaluating the general conditions under which the proposed solution schema is applicable, the consistency criteria it satisfies under different conditions, and sufficient conditions for assessment of when application of such a solution would yield a correct, convergent result. Theoretical relationship between the proposed solution, existing solutions and various consistency constraints under various network conditions are discussed, providing a further understanding of the trade-offs that were made to achieve the specific goals of this thesis.

The work is finally summarized in @summary, where achieved and open goals are outlined, and a conclusion and outlook for future work is provided.

#pagebreak()

= Background <background>
The following section provides background information on key concepts that present thesis is based on or draws inspiration from. This includes an overview of Apollon, the online UML editor which is the basis of the implementation work conducted, Artermis, the educational platform within which Apollon is integrated, and the general concept of realtime collaboration systems alongside they key challenges they face, specifically consistency models desirable in such systems.

This section finally provides an overview of the most commonly used techniques for achieving those consistency requirements, namely Operational Transformation, and Conflict-free Replicated Data Types, detailing some examples of the latter family of solutions to offer a better understanding of the realtime collaboration solution proposed and implemented by this thesis. A critical analysis of these methodologies for the specific problem of realtime collaboration on UML diagrams, specifically for Apollon, is subsequently provided in @related-work.

== Apollon and Artemis <apollon-artemis>

Apollon is an interactive web-based UML editor, developed at the Technical University of Munich. It was originally designed to facilitate drag-and-drop modeling exercises, where in instructors easily and efficiently create UML diagrams and students fill-in the missing parts, with support for automated assessment @thesis-schulz. It has since evolved into an easy-to-use and learning-focused UML modeling tool with support for educational feedback and guidance @thesis-tobi, and a great degree of extensibility specifically with regards to adding support for new diagram types @thesis-willand. Since its inception, Apollon was designed to be easily integrated into other educational platforms, enhancing the learning experience of students using such platforms @thesis-schulz. Usage of Apollon has proven to improve various learning outcomes with regards to modelling, specifically increasing student engagement, improving learning success in modelling, and better understanding of taught concepts in programming exercises @uml-learning.

Apollon was originally designed to be integrated into Artemis, an interactive learning management system also developed at the Technical University of Munich originally with a focus on programming exercises and automatic assessment, which later expanded to include support for a variety of exercise types and exams, namely modelling exercises, with support for individual or team-based exercises with integrated online editors. It is used in multiple universities for various online, offline or hybrid courses, and has proven helpful in guiding students in their learning process via iterative feedback cycles whilst reducing the overhead effort required by instructors and teaching assistants @artemis.

== Realtime Collaboration

Realtime collaborative applications (sometimes refered to in literature as group-editors or realtime group-editors) allow distributed users to work together, simultaenously, on shared data and documents @op-effect. As outlined above, such collaborative settings can provide various benefits for different use-cases: for example collaborative educational settings where multiple students work in a group on a shared task result in increased academic motivation @collab-learning. However, communication in such a setting is dependent on network which is often prone to disconnection or delay, making it rather impossible to achieve a strong degree of consistency between all collaborating peers @cap.

Ideally, a realtime collaborative system or application should display these characteristics in order to achieve its desired goals @cci:
- _realtime_: response to local user interaction should be immediate, i.e. a user shouldn't wait for approval to see the effect of their actions.
- _distributed_: users reside on different machines connected via network prone to non-deterministic latency and disconnections.
- _unconstrained editing_: multiple users should be allowed to modify various and potentially overlapping parts of the data concurrently.

The requirements of realtimeness and unconstrained collaboration necessitate local replicas of the data to be modified by each client. Such a setup however leads to the consistency issues of _causality-violation_ and _divergence_ @ot-issues, the former referring to when causaly related operations are delivered to a client out-of-order (e.g. when deletion of a string is delivered before the insertion of said string), and the latter referring to two replicas diverging due to execution of two concurrent (not causally related) operations in different orders (e.g. when two users insert different characters at the beginning of a string). In response, a consistency model requiring convergence and causality preservation was proposed @ot for such systems.

Another problem that arises with such systems is _Intention Violation_ @cci. For example, a user might want to delete the first two characters of a string, while another user is inserting two other characters at the beginning of this string. An execution order might lead to deletion of the characters that were not intended by the deleting user. To address this issue, _Intention Preservation_ is often considered as another desired consistency constraint, which requires the effect of executing an operation to be the same as the intended effect, i.e. its effect on the state wherein the operation was issued. This notion has been further formalised into _single operation effect preservation_ and _multi-operation effects relation preservation_, the latter of which requires that the relation between two operations is also preserved when they are executed, as it was in the original states they were generated @op-effect (e.g. if a character is inserted after another character, this relation holds when these operations are applied to other replicas with different states as well).

=== Eventual Consistency

A consistency model often adopted to address these requirements is *Eventual Consistency* (EC) @ev, also referred to as optimistic replication @ev-2, which informally guarantees that if no new updates are issued, and all updates are eventually propagated to all peers, all peers will eventually converge to the same state. This model is often also used to assure convergence of replicated data in distributed systems (e.g. distributed databases), and is formulated as BASE @base, as a set of guarantees diametrically opposed to ACID guarantees @acid for partitioned databases, to further emphasize availability instead of consistency when handling replicated data (a trade-off necessary due to CAP theorem @cap):

- _Basically Available_: the system is always available for read and write operations, even in the presence of network partitions or failures.
- _Soft state_: the state of the system is allowed to be inconsistent between replicas, but will eventually converge to a consistent state.
- _Eventual consistency_: the system guarantees that if no new updates are issued, and all updates are eventually propagated to all peers, all peers will eventually converge to the same state.

Eventual Consistency is a weak guarantee, specifically as it is merely a guarantee of liveness and does not provide any safety guarantees. Under EC, reads might yield any potentially inconsistent result before the repilcas have converged. To compensate, a stronger version, _Strong Eventual Consistency_, is often considered, which additionally guarantees that all replicas that have received the same (unordered) set of updates will yield the same results for read operations. _Monotonicity_ of the state is another additional guarantee, which ensures that the state is never _rolled back_ @crdts.

== Operational Transformation <ot-background>

Operational Transformation (or Operation Transformation) is a well-established and commonly used technique for maintaining consistency in a distributed collaborative setting, used in products such as Google Docs @ot-json. The technique was originally introduced with a focus on text editting @ot, and while the majority of study and improvements have been focused on that front, extensions to other formats, including abritrary JSON trees, have been explored @ot-json.

The core idea behind Operation Transformation is to transform operations received from peers before they are applied to local state. @figure-ot provides a basic example of how this works: Alice and Bob start from sync state of "xyz". Alice inserts "a" at the beginning of the string, Bob deletes "y" at index 1. Alice and Bob then exchange operations. If they were to apply these remote operations naively, Alice would yield "ayz", and Bob "axz", their local states diverging. However, Alice determines that the received operation is concurrent with her previous insertion, for example by using a vector clock @vector-clock, and transforms the delete operation against her insertion, by increasing its index. Both Alice and Bob yield "axz", the convergent (and intended) state.


#figure(
  image("figures/ot-fig-1.svg"),
  caption: [
    A basic example of Operational Transformation
  ],
) <figure-ot>

Operational Transformation assumes a network reliable enough for delivering messages exactly once @ot, and is fault tolerant towards out-of-order delivery by transforming incoming operations in a manner that ensures some form of commutativity, while the operations themselves typically lack that property @ot-proof. For example, in the scenario depicted in @figure-ot, while $O_1$ and $O_2$ aren't commutative, we do have $O_1 compose O'_2 equiv O_2 compose O'_1$. Ensuring this property with higher number of peers and increasing number of concurrent operations is specially challenging @ot-issues, and although distributed variants exist, many implementations (such as Google Docs) resort to sequencing and transforming operations centrally, on a central server, to avoid these issues altogether @ot-x-crdt.

== Conflict-free Replicated Data Types <crdt-background>

Conflict-free Replicated Data Types are a more recent family of solutions for achieving eventual consistency, based on (re)desigining data types in a manner that operations are natively commutative @ot-x-crdt, @ot-v-crdt. This property ensures that operations can be exchanged in a distributed (peer-to-peer) manner, and all peers will converge to the same state.

The most basic example of such a data type is a counter @crdt-pure-op, where peers exchange "increment" and "decrement" operations. In a network with exactly-once-delivery, all peers eventually converge on the same value. Another simple example would be a 2P-Set @crdt-list, where elements can be added and removed, but not added back again. Each peer holds a main set and a _tombstone_ set, moving elements from the main set to the tombstone upon receiving _remove_ operations, and adding elements to the main set upon receiving _add_ operations if said elements are not in present in the tombstone set #footnote([
  The limitation of adding back removed elements can also be circumvented using unique IDs, and storing IDs in the tomstone set @crdt-list.
]).

#figure(
  image("figures/crdt-2pset.svg"),
  caption: [
    Op-based 2P-Set CRDT
  ],
) <figure-crdt-2pset>

CRDTs are often categoriesed based on how peers communicate, resulting in varying trade-offs between implementation complexity, message size, and network fault tolerance @crdt-list. Examples described above are _operation-based_, also referred to as CmRDTs, as peers communicate operations between each other. An alternative would be communicating local states, resulting in _state-based_ CRDTs, or CvRDTs. For example, a state-based grow-only counter can be constructed by each peer maintaining a mapping of peer IDs to counters. Each peer updates its own counter locally, and upon recieving the state of another peer, their corresponding counter in local mapping is updated to the maximum of the remote and local mappings. The _value_ of the counter, often obtained by a _query_ function, would then be the sum of all counters in the vector.

#figure(
  image("figures/crdt-counter.svg"),
  caption: [
    State based CRDT counter
  ],
) <figure-crdt-counter>

State-based CRDTs have a higher network fault tolerance as they do not require exactly-once-delivery guarantee. This however comes at the cost of larger message sizes and implementation complexity. It has been shown that CvRDTs and CmRDTs can emulate each other and are thus equivalent @crdts. The problem of message size of CvRDTs can be mitigated by sending _delta-states_ instead of full states, resulting in a third class called $delta$-CRDTs, though this technique also incurs its own complexities for synchronising update histories between peers @delta-crdt.

CRDTs can also be used to construct more complicated data types, even those whose operations are not naturally commutative (such as strings, arrays, sequences, etc) @crdt-list, @treedoc, @logoot, @yata. @figure-crdt-seq shows schematics of a CRDT sequence, wherein each element is assigned a unique ID with some total ordering. When a character is inserted, it is assigned an ID between those of its siblings at time of insertion: for example when inserting "a" between "x", "y", its ID is picked so that $"ID"_x < "ID"_a < "ID"_y$, ensuring preservation of intention. Deleted characters are merely marked as such, which similar to tomstoning of 2P-Set elements, handles out-of-order delivery of operations and conserves causality. 

#figure(
  image("figures/crdt-seq.svg"),
  caption: [
    Schematic CRDT Sequence
  ],
) <figure-crdt-seq>


#pagebreak()

= Related Work <related-work>

A prime candidate for solving challenges of realtime collaboration for Apollon are solutions based on Operational Transformation. Though originally developed for text editing, OT has been extended to support other formats, including arbitrary JSON objects @ot-json, with corresponding tools such as ShareDB @sharedb. Such approaches however require a server-client architecture with tight integration on the server-side, posing an issue to potential consumers of Apollon who would like to integrate the tool into their own systems with a variety of potentially incompatible technology stacks. Requiring potential consumers to handle transformation and sequencing of operations on the server-side is also not feasible, as it would drastically increase the barrier for adoption of such features.

Furthermore, while distributed designs for OTs have also been proposed @ot, checking correctness of such algorithms and covering all potential corner cases is quite complex and often error-prone @ot-issues, @ot-proof, @ot-admis. The famous example of the dOPT puzzle (@figure-dopt-puzzle) demonstrates this challenge, where the originally proposed dOPT algorithm fails to achieve convergence @ot-issues.

#figure(
  image("figures/ot-puzzle.svg"),
  caption: [
    dOPT puzzle @ot-issues
  ],
) <figure-dopt-puzzle>

These difficulties, alongside stronger network requirements of OT-based solutions (mainly guarantee of exactly-once-delivery), render them unsuitable for the specific problem of realtime collaboration for Apollon.

CRDT-based solutions are another viable alternative for bringing realtime collaboration to Apollon. General-purpose and extensible solutions such as YATA @yata have been developed, resulting in general purpose libraries such as Yjs @yjs, that are actively utilised by popular collaborative diagram editting software such as tldraw#footnote("https://www.tldraw.com") @tldraw-yjs. The distributed nature of CRDTs removes any burden of integration of realtime collaboration of Apollon from integrating platforms, availing realtime collaboration in a seamless manner to any such platform. That said, CRDTs introduce their own host of performance overheads and complexities @ot-v-crdt, @delta-crdt, @yata. Garbage collecting tombstones is a recurring problem in CRDTs, and while CvRDTs are more fault tolerant than CmRDTs or OTs, they incur a much higher message size and bandwidth consumption.

Besides performance concerns, CRDTs typically require a more complex internal type that is _queried_ into the user-facing type, which increases the complexity of development of Apollon itself, specifically extension of new diagram types, as developers would need to compose their own CRDTs for such extensions. Potential consumers and integrators also might need to "participate" as clients in the replication system to be able to provide remote persistence, which in-turn exposes them to the complexities of these internal data types.

#pagebreak()

= Requirements Analysis <requirements-analysis>

In this chapter, we study the requirements for adding support for realtime collaboration to Apollon, following requirement ellicitation and analysis process advised by Bruegge and Dutoit @bruegge2004object. We first provide an overview of the purpose, scope, objectives and success criteria of the system that we aim to develop. We then outline the functional and non-functional requirements of the system, and provide important system models for the requirements analysis.

== Overview

The purpose of this thesis is to design and implement support for realtime collaboration into Apollon, so that implementation of realtime collaboration for consumers integrating Apollon into their platforms becomes a straightforward task. This means Apollon must in some form or manner, inform consumer code of "changes" happening to diagrams that need to be synced with potential remote peers, and provide a mechanism for importing such changes produced by a remote Apollon client. The implementation should yield at minimum _Eventual Consistency_, ideally _Strong Eventual Consistency_ and _Intention Preservation_, with minimal complexity and overhead for consumer code, and minimal network guarantees. It should be designed in a manner that also allows third-party code to participate in any such network, primarily with purpose of remote persistence. We strive for an architecture that also incurs minimal complexity onto Apollon itself, maintaining its extensible architecture and ease of adding new diagram types, without requiring developers to design such future capabilities with realtime collaboration and its associated challenges in mind. Such a design, ideally should be domain-agnostic enough to also be applicable to similar projects, even beyond the scope of UML diagrams.

== Current System <current-system>

This section describes the status of realtime collaboration in Apollon prior to the implementation work of present thesis. The current design lacks any direct support for realtime collaboration within Apollon, requiring integrating platforms to implement and handle such a system from scratch. As described in @background, many such solutions (such as CRDTs) require specifically designed internal data types, which limits the range of possible solutions for consumers and integrating platforms.

@figure-stquo outlines an example implementation of such a system without delving into specifics of the implementation. Apollon consists of components necessary for rendering diagrams and providing interactions upon them. The UML model itself is managed via the _Core Model_ component, which follows a Flux-based data flow for managing the state @flux (@figure-flux), and separates the internal representation of the UML model, which has additional rendering and interaction metadata, from the external representation exposed via _ApollonEditor_ interface.

#figure(
  image("figures/stquo.svg", width: 70%),
  caption: [
    Example implementation of realtime collaboration with current system, based on @thesis-willand
  ],
) <figure-stquo>

#v(4mm)

The _ApollonEditor_ interface provides methods for consumer code to subscribe to the state of the UML model, represented via the external schema. Upon each update to the internal store (triggered by various actions), the state is transformed into the external schema and pushed to subscribers. In the example implementation provided, the consumer client code can feed this state into their own realtime collaboration subsystem (denoted as "Collab."), which might detect changes, add metadata, or perform other tasks necessary for realtime collaboration, and push the changes to a central server for further processing, or to remote peers via some message broadcast layer. Additionally, a local persistence component stores the latest state of the diagram locally and synchronises with a remote server for remote persistence. In the provided example, for simplicity, a naive approach is assumed, where the server merely acts as a message broadcast amongst peers, and necessary transformation, concurrency detection or reconcilliation is done by the client.

#v(4mm)

#figure(
  image("figures/flux.svg", width: 70%),
  caption: [
    Simplified view of the "flux" data flow managing Apollon's internal state
  ],
) <figure-flux>

#v(4mm)

== Proposed System <proposed-system>

The proposed system should shift responsibility of detecting changes, updating and preparing _update messages_, detecting concurrency and conflicts, and reconcilliating them into consistent diagrams across multiple remote peers, to a new component within Apollon itself (denoted as "Patcher" in @figure-proposed). Responsibilities such as displaying and detecting online peers and their status still remains with the consumer code. The "Patcher" component detects changes in the core model and notifies subscribers with _update_ or _sync_ messages (depending on the actual design), and handles incoming _update_ (or _sync_) messages from remote peers, properly updating the core model accordingly. These functionalities are provided as an independent component to the rest of Apollon subsystems, to maintain simplicity and extensibility.

#figure(
  image("figures/proposed.svg"),
  caption: [
    Proposed system with example integration.
  ],
) <figure-proposed>

#v(4mm)

The following sections detail the requirements of the proposed system. First, the functional requirements are documented, describing expected interactions and functional behaviour of the realtime collaboration system with users and integrating platforms. Qualitiative requirements of the system are then detailed under non-functional requirements and categorized using the FURPS+ model as advised by @bruegge2004object.

#pagebreak()

=== Functional Requirements <functional-requirements>

The following requirements describe how the realtime collaboration component of Apollon should functionally behave towards users and integrating platforms (also refered to as "Consumer Code").

- FR1 *Collaboration*: Changes made by a user to the diagram should be reflected to all other users working on the same diagram, as determined by the consumer system. <fr1>
- FR2 *Realtime Updates*: Users should see the effect of changes they make locally immediately, regardless of network conditions. <fr2>
- FR3 *Unconstrained Editing*: Multiple users should be able to edit any part of the diagram they desire at any moment they desire. <fr3>
- FR4 *Eventual Consistency*: All users should eventually see the same diagram as the peers they are collaborating with. <fr4>
- FR5 *Intention Preservation*: The effect of a change made by a user in the final diagram should be the same as the effect intended by the user, i.e. the effect it had on the diagram in the state it was issued by the user. <fr5>
- FR6 *Conflict Resolution*: In case users change different parts of the diagram concurrently, all of their changes should be reflected in the diagram. <fr6>
- FR7 *Update Notification*: Consumer code should be able to subscribe and unsubscribe to changes in the diagram, receiving _update_ or _sync_ messages that can be disseminated to remote peers. <fr7>
- FR8 *Receiving Updates*: The system should receive _update_ or _sync_ messages from consumer code, potentially originated from some remote peer running Apollon client as well. Changes denoted by these messages should be reflected in the local diagram. <fr8>

=== Nonfunctional Requirements <non-functional-requirements>

This section, as specified by @bruegge2004object, describes the aspects and requirements of the system that are not directly related to the functional behaviour of the system, but are rather indicative of its quality, usability, performance, etc. The requirements are categorized using the FURPS+ model.

- NFR1 *Usability*: The system should provide a smooth diagram editing experience. When no other peers are actively editing the diagram, the user should experience no difference in editting compared to a completely local, non-collaborative setting. <nfr1>
- NFR2 *Reliability*: The system should be fault-tolerant towards network partitions. When users disconnect, they should be able to continue editing the diagram, and when they reconnect, they should eventually see the changes made by their peers, and have their peers see the changes they have made. <nfr2>
- NFR3 *Reliability*: The system should be fault-tolerant towards network unreliabilities, including out-of-order delivery of messages, non-deterministic network delays, message loss, duplicate delivery, etc. Ideally, only eventual delivery of messages should be assumed, i.e. if a message is sent infinite times, it will eventually be delivered infinite times. <nfr3>
- NFR4 *Reliability*: Diagrams that users see and work on should converge as soon as possible. The ideal limit of this requirement would be for _Strong Eventual Consistency_ to be satisfied by the system, i.e. users that have received the same (unordered) set of updates (messages) see the same diagram. <nfr4>
- NFR5 *Performance*: Users should see changes made by their peers in a timely manner, considering network conditions. <nfr5>
- NFR6 *Performance*: The system should have minimal overhead on computing resources of user devices, including processing and memory, for handling conflict resolution, concurrency detection, etc. <nfr6>
- NFR7 *Performance*: The system should incur minimal overhead on network bandwidth, considering the size of _update_ (or _sync_) messages issued. The size of the messages should ideally not scale with either the size of the diagram or the number of users. <nfr7>
- NFR8 *Supportability*: The system should be designed in a manner that allows easy integration by consumer code. Specifically, the system should not require consumer code to detect conflicts or provide any reconcilliation mechanism. The system should also incur minimum requirements on how consumer code disseminates _update_ messages to remote peers. <nfr8>
- NFR9 *Supportability*: The system should issue _update_ or _sync_ messages in a format that is easy to understand by consumer code and can be used to update existing diagrams in different tech stacks, languages, etc., in order to facilitate participation in the network e.g. for remote persistence of diagrams. <nfr9>
- NFR10 *Supportability*: The system should incur minimal code complexity on other Apollon subsystems, specifically requiring minimal awareness of realtime collaboration mechanism while designing and implementing further changes to other subsystems. <nfr10>
- NFR11 *Supportability*: The system should be decoupled, as much as possible, from specific schema of various UML diagram types, allowing for easy extension of the system to support new diagram types without having to consider realtime collaboration in depth. <nfr11>

== System Models

=== Scenarios

Here we describe two scenarios for using realtime collaboration with Apollon, from perspective of potential users, as described in @bruegge2004object. A visionary scenario and a demo scenario are detailed: the former describes an ideal solution for realtime collaboration, while the latter describes a more realistic scenario that is feasible within the scope of present work.

#v(4mm)

*Visionary Scenario*: Multiple users work simultaenously on a UML diagram important to their work, which they prefer to keep as private as possible, on a platform utilising Apollon as its UML editor. The users are geographically dispersed with various network conditions, Bob, for example is riding a train with intermittent connectivity. To maintain the required privacy, the platform allows them to communicate in a P2P encrypted manner (for example, utilising a gossip protocol), so their diagram and the changes they make are not visible to any third-parties, for example servers operating the platform. Users can make changes to any part of the diagram at any moment they desire, while they see in realtime changes made by their peers, without seeing their own changes getting lost unless they clearly see because a peer overrides a change made them.

During this collaboration session, Bob's train enters a tunnel, and he is temporarily disconnected from his peers. He can still work on the diagram, making changes, moving elements, creating relationships, etc. As soon as he reconnects, he sees the changes made by his peers in the meanwhile, while his peers also immediately receive the changes he made.

#v(4mm)

*Demo Scenario*: This scenario describes the interaction between a developer of Artemis, an online learning platform integrating Apollon, a developer of Apollon, adding a new diagram type to Apollon, and some students, working on a team exercise on Artemis platform, on this new diagram type.

*Artemis Developer*: Eugene is a developer for Artemis, tasked with enabling team-based modeling exercises on the platform. He integrates Apollon client into client side code, subscribing to updates as specificed by ApollonEditor API. He relays these changes to Artemis server without any further processing. On the server, he implements a simple broadcast mechanism to relay changes to all students participating in a team-based exercise. On the client, he again receives these changes and passes them back to Apollon client, which synchronises the diagrams between participating students automatically.

*Apollon Developer*: Matthias is a developer for Apollon team who wants to implement a new BPMN diagram type for the editor. He implements the new diagram type following existing Apollon architectural guides, which includes a simple guide on how to organise diagram data so that it would automatically work with the realtime collaboration system. Besides this, he doesn't need to consider any additional steps for enabling realtime collaboration, and his new diagram type automatically works with the system.

*Students*: A group of students are working on a team BPMN modeling exercise on Artemis platform. Each student can make changes to any part of the diagram as they see fit, seeing the changes they make immediately on the diagram. They can also see the changes made by their peers, like when a new element is created, or a new relationship is made. Alice and Bob, simultaenously move two connected elements, and they see the elements moved as they intended with the other connected element also move as their peer intended.

=== Use Case Model

From the usage scenarios outlined in the previous section, we have identified three main actors for the realtime collaboration system in Apollon:

- *User*: A user utilises Apollon, or more specifically, a platform integrating Apollon, in collaboration with other users, to work on some shared UML diagram. Bob from the visionary scenario, or the students from demo scenario, are examples of such actors. Users are the primary actors of the realtime collaboration system.
- *Platform Developer*: A developer of a platform integrating Apollon, responsible for providing realtime collaboration to the *Users*. This includes integrating realtime collaboration features provided by Apollon, alongside additional context-specific features (for example, access management in case of team-based exercises on Artemis).
- *Apollon Developer*: A developer working to maintain and extend Apollon, specifically works to extend Apollon with new diagram types.

These actors use functionality provided by two different scopes: _Apollon_, as the diagram editor which also provides features for realtime collaboration, and the _Integrating Platform_, which embeds Apollon into their own system and provides additional context-specific functionality.

Use cases pertaining to *Users* are described in @figure-use-case, and further detailed in @table-conc. The scope of these functionalities is distributed between _Apollon_ and _Integrating Platform_: _Apollon_ is the source of truth for the local replica of the diagram a user works with, renders the diagram, and provides the user interface for updating the diagram. The _Integrating Platform_ is responsible for additional functionality related to collaboration that falls outside of this scope: for example, *Users* might need to see the online/offline status of their peers, have a sharing mechanism to invite other *Users* to collaborate, save their diagrams remotely, etc.

#figure(
  image("figures/use-case.svg", width: 80%),
  caption: [
    Use cases related to realtime collaboration. Use cases are symmetric for both users, the diagram is simplified for further readability.
  ],
) <figure-use-case>

#v(8mm)

Within the scope of _Apollon_, a *User* should be able to change the diagram in an unconstrained manner (#link(<fr3>)[FR3]), seeing the results of these changes immediately (#link(<fr2>)[FR2]). Their peers should at some point see the effect of these changes (#link(<fr1>)[FR1]), eventually all *Users* seeing the same diagram (#link(<fr4>)[FR4]).

#figure(
  table(
    columns: (auto, 1fr),
    align: left,
    [_Use case name_], [Concurrent Modification],
    [_Participating actors_], [*Users*],
    [_Flow of events_], [
      1. Mutliple *Users* collaborate on a diagram.
      2. *Users* concurrently change the diagram.
        1. Each *User* sees their local changes immediately.
        2. *Apollon* issues _updates_ pertaining to these concurrent changes.
        3. *Integrating Platform* relays these messages to remote peers.
        4. *Integrating Platform* receives _update_ messages and relays them to *Apollon*.
        5. *Apollon* reconciles changes and updates diagram.
      3. *User* sees the changes made by their peers.
    ],
    [_Entry Condition_], [The diagram is in some form shared with *Users*],
    [_Exit Condition_], [All *Users* see the same diagram.],
    [_Quality Requirements_], [
      - *Users* see changes by their peers in a timely manner.
      - *Users* experience a smooth editing flow, on par with a local, non-collaborative setting.
    ]
  ),
  caption: [
    Use case table for "Concurrent modification" use case.
  ],
) <table-conc>

#v(8mm)

Use cases pertaining to *Platform Developers* and *Apollon Developers* can be observed in @figure-use-case-dev. For an *Apollon Developer*, integrating realtime collaboration support into the new diagram type is considered an "extended use case", as developers could skip this step for a particular diagram type, though this would over time degrade the functionality of Apollon for integrating platforms and users alike.

For a *Platform Developer*, integration of realtime collaboration of Apollon inevitably includes implementation of a message delivery mechanism (so that clients can communicate with each other), which is also a requirement for additional, out-of-scope requirements such as session management (managing which users access a collaboration session), user status, etc. A *Platform Developer* should be, at the minimum, able to connect this broadcast layer to _update_ or _sync_ messages provided by Apollon (#link(<fr7>)[FR7]), and conversely should be able to feed received updates back into Apollon (#link(<fr8>)[FR8]).

#figure(
  image("figures/use-case-dev.svg"),
  caption: [
    Use cases related to integrating realtime collaboration, or extending Apollon with support for realtime collaboration.
  ],
) <figure-use-case-dev>

#v(8mm)

From this model, it can be observed that in order to achieve ease of integration for *Apollon Developers* (#link(<nfr10>)[NFR10], #link(<nfr11>)[NFR11]), the realtime collaboration system should be designed as an independent component, directly hooked to the main state flow of Apollon itself, and without tight coupling into schema of various diagram types. Additionally, if any specific requirements for schema of new diagram types are necessary, they should be as minimal and intuitive as possible.

Similarly, ease of integration for *Platform Developers* (#link(<nfr8>)[NFR8], #link(<nfr9>)[NFR9]) the system should not require any additional mechanism beyond the already necessary message delivery mechanism, while also minimising requirements of this mechanism as much as possible.

#pagebreak()

=== Analysis Object Model <analysis-object-model>

Following the requirements and use cases outlined in previous sections, we can identify the main concepts of the realtime collaboration system in Apollon and subsequently construct an analysis object model as per @bruegge2004object.

The main concept of the system is "changes to the diagram", which we will refer to as *Patches*, which are generated in response to changes made by the user, delivered to other clients through the integrating platform, inspected for detection of concurrent and conflicting changes, etc. The integrating platform needs to subscribe to new patches when they are emitted due to user interaction, and also ask Apollon to apply incoming patches from other peers. Since the integrating platform interacts with Apollon via _ApollonEditor_ interface (@figure-stquo), this necessitates new exposed methods within _ApollonEditor_, _patch()_ and _subscribe()_, as detailed in @figure-analysis-object.

The other primary concept necessary for the system is an independent component responsible for detecting changes, in a generic and diagram-type agnostic manner, emitting change objects, and handling incoming changes, reconcilliating them with local changes and ensuring eventual consistency amongst peers. This component is denoted as the *Patcher* in @figure-analysis-object, and essentially is wrapped by _ApollonEditor_ to provide necessary functionality to the integrating platform.

As previously mentioned, Apollon utilises a unidirectional Flux-based @flux data flow (@figure-flux), wherein the application state, including the diagram state, is maintained by a central _Store_. The user interface updates itself when changes occur to the _Store_, and dispatches _Actions_ in response to user interaction (or other events). These _Actions_ are preprocessed by _Middlewares_ (which might modify the actions or execute arbitrary side effects), and then used by _Reducers_ to calculate necessary updates to the store per _Action_. Since the *Patcher* component needs to be diagram-type agnostic, it needs to directly attach to this flow, creating *Patches* in response to arbitrary _Actions_ (regardless of the diagram type that generated them). This requires a specific middleware (denoted as *Patcher Middleware* in @figure-analysis-object) which utilises the *Patcher* component to check for necessary *Patches* to be emitted in response to potentially state-altering actions. Similarly, state updates resulting from *Patches* received from remote peers need to be expressed by a corresponding _Action_, which is then intercepted by a special reducer (*Patcher Reducer* in @figure-analysis-object), passed to the *Patcher* for detecting any potential conflicts and conduct any necessary transformations, yielding the changes that are subsequently applied to the store.

#figure(
  image("figures/analysis-object.svg"),
  caption: [
    Analysis object model for a realtime collaboration system in Apollon.
  ],
) <figure-analysis-object>

#pagebreak()

=== Dynamic Model

Based on the requirement analysis provided so far, we can construct a dynamic model of the realtime collaboration system of Apollon, detailing the flow of events and interactions between various components of the system. @figure-dynamic-comm provides a high-level overview of this process via a UML communication diagram.

The process starts with an action dispatched from the _View_ (step 1), potentially due to user interaction. This action is intercepted by the _Middleware_ layer, wherein it is processed by composed middlewares, including the _Patcher Middleware_ described in the previous section, which asks the _Patcher_ component to check for potential patches that would need to be emitted (step 2). The action (or the processed action) is meanwhile passed to the _Reducer_ layer and its effect are applied to the _Store_ (step 1.a), resulting in the user receiving immediate realtime feedback of the changes they have issued.

The _Patcher_ checks the action and, if necessary, emits patches, which are relayed through _ApollonEditor_ interface layer to the _Integrating Platform_ (steps 3 and 4). For simplicity, we've assumed a standard client-server architecture with a remote persistence layer for the integrating platform in this diagram. The _Integrating Platform_ then broadcasts the patch to all remote peers, potentially including the originating client (depending on the designed solution and network requirements), and passes the patch down to _ApollonEditor_ (step 7). An action is dispatched (step 8), which is intercepted by the _Patcher Reducer_, which utilising the _Patcher_ calculates necessary updates to the store (steps 9 and 10), which are then applied to the _Store_ and subsequently updated in the user interface. The process for handling incoming changes from a remote peer would be basically captured in steps 6 through 12.

#figure(
  image("figures/dynamic-comm.svg", width: 75%),
  caption: [
    Dybamic model of flow of events for realtime collaboration within Apollon.
  ],
) <figure-dynamic-comm>

#pagebreak()

= System Design <system-design>

This section details the mapping of requirements detailed in @requirements-analysis to the solution domain, loosely following the guidelines provided by @bruegge2004object, and providing a high-level overview as well as detailed description of the design of the system and the reconcilliation solution that enables realtime collaboration capabilities implemented for Apollon. Example integrations of the system into real platforms (Apollon Standalone and Artemis) are also discussed, alongside the behavior of the system in boundary conditions and mitigation strategies for potential network conditions.

== Overview

Apollon is an open-source project providing a web-based UML diagram editor that can be integrated into various platforms, as described in @apollon-artemis. It is written in Typescript #footnote("http://typescriptlang.org/"), and utilises React #footnote("http://reactjs.org/") as a rendering framework and Redux #footnote("https://redux.js.org"), a Flux-based state management library, for managing the internal state of the application via a unidirectional flow (@current-system, @figure-flux). This architecture puts constraints on how realtime collaboration can be integrated into Apollon, as the source of truth remains within the _Store_ managed by Redux, but also provides a unique opportunity for the realtime collaboration component of Apollon to handle potential changes in a generic and diagram-type agnostic manner. Apollon interfaces with the external systems integrating it (the integrating platform) via the _ApollonEditor_ interface, which also exposes a modified diagram format compared to the internal diagram format it manages. Overall, these constraints define the general architecture and design of the realtime collaboration system independent of the specific realtime collaboration solution utilised, as described in @analysis-object-model.

To design a solution satisfying requirements detailed in @functional-requirements and @non-functional-requirements, a standard format for Apollon's exposed _update_ messages are picked (JSONPatch @jsonpatch), ensuring interoperability and easy integration. Inspired by CRDT-based solutions for realtime collaboration (see @crdt-background), the exposed diagram format is updated to produce non-conflicting and commutative patching operations solely according to the specified patching standard for all independent changes made by users, while maintaining simplicity and performance. To ensure the latter, a client-server architecture is loosely expected from integrating platforms (though this can be adopted for other topologies as well), which natively decides on the order of conflicting patches ensuring eventual consistency amongst peers. Finally, a stuttering-prevention component is introduced for the system, ensuring a smooth user experience for the users under various network conditions.

== Design Goals

The design goals of the system, which drive subsequent design decisions, are described per @bruegge2004object, derived from non-functional requirements detailed in @non-functional-requirements:

#v(4mm)

- *Usability* \
  Users of platforms integrating Apollon expect a smooth diagram editing experience, regardless of network conditions. Specifically, collaborative editing should not introduce any additional complexity or overhead to the user experience, as much as possible (#link(<nfr1>)[NFR1]).

#v(2mm)

- *Performance* \
  Performance directly ties to the previous design goal, as a system with a lot of overhead will have detimental effects on user experience and portability (the next described design goal). For example, considering the web-based nature of Apollon and the wide-variety of devices that users might access it with, reconcilliation strategies that are taxing on the client-side resources such as CPU or memory should be avoided, specifically strategies that scale resource consumption based on content-size or number of users (#link(<nfr6>)[NFR6]). Or, depending on network conditions, if a user sees the changes made by their peers too late, the collaborative nature of the setting is disturbed (#link(<nfr5>)[NFR5]).

  Integrating platforms might also have various performance requirements of their own, which complicates integration of taxing solutions. For example, solutions that utilise large message payloads incur performance constraints on integrating platform servers and network topology (#link(<nfr7>)[NFR7]).

#v(2mm)

- *Portability* \
  Apollon is designed to be easily integrated into other platforms. Its realtime collaboration system should also be quite straightforward to integrate, with minimal requirements on the integrating platform beyond the necessary message delivery mechanism (#link(<nfr8>)[NFR8]). It should not require any tight-coupling with the internal workings of the realtime collaboration solution, and should expose the system in a standard and interoperable manner, as integrating platforms might utilise the system for various use cases such as remote persistence (#link(<nfr9>)[NFR9]).

#v(2mm)

- *Extensibility* \
  Apollon is specifically designed to be extensible, specially with regards to new diagram types, so any realtime collaboration solution must consider that and avoid tight-coupling with various features of Apollon, specifically various diagram types (#link(<nfr10>)[NFR10], #link(<nfr11>)[NFR11]).

#v(2mm)

- *Reliability* \
  At a basic level, all collaborating peers should eventually see the same diagram for realtime collaboration to make sense to begin with (Eventual Consistency requirement). Beyond that, additional fault tolerance towards various network conditions is desirable as it allows users with various network conditions to collaborate without issues, and provides further flexibility for integrating platforms for handling various network conditions (#link(<nfr2>)[NFR2], #link(<nfr3>)[NFR3], #link(<nfr4>)[NFR4]).

#v(2mm)

=== Trade-offs <trade-offs>

The design goals described in the above section are outlined in order of priority for this work. Usability requirements are strong enough for a realtime collaboration system that many of them actually fall under functional requirements, as otherwise the definition of a realtime collaboration system would be violated. Performance requirements take second priority as they affect both usability and can have serious negative impact on portability, which considering the design and intended use of Apollon, cause them to take the next priority. Portability and extensibility requirements follow, considering that Apollon is designed to be integrated into other platforms, to be extensible and is developed via a student-driven development model.

Reliability in face of various network conditions takes last priority. Though important, integrating platforms can be expected to setup commonplace network systems such as a client-server setup, which greatly simplify many issues with distributed reconcilliation. Normal network conditions can also be expected in many cases: while out-of-order delivery will occur necessarily due to realtime nature of the system (a user sees their own changes always out-of-order with changes of other peers), properties such as exactly-once-delivery or a preserved deliver-order between the server and the clients can be expected (and are in fact the assumptions for popular solutions such as Operational Transformation @ot and Google Docs @ot-x-crdt). Subsequently, in trade-offs between performance, portability, extensibility and additional reliability, the latter takes lower priority. That said, the design of the system should enable integrating platforms to mitigate such corner cases without requiring a tight coupling to the internals of the system.

== Data Format

As detailed in @related-work, solutions based on Operational Transformation techniques are not suitable for the particular case of realtime collaboration for Apollon as they either incur lots of error-prone complexity on the code-base or require integrating platforms to manage sequencing and transforming operations and hence getting tightly coupled with the realtime collaboration system, both of which go against outlined design goals, specifically extensibility and portability. Instead, we draw inspiration from CRDT-based solutions, in particular transforming the exposed diagram data format, alongside an exposed and standardised _update_ message format, which allows for non-conflicting and commutative operations.

To this end, the proposed solution specifically draws inspiration from $delta$-CRDTs (@delta-crdt), wherein _update_ (or _sync_) messages are deltas (or patches) applied to local replicas of state. Alternatives would be syncing the entire state, similar to CvRDTs @crdts, which would require large message sizes @ot-x-crdt, @ot-v-crdt, @yata, going against performance design principle and its associated non-functional requirements, or to communicate operations similar to CmRDTs @crdts, which would require an exactly-once-delivery guarantee of the network, going against the reliability design principle. Patches on the other hand, are small but idempotent, allowing for system design with further fault tolerance towards various network conditions.

=== Patch Format

Patches are the main added entity exposed to integrating platforms via the realtime collaboration system. Though integrating platforms can treat patches as a blackbox by merely broadcasting them to all participating peers, they might need to be able to interpret them and utilise them for various purposes, for example for maintaining remote backups of the diagram which is updated based on patches issued by clients.

JSONPatch (RFC 6902) @jsonpatch format was subsequently picked as the format of patch messages to ensure interoparability and ease of integration. JSONPatch is a web standard specified by the Internet Engineering Task Force (IETF) #footnote("https://www.ietf.org/") for expressing sequences of operations on JSON objects, using the JSON Pointer @jsonpointer standard for addressing specific parts of the JSON object. Due to its status as an approved web standard and the host of tools available to read, produce and apply JSONPatches in various languages @jsonpatch-exp, it satisfies the portability design goal through simplicity of integration and interoparability.

#v(4mm)

#figure(
  ```json
  [
    { "op": "replace", "path": "/baz", "value": "boo" },
    { "op": "add", "path": "/hello", "value": ["world"] },
    { "op": "remove", "path": "/foo" }
  ]
  ```,
  caption: [An example JSONPatch message @jsonpatch-exp.],
) <code-jsonpatch-example>

#v(4mm)

=== Diagram Schema <diagram-schema>

As mentioned in previous sections, to address challenges of realtime collaboration, we also propose modifying the schema of UML diagrams exposed by Apollon to the integrating platform in a way that the diagram schema, in combination with the patch messages (which are in JSONPatch format), constitute a data type that natively produces non-confilcting and commutative (patch) operations. This is done, however, while considering the extensibility and portability design goals previously outlined. In particular, the diagram schema can't be overtly tightly coupled with the realtime collaboration system, for example, by including clock vectors for each participating user, or by representing strings as linked lists of characters with unique identifiers (as in a CvRDT G-Counter or a CmRDT sequence respectively, see @crdt-background). This means that not all operations produced by the resulting data type will be commutative. Instead, we attempt to ensure commutativity for operations that are naturally independent, and fallback to other conflict resolution mechanisms for operations that are not. To achieve this, we propose the following modifications:

#v(4mm)

- Use of mappings of unique identifiers to entities instead of lists or sequences of entities that do have, or can naturally have, unique identifiers,
- Use of mappings of unique identifiers to boolean values (inclusion maps) to represent sets, instead of lists or sequences of such identifiers, when applicable,
- Treating other cases, including lists and strings that cannot be converted in this manner, as atomic objects.

#v(4mm)

#figure(
  ```json
  {
    "elements": [
      { "id": "<unique-id-1>", "type": "Package", ... },
      { "id": "<unqiue-id-2>", "type": "Class", ... },
    ],
    "relationships": [
      {
        "id": "<unique-id-3>",
        "source": { "element": "<unique-id-1>" },
        "target": { "element": "<unique-id-2>" },
        "path": [ { "x": 0, "y": 0 }, { "x": 10, "y": 10 } ],
        ...
      }
    ],
    "interactive": ["<unique-id-1>", "<unique-id-3>"]
  }
  ```,
  caption: [An example of a partial diagram in the original diagram schema]
) <code-schema-og>

#v(4mm)

@code-schema-og provides an example of the schema of UML diagrams exposed by Apollon prior to the work done in this thesis. Within this schema, though various UML elements can be identified by their unique IDs, their default adderssing vai JSONPointer would utilise their index in the list. The result would be unnecessary conflicts between patches that would add or remove elements, as outlined in @code-conflicting-patches.

#v(4mm)

#figure(
  ```json
  [
    {"op": "add", "path": "/elements/0", "value": ...}
  ]
  [
    {"op": "replace", "path": "/elements/0/type", "value": "Interface"}
  ]
  ```,
  caption: [Example of patches conflicting with original schema]
) <code-conflicting-patches>

#v(4mm)

This conflict would be resolved by applying the proposed modifications to the schema, as displayed by @code-schema-new. In this new schema, the `path` property of the first patch would become `/elements/<unique-id-4>`, where the `path` property of the second patch would become `/elements/<unique-id-1>/type`, resolving the conflict between these two independent patches and rendering them commutative.

#v(4mm)

#figure(
  ```json
  {
    "elements": {
      "<unique-id-1>": { "type": "Package", ... },
      "<unqiue-id-2>": { "type": "Class", ... },
    },
    "relationships": {
      "<unique-id-3>": {
        "source": { "element": "<unique-id-1>" },
        "target": { "element": "<unique-id-2>" },
        "path": [ { "x": 0, "y": 0 }, { "x": 10, "y": 10 } ],
        ...
      }
    },
    "interactive": {"<unique-id-1>": true, "<unique-id-3>": true}
  }
  ```,
  caption: [An example of a partial diagram in the modified diagram schema]
) <code-schema-new>

#v(4mm)

Note that not all lists and sequences can be replaced by mappings. For example, the `path` property of relationships in @code-schema-new (e.g. `relationships/<unique-id-3>/path`) is a list of points without unique identifiers and semantically meaningful indices (the order of the points in the path), leaving no straightforward solution for turning it into a mapping without encoding additional conflict resolution mechanisms to the type. Subsequently, we treat such addresses as atomic objects, i.e. any operation with a child path will be uplifted to an operation replacing the whole list.

As noted above, not all patch operations produced by this modified data type are commutative, specifically effect of operations relating to the same path will be dependent on the order of delivery. These operations are however idempotent, so we rely on the integrating platform to determine the "winning" patch for each path. In particular, an integrating platform with a client-server architecture, where the server guarantees delivery order of its messages to each client, will be natively picking this "winning" patch by rebroadcasting all patches to all clients (including the client who issued the patch), hence achieving Eventual Consistency. In @boundary, and in more detail in @g-eval, we discuss mechanisms through which this can be achieved in less reliable network conditions. 

== Subsytem Decomposition <subsystems>

The following section details the decomposition of the subsystems involved in realtime collaboration system implemented for Apollon, explained in detail as per @bruegge2004object. @figure-subsystems provides a high-level overview of the subsystems involved in realtime collaboration, in the context of an example integration of Apollon. The newly added subsystem for realtime collaboration (denoted as _Realtime Collab._) is highlighted for better visibility of changes implemented to Apollon and how these changes affect Apollon's interactions with integrating platforms.


#v(4mm)

#figure(
  image("figures/subsystems.svg", width: 80%),
  caption: [
    Subsystem decomposition of the implemented realtime collaboration system in Apollon, in an example integration scenario
  ],
) <figure-subsystems>

#v(4mm)

As described in previous sections, Apollon is a web-based UML editor that is integrated into web-based client of any integrating platform. Interactions between Apollon and the integrating platform are managed via the _ApollonEditor_ interface, with internal components contributing to the exposed APIs. In particular, the _Store_ components centrally manages all of the internal state of the application, including the state of the UML diagram being editted, with the _User Interface_ layer updating itself in response to changes in the _Store_. As detailed before, the content of the _Store_ is updated by _Reducer_ layer (which aggregates reducers from various subsystems) in response to dispatched actions (potentially by the UI layer). These actions are passed through a _Middleware_ layer beforehand (which similarly aggregates middlewares from various subsystems) which might modify the incoming actions, dispatch new actions, or merely run side-effects. This process can be observed in more detail in @figure-analysis-object.

The realtime collaboration subsystem interfaces with the _Store_ through three main constructs: (1) An exposed _Middleware_, which composes into the middleware layer and intercepts all changes made to the _Store_, triggering the _Patcher_ to produce any patches and emit them if necessary. (2) An exposed _Reducer_, which intercepts _patch actions_ (actions dispatched in response to patches received from remote peers) and triggers the _Patcher_ to calculate necessary updates to the _Store_. (3) An exposed _Saga_, which is a middleware with long running side-effects, re-aligning the layout of the local diagram after changes are applied due to an incoming remote patch (e.g. ensuring connected elements remain connected).

The _Patcher_ itself interacts with the _Patch Verifier_ during both processes: it uses the verifier to _sign_ patches that are to be emitted, and to _verify_ incoming patches to match them against previously signed patches. This verification system allows the realtime collaboration to optimistically suppress unnecessary remote patches and avoid stuttering, and is further detailed in @stuttering.

The integrating platform interfaces with the realtime collaboration by subscribing to the _Patcher_ (for emitting local changes) or by dispatching _patch actions_ (for receiving remote changes), both through the _ApollonEditor_ interface. The integrating platform can then utilise received patches to update the local or remote storage, or broadcast the change to other peers. The integrating platform is required to deliver emitted patches to all clients, including the client issuing the patch (see @diagram-schema).

#v(4mm)

#figure(
  image("figures/classes-detailed.svg"),
  caption: [
    Detailed class diagram of the implemented realtime collaboration system
  ],
) <figure-classes>

#v(4mm)

@figure-classes further details the concepts in the realtime collaboration subsystem. The _Patcher_ is the central component of the system, responsible for tracking changes to the state and emitting patches when necessary.

The _Patcher_ specifically allows for subscription to two types of changes "discrete", which denote important lower frequency changes (e.g. adding a new element, moving an element), and "continuous", denoting higher-frequency changes that can be dropped/throttled (e.g. patches related to moving an element while it is being moved by the user). Utilising continuous patches, the integrating platform can provide a smoother user experience, at the expense of higher-bandwidth usage, a choice that should be made by the integrating platform and provides flexibility for various network conditions.

=== Stuttering Prevention <stuttering>

Stuttering happens in scenarios where a client bounces between states in rapid succession. Take the following scenario as an example:

1. Clients A and B start from state $I$.
2. Client A applies $O_X$ to the diagram, yielding state $X$.
3. Client B applies $O_Y$ (of the same scope) to the diagram, yielding state $Y$.
4. Both clients receive $O_X$ from the server, syncing on state $X$.
5. Both clients receive $O_Y$ from the server, syncing on state $Y$.

The following are the sequence of states experienced by both clients:

$
  A: I -> X -> X -> Y \
  B: I -> Y -> X -> Y
$

In this scenario, client A experiences a smooth transition of states, while client B experiences stuttering. Considering the condition on the network layer (provided by the integrating platform) to rebroadcast all patches even to the issueing client, the stuttering effect shown above can also happen to a single client:

1. Client applies $O_X$, yielding state $X$.
2. Client applies $O_Y$, yielding state $Y$.
3. Client receives $O_X$ from the server, syncing on state $X$.
4. Client receives $O_Y$ from the server, syncing on state $Y$.

The client will subsequently experience the following sequence of states:

$
I -> X -> Y -> X -> Y
$

#v(4mm)

To mitigate this stuttering issue, the _Patch Verifier_ component was added to the realtime collaboration subsystem. When patches are to be emitted, the _Patcher_ asks the _Patch Verifier_ to sign each operation within the patch. The verifier checks each operation, and assigns a unique, randomly generated identifier to each replace operation (as other operations do not yield stuttering). The verifier also records the corresponding path of the patch with the unique identifier, for future verification of incoming patches (@figure-st-sign).

#v(4mm)

#figure(
  image("figures/st-sign.svg", width: 40%),
  caption: [
    Process of signing operations of a patch
  ],
) <figure-st-sign>

#v(4mm)

When a patch is received, the _Patch Verifier_ checks each operation whether it is signed, and whether its path is already recorded. The operation is skipped, and if the patch is self-signed, the path is removed from the record, allowing subsequent patches on this path to be applied (@figure-st-verify).

#v(4mm)

#figure(
  image("figures/st-verify.svg", width: 65%),
  caption: [
    Process of verifying operations of incoming patches
  ],
) <figure-st-verify>

#v(4mm)

Assuming each client receives patches from the server in the correct order, this mechanism allows clients to optimisitcally suppress patches that they know will be overwritten by a subsequent patch, hence avoiding stuttering. In effect, a client will _wait for confirmation_ for each patch it issues to the server, and supress all incoming patches on that path until it receives the confirmation.

#pagebreak()

=== Example Integrations

The implemented solution was also integrated into two platforms integrating Apollon: Apollon Standalone and Artemis. @figure-apollon-standalone-integration and @figure-artemis-integration provide an overview of the integration of the realtime collaboration system into these platforms.

#v(4mm)

#figure(
  image("figures/apollon-standalone.svg", width: 60%),
  caption: [
    Integration of realtime collaboration into ApollonStandalone
  ],
) <figure-apollon-standalone-integration>

#v(4mm)

Apollon Standalone uses a local persistence component that stores the diagrams locally, as well as a file storage service storing diagrams remotely when they are shared. The local persistence component subscribes to the UML diagrams directly through the store itself #footnote([The interfaces provided by the _Patcher_ and the _Store_ are aggregated in _ApollonEditor_ interface. This detail is removed from the diagram for clarity.]), and the collaboration service on the client side subscribes to incoming patches from _Patcher_ component of Apollon, which are relayed to the server via a WebSocket API. The service broadcasts these patches back to all connected clients, and also applies the patch to the remotely persisted diagram. 

#v(4mm)

#figure(
  image("figures/artemis.svg"),
  caption: [
    Integration of realtime collaboration into Artemis
  ],
) <figure-artemis-integration>

#v(4mm)

Artemis integrates the realtime collaboration of Apollon differently. The context of collaboration for Artemis are team-based modeling exercises, and upon emission of patches to the server, additional access control should be conducted to ensure that only valid team members receive the patches. To increase performance, the process is completely decoupled from persistence, which is handled by Artemis client periodically checking the diagram and syncing with the server, independent of the realtiome collaboration system.

#pagebreak()

== Boundry Conditions <boundary>

The proposed system achieves convergence (which is analogous to eventual consistency under described network conditions) in a client-server setup under the following network conditions, assuming that the integrating platform simply broadcasts all incoming patches to all clients (including the client that issued the patch):

#v(4mm)

- Exactly-once-delivery: each message that is sent by the client to the server and vice-versa delivers exactly once.
- Preserved delivery order: the order of delivery of messages from the server to the client is preserved.

#v(4mm)

Note that while preserved deliver order of protocols such as TCP @tcp ensures that messages transferred between the server and the client are delivered in the order they were sent, clients will still, inevitably, see different changes (specifically those issued locally) out-of-order, which is why commutativity of independent operations is a requirement regardless of network guarantees.

Additionally, the exactly-once-delivery guarantee can't be upheld under certain network conditions, for example where intermittent disconnections affect some clients. While idempotency of operations described via the proposed solution allows for mitigation strategies such as repeated retries, as such strategies are implemented in a separate network layer, they might violate the preserved order guarantee instead (i.e. message $a$ and $b$ are sent, $b$ is received while $a$ fails, and the system retries $a$, which results in out-of-order delivery of the messages).

Mitigation for such conditions is not baked in to the proposed solution itself in favor of meeting the expressed design goals (specifically of performance, portability and extensibility). Instead, the system is designed in a manner that accomodate such mitigation strategies. One such strategy would be to repeat the latest operation of each path, in an unsigned manner, to each client until the client confirms receipt. While operations of differing paths might be delivered out-of-order, their commutativity ensures that the clients converge on the same state. The removal of signature also ensures the stuttering suppression mechanism doesn't overrule the patch. To respect stuttering prevention, the network layer can for example send the unsigned version of the patch with a preset delay, avoiding the stuttering effect as well. This naive strategy ensures eventual consistency amongst clients in network conditions where merely eventual delivery is guaranteed.

The flexibility of the design of the system also allows integrating platforms to implement more sophisticated strategies. For example, using totally ordered logical timestamps allow the integrating platform to operate in a fully distributed manner, though it would incur associated overheads and complexities. The integrating platform can also detect prolonged disconnections of a client and resync the diagram wholesale. Further analysis and details of how various consistency properties can be achieved under various network conditions and topoligies is further discussed in @eval.

#pagebreak()

= Theoretical Analysis <theoretical-analysis>

This section provides a theoretical analysis of the proposed solution, evaluating the conditions under which it can achieve desired consistency properties of a realtime collaboration system. As a first step, a generalisation of the proposed solution (as detailed in @system-design) is provided (@general-form), followed by a detailed evaluation of this general form under various network conditions, alongside evaluation of applicability of this general criteria to the specific case of the proposed solution (@eval). In the later parts of this chapter, the evaluation results and limitations of the provided analysis are further discussed.

== Overview

The gist of the solution proposed by this thesis for realtime collaboration in Apollon can be deconstructed as a two-step approach:

- We first (re)design the data format to break it into separate and independent operational scopes, where operations from different scopes are commutative and non-conflicting natively,
- We ensure strong indempotency properties for operations within each scope, allowing for a mechanism to determine the _winning order_ or the _winning operation_ within each scope, with complexity of said mechanism solely determined by the feasible network topology (e.g. a simple relay in a client-server setup).

Based on these, a variety of actual mechanisms can be designed and implemented, ranging from a naive relay to a fully distributed setup, either treating the operations as blackboxes, or by coupling to the "scope" they affect.

These notions can be generalised using the introduced concept of _lenses_, which are arbitrary functions mapping the data to some other data type. Operations can be then categorised based on lenses which they affect (i.e. the change they make is reflected by the lens), establishing _operational scopes_. Commutativity between operations of different scopes can then be achieved if the original data-type can be reconstructed from lenses associated with these scopes. These operational scopes are then used to define required idempotency properties within each scope.

== General Form <general-form>

=== Definitions <defs>

We  assume a data type (an arbitrary set) $D$, equiped with an equality operator $=$, and a set of operations $O_D$ in the general form of $f: D -> D$. Within this context, we define a _lens_ as an arbitrary function from $D$ to some other domain $D'$ similarly equiped with an equality operator, i.e. a _lens_ is a function $ell: D -> D'$. For a given set of lenses, $Gamma_D$, the target domain $D'$ is determined implicitly as a set of all possible domains of members of $Gamma_D$, constructed in any arbitrary manner from its constintuents, but specifically in a manner that still provides an equality operator. For readability, we refer to the result of applying lens $ell$ on data $d$ as _$d$ viewed through (or under) $ell$_ and denote it by $d_ell$.

As a first step, we utilise the concept of lenses to provide definitions for the notion of _operational scope_ of any given operation:


#definition[
  A _lens sees an operation_, iff any data that changes under the operation also changes under it when viewed through that lens. Formally, we denote this relation with the $sees$ symbol, so for $ell in Gamma_D$, $f in O_D$ we have:

  #v(4mm)

  $
  ell sees f <=> forall d in D: d != f(d) => d_ell != f(d)_ell
  $
] <def-sees>


#definition[
  Two operations _share scope_ iff any lens that sees one, also sees the other. We denote this relationship by the $sharesscope$ symbol, and for all $f, g in O_D$ we have:

  #v(4mm)

  $
  f sharesscope g <=> forall ell in Gamma_D: ell sees f <=> ell sees g
  $

  #v(2mm)

  It is trivial to see that sharing scope is reflexive, commutative and transitive, so it can be used to partition operations into _scopes_. We define the scope of each operation $f$, denoted by $Delta f$, as the set of all operations sharing scope with $f$, i.e.:
  
  #v(4mm)

  $
  Delta f := { g in O_D | f sharesscope g }
  $
] <def-sharesscope>

#pagebreak()

For the next step, we provide definitions to capture the notion of _independence_ of operations of varying scopes:

#definition[
  Operation $f$ _is blind to_ operation $g$ under lens $ell$, iff:

  #v(4mm)

  $
  forall d in D: f(g(d))_ell = f(d)_ell
  $

  We denote this relationship with the $blindto_ell$ symbol ($f blindto_ell g$).
] <def-blind-under>

#v(4mm)

#definition[
  A given lens $ell$ _is blind to_ operation $f$, iff it does not see the effect of $f$ on any data. We denote this relationship by the $blindto$ symbol, and have:

  #v(4mm)

  $
  ell blindto f <=> forall d in D: d_ell = f(d)_ell
  $

  #v(4mm)
] <def-blind>


#definition[
  A lens $ell$ _selects_ an operation $f$ (or its scope), or $ell$ _is a selector for_ $f$ (or its scope), iff it sees $f$ and is blind to any operation $g$ outside of the scope. We denote this relationship with the $selects$ symbol, and have:

  #v(4mm)

  $
  ell selects f <=> (ell sees f) and (forall g in.not Delta f: ell blindto g)
  $
] <def-selects>

#v(4mm)

With these baseline definitions established, we can derive basic conditions for commutativity of operations with differing scopes:

#proposition[
  Given operation $f$ selected by given lens $ell$, $f$ commutes with operation $g$ outside of its scope under $ell$, if and only if $f$ is blind to $g$ under $ell$. <prop-com>

  #proof[ For any $g in.not Delta f$ where $f$ is blind to $g$ under $ell$ we have:
    $
     f blindto_ell g & => forall d in D: f(g(d))_ell = f(d)_ell \
     ell blindto g & => forall d in D: g(f(d))_ell = f(d)_ell \
     & => forall d in D: f(g(d))_ell = g(f(d))_ell \
     & => (f compose g)_ell = (g compose f)_ell
    $ 

    Conversely, for any $g in.not Delta f$ that commutes with $f$ under $ell$ we have:

    $
      ell blindto g & => forall d in D: g(f(d))_ell = f(d)_ell \
      (f compose g)_ell = (g compose f)_ell & => forall d in D: g(f(d))_ell = f(g(d))_ell \
      & => forall d in D: f(g(d))_ell = f(d)_ell \
      & => f blindto_ell g
    $

    Altogether, we have:

    $
    ell selects f => forall g in.not Delta f: f blindto_ell g <=> (f compose g)_ell = (g compose f)_ell
    $
  ]
]

=== Reconstruction <rec>

Having established sufficient criteria for operations of different scopes to commute under their respective selectors, we can now expand this notion to general commutativity by reconstructing the original data from a given set of lenses. For an ordered set of lenses $Gamma$, denoted by $angle.l ell_1, ell_2, ... angle.r$, we express the image of any data $d in D$ by $angle.l d_ell_1, d_ell_2, ... angle.r$, denoted as $d_Gamma$. Subsequently we denote the image of D under $Gamma$ as $D_Gamma$:

$
D_Gamma equiv { d_Gamma | d in D }
$

#v(2mm)

#definition[
  Some data type $D$ _can be reconstrcuted_ from an ordered set of lenses $Gamma$, iff there exists function $R: D_Gamma -> D$ such that:

  #v(4mm)

  $
  forall d in D: R(d_Gamma) = d
  $ 
] <def-rec>

#v(2mm)

#proposition[
  (_Reconstruction_) Given a data type $D$, a set of operations $O$, and an ordered set of lenses $Gamma$, if the following conditions hold:

  1. $Gamma$ consists of selectors of O: $forall ell in Gamma exists f in O: ell selects f$
  2. operations not sharing scope are blind to each other under their selectors,
  3. we can reconstruct $D$ from $Gamma$,

  Then operations of different scopes commute. <prop-rec>

  #proof[
    We first show that operations of different scopes commute under all lenses. #link(<prop-com>)[Proposition 1] already proves that such operations commute under their respective selectors, so it suffices to show that operations commute under lenses selecting neither:

    $
    ell blindto f and ell blindto g & => \
      forall d in D:& f(g(d))_ell  = g(d)_ell = d_ell \
      & = f(d)_ell = g(f(d))_ell \
      & => (f compose g)_ell = (g compose f)_ell
    $

    This means $f$ and $g$ commute under $Gamma$:

    $
    forall d in D: f(g(d))_Gamma & = angle.l f(g(d))_ell_1, f(g(d))_ell_2, ... angle.r \
    & = angle.l g(f(d))_ell_1, g(f(d))_ell_2, ... angle.r \
    & = g(f(d))_Gamma \
    & => (f compose g)_Gamma = (g compose f)_Gamma
    $

    Since we can reconstruct $D$ from $Gamma$, for example using reconstruction function $R$, we can prove $f$ and $g$ generally commute:

    $
    forall d in D: f(g(d)) &= R(f(g(d))_Gamma) \ &= R(g(f(d))_Gamma) \ &= g(f(d)) \
  & => f compose g = g compose f
    $

  ]
]

Intuitively, this result indicates that given a particular data type and its associated operations, if we can find a set of lenses that partition operations into independent scopes (operations of one scope being blind to operations of another under their selector) and reconstruct the data from these lenses, then the operations of different scopes will commute.

=== Idempotency <idem>

As described in @system-design, the proposed solution relies on idempotency of operations within each scope to resolve their conflicts. In particular, an operation $f$ might be applied locally by the client, and then reapplied when the client receives a sequence of other operations from the server, including said operation. We capture this notion in the definition of _strong idempotency_:

#definition[
  An operation $f$ is _strongly idemptoent_ with respect to a set of operations $O$, iff for any finite (potentially empty) sequence $G$ of operations of $O$ in form of $angle.l g_1, g_2, ... angle.r$, we have:

  #v(4mm)

  $
  f compose G compose f = f compose G
  $

  Here, application and composition of ordered sets of operations is equivalent to application and composition of their elements in given order, i.e.

  $
  & f compose G = f compose g_1 compose g_2 compose ... \
  & G compose f = g_1 compose g_2 compose ... compose f \
  & G(d) = g_1(g_2(...(g_n(d))...)) \
  & G compose G' = g_1 compose g_2 compose ... compose g_n compose g_1' compose g_2' compose ... compose g_m'
  $
]<def-str-idem>

#v(4mm)

Strong idempotency in particular allows us to fulfill the realtime requirment of a realtime collaboration system, while also achieving eventual consistency using a client-server architecture with exactly-once-delivery and preserved delivery order guarantees. If we have independent operational scopes that can reconstruct the data, we can achieve strong idempotency by merely ensuring each operation is strongly idempotent with respect to its own scope.

#proposition[
  Given a data type $D$, a set of operations $O$, and an ordered set of lenses $Gamma$, if conditions of #link(<prop-rec>)[_Reconstruction_] (Proposition 2) hold and operations are strongly idempotent with respect to their scopes, then operations are strongly idempotent with respect to $O$. <prop-stid>

  #proof[
    We use strong induction on the size of the operation sequence $X$. For the initial step of induction, assume $X = angle.l x angle.r$. We now prove that given operation $f$ is strongly idempotent with respect to ${x}$ under all lenses, i.e.:

    $
    forall ell in Gamma: (f compose x compose f)_ell = (f compose x)_ell
    $

    - If $ell blindto f$, $ell blindto x$, then we have
      $forall d in D: f(x(f(d)))_ell = d_ell = f(x(d))_ell$
    - If $ell blindto f$, $ell selects x$, then we have:
      $
      forall d in D: f(x(f(d)))_ell &= x(f(d))_ell #h(20mm)& because ell blindto f \
      &= x(d)_ell & because x blindto_ell f \
      &= f(x(d))_ell & because ell blindto f
      $
    - If $ell selects f$, $x in.not Delta f$, then we have:
      $
      forall d in D: f(x(f(d)))_ell &= f(f(d))_ell #h(20mm)& because f blindto_ell x \
      &= f(d)_ell & because f "is idempotent" \
      &= f(x(d))_ell & because f blindto_ell x
      $
    - If $ell selects f$, $ell selects x$, then $x in Delta f$ and we have strong idempotency by assumption.

    We now use the reconstruction function to expand this result to the whole data type:
    $
    forall d in D: (f compose x compose f)(d) &= R(angle.l (f compose x compose f)(d)_ell_1, (f compose x compose f)(d)_ell_2, ... angle.r) \
    &= R(angle.l (f compose x)(d)_ell_1, (f compose x)(d)_ell_2, ... angle.r) \
    &= (f compose x)(d) \
    $

    As the next step of induction, for any larger sequence $X$, we break it into smaller sequences $X_1$ and $X_2$. Due to induction, we have:

    $
    f compose X compose f &= f compose X_1 compose X_2 compose f &\
    &= f compose X_1 compose f compose X_2 compose f #h(20mm)& because f compose X_1 = f compose X_1 compose f \
    &= f compose X_1 compose f compose X_2 & because f compose X_2 compose f = f compose X_2 \
    &= f compose X_1 compose X_2 & because f compose X_1 compose f = f compose X_1 \
    & = f compose X
    $
    #v(4mm)
  ]
] 

It is notable that the operations of the proposed realtime collaboration solution for Apollon display a stronger property than _strong idempotency_: they effectively _overwrite_ the content of their respective scopes. This notion can be expressed by an operation being blind to other operations of a scope, including potentially itself, under the selectors of the scope:

#definition[
  An operation $f$ _overwrites_ a scope $Delta$, iff it is blind to all operations of $Delta$ under their selectors, i.e.:
  $
  forall ell selects Delta, forall g in Delta: f blindto_ell g
  $
]

Needless to say that if independent operational scopes are established, then an operation can only overwrite its own scope. In such a condition, the operation is also necessarily strongly idempotent with regards to its scope. The converse is however not ture, for example given the following setup:
$
& f := (x, y) -> cases(
  (x + 1, 1) text(#h(20mm)& "if" y = 0),
  (x, y) & "otherwise"
) \
& g := (x, y) -> (3, y) \
& O := {f, g}, Gamma := { p -> p }, D := ZZ^2 \
$

Operation $f$ is strongly idempotent with respect to its scope, but it does not overwrite its scope (e.g. $f(0, 0) != f o g(0, 0)$).

#pagebreak()

== Evaluation <eval>

In the following section, we evaluate which consistency properties can be achieved when the generalised criteria described in @general-form are satisfied, and under which network conditions. We then evaluate the applicability of these criteria to the specific case of the proposed solution for realtime collaboration in Apollon.

=== General Form Evaluation <g-eval>

==== Client-Server Setup, Reliable Network

For a client-server setup with exactly-once-delivery and preserved delivery order guarantees, it can be observed that _strong idempotency_ of operations suffices to achieve _Convergence_ (i.e. all clients will eventually converge to the same state @cci). As mentioned before, low-level network protocols such as TCP guarantee preserved delivery order @tcp, and exactly-once-delivery can also be assumed if no serious partitions occur (i.e. clients don't get disconnected).

In such a scenario, it suffices for the server to broadcast the operations it receives to all clients, including the client who issued the operation. Assuming client A conducts operation $a$ while client B conducts operation $b$ locally, and the server broadcasts the sequence $angle.l a, b angle.r$, and assuming both clients started from the same initial state $i$, its easy to observe how their respective states, denoted by $S_A$ and $S_B$ converge:

$
S_A = (a compose b compose a)(i) = (a compose b)(i) #h(20mm)& because a "is strongly idempotent" \
S_B = (a compose b compose b)(i) = (a compose b)(i) #h(20mm)& because b "is idempotent" \
$

A similar process happens with larger sequences of events, as strong idempotency ensures that operations executed locally to ensure realtime aspect of the system yield no effect on the final state each client converges to, as it can be derived purely from the sequence of operations the server broadcasts.

In this scenario, _Strong Convergence_ is also achieved. As per @crdts, _Strong Convergence_ requires that all clients that have received the same set of operations have converged on the same state. If two clients have observed the same operations in the described setup, they have necessarily observed them in the same order as delivered by the server, which as above, results in the same state.

==== Client-Server Setup, Unreliable Network

For a client-server setup where eventual delivery is the only network guarantee (i.e. all messages will eventually be delivered), a data type partitioned into independent operational scopes that can be reconstructed from these scopes (i.e. requirements of #link(<prop-rec>)[_Reconstruction_], Proposition 2, are met), with operations that _overwrite_ their scopes, can achieve _Eventual Consistency_ (convergence under the described network conditions @crdts). To that end, the server needs to replay the last operation of each scope to all clients until it receives an acknowledgement from said client for said operation. Operations of various scopes might arrive at clients out-of-order, but they commute and subsequently yield the same final state (as per #link(<prop-rec>)[Proposition 2]). Additionally, since the operations overwrite their respective scopes, it suffices for eventual convergence within each scope that each client eventually receives the last operation of said scope, which is guaranteed by the network conditions.

Note that this scenario does not satisfy _Strong Eventual Consistency_, as it is possible for a client to have received the same set of operations of a particular scope with a different order, resulting in two clients who have observed the same set of operations but have not converged on the same state.

==== Distributed Setup

In a distributed setup with an eventual delivery guarantee, if conditions of #link(<prop-rec>)[_Reconstruction_] hold and operations overwrite their scopes, _Strong Eventual Consistency_ (and by extension, _Eventual Consistency_) can be achieved. In this scenario, we additionally treat each operational scope as a LWW Register #footnote([Last-Write-Wins Register]) CRDT, as described in @crdt-list, for example we can attach a logical timestamp combined with a unique client identifier to each operation, and use it to reach consensus on the _winning_ operation amongst peers. With this modification, operations within each scope will commute, and due to #link(<prop-rec>)[Proposition 2], operations of different scopes also commute, achieving full commutativity.

==== Intention Preservation <int-prev>

Intention Preservation is another consistency requirement desired for realtime collaboration systems, which ensures that the intention of each operation is preserved when it is executed in different clients upon different states @cci. The effect of an operation can be expressed with its scope, in which case intention preservation is achieved when operational scopes are independent and operations overwrite their respective scopes, since the context of application does not affect the operation anymore. That said, for example in the case of the solution implemented for Apollon, where paths of UML relationships are treated as atomic registers, two clients moving two connected elements at the same time might converge on a diagram where the elements are no longer connected. Specifically, if clients A and B move connected elements $e_A$ and $e_B$ respectively, the operational scope related to the path of the connection between the elements will be overwritten by one, for example client A, which leads to the potential of it being disconnected from $e_B$. In a sense, the intention is preserved: client A intended for the path to be connected to $e_A$ and end where $e_B$ used to be when they made their changes, but it in a more real sense, the intention of both clients was to maintain the elements connected. As noted by @cci, intention preservation only takes "syntactic intention" into account, but the provided example yields a "semantic violation of intention" that arguably results in a diagram with a wrong syntax, although the intention based on the syntax of the diagram object (the UML diagram schema) is preserved.

=== Evaluation of Proposed Solution <s-eval>

Since the operations of the proposed solution are JSONPatches, a natural candidate for lenses is functions selecting each possible operation path (JSONPointer). Within this context, it is trivial to observe that _replace_ operations of different paths do constitute independent operational scopes, and each operation overwrites its scope, if the paths of the patches issued are detailed to the level of atomic objects (whether they are atomic by nature, like boolean or string values, or are treated atomic as perscribed by @diagram-schema): Since these paths point to atomic objects, two operations either point to the same object (in which case each operation overwrites its scope), or they point to different atomic objects and are independent (the lenses corresponding to their paths select them and are blind to the other, and they are blind to each other under these lenses).

#figure(
  ```json
  {
    "a": {
      "b": 2,
      "c": ["x", "y"]
    }
  }

  A: [{ "op": "replace", "path": "/a/b", "value": 3}],
  B: [{ "op": "replace", "path": "/a/b", "value": 4}],
  C: [{ "op": "replace", "path": "/a/c", "value": ["x", "z"]}],
  D: [{ "op": "replace", "path": "/a", "value": { "b": 6, "c": [] }}]

  
  ```,
  caption: [
    Example JSON document with atomic and non-atomic replace operations
  ],
) <figure-json>

Note that this operational independence between replace operations would not be true if paths used in operations did not point to atomic objects. For example, in @figure-json, operations A and C are independent, and operations A and B share the scope and overwrite it, both selected by the lens corresponding to the path `"/a/b"`. However, operations A and D are not independent, as the path of D is a parent of the path of A, and the operations are not blind to each other under the lens corresponding to the path `"/a"`.

As described in @diagram-schema, arrays that can't be transformed into mappings with unique ids are treated as atomic values in the proposed solution. Subsequently, no _add_ or _remove_ operations with paths traversing array indices are produced. With this complexity resolved, _add_ and _remove_ operations can also be assumed as _replace_ operations, respectively from and to some null value. We can also assume that each _add_ or _remove_ operation is broken into several _add_ or _remove_ operations with atomic values, to preserve operational independence described above. For example, in @figure-json, an _add_ operation for path `"/a"` can be broken into two _add_ operations for paths `"/a/b"` and "`/a/c`".

Overall, with specified criteria, the proposed solution does induce independent operational scopes with operations overwriting their respective scopes. It is trivial to reconstruct the JSON object from any given set of JSON Pointers and their associated atomic values.

== Discussion <disc>

The results outlined in @eval, demonstrate that utilising the proposed solution for realtime collaboration for Apollon, we can achieve _Convergence_ and _Strong Convergence_ in a client-server setup with reliable network conditions, _Eventual Consistency_ but not _Strong Eventual Consistency_ in a client-server setup with unreliable network, and we  achieve _Strong Eventual Consistency_ in a distributed setting by adding a distributed layer on top of the implemented solution.

A particularly interesting aspect of the provided generalised solution is its relation with other techniques such as CRDTs. In particular, the structure of many (but not all) CRDTs can be expressed via independent operational scopes, and a mechanism for determining "winning" operations within each scope. For example, a CRDT sequence, as described in @crdt-background, can be expressed with a data type of mapping of unique identifiers (with a total order) to characters, lenses that select each such identifier, and operations for mapping a character to  an identifier (_insert_) or marking such an identifier as deleted (_delete_). The main difference from this perspective is that operations within each scope are also specifically designed, in tandem with the data type, to commut as well, yielding _Strong Eventual Consistency_. As discussed in @eval, the generalised form of the proposed solution (and by extension, the specific solution proposed for Apollon) can also be extended to achieve _Strong Eventual Consistency_ by attaching similarly unique identifiers with an established total ordering to each operational scope.

In effect, the proposed solution of this thesis deconstructs the process of designing a CRDT, retaining the essential aspect of operational independence, but avoiding complexity necessary for achieving full commutativity. Instead, the solution relies on network guarantees, or subsequent adoptions, to ensure convergence, providing an extensible bedrock that avoids complexities and overheads associated with CRDTs while remaining flexible enough for their addition in cases where stronger guarantees are needed.


== Limitations <limits>

The provided theoretical analysis and evaluation considers only consistency properties for the proposed solution. A key missing aspect here is performance analysis, specifically as the proposed solution was preferred over CRDTs in part due to it avoiding performance overheads attached with CRDTs. While intuitively it is easy to see why the simpler solution provided here, with its lack of awareness of participants or avoidance of maintaining or communicating data beyond what is required for representation of diagrams, would be more performant, a more detailed analysis of this aspect is needed.

Similarly, while the provided analysis does outline the achievable consistency properties in various conditions, it is lacking in deriving minimum requirements of the external environment (feasible network topology, network guarantees) based on desired consistency properties. For example, it is not clear if _Strong Convergence_ suffices for a particular application, which network guarantees would be required minimally.

The evaluation is in need of a more in-depth analysis of intention preservation and its correlation with expressed criteria and framework. The provided example in @int-prev highlights this shortcoming, as it can't be clearly argued whether syntactic intention is preserved, even for the special case of realtime collaboration in Apollon from which the generalised form was derived.

Provided analysis merely hints at the connection between the outlined general framework and CRDTs, leaving room for more in-depth analysis of properties of CRDTs that can be relaxed in favor of simplicity and performance, and the implications of such relaxations on consistency. The perceived "simplicity" that is achieved here is also only described qualitatively, and while this might be easy to express more precisely in comparison with CRDTs where information about pariticpants is embedded into the data type itself, or in cases where deriving the representational data from the replicated schema is non-trivial, present work falls short of providing such an expression, or further investigation with cases where distinctions are not trivial.

#pagebreak()

= Summary <summary>

In the following sections, we summarize the status of the thesis, providing an overview of fulfillment of outlined functional and non-functional requirements, and the achieved and open goals. We conclude by providing an overview of the contributions made by this work and potential future work.

== Status <status>

@fr-status and @nfr-status provide an overview of the status of functional and non-functional requirements, respectively. The following symbols are used to denote the status of each requirement:

- $success$: requirement fulfilled,
- $semisuccess$: requirement partially fulfilled,
- $failure$: requirement not fulfilled.

#figure(
  table(
    columns: (30mm, 1fr, auto),
    align: (center, left, center),
    table.header([Requirement], [Description], [Status]),
    link(<fr1>)[FR1], [*Collaboration*: users see each other's changes], [$success$],
    link(<fr2>)[FR2], [*Realtime*: local changes are reflected immediately], [$success$],
    link(<fr3>)[FR3], [*Unconstrained Editing*: users can edit any part of the diagram], [$success$],
    link(<fr4>)[FR4], [*Eventual Consistency*: users eventually converge], [$success$],
    link(<fr5>)[FR5], [*Intention Preservation*: changes maintain intended effect], [$semisuccess$],
    link(<fr6>)[FR6], [*Conflict Resolution*: independent changes don't conflict], [$success$],
    link(<fr7>)[FR7], [*Update Notification*: consumer code gets updates], [$success$],
    link(<fr8>)[FR8], [*Receiving Updates*: independent changes don't conflict], [$success$],
  ),
  caption: [Status of functional requirements]
) <fr-status>

Most functional requirements are fulfilled by the implementation of the proposed system and its integration into Artemis and Apollon Standalone platforms, as detailed in @eval. As discussed in that section, and specifically as elaborated in @int-prev, while intention behind changes is preserved in most cases, there are example scenarios where it is violated. While as described in @subsystems, the implementation implores other mechanisms to compensate for such cases, it can be argued that the realtime collaboration system did not fully materialise this particular requirement.

#figure(
  table(
    columns: (30mm, 1fr, auto),
    align: (center, left, center),
    table.header([Requirement], [Description], [Status]),
    link(<nfr1>)[NFR1], [*Usability*: realtime collab as smooth as local editing], [$success$],
    link(<nfr2>)[NFR2], [*Reliability*: fault-tolerance towards network partitions], [$failure$],
    link(<nfr3>)[NFR3], [*Reliability*: fault-tolerance towards network unreliability], [$semisuccess$],
    link(<nfr4>)[NFR4], [*Reliability*: peers converge strongly], [$semisuccess$],
    link(<nfr5>)[NFR5], [*Performance*: updates deliver quickly], [$success$],
    link(<nfr6>)[NFR6], [*Performance*: optimised resource usage], [$semisuccess$],
    link(<nfr7>)[NFR7], [*Performance*: optimised message size], [$success$],
    link(<nfr8>)[NFR8], [*Supportability*: easy integration], [$success$],
    link(<nfr9>)[NFR9], [*Supportability*: update message interop.], [$success$],
    link(<nfr10>)[NFR10], [*Supportability*: independent subsystem], [$success$],
    link(<nfr11>)[NFR11], [*Supportability*: easy extension of new diagram types], [$semisuccess$],
  ),
  caption: [Status of non-functional requirements]
) <nfr-status>

#link(<nfr2>)[NFR2] is considered not fulfilled, as although theoretically the proposed solution can be used in a manner that fault tolerance towards network partitions is achieved (see @g-eval), neither the actual implementation nor the integrations utilise such a mechanism. This particular non-functional requirement was deprioritized in favor of the supportability goals as detailed in @trade-offs. The same trade-off affected resulted in deprioritization of #link(<nfr3>)[NFR3] and #link(<nfr4>)[NFR4], which are considered partially fulfilled as the implemented system does provide strong convergence and fault-tolerance towards some degree of out-of-order delivery and message loss, while achieving ideal tolerance is delegated to the integrating platforms (see @g-eval).

#link(<nfr6>)[NFR6] is considered partially fulfilled, as though overheads associated with commonly used realtime collaboration solutions such as CRDTs and Operational Transformation are avoided, present work still lacks a proper analysis of the performance of the system, due to limited time scope of the work. #link(<nfr11>)[NFR11] is also considered partially fulfilled, as though addition of new diagram types is mostly unaffected by the realtime collaboration system and the system supports those extensions out-of-the-box, the ideal of "zero awareness" (required from developers) could not be achieved and developers of such extensions need to consider the guidelines provided in @diagram-schema.

=== Realized Goals <r-goals>

From the targetted objectives of the work, design and implementation is considered complete, providing a simple, easily integratable and extensible realtime collaboration system that achieves strong convergence with minimal work required by integrating platforms, and can easily be expanded to behave in a more fault-tolerant manner (see @eval).

The integration goal is considered partially achieved, as integration of the realtime collaboration system into Artemis and Apollon Standalone projects was implemented, successfully acting as a testbed to ensure simplicity of integration of the system. The goal is considered partially achieved as there is still room for integration into a more scalable remote persistence layer, which might come with its own unique challenges.

The goal of providing a theoretical analysis is also considered mostly achieved. The provided analysis outlines a generalised framework for assessing the proposed solution, similar solutions, and their relations to CRDTs, alongside proving consistency properties in vaiorus network topologies and conditions.

=== Open Goals <o-goals>

As mentioned above, the objective of integration into a more scalable remote persistence system and resolving all potential challenges that come with that is an open goal. This goal was not achieved due to limited time constraints of the project, and is left for future work.

Additionally, as described in @nfr-status, many requirements related to the reliability design goal were partially realised. This is due to the design decision of prioritising extensibility and portability of the solution over strong fault tolerance, while flexibility to easily add mechanisms providing such fault tolerance was provided, as detailed in @trade-offs.

== Conclusion <conclusion>

Through this thesis, realtime collaboration capabilities for Apollon were designed and implemented, supporting straightforward integration into platforms aiming to utilise Apollon, as demonstrated by integration with Apollon Standalone and Artemis. Implemented solution provides a simple, yet easily integratable and existensible system that achieves strong consistency properties without requiring coupling of consumer code or future Apollon extensions into the system, while providing flexibility for various circumstances and requirements.

Present work also provided a theoretical analysis of the proposed solution, establishing a generalised framework for assessing the realtime collaboration system of Apollon alongside any similar systems, outlining theoretically sufficient conditions for designing and implementing such systems, and providing an evaluation of consistency properties such systems would yield in various architectures and under various network conditions. The analysis also provided a connection between the proposed solution and CRDTs, establishing a guideline for relaxing constraints of CRDTs in a granular manner to achieve simplicity and performance.

== Future Work <future-work>

As outlined in previous sections, present thesis highlights several areas for improvement and further work, both with regards to realtime collaboration on UML diagrams and similarly structured data, and specifically with regards to Apollon.

=== Integration

Integration into a wider variety of platforms can help further refine the requirements and realtime collaboration features provided by Apollon itself. Most notably of interest would be integration into a system requiring scalable persistence solutions, as it potentially highlights requirements in the area of applying update messages provided by Apollon as atomic operations on partitioned databases, and designing architectures for fault-tolerant and consistent persistence of data in face of high-frequency updates.

Another area of interest would be integration into more distributed platforms, which help further analyse the requirements of fault-tolerance and consistency, and potentially result in a realtime collaboration system that can be used in an out-of-the-box manner in a wider variety of platforms, assuming associated overheads with such solutions can be overcome.

=== Functionality Extension

Another area for potential improvement is extended functionality of the realtime collaboration system within Apollon itself. For example, better support for partition-recovery mechanisms could further reduce complexity of implementing more robust realtime collaboration for integrating platforms.

Additionally, improved intention preservation, specifically with regards to special cases such as paths of UML relationships, can result in smoother and more intuitive user experience. Such work would also require further investigation into how such systems can be implemented within the boundaries of the constraints and design goals outlined in this thesis, or which trade-offs should be looked at in a different manner to accomodate such more in-depth systems.

=== Analysis

As mentioned in @limits, present thesis also leaves a lot of room for further theoretical analysis. A more in-depth performance analysis of the proposed solution can provide further insight into the validity of the trade-offs made in favor of simplicity and performance against fault tolerance. Additionally, further theoretical investigation can shed more light into the connection between such potential trade-offs, for example by providing a more precise expression of the "simplicity" goal of this thesis, specifically as it is also boasted as one of the main advantages of CRDTs in general against similar solutions @crdts, @ot-v-crdt. Further theoretical work could also provide a more concrete framework for relaxing various consistency constraints under various network conditions and how such relaxations would yield differing performance results.