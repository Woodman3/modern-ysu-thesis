#import "@preview/anti-matter:0.1.1":anti-matter,fence,set-numbering
#set page("a4", height: auto,numbering: "I")

// #let t(it) = {
//   anti-matter(numbering:("-I","1","I-"),it)
// }

first
#pagebreak(to:"odd")
// #show:t
#set page(header: {})
#set page(numbering: "- I =")
#counter(page).update(1)
second

#counter(page).display()
#pagebreak()
thrid
#counter(page).display()
#fence()
#pagebreak()
forth
#counter(page).display()
#fence()
#pagebreak()
fifth
#counter(page).display()