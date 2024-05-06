#import "../utils/datetime-display.typ": datetime-display
#import "../utils/style.typ": 字号, 字体

#let bachelor-detail(
  anonymous: false,
  twoside: false,
  fonts: (:),
  info: (:),
  // 其他参数
  stoke-width: 0.5pt,
  min-title-lines: 2,
  info-inset: (x: 0pt, bottom: 1pt),
  info-key-width: 72pt,
  info-key-font: "楷体",
  info-value-font: "楷体",
  column-gutter: 22pt,
  row-gutter: 11.5pt,
  anonymous-info-keys: ("grade", "student-id", "author", "supervisor", "supervisor-ii"),
  bold-info-keys: ("title",),
  bold-level: "bold",
  datetime-display: datetime-display,
  ) = {
  let info-key(body) = {
    rect(
      width: 100%,
      inset: info-inset,
      stroke: none,
      text(
        font: fonts.at(info-key-font, default: "黑体"),
        size: 字号.四号,
        body
      ),
    )
  }

  let info-value(key, body) = {
    set align(left)
    rect(
      width: 100%,
      inset: info-inset,
      stroke: none,
      text(
        font: fonts.at(info-value-font, default: "宋体"),
        size: 字号.四号,
        weight: if (key in bold-info-keys) { bold-level } else { "regular" },
        bottom-edge: "descender",
        body,
      ),
    )
  }

  let info-long-value(key, body) = {
    grid.cell(colspan: 3,
      info-value(
        key,
        if anonymous and (key in anonymous-info-keys) {
          "██████████"
        } else {
          body
        }
      )
    )
  }

  let info-short-value(key, body) = {
    info-value(
      key,
      if anonymous and (key in anonymous-info-keys) {
        "█████"
      } else {
        body
      }
    )
  }
  v(字号.小四*4)
  set align(center)
  text(font:fonts.宋体,size:字号.小二)[燕山大学本科生毕业设计（论文）]
  v(字号.小二*2)
  text(font:fonts.黑体,size:字号.二号,info.title)
  v(字号.小二*12)
  block(width: 400pt,grid(
    columns: (info-key-width, 1fr, info-key-width, 1fr),
    column-gutter: column-gutter,
    row-gutter: row-gutter,
    info-key("学　　院："),
    info-long-value("department", info.department),
    info-key("专　　业："),
    info-long-value("major", info.major),
    info-key("姓　　名："),
    info-long-value("author", info.author),
    info-key("学　　号："),
    info-long-value("student-id", info.student-id),
    info-key("指导教师："),
    info-long-value("supervisor", info.supervisor.at(0)),
    info-key("答辩日期："),
    // info-long-value("submit-date", info.submit-date),
  ))
}