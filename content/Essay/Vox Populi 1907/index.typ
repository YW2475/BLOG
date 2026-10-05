#import "../index.typ": template, tufted
#import "../../_essay/bilingual.typ": zh, zh-caption
#show: template.with(
  title: "Vox Populi",
  author: "Francis Galton",
  date: "1907",
  lang: "en",
  css: ("/assets/custom.css", "/assets/essay.css"),
)

= Vox Populi / 大众之声

#html.p(id: "en-S001")[#text("In these democratic days, any investigation into the trustworthiness and peculiarities of popular judgments is of interest. The material about to be discussed refers to a small matter, but is much to the point.")]

#zh(id: "S001")[#text("在这个民主的时代，凡是研究大众判断的可靠性及其特点的工作，都令人感兴趣。下面讨论的材料虽然涉及一件小事，却很切中问题。")]

#html.p(id: "en-S002")[#text("A weight-judging competition was carried on at the annual show of the West of England Fat Stock and Poultry Exhibition recently held at Plymouth. A fat ox having been selected, competitors bought stamped and numbered cards, for 6d. each, on which to inscribe their respective names, addresses, and estimates of what the ox would weigh after it had been slaughtered and ‘dressed.’ Those who guessed most successfully received prizes. About 800 tickets were issued, which were kindly lent me for examination after they had fulfilled their immediate purpose. These afforded excellent material. The judgments were unbiassed by passion and uninfluenced by oratory and the like. The sixpenny fee deterred practical joking, and the hope of a prize and the joy of competition prompted each competitor to do his best. The competitors included butchers and farmers, some of whom were highly expert in judging the weight of cattle; others were probably guided by such information as they might pick up, and by their own fancies. The average competitor was probably as well fitted for making a just estimate of the dressed weight of the ox, as an average voter is of judging the merits of most political issues on which he votes, and the variety among the voters to judge justly was probably much the same in either case.")]

#zh(id: "S002")[#text("最近在普利茅斯举行的英格兰西部肥畜与家禽年度展览会上，举办了一次猜重量比赛。选定一头肥牛后，参赛者每人花六便士，购买盖有印章并编了号码的卡片，在上面写下自己的姓名、地址，以及估计这头牛在屠宰并‘处理’后会有多重。猜得最准的人获奖。总共发出了约800张票；它们完成眼前的用途后，主办方好意借给我研究。这批材料十分理想。人们的判断没有被激情左右，也不受演说之类的影响。六便士的报名费阻止了恶作剧，而获奖的希望和比赛的乐趣，促使每个参赛者尽力作答。参赛者中有屠夫和农民，一些人很擅长判断牲畜重量；其他人或许依靠偶然获得的消息和自己的想象。一个普通参赛者作出合理胴体重量估计的能力，大概和一个普通选民判断自己所投票的大多数政治议题优劣的能力差不多；两种场合中，人们判断能力的差异程度，可能也很相近。")]

#html.p(id: "en-S003")[#text("After weeding thirteen cards out of the collection, as defective or illegible, there remained 787 for discussion. I arrayed them in order of the magnitudes of the estimates, and converted the cwt., quarters, and lbs. in which they were made, into lbs., under which form they will be treated.")]

#zh(id: "S003")[#text("从这批卡片中剔除了13张填写有缺陷或字迹难辨的卡片后，还剩787张可供讨论。我按估计值的大小将它们排序，并把原来使用的英担、四分之一英担和磅全部换算成磅；以下都用磅来表示。")]

#html.p[*Distribution of the estimates of the dressed weight of a particular living ox, made by 787 different persons.*]

#zh[787人对同一头活牛胴体重量的估计值分布。]

#table(
  columns: 5,
  table.header([Centile / 百分位], [Estimate (lb.) / 估计值（磅）], [Observed deviation / 观测偏差], [Normal deviation / 正态偏差], [Excess / 差额]),
  [5], [1074], [−133], [−90], [+43],
  [10], [1109], [−98], [−70], [+28],
  [15], [1126], [−81], [−57], [+24],
  [20], [1148], [−59], [−46], [+13],
  [25], [1162], [−45], [−37], [+8],
  [30], [1174], [−33], [−29], [+4],
  [35], [1181], [−26], [−21], [+5],
  [40], [1188], [−19], [−14], [+5],
  [45], [1197], [−10], [−7], [+3],
  [50], [1207], [0], [0], [0],
  [55], [1214], [+7], [+7], [0],
  [60], [1219], [+12], [+14], [−2],
  [65], [1225], [+18], [+21], [−3],
  [70], [1230], [+23], [+29], [−6],
  [75], [1236], [+29], [+37], [−8],
  [80], [1243], [+36], [+46], [−10],
  [85], [1254], [+47], [+57], [−10],
  [90], [1267], [+60], [+70], [−10],
  [95], [1293], [+86], [+90], [−4],
)

#html.p[q₁, q₃: the first and third quartiles, standing at 25° and 75° respectively; m: the median or middlemost value, standing at 50°. The dressed weight proved to be 1198 lbs. Normal p.e. = 37; deviations are measured from 1207 lbs.]

#zh[q₁、q₃分别为第25和第75百分位处的第一、第三四分位数；m为第50百分位处的中位数。实际胴体重量为1198磅。正态曲线的或然误差为37磅；偏差以1207磅为基准。]

#html.p(id: "en-S004")[#text("According to the democratic principle of ‘one vote one value,’ the middlemost estimate expresses the vox populi, every other estimate being condemned as too low or too high by a majority of the voters (for fuller explanation see ‘One Vote, One Value,’ NATURE, February 28, p. 414). Now the middlemost estimate is 1207 lb., and the weight of the dressed ox proved to be 1198 lb.; so the vox populi was in this case 9 lb., or 0·8 per cent. of the whole weight too high. The distribution of the estimates about their middlemost value was of the usual type, so far that they clustered closely in its neighbourhood and became rapidly more sparse as the distance from it increased.")]

#zh(id: "S004")[#text("按照‘一票一值’的民主原则，位于正中间的估计值表达了大众之声，因为其他任何估计值，都会被多数投票者认为过低或过高（详细解释见2月28日《自然》第414页的《一票一值》）。这里的中位估计值是1207磅，而牛处理后的实际重量是1198磅；因此，大众之声在这个例子中高估了9磅，即总重量的0.8%。估计值围绕中位数的分布，就这一点而言属于通常的类型：数值密集聚集在中位数附近，随着距离增加而迅速变得稀疏。")]

#html.figure(class: "essay-paper-figure")[
#image("assets/distribution.png")
#html.figcaption[Diagram, from the tabular values. The continuous line is the normal curve with p.e. = 37. The broken line is drawn from the observations. The lines connecting them show the differences between the observed and the normal. #zh-caption[根据表中数值绘制的图。实线为或然误差37磅的正态曲线，折线来自观测值；两条曲线之间的连接线表示观测值与正态值的差异。]]
]

#html.p(id: "en-S005")[#text("But they were not scattered symmetrically. One quarter of them deviated more than 45 lb. above the middlemost (3·7 per cent.), and another quarter deviated more than 29 lb. below it (2·4 per cent.), therefore the range of the two middle quarters, that is, of the middlemost half, lay within those limits. It would be an equal chance that the estimate written on any card picked at random out of the collection lay within or without those limits. In other words, the ‘probable error’ of a single observation may be reckoned as ½(45+29), or 37 lb. (3·1 per cent.). Taking this for the p.e. of the normal curve that is best adapted for comparison with the observed values, the results are obtained which appear in above table, and graphically in the diagram.")]

#zh(id: "S005")[#text("但它们并非对称分布。其中四分之一高于中位数45磅以上（3.7%），另四分之一低于中位数29磅以上（2.4%）；因此，中间两个四分位，也就是居中的一半估计值，都处于这些界限之内。随机抽取一张卡片，其估计值处在界限内外的机会各占一半。换句话说，单次观察的‘或然误差’可以计为½(45+29)，即37磅（3.1%）。把这个值作为最适合与观测值比较的正态曲线的或然误差，便得到上表中的结果，并在图中用曲线表示出来。")]

#html.p(id: "en-S006")[#text("The abnormality of the distribution of the estimates now becomes manifest, and is of this kind. The competitors may be imagined to have erred normally in the first instance, and then to have magnified all errors that were negative and to have minified all those that were positive. The lower half of the ‘observed’ curve agrees for a large part of its range with a normal curve having the p.e. = 45, and the upper half with one having its p.e. = 29. I have not sufficient knowledge of the mental methods followed by those who judge weights to offer a useful opinion as to the cause of this curious anomaly. It is partly a psychological question, in answering which the various psychophysical investigations of Fechner and others would have to be taken into account. Also the anomaly may be partly due to the use of a small variety of different methods, or formulæ, so that the estimates are not homogeneous in that respect.")]

#zh(id: "S006")[#text("估计值分布的非正态性，现在便清楚地显现出来，形式如下。可以设想，参赛者最初的误差呈正态分布，随后把所有负误差放大，把所有正误差缩小。‘观测’曲线的下半部分，在相当大的一段范围内，与或然误差为45的正态曲线吻合；上半部分则与或然误差为29的正态曲线吻合。我对估计重量的人所采用的思考方法了解不足，无法就这种奇特的非正态现象的原因提出有用意见。它部分属于心理学问题；回答时，需要考虑费希纳等人所做的各种心理物理学研究。这种非正态现象也可能部分来自人们使用了少数几种不同的方法或公式，使得这些估计值在这一方面并不具有同质性。")]

#html.p(id: "en-S007")[#text("It appears then, in this particular instance, that the vox populi is correct to within 1 per cent. of the real value, and that the individual estimates are abnormally distributed in such a way that it is an equal chance whether one of them, selected at random, falls within or without the limits of −3·7 per cent. and +2·4 per cent. of their middlemost value.")]

#zh(id: "S007")[#text("因此，在这个具体例子中，大众之声与真实值的误差在1%以内；个人估计值呈非正态分布，随机选取一个估计值，它落在中位数的−3.7%至+2.4%范围之内或之外的机会相等。")]

#html.p(id: "en-S008")[#text("This result is, I think, more creditable to the trustworthiness of a democratic judgment than might have been expected.")]

#zh(id: "S008")[#text("我认为，这个结果显示的民主判断的可靠性，比人们可能预期的更令人信服。")]

#html.p(id: "en-S009")[#text("The authorities of the more important cattle shows might do service to statistics if they made a practice of preserving the sets of cards of this description, that they may obtain on future occasions, and loaned them under proper restrictions, as these have been, for statistical discussion. The fact of the cards being numbered makes it possible to ascertain whether any given set is complete.")]

#zh(id: "S009")[#text("较重要的牲畜展览会的主办方，如果能养成保存今后获得的此类整套卡片的习惯，并像这次一样，在适当限制下借出它们供统计讨论，就能为统计学作出贡献。卡片有编号，因此可以查明任何一套是否完整。")]
