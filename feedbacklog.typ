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