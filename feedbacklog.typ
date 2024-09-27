#import "/feedbacklog_template.typ": *
#import "/common/metadata.typ": *
#import "/common/feedback.typ": *

#set document(title: titleEnglish, author: author)

#show: feedbacklog.with(
  titleEnglish: titleEnglish,
  supervisor: supervisor,
  advisors: advisors,
  author: author,
  presentationDate: presentationDate,
  feedbacklogSubmissionDate: feedbacklogSubmissionDate,
)

#feedback(
  feedback:
    "Comparison is only made with existing realtime collaboration algorithms, but not existing software satisfying outlined requirements.",
  response:
    "Such software typically use a known realtime collaboration algorithm falling under one of the discussed categories. To further clarify this, specific discussion of the one of the most famous diagram editting softwares, tldraw, and its specific underlying library, Yjs, using the YATA approach, was added to the thesis in the third chapter \"Related Work\"."
)

#feedback(
  feedback:
    "While proper software design and engineering concepts are established, the evaluation of the implemented solution is done only theoretically. Additionally, only the theoretical limitations of presented work are discussed, which might be niche corner cases and differ from real world limitations of the software. Since this work is done in the applied engineering chair, an evaluation, possibly in form of a real-world test of Apollon in collaborative settings, should also be conducted.",
  response:
    "Real-world testing sessions were conducted, and parameters of these sessions, alongside general learnings (in which cases realtime collaboration in Apollon was found to be useful, missing features and pain points) where added to slides 26 & 27, alongside a detailed report in confluence and corresponding issues on Github."
)

#feedback(
  feedback:
    "System design diagram is perhaps too much in depth, as it involves concepts such as Middlewares and Reducers.",
  response:
    "These concepts are basic primitives of Redux-based application architecture, which is the architecture of choice for Apollon. It is thus necessary to use them to outline how the newly implemented realtime collaboration system interacts with Apollon's existing subsystems."
)

#feedback(
  feedback:
    "In the demo recording, it is not clear that two users are using the system and collaborating with each other. This should be further clarified.",
  response:
    "The main improvement of the new realtime collaboration system of Apollon over the previous 'naive' implementation is specifically its ability to handle simultaenous changes to the diagram, which makes demos inherently hard to follow. For further clarification, an explanatory description was added to slide 20."
)

#feedback(
  feedback:
    "The supervisor's name is missing from the title slide.",
  response:
    "Apologies for the oversight, the title slide was updated with all necessary information including the name of the thesis supervisor."
)