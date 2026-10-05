#import "../config.typ": template, tufted
#import "@preview/theorion:0.4.1": *
#show: template

// tufted.margin-note 可以让你在边栏中放置内容
// 宽大的边栏是 tufte 样式的特点，将注释放于其中并与正文并排，便于对照

= YinWang

#{
  tufted.margin-note[
    #html.span(class: "liujian-font")[
      天行有常，不为尧存，不为桀亡。
    ]
  ]
}
