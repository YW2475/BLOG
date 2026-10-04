# Essay 中英对照制作记录

日期：2026-10-05。主交付为项目已有的 Typst 网页格式；直接修改 `index.typ`，以 Typst 编译和少量关键位置检查验证公式及布局。

## Attention Is All You Need

- 来源：用户项目中的 Essay 原有 Typst 转写文件；英文正文、公式、图片、表格数据均保留。
- 对齐范围：62 个正文／列表文字块、5 个图表说明、2 条脚注。章节标题加上中文；参考文献条目保持原有书目信息。
- 这是对现有转写的逐段翻译，不补写原转写未包含的原论文附录。
- 使用 Essay 资源路径，保留 Table 3 的宽表、下方说明和修正后的 (E) 行。
- 原英文多头注意力投影维度写为 `d_k, d_k, d_v`；译文沿用该内容，未自行改变原文公式或参数。

## Computing Machinery and Intelligence

- 来源：Oxford Academic 出版方完整 HTML 文本，DOI 10.1093/mind/LIX.236.433；元数据核对 Turing Digital Archive。
- 125 个原文段落／问答／列表项目均有紧随其后的中文翻译；保留全部 7 节、9 种反对意见、4 条注释和 9 条参考文献。
- 原网页提供的两张离散状态表以原图为依据重建为可访问的原生表格；进化类比表也重建并翻译。现代网页控件、链接列表和重复表格已剔除。
- 页面使用原文文本与重新排版的表格，不使用出版方的页面扫描、网页设计或现代编辑附加内容。
- 统一术语：imitation game＝模仿游戏；digital computer＝数字计算机；discrete-state machine＝离散状态机；universal machine＝通用机器；learning machine＝学习机器；child-machine＝儿童机器。
- HTML 源没有可靠的逐段印刷页码，source_map 使用顺序块 ID；页面提供英文 en-Sxxx 和中文 zh-Sxxx 锚点。
- 出版方 HTML 在 S122 使用 `omitted`，译为“被省略”；原文的个别内部页码、拼写和历史陈述沿用其网页转写，未悄悄改写为当代论断。
- 超感官知觉等段落属于作者在 1950 年的历史论述，翻译保留其观点和语气。
- 修复 34 处被误写为块公式的行内公式；段落不再因 HTML 的块元素嵌套而被截断，S050 及其后半段保持一致字号与正文宽度。

## Deep Residual Learning for Image Recognition

- 题名、四位作者、CVPR 2016、770–778 页、会议 DOI、arXiv 编号与 2015-12-10 首发日期已核对。
- 原文依据用户提供的 `C:/Users/ME/Downloads/1512.03385v1.pdf`，共 12 页，版本为 arXiv v1（2015-12-10）；同版本 arXiv HTML 仅辅助恢复分栏文字与跨页段落。
- 已替换简介，完成 82 个摘要、正文及附录段落的中英对照、6 条注释的翻译，并保留 50 条参考文献。附录 A、B、C 均已包含。
- 7 张图与 14 张编号表格直接从提供的 PDF 提取，保留原始图表数据；每个图表下方有英文说明与中文翻译。CIFAR-10 的无编号架构表以原生表格重建，并翻译表头。
- arXiv HTML 转换存在合并表格及错误交叉引用，表 4/5、7/8、10/11 的编号和正文对应引用按用户 PDF 修正。
- 每个段落使用 en-Sxxx / zh-Sxxx 锚点；source-map 记录段落起始页、原文与译文、图表裁剪页码及范围。
- 术语统一为：residual learning＝残差学习；shortcut connection＝快捷连接；identity mapping＝恒等映射；degradation problem＝退化问题；bottleneck＝瓶颈；region proposal＝区域提议；localization＝定位。
