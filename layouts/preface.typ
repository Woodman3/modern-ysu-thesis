// 前言，重置页面计数器
#let preface(
  // documentclass 传入的参数
  twoside: false,
  // 其他参数
  spec: (front: "- I -", inner: "- 1 -", back: "I"),
  ..args,
  it,
) = {
  // 分页
  if (twoside) {
    pagebreak() + " "
  }
  set page(numbering: "I",footer:[
    #set align(center)
    #counter(page).display("- I -")
  ])
  counter(page).update(1)
  set page()
  it
}