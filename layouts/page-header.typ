#import "@preview/anti-matter:0.0.2": anti-front-end
#import "@preview/i-figured:0.2.4"
#import "../utils/style.typ": 字号, 字体
#import "../utils/custom-numbering.typ": custom-numbering
#import "../utils/custom-heading.typ": heading-display, active-heading, current-heading
#import "../utils/indent.typ": fake-par
#import "../utils/unpairs.typ": unpairs

#let page-header(
  twoside: false,
  fonts: (:),
  // 其他参数
  leading: 1.5 * 15.6pt - 0.7em,
  spacing: 1.5 * 15.6pt - 0.7em,
  justify: true,
  first-line-indent: 2em,
  numbering: custom-numbering.with(first-level: "第1章 ", depth: 4, "1.1 "),
  // 正文字体与字号参数
  text-args: auto,
  // 标题字体与字号
  heading-font: auto,
  heading-size: (字号.小二, 字号.小三,字号.四号,字号.小四),
  heading-weight: ("regular",),
  heading-above: (33pt, 11pt*1.5,11pt*1.5,11pt),
  heading-below: (22pt*0.8,11pt*1.5,11pt*1.5,11pt),
  heading-pagebreak: (true, false),
  heading-align: (center, auto),
  // 页眉
  header-render: auto,
  header-vspace: 0em,
  display-header: true,
  skip-on-first-level: true,
  stroke-width: 0.5pt,
  reset-footnote: true,
  // caption 的 separator
  separator: "  ",
  // caption 样式
  caption-style: strong,
  caption-size: 字号.五号,
  // figure 计数
  show-figure: i-figured.show-figure,
  // equation 计数
  show-equation: i-figured.show-equation,
  ..args,
  it,
) = {
  set page(..(if display-header {
    (
      header: {
        // 重置 footnote 计数器
        if reset-footnote {
          counter(footnote).update(0)
        }
        locate(loc => {
          // 5.1 获取当前页面的一级标题
          let cur-heading = current-heading(level: 1, loc)
          // 5.2 如果当前页面没有一级标题，则渲染页眉
          // 我改了下，有也渲染
            if header-render == auto {
              let first-level-heading = if calc.rem(loc.page(), 2)==1 {
                  heading-display(active-heading(level: 1,prev:false, loc)) 
              } else {
                "燕山大学本科生毕业设计（论文）" 
              }
              set text(font: fonts.楷体, size: 字号.五号)
              stack(
                align(center,first-level-heading),
                if first-level-heading != "" {
                  stack(
                    spacing: 1.4pt,
                    line(length: 100%, stroke: stroke-width+0.3pt + black),
                    line(length: 100%, stroke: stroke-width + black))
                   },

              )
            } else {
              header-render(loc)
            }
            v(header-vspace)
        })
      }
    )
  } else {
    (
      header: {
        // 重置 footnote 计数器
        if reset-footnote {
          counter(footnote).update(0)
        }
      }
    )
  }))
}