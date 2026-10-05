#import "../index.typ": template, tufted
#import "../../_essay/bilingual.typ": zh
#show: template.with(
  title: "Predictability: Does the Flap of a Butterfly's Wings in Brazil Set Off a Tornado in Texas?",
  author: "Edward N. Lorenz",
  date: "1972",
  description: "从蝴蝶效应的原始设问，理解微小差异如何限制长期天气预测。",
  lang: "en",
  css: ("/assets/custom.css", "/assets/essay.css"),
)


= Predictability: Does the Flap of a Butterfly's Wings in Brazil Set Off a Tornado in Texas? / 可预测性：巴西蝴蝶扇动翅膀，会在得克萨斯引发龙卷风吗？

#html.p(id: "en-S001")[#text("Lest I appear frivolous in even posing the title question, let alone suggesting that it might have an affirmative answer, let me try to place it in proper perspective by offering two propositions.")]

#zh(id: "S001")[#text("为了避免仅仅提出标题中的问题就显得轻率——更不用说暗示它可能得到肯定的答案——让我先提出两个命题，把它放在恰当的视角中。")]

#html.p(id: "en-S002")[#text("1. If a single flap of a butterfly's wings can be instrumental in generating a tornado, so also can all the previous and subsequent flaps of its wings, as can the flaps of the wings of millions of other butterflies, not to mention the activities of innumerable more powerful creatures, including our own species.")]

#zh(id: "S002")[#text("1. 如果一只蝴蝶的一次振翅能够促成龙卷风，那么它此前和此后的每一次振翅也都能如此，其他数百万只蝴蝶的振翅也一样，更不用说无数更有力量的生物的活动，包括我们人类自身。")]

#html.p(id: "en-S003")[#text("2. If the flap of a butterfly's wings can be instrumental in generating a tornado, it can equally well be instrumental in preventing a tornado.")]

#zh(id: "S003")[#text("2. 如果蝴蝶的振翅能够促成龙卷风，它也同样能够阻止龙卷风。")]

#html.p(id: "en-S004")[#text("More generally, I am proposing that over the years minuscule disturbances neither increase nor decrease the frequency of occurrence of various weather events such as tornados; the most that they may do is to modify the sequence in which these events occur. The question which really interests us is whether they can do even this—whether, for example, two particular weather situations differing by as little as the immediate influence of a single butterfly will generally after sufficient time evolve into two situations differing by as much as the presence of a tornado. In more technical language, is the behavior of the atmosphere unstable with respect to perturbations of small amplitude?")]

#zh(id: "S004")[#text("更一般地说，我提出的是：多年之中，微小扰动既不会增加，也不会减少龙卷风等各种天气事件发生的频率；它们至多能够改变这些事件发生的先后次序。真正使我们感兴趣的问题，是它们连这一点能否做到——例如，两个特定天气状态，最初的差别仅相当于一只蝴蝶的即时影响，是否通常会在足够长的时间后，演变成差别大到相当于有无一场龙卷风的两个状态？用更专业的语言说，大气的行为对小幅度扰动是否不稳定？")]

#html.p(id: "en-S005")[#text("The connection between this question and our ability to predict the weather is evident. Since we do not know exactly how many butterflies there are, nor where they are all located, let alone which ones are flapping their wings at any instant, we cannot, if the answer to our question is affirmative, accurately predict the occurrence of tornados at a sufficiently-distant-future time. More significantly, our general failure to detect systems even as large as thunderstorms when they slip between weather stations may impair our ability to predict the general weather pattern even in the near future.")]

#zh(id: "S005")[#text("这个问题与我们预测天气的能力之间的联系是显而易见的。由于我们不知道究竟有多少只蝴蝶，也不知道它们都在哪里，更不知道任一时刻哪些蝴蝶正在振翅，因此，如果问题的答案是肯定的，我们就无法准确预测足够遥远的未来会不会发生龙卷风。更重要的是，即便雷暴这样大的系统从气象站之间穿过，我们通常也无法检测到；这可能削弱我们对近期整体天气形势的预测能力。")]

#html.p(id: "en-S006")[#text("How can we determine whether the atmosphere is unstable? The atmosphere is not a controlled laboratory experiment; if we disturb it and then observe what happens, we shall never know what would have happened if we had not disturbed it. Any claim that we can learn what would have happened by referring to the weather forecast would imply that the question whose answer we seek has already been answered in the negative.")]

#zh(id: "S006")[#text("我们怎样判断大气是否不稳定？大气不是可控的实验室实验；如果我们扰动它，然后观察发生了什么，就永远无法知道不扰动时会发生什么。任何声称可以参考天气预报来了解未受扰动时情形的说法，都意味着我们正在寻求答案的那个问题，已经得到了否定的回答。")]

#html.p(id: "en-S007")[#text("The bulk of our conclusions are based upon computer simulation of the atmosphere. The equations to be solved represent our best attempts to approximate the equations actually governing the atmosphere by equations which are compatible with present computer capabilities. Generally two numerical solutions are compared. One of these is taken to simulate the actual weather, while the other simulates the weather which would have evolved from slightly different initial conditions, i.e., the weather which would have been predicted with a perfect forecasting technique but imperfect observations. The difference between the solutions therefore simulates the error in forecasting. New simulations are continually being performed as more powerful computers and improved knowledge of atmospheric dynamics become available.")]

#zh(id: "S007")[#text("我们的结论大部分基于大气的计算机模拟。需要求解的方程，代表了我们在现有计算机能力允许的范围内，用可计算的方程近似实际支配大气的方程的最佳尝试。通常，我们比较两个数值解。一个用来模拟实际天气，另一个模拟初始条件略有不同的天气演变，也就是使用完美预报技术、却只有不完美观测时所预测的天气。因此，两个解之间的差异模拟了预报误差。随着更强大的计算机出现，以及对大气动力学的认识改善，我们不断进行新的模拟。")]

#html.p(id: "en-S008")[#text("Although we cannot claim to have proven that the atmosphere is unstable, the evidence that it is so is overwhelming. The most significant results are the following.")]

#zh(id: "S008")[#text("虽然我们不能声称已经证明大气是不稳定的，但支持这一点的证据极为充分。最重要的结果如下。")]

#html.p(id: "en-S009")[#text("1. Small errors in the coarser structure of the weather pattern—those features which are readily resolved by conventional observing networks—tend to double in about three days. As the errors become larger the growth rate subsides. This limitation alone would allow us to extend the range of acceptable prediction by three days every time we cut the observation error in half, and would offer the hope of eventually making good forecasts several weeks in advance.")]

#zh(id: "S009")[#text("1. 天气形势较粗尺度结构中的小误差——即常规观测网容易分辨的那些特征的误差——往往约三天翻一倍。误差变大后，增长速率会下降。若只有这一限制，那么每把观测误差减半，就可以把可接受预报的时效延长三天，并有希望最终提前数周作出良好预报。")]

#html.p(id: "en-S010")[#text("2. Small errors in the finer structure—e.g., the positions of individual clouds—tend to grow much more rapidly, doubling in hours or less. This limitation alone would not seriously reduce our hopes for extended-range forecasting, since ordinarily we do not forecast the finer structure at all.")]

#zh(id: "S010")[#text("2. 更精细结构中的小误差，例如单个云团位置的误差，通常增长得快得多，几小时甚至更短时间就会翻一倍。单是这一限制，不会严重削弱我们对延长预报时效的希望，因为通常我们根本不预报这些精细结构。")]

#html.p(id: "en-S011")[#text("3. Errors in the finer structure, having attained appreciable size, tend to induce errors in the coarser structure. This result, which is less firmly established than the previous ones, implies that after a day or so there will be appreciable errors in the coarser structure, which will thereafter grow just as if they had been present initially. Cutting the observation error in the finer structure in half—a formidable task—would extend the range of acceptable prediction of even the coarser structure only by hours or less. The hopes for predicting two weeks or more in advance are thus greatly diminished.")]

#zh(id: "S011")[#text("3. 精细结构中的误差达到可观程度后，往往会在较粗尺度结构中诱发误差。这一结果的确立程度不如前两项牢固，但它意味着：大约一天之后，较粗尺度结构中就会出现可观的误差，此后这些误差的增长，会如同它们最初就已经存在一样。把精细结构的观测误差减半——这是一项艰巨任务——即便对较粗尺度结构的可接受预报时效，也只能延长几小时或更少。因此，提前两周甚至更久作出预报的希望大为减弱。")]

#html.p(id: "en-S012")[#text("4. Certain special quantities such as weekly average temperatures and weekly total rainfall may be predictable at a range at which entire weather patterns are not.")]

#zh(id: "S012")[#text("4. 某些特殊的量，例如一周平均气温和一周总降雨量，可能在整体天气形势已经无法预测的时效范围内，仍然可以预测。")]

#html.p(id: "en-S013")[#text("Regardless of what any theoretical study may imply, conclusive proof that good day-to-day forecasts can be made at a range of two weeks or more would be afforded by any valid demonstration that any particular forecasting scheme generally yields good results at that range. To the best of our knowledge, no such demonstration has ever been offered. Of course, even pure guesses will be correct a certain percentage of the time.")]

#zh(id: "S013")[#text("无论任何理论研究意味着什么，只要能够有效地证明某种特定预报方案通常在两周或更长的时效上得到良好结果，就足以确凿证明可以在这样的时效内作出良好的逐日预报。据我们所知，迄今从未有人给出这种证明。当然，即便纯粹猜测，也总会有一定比例猜对。")]

#html.p(id: "en-S014")[#text("Returning now to the question as originally posed, we notice some additional points not yet considered. First of all, the influence of a single butterfly is not only a fine detail—it is confined to a small volume. Some of the numerical methods which seem to be well adapted for examining the intensification of errors are not suitable for studying the dispersion of errors from restricted to unrestricted regions. One hypothesis, unconfirmed, is that the influence of a butterfly's wings will spread in turbulent air, but not in calm air.")]

#zh(id: "S014")[#text("现在回到最初提出的问题，我们注意到还有一些尚未考虑的方面。首先，一只蝴蝶的影响不仅是一个微小细节，而且局限于很小的体积内。某些看起来很适合研究误差增强的数值方法，并不适合研究误差如何从局限区域扩散到广阔区域。一种尚未证实的假说认为，蝴蝶振翅的影响会在湍流空气中传播，却不会在平静空气中传播。")]

#html.p(id: "en-S015")[#text("A second point is that Brazil and Texas lie in opposite hemispheres. The dynamical properties of the tropical atmosphere differ considerably from those of the atmosphere in temperate and polar latitudes. It is almost as if the tropical atmosphere were a different fluid. It seems entirely possible that an error might be able to spread many thousands of miles within the temperate latitudes of either hemisphere, while yet being unable to cross the equator.")]

#zh(id: "S015")[#text("第二点是，巴西和得克萨斯位于不同的半球。热带大气的动力学性质，与温带和极地纬度的大气有很大差别，几乎仿佛热带大气是另一种流体。完全有可能，一项误差能够在任一半球的温带纬度范围内传播数千英里，却仍无法越过赤道。")]

#html.p(id: "en-S016")[#text("We must therefore leave our original question unanswered for a few more years, even while affirming our faith in the instability of the atmosphere. Meanwhile, today's errors in weather forecasting cannot be blamed entirely nor even primarily upon the finer structure of weather patterns. They arise mainly from our failure to observe even the coarser structure with near completeness, our somewhat incomplete knowledge of the governing physical principles, and the inevitable approximations which must be introduced in formulating these principles as procedures which the human brain or the computer can carry out. These shortcomings cannot be entirely eliminated, but they can be greatly reduced by an expanded observing system and intensive research. It is to the ultimate purpose of making not exact forecasts but the best forecasts which the atmosphere is willing to have us make that the Global Atmospheric Research Program is dedicated.")]

#zh(id: "S016")[#text("因此，尽管我们确认自己相信大气的不稳定性，最初的问题仍须再过几年才能回答。与此同时，今天的天气预报误差不能完全、甚至不能主要归咎于天气形势的精细结构。误差主要来自：我们甚至不能近乎完整地观测较粗尺度结构；我们对支配天气的物理原理了解仍不完全；以及把这些原理表述为人脑或计算机能够执行的程序时，不可避免地引入的近似。这些缺陷不能完全消除，但扩大观测系统并开展深入研究，可以大幅减少它们。全球大气研究计划致力于的最终目的，是作出大气允许我们作出的最佳预报，而非精确无误的预报。")]

#html.p(id: "en-N001")[#text("Acknowledgement: This work has been supported by the Atmospheric Sciences Section, National Science Foundation, under Grant GA28203X.")]

#zh(id: "N001")[#text("致谢：本项工作得到美国国家科学基金会大气科学部门资助，资助编号为GA28203X。")]
