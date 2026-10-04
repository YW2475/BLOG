#import "../index.typ": template, tufted
#show: template.with(
  title: "Essay",
  description: "人工智能经典论文阅读：图灵、ResNet 与 Transformer，中英文对照。",
  css: ("/assets/custom.css", "/assets/essay.css"),
)

= Essay

== Sequence Modeling / 序列建模

#tufted.blog-entry(
  date: datetime(year: 2017, month: 12, day: 4),
  path: "Attention is All you Need 2017",
  title: "Attention Is All You Need / 注意力就是你所需要的",
)

== Computer Vision / 计算机视觉

#tufted.blog-entry(
  date: "CVPR 2016",
  path: "Deep Residual Learning for Image Recognition 2016/",
  title: "Deep Residual Learning for Image Recognition / 深度残差学习与图像识别",
)

== Foundations of AI / 人工智能基础

#tufted.blog-entry(
  date: datetime(year: 1950, month: 10, day: 1),
  path: "Computing Machinery and Intelligence 1950/",
  title: "Computing Machinery and Intelligence / 计算机器与智能",
)
