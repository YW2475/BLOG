#import "../index.typ": template, tufted
#import "../../_essay/bilingual.typ": zh
#show: template.with(
  title: "The Spandrels of San Marco and the Panglossian Paradigm: A Critique of the Adaptationist Programme",
  author: "Stephen Jay Gould; Richard C. Lewontin",
  date: "1979",
  description: "教堂建筑的拱肩怎样成为演化思想的比喻？一个特征存在，不等于它是为某个用途进化出来的。",
  lang: "en",
  css: ("/assets/custom.css", "/assets/essay.css"),
)



= The Spandrels of San Marco and the Panglossian Paradigm: A Critique of the Adaptationist Programme / 圣马可的拱肩与潘格洛斯范式：对适应主义纲领的批评

#html.p(id: "en-S001")[#text("An adaptationist programme has dominated evolutionary thought in England and the United States during the past 40 years. It is based on faith in the power of natural selection as an optimizing agent. It proceeds by breaking an organism into unitary ‘traits’ and proposing an adaptive story for each considered separately. Trade-offs among competing selective demands exert the only brake upon perfection; non-optimality is thereby rendered as a result of adaptation as well. We criticize this approach and attempt to reassert a competing notion (long popular in continental Europe) that organisms must be analysed as integrated wholes, with Bauplane so constrained by phyletic heritage, pathways of development and general architecture that the constraints themselves become more interesting and more important in delimiting pathways of change than the selective force that may mediate change when it occurs. We fault the adaptationist programme for its failure to distinguish current utility from reasons for origin (male tyrannosaurs may have used their diminutive front legs to titillate female partners, but this will not explain why they got so small); for its unwillingness to consider alternatives to adaptive stories; for its reliance upon plausibility alone as a criterion for accepting speculative tales; and for its failure to consider adequately such competing themes as random fixation of alleles, production of non-adaptive structures by developmental correlation with selected features (allometry, pleiotropy, material compensation, mechanically forced correlation), the separability of adaptation and selection, multiple adaptive peaks, and current utility as an epiphenomenon of non-adaptive structures. We support Darwin's own pluralistic approach to identifying the agents of evolutionary change.")]

#zh(id: "S001")[#text("过去四十年中，一种适应主义纲领主导了英美的演化思想。它相信自然选择作为优化力量的威力，把生物体拆分为一个个“性状”，再为每个性状分别提出适应性故事。相互竞争的选择要求之间的权衡，是通向完美的唯一制动因素；于是，不最优也被解释为适应的结果。我们批评这种方法，试图重新申明另一种长期流行于欧洲大陆的观点：生物体必须作为整合的整体来分析，其基本体制受到系统发育遗产、发育途径和总体构造的强烈约束，以至于在界定变化路径时，约束本身比变化发生时可能促成变化的选择力量，更值得关注、更为重要。适应主义纲领的缺陷包括：不区分当前用途与起源原因——雄性暴龙可能用小前肢挑逗雌性，但这不能解释前肢为什么变得如此小；不愿考虑适应故事以外的解释；仅凭听起来合理就接受推测；以及没有充分考虑等位基因随机固定、因与受选择特征存在发育相关而产生非适应性结构、适应与选择可以分离、多重适应峰，以及当前用途可能只是非适应结构的附带结果。其中发育相关包括异速生长、多效性、材料补偿和机械上必然的关联。我们支持达尔文本人的多元方法，识别推动演化变化的不同因素。")]

== 1. Introduction / 1. 引言

#html.p(id: "en-S002")[#text("The great central dome of St Mark's Cathedral in Venice presents in its mosaic design a detailed iconography expressing the mainstays of Christian faith. Three circles of figures radiate out from a central image of Christ: angels, disciples, and virtues. Each circle is divided into quadrants, even though the dome itself is radially symmetrical in structure. Each quadrant meets one of the four spandrels in the arches below the dome. Spandrels - the tapering triangular spaces formed by the intersection of two rounded arches at right angles (figure 1)- are necessary architectural by-products of mounting a dome on rounded arches. Each spandrel contains a design admirably fitted into its tapering space. An evangelist sits in the upper part flanked by the heavenly cities. Below, a man representing one of the four Biblical rivers (Tigris, Euphrates, Indus and Nile) pours water from a pitcher into the narrowing space below his feet.")]

#zh(id: "S002")[#text("威尼斯圣马可大教堂宏伟的中央穹顶，以马赛克呈现详尽的宗教图像，表达基督教信仰的支柱。以中央基督像为中心，向外展开三圈人物：天使、门徒和美德。尽管穹顶结构本身径向对称，每圈仍划为四个象限，每个象限对应穹顶下方拱门中的一个拱肩。拱肩是两座圆拱以直角相交时形成的渐窄三角空间（图1），是在圆拱上架设穹顶必然产生的建筑副产物。每个拱肩都装饰着与渐窄空间巧妙吻合的图案：上部坐着一位福音书作者，两旁是天上的城市；下方，一个代表四条《圣经》河流之一的人——底格里斯河、幼发拉底河、印度河或尼罗河——从水罐中倒出水，注入脚下逐渐收窄的空间。")]

#html.figure(id: "F001", class: "essay-paper-figure")[
#image("assets/figure-01.png")
]

#html.p(id: "en-C001", class: "essay-original-caption")[#text("Figure 1. One of the four spandrels of St Mark's; seated evangelist above, personification of river below.")]

#zh(id: "C001")[#text("图1．圣马可教堂四个拱肩之一；上方是坐着的福音书作者，下方是河流的人格化形象。")]

#html.p(id: "en-S003")[#text("The design is so elaborate, harmonious and purposeful that we are tempted to view it as the starting point of any analysis, as the cause in some sense of the surrounding architecture. But this would invert the proper path of analysis. The system begins with an architectural constraint: the necessary four spandrels and their tapering triangular form. They provide a space in which the mosaicists worked; they set the quadripartite symmetry of the dome above.")]

#zh(id: "S003")[#text("图案如此精巧、和谐而富有目的性，以至于我们容易把它视为分析的起点，甚至在某种意义上，视为周围建筑的成因。但这恰好颠倒了正确的分析路径。系统首先来自建筑约束：四个必然存在的拱肩及其渐窄的三角形。它们为马赛克艺术家提供了创作空间，并规定了上方穹顶的四分对称。")]

#html.p(id: "en-S004")[#text("Such architectural constraints abound and we find them easy to understand because we do not impose our biological biases upon them. Every fan vaulted ceiling must have a series of open spaces along the mid-line of the vault, where the sides of the fans intersect between the pillars (figure 2). Since the spaces must exist, they are often used for ingenious ornamental effect. In King's College Chapel in Cambridge, for example, the spaces contain bosses alternately embellished with the Tudor rose and portcullis. In a sense, this design represents an ‘adaptation', but the architectural constraint is clearly primary. The spaces arise as a necessary by-product of fan vaulting; their appropriate use is a secondary effect. Anyone who tried to argue that the structure exists because the alternation of rose and portcullis makes so much sense in a Tudor chapel would be inviting the same ridicule that Voltaire heaped on Dr Pangloss: “Things cannot be other than they are... Everything is made for the best purpose. Our noses were made to carry spectacles, so we have spectacles. Legs were clearly intended for breeches, and we wear them.' Yet evolutionary biologists, in their tendency to focus exclusively on immediate adaptation to local conditions, do tend to ignore architectural constraints and perform just such an inversion of explanation.")]

#zh(id: "S004")[#text("这种建筑约束比比皆是，也容易理解，因为我们不会把生物学偏见强加其上。任何扇形拱顶沿中央线都必有一系列开放空间，位于扇形两侧在柱子之间交汇的地方（图2）。这些空间既然必然存在，便常被巧妙地用于装饰。以剑桥国王学院礼拜堂为例，空间中的凸饰交替装点着都铎玫瑰和闸门纹样。从某种意义上说，这种设计代表一种“适应”，但建筑约束显然先于它。空间是扇形拱顶的必然副产物，恰当地利用空间只是次生效果。如果有人说，这种结构之所以存在，是因为在都铎礼拜堂交替使用玫瑰和闸门纹样十分合理，他就会受到伏尔泰讥讽潘格洛斯博士那样的嘲笑：“事物不可能不是现在的样子……一切都为最好的目的而造。鼻子是为架眼镜造的，所以我们戴眼镜。腿显然是为裤子准备的，所以我们穿裤子。”然而，演化生物学家倾向于只关注对地方条件的即时适应，确实会忽略建筑约束，作出这种倒置的解释。")]

#html.figure(id: "F002", class: "essay-paper-figure")[
#image("assets/figure-02.png")
]

#html.p(id: "en-C002", class: "essay-original-caption")[#text("Figure 2. The ceiling of King's College Chapel.")]

#zh(id: "C002")[#text("图2．国王学院礼拜堂的天花板。")]

#html.p(id: "en-S005")[#text("As a closer example, recently featured in some important biological literature on adaptation, anthropologist Michael Harner has proposed (1977) that Aztec human sacrifice arose as a solution to chronic shortage of meat (limbs of victims were often consumed, but only by people of high status). E. O. Wilson (1978) has used this explanation as a primary illustration of an adaptive, genetic predisposition for carnivory in humans. Harner and Wilson ask us to view an elaborate social system and a complex set of explicit justifications involving myth, symbol, and tradition as mere epiphenomena generated by the Aztecs as an unconscious rationalization masking the ‘real’ reason for it all: need for protein. But Sahlins (1978) has argued that human sacrifice represented just one part of an elaborate cultural fabric that, in its entirety, not only represented the material expression of Aztec cosmology, but also performed such utilitarian functions as the maintenance of social ranks and systems of tribute among cities.")]

#zh(id: "S005")[#text("一个更近的例子，最近出现在讨论适应的重要生物学文献中。人类学家迈克尔·哈纳（1977）提出，阿兹特克人的人祭，是解决长期肉类短缺的办法；祭品的四肢常被食用，但仅供高地位者享用。E. O.威尔逊（1978）把这种解释用作人类对肉食具有适应性遗传倾向的主要例证。哈纳和威尔逊要求我们，把复杂社会系统及其涉及神话、象征和传统的明确论证，都看作阿兹特克人无意识地制造的附带现象，以掩盖一切背后的“真正”原因：对蛋白质的需求。但萨林斯（1978）认为，人祭只是复杂文化网络的一部分；这个整体不仅是阿兹特克宇宙观的物质表达，也承担维系社会等级、城市间贡赋体系等实际功能。")]

#html.p(id: "en-S006")[#text("We strongly suspect that Aztec cannibalism was an 'adaptation' much like evangelists and rivers in spandrels, or ornamented bosses in ceiling spaces: a secondary epiphenomenon representing a fruitful use of available parts, not a cause of the entire system. To put it crudely: a system developed for other reasons generated an increasing number of fresh bodies; use might as well be made of them. Why invert the whole system in such a curious fashion and view an entire culture as the epiphenomenon of an unusual way to beef up the meat supply. Spandrels do not exist to house the evangelists. (Moreover, as Sahlins argues, it is not even clear that human sacrifice was an adaptation at all. Human cultural practices can be orthogenetic and drive towards extinction in ways that Darwinian processes, based on genetic selection, cannot. Since each new monarch had to outdo his predecessor in even more elaborate and copious sacrifice, the practice was beginning to stretch resources to the breaking point. It would not have been the first time that a human culture did itself in. And, finally, many experts doubt Harner's premise in the first place (Ortiz de Montellano 1978). They argue that other sources of protein were not in short supply, and that a practice awarding meat only to privileged people who had enough anyway, and who used bodies so inefficiently (only the limbs were consumed, and partially at that) represents a mighty poor way to run a butchery.)")]

#zh(id: "S006")[#text("我们强烈怀疑，阿兹特克食人习俗的“适应”，就像拱肩中的福音书作者和河流，或拱顶空隙中的装饰凸饰一样：它是有效利用现成部分的次生现象，而非整个系统的成因。说得粗一点，一个因其他原因发展的系统，产生了越来越多的新鲜尸体；不妨利用它们。为什么要如此奇怪地颠倒整个系统，把完整文化看成一种特殊增肉方式的附带现象？拱肩不是为了安置福音书作者才存在的。而且，如萨林斯所说，人祭是否构成适应，本身也不清楚。人类文化实践可以沿定向发展的路线趋向灭绝，而以遗传选择为基础的达尔文过程不能这样运作。每位新君主都必须用更复杂、更多的人祭超越前任，这种做法开始把资源推向崩溃边缘。人类文化自我毁灭并非没有先例。最后，许多专家从根本上怀疑哈纳的前提（Ortiz de Montellano 1978）：其他蛋白质来源并不短缺；肉只分给本已充足的特权者，而且尸体利用率极低——只吃四肢，且仅吃其中一部分——实在是一种糟糕的肉食经营办法。")]

#html.p(id: "en-S007")[#text("We deliberately chose non-biological examples in a sequence running from remote to more familiar: architecture to anthropology. We did this because the primacy of architectural constraint and the epiphenomenal nature of adaptation are not obscured by our biological prejudices in these examples. But we trust that the message for biologists will not go unheeded: if these had been biological systems, would we not, by force of habit, have regarded the epiphenomenal adaptation as primary and tried to build the whole structural system from it?")]

#zh(id: "S007")[#text("我们有意按从较远到较熟悉的顺序，选择非生物学例子，从建筑走向人类学。因为在这些例子中，建筑约束的优先地位，以及适应的附带性质，不会被生物学偏见遮蔽。但我们希望生物学家不会忽视这一信息：如果这些是生物系统，我们是否会出于习惯，把附带的适应视为首要原因，并试图从它构建整个结构系统？")]

== 2. The Adaptationist Programme / 2. 适应主义纲领

#html.p(id: "en-S008")[#text("We wish to question a deeply engrained habit of thinking among students of evolution. We call it the adaptationist programme, or the Panglossian paradigm. It is rooted in a notion popularized by A. R. Wallace and A. Weismann (but not, as we shall see, by Darwin) towards the end of the nineteenth century: the near omnipotence of natural selection in forging organic design and fashioning the best among possible worlds. This programme regards natural selection as so powerful and the constraints upon it so few that direct production of adaptation through its operation becomes the primary cause of nearly all organic form, function, and behaviour. Constraints upon the pervasive power of natural selection are recognized of course (phyletic inertia primarily among them, although immediate architectural constraints, as discussed in the last section, are rarely acknowledged). But they are usually dismissed as unimportant or else, and more frustratingly, simply acknowledged and then not taken to heart and invoked.")]

#zh(id: "S008")[#text("我们希望质疑演化研究者一种根深蒂固的思维习惯，称其为适应主义纲领，或潘格洛斯范式。它起源于19世纪末由A. R.华莱士和A.魏斯曼普及的观念——下文将说明，并非达尔文的观念：自然选择近乎全能，能够塑造生物设计，造出一切可能世界中最好的世界。这一纲领认为自然选择如此强大，所受约束如此少，因而它直接产生适应，成为几乎所有生物形态、功能和行为的首要原因。当然，人们承认自然选择的广泛力量受到约束，其中主要是系统发育惯性，而前一节讨论的即时构造约束很少被承认。但通常这些约束被视为无关紧要；更令人沮丧的是，人们口头承认它们，却不真正认真对待，也不用于解释。")]

#html.p(id: "en-S009")[#text("Studies under the adaptationist programme generally proceed in two steps: (1) An organism is atomized into‘traits’ and these traits are explained as structures optimally designed by natural selection for their functions. For lack of space, we must omit an extended discussion of the vital issue: ‘what is a trait?' Some evolutionists may regard this as a trivial, or merely a semantic problem. It is not. Organisms are integrated entities, not collections of discrete objects. Evolutionists have often been led astray by inappropriate atomization, as D'Arcy Thompson (1942) loved to point out. Our favourite example involves the human chin (Gould 1977, pp. 381-382; Lewontin 1978). If we regard the chin as a ‘thing', rather than as a product of interaction between two growth fields (alveolar and mandibular), then we are led to an interpretation of its origin (recapitulatory) exactly opposite to the one now generally favoured (neotenic).")]

#zh(id: "S009")[#text("适应主义纲领下的研究，通常分两步进行：（1）把生物体原子化为“性状”，再把性状解释为自然选择为其功能设计的最优结构。限于篇幅，我们无法展开讨论“什么是性状”这个关键问题。有些演化学者可能认为这只是琐碎或语义问题，其实并非如此。生物体是整合实体，不是离散对象的集合。正如达西·汤普森（1942）喜欢指出的，不恰当的拆分常使演化研究误入歧途。我们最喜欢的例子是人类下巴（Gould 1977：381—382；Lewontin 1978）。如果把下巴视为一件“东西”，而非两个生长场——齿槽与下颌——互动的产物，就会把其起源解释为重演祖先发育；这与如今通常赞成的幼态延续解释，恰好相反。")]

#html.p(id: "en-S010")[#text("(2) After the failure of part-by-part optimization, interaction is acknowledged via the dictum that an organism cannot optimize each part without imposing expenses on others. The notion of‘trade-off’is introduced, and organisms are interpreted as best compromises among competing demands. Thus, interaction among parts is retained completely within the adaptationist programme. Any suboptimality of a part is explained as its contribution to the best possible design for the whole. The notion that suboptimality might represent anything other than the immediate work of natural selection is usually not entertained. As Dr Pangloss said in explaining to Candide why he suffered from venereal disease: ‘It is indispensable in this best of worlds. For if Columbus, when visiting the West Indies, had not caught this disease, which poisons the source of generation, which frequently even hinders generation, and is clearly opposed to the great end of Nature, we should have neither chocolate nor cochineal.’ The adaptationist programme is truly Panglossian. Our world may not be good in an abstract sense, but it is the very best we could have. Each trait plays its part and must be as it is.")]

#zh(id: "S010")[#text("（2）逐部分优化失败后，人们通过这样的说法承认互动：生物体不可能优化每一部分，而不给其他部分增加成本。于是引入“权衡”，把生物体解释为相互竞争的要求之间的最佳折中。这样，各部分的互动仍完全保留在适应主义纲领内；某一部分的不最优，被解释为对整体最佳设计的贡献。通常，人们不考虑不最优可能来自自然选择即时作用以外的原因。如潘格洛斯向老实人解释自己为何患性病时所说：“这在最好的世界中不可或缺。如果哥伦布到西印度群岛时没有染上这种毒害生殖根源、甚至常常妨碍生殖、显然违背自然伟大目的的疾病，我们就既没有巧克力，也没有胭脂虫。”适应主义纲领确实是潘格洛斯式的。我们的世界在抽象意义上也许并不好，却是我们能拥有的最好世界。每个性状各司其职，必须是现在的样子。")]

#html.p(id: "en-S011")[#text("At this point, some evolutionists will protest that we are caricaturing their view of adaptation. After all, do they not admit genetic drift, allometry, and a variety of reasons for non-adaptive evolution? They do, to be sure, but we make a different point. In natural history, all possible things happen sometimes; you generally do not support your favoured phenomenon by declaring rivals impossible in theory. Rather, you acknowledge the rival, but circumscribe its domain of action so narrowly that it cannot have any importance in the affairs of nature. Then, you often congratulate yourself for being such an undogmatic and ecumenical chap. We maintain that alternatives to selection for best overall design have generally been relegated to unimportance by this mode of argument. Have we not all heard the catechism about genetic drift: it can only be important in populations so small that they are likely to become extinct before playing any sustained evolutionary role (but see Lande 1976).")]

#zh(id: "S011")[#text("此时，一些演化学者会抗议，说我们歪曲了他们的适应观。他们难道没有承认遗传漂变、异速生长和多种非适应性演化原因吗？当然承认，但我们的论点不同。在自然史中，一切可能的事情，有时都会发生；通常不是通过宣称竞争解释在理论上不可能，来支持自己偏爱的现象。而是承认对手，却把它的作用领域限制得如此狭窄，使其在自然中无足轻重，然后常常为自己不教条、兼容并包而自贺。我们认为，以整体最佳设计为目标的选择以外的解释，普遍被这种论证方式贬为不重要。谁没有听过有关遗传漂变的教条：它只能在小得可能尚未发挥持续演化作用就灭绝的种群中重要？但参见 Lande（1976）。")]

#html.p(id: "en-S012")[#text("The admission of alternatives in principle does not imply their serious consideration in daily practice. We all say that not everything is adaptive; yet, faced with an organism, we tend to break it into parts and tell adaptive stories as if trade-offs among competing, well designed parts were the only constraint upon perfection for each trait. It is an old habit. As Romanes complained about A. R. Wallace in 1900: ‘Mr. Wallace does not expressly maintain the abstract impossibility of laws and causes other than those of utility and natural selection... Nevertheless, as he nowhere recognizes any other law or cause..., he practically concludes that, on inductive or empirical grounds, there is no such other law or cause to be entertained.'")]

#zh(id: "S012")[#text("原则上承认其他解释，不意味着在日常实践中认真考虑它们。我们都说并非一切都是适应的，但面对生物体，仍倾向于把它拆成部分，再讲适应故事，仿佛竞争的、设计良好的部分之间的权衡，是每个性状无法完美的唯一约束。这是旧习惯。罗曼尼斯1900年批评华莱士说：“华莱士先生并未明确主张，效用和自然选择以外的规律与原因，在抽象上不可能存在……然而，因为他从未承认任何其他规律或原因……他实际上就根据归纳或经验，断定没有其他规律或原因值得考虑。”")]

#html.p(id: "en-S013")[#text("The adaptationist programme can be traced through common styles of argument. We illustrate just a few; we trust they will be recognized by all:")]

#zh(id: "S013")[#text("适应主义纲领可以从常见论证方式中辨认出来。我们只举几个例子，相信大家都能认出：")]

#html.p(id: "en-S014")[#text("(1) If one adaptive argument fails, try another. Zig-zag commissures of clams and brachiopods, once widely regarded as devices for strengthening the shell, become sieves for restricting particles above a given size (Rudwick 1964). A suite of external structures (horns, antlers, tusks) once viewed as weapons against predators, become symbols of intraspecific competition among males (Davitashvili 1961). The eskimo face, once depicted as ‘cold engineered’ (Coon et al. 1950), becomes an adaptation to generate and withstand large masticatory forces (Shea 1977). We do not attack these newer interpretations; they may all be right. We do wonder, though, whether the failure of one adaptive explanation should always simply inspire a search for another of the same general form, rather than a consideration of alternatives to the proposition that each part is ‘for’ some specific purpose.")]

#zh(id: "S014")[#text("（1）一种适应解释失败，就换另一种。蛤和腕足动物的锯齿状壳缝，曾普遍被视为加固贝壳的装置，后来变成了阻挡一定大小颗粒的筛子（Rudwick 1964）。角、鹿角、獠牙等一组外部结构，曾被看作抵御捕食者的武器，后来变成雄性种内竞争的象征（Davitashvili 1961）。爱斯基摩人的脸，曾被说成适应寒冷的“工程设计”（Coon 等 1950），后来被解释为产生和承受巨大咀嚼力的适应（Shea 1977）。我们不是攻击这些新解释，它们可能全都正确。我们只是疑问：一种适应解释失败，是否总该仅仅激励人们寻找同类的另一个解释，而不考虑“每一部分都是为某种具体目的而存在”之外的可能性？")]

#html.p(id: "en-S015")[#text("(2) If one adaptive argument fails, assume that another must exist; a weaker version of the first argument. Costa & Bisol (1978), for example, hoped to find a correlation between genetic polymorphism and stability of environment in the deep sea, but they failed. They conclude (1978, pp. 132, 133): “The degree of genetic polymorphism found would seem to indicate absence of correlation with the particular environmental factors which characterize the sampled area. The results suggest that the adaptive strategies of organisms belonging to different phyla are different.'")]

#zh(id: "S015")[#text("（2）一种适应解释失败，就假定必有另一种。这是第一种论证的较弱版本。例如，Costa 和 Bisol（1978）希望找到深海遗传多态性与环境稳定性的相关性，却没有找到。他们的结论是：“所发现的遗传多态程度，似乎表明它与取样地区特有的环境因素没有相关性。结果提示，不同门类生物的适应策略不同。”（1978：132、133）")]

#html.p(id: "en-S016")[#text("(3) In the absence of a good adaptive argument in the first place, attribute failure to imperfect understanding of where an organism lives and what it does. This is again an old argument. Consider Wallace on why all details of colour and form in land snails must be adaptive, even if different animals seem to inhabit the same environment (1899, p. 148): 'The exact proportions of the various species of plants, the numbers of each kind of insect or of bird, the peculiarities of more or less exposure to sunshine or to wind at certain critical epochs, and other slight differences which to us are absolutely immaterial and unrecognizable, may be of the highest significance to these humble creatures, and be quite sufficient to require some slight adjustments of size, form, or colour, which natural selection will bring about.'")]

#zh(id: "S016")[#text("（3）最初没有好的适应解释，就归咎于对生物生活地点和行为的理解不足。这又是一种老论点。华莱士解释陆生蜗牛颜色和形态的所有细节为何必须具有适应性，即使不同动物似乎生活在同样环境中时说：“各种植物的精确比例，每类昆虫或鸟的数量，某些关键时期日照或风力暴露程度的特点，以及对我们完全无关紧要、甚至无法辨认的其他微小差异，对这些卑微生物可能极其重要，足以要求大小、形态或颜色作出些微调整，而自然选择便会带来这种调整。”（1899：148）")]

#html.p(id: "en-S017")[#text("(4) Emphasize immediate utility and exclude other attributes of form. Fully half the explanatory information accompanying the full-scale Fibreglass Tyrannosaurus at Boston's Museum of Science reads:‘Front legs a puzzle: how Tyrannosaurus used its tiny front legs is a scientific puzzle; they were too short even to reach the mouth. They may have been used to help the animal rise from a lying position.’ (We purposely choose an example based on public impact of science to show how widely habits of the adaptationist programme extend. We are not using glass beasts as straw men; similar arguments and relative emphases, framed in different words, appear regularly in the professional literature.) We don't doubt that Tyrannosaurus used its diminutive front legs for something. If they had arisen de novo, we would encourage the search for some immediate adaptive reason. But they are, after all, the reduced product of conventionally functional homologues in ancestors (longer limbs of allosaurs, for example). As such, we do not need an explicitly adaptive explanation for the reduction itself. It is likely to be a developmental correlate of allometric fields for relative increase in head and hindlimb size. This non-adaptive hypothesis can be tested by conventional allometric methods (Gould (1974) in general; Lande (1978) on limb reduction) and seems to us both more interesting and fruitful than untestable speculations based on secondary utility in the best of possible worlds. One must not confuse the fact that a structure is used in some way (consider again the spandrels, ceiling spaces and Aztec bodies) with the primary evolutionary reason for its existence and conformation.")]

#zh(id: "S017")[#text("（4）强调即时用途，排除形态的其他属性。波士顿科学博物馆实物大小的玻璃纤维暴龙模型旁，整整一半说明写道：“前肢之谜：暴龙怎样使用它的小前肢，是一个科学谜题；前肢短得甚至够不到嘴。它们可能用于帮助动物从卧姿站起。”我们有意选择科学公众影响方面的例子，以说明这种习惯传播之广，而不是拿玻璃兽当稻草人；专业文献也经常用不同措辞表达相同论点和侧重。我们不怀疑暴龙的小前肢曾有用途。如果前肢是全新出现的，我们会鼓励寻找即时适应原因。但它们毕竟是祖先中正常发挥功能的同源结构缩小后的产物，例如异特龙较长的前肢。因此，不必为缩小本身寻找明确适应解释。它可能只是头部和后肢相对增大时，异速生长场产生的发育关联。这一非适应假说可以用常规异速生长方法检验——一般方法见 Gould（1974），肢体缩减见 Lande（1978）——在我们看来，比根据最好世界中的次生用途作不可检验的推测，更有趣、更有成果。不能把某结构以某种方式被利用的事实，再想想拱肩、拱顶空隙和阿兹特克尸体，与其存在及形状的首要演化原因混为一谈。")]

== 3. Telling Stories / 3. 讲故事

#html.p(id: "en-S018")[#text("' All this is a manifestation of the rightness of things, since if there is a volcano at Lisbon it could not be anywhere else. For it is impossible for things not to be where they are, because everything is for the best’ (Dr Pangloss on the great Lisbon earthquake of 1755 in which up to 50000 people lost their lives).")]

#zh(id: "S018")[#text("“这一切都显示事物安排得正确：里斯本既然有火山，它就不可能在别处。事物不可能不在现在的地方，因为一切都是最好的。”——潘格洛斯博士谈1755年里斯本大地震，那次灾难夺走了多达五万人的生命。")]

#html.p(id: "en-S057")[#text("We would not object so strenuously to the adaptationist programme if its invocation, in any particular case, could lead in principle to its rejection for want of evidence. We might still view it as restrictive and object to its status as an argument of first choice. But if it could be dismissed after failing some explicit test, then alternatives would get their chance. Unfortunately, a common procedure among evolutionists does not allow such definable rejection for two reasons. First, the rejection of one adaptive story usually leads to its replacement by another, rather than to a suspicion that a different kind of explanation might be required. Since the range of adaptive stories is as wide as our minds are fertile, new stories can always be postulated. And if a story is not immediately available, one can always plead temporary ignorance and trust that it will be forthcoming, as did Costa & Bisol (1978), cited above. Secondly, the criteria for acceptance of a story are so loose that many pass without proper confirmation. Often, evolutionists use consistency with natural selection as the sole criterion and consider their work done when they concoct a plausible story. But plausible stories can always be told. The key to historical research lies in devising criteria to identify proper explanations among the substantial set of plausible pathways to any modern result.")]

#zh(id: "S057")[#text("如果适应主义纲领用于具体案例时，原则上可能因证据不足而被否定，我们不会如此强烈反对。我们也许仍认为它限制太多，反对把它作为首选论证；但如果未通过明确检验就可以被排除，其他解释便有机会。遗憾的是，演化学者常用的方法，不允许这种明确否定，原因有二。第一，一个适应故事被否定，通常由另一个取代，而不是怀疑可能需要另一类解释。适应故事的范围与我们的想象一样丰富，总能提出新故事。如果眼下没有故事，也能像前述Costa和Bisol（1978）那样，以暂时无知为由，相信以后会有。第二，接受故事的标准太宽松，许多故事未经适当确认便过关。演化学者常把符合自然选择作为唯一标准，编出合理故事就认为工作完成了。但合理故事总能编出来。历史研究的关键，是设计标准，在通向现代结果的众多合理路径中，辨认正确解释。")]

#html.p(id: "en-S020")[#text("We have, for example (Gould 1978) criticized Barash's (1976) work on aggression in mountain bluebirds for this reason. Barash mounted a stuffed male near the nests of two pairs of bluebirds while the male was out foraging. He did this at the same nests on three occasions at 10 day intervals: the first before eggs were laid, the last two afterwards. He then counted aggressive approaches of the returning male towards both the model and the female. At time one, aggression was high towards the model and lower towards females but substantial in both nests. Aggression towards the model declined steadily for times two and three and plummeted to near zero towards females. Barash reasoned that this made evolutionary sense since males would be more sensitive to intruders before eggs were laid than afterwards (when they can have some confidence that their genes are inside). Having devised this plausible story, he considered his work as completed (1976, pp. 1099, 1100):")]

#zh(id: "S020")[#text("例如，我们因此批评过Barash（1976）对山蓝鸲攻击行为的研究（Gould 1978）。雄鸟外出觅食时，他把一只雄鸟标本放在两对蓝鸲的巢旁。在同一巢址，他间隔十天做了三次：第一次在产卵前，后两次在产卵后，然后统计返回雄鸟对标本和雌鸟的攻击性接近。第一次，对标本的攻击很强，对雌鸟较弱，但两个巢的雌鸟都受到相当攻击。第二、三次，对标本的攻击持续下降，对雌鸟则骤降至接近零。Barash认为这符合演化逻辑：雄鸟在产卵前比产卵后更在意入侵者，因为产卵后能较有把握认为卵里有自己的基因。构造出这个合理故事后，他便认为工作完成了（1976：1099、1100）：")]

#html.p(id: "en-S021")[#text("‘The results are consistent with the expectations of evolutionary theory. Thus aggression toward an intruding male (the model) would clearly be especially advantageous early inthe breeding season, when territories and nests are normally defended. . . The initial aggressive response to the mated female is also adaptive in that, given a situation suggesting a high probability of adultery (i. e. the presence of the model near the female) and assuming that replacement females are available, obtaining a new mate would enhance the fitness of males. . . The decline in male-female aggressiveness during incubation and fledgling stages could be attributed to the impossibility of being cuckolded after the eggs have been laid... The results are consistent with an evolutionary interpretation.'")]

#zh(id: "S021")[#text("“结果符合演化理论的预期。因此，在通常保卫领地和巢穴的繁殖季早期，攻击入侵雄鸟——即标本——显然特别有利……最初攻击配偶雌鸟也具有适应性，因为情境暗示不忠概率很高，即标本在雌鸟附近；若另有雌鸟可供替换，获得新配偶便会提高雄鸟适合度……孵卵和雏鸟阶段雄雌间攻击的下降，可归因于产卵后已经不可能再被戴绿帽……结果符合演化解释。”")]

#html.p(id: "en-S022")[#text("They are indeed consistent, but what about an obvious alternative, dismissed without test by Barash? Male returns at times two and three, approaches the model, tests it a bit, recognizes it as the same phoney he saw before, and doesn't bother his female. Why not at least perform the obvious test for this alternative to a conventional adaptive story: expose a male to the model for the first time after the eggs are laid.")]

#zh(id: "S022")[#text("它们确实符合，但Barash未经检验就排除了一个显而易见的替代解释，怎么办？第二、三次雄鸟回来，接近标本，稍作试探，认出还是先前那个假货，便不再打扰雌鸟。为什么不至少进行一个明显的检验：在产卵后才让雄鸟第一次见到标本，以检验这个传统适应故事以外的解释？")]

#html.p(id: "en-S023")[#text("Since we criticized Barash's work, Morton et al. (1978) repeated it, with some variations (including the introduction of a female model), in the closely related eastern bluebird Sialia sialis. ‘We hoped to confirm', they wrote, that Barash's conclusions represent ‘a widespread evolutionary reality, at least within the genus Sialia. Unfortunately, we were unable to do so.’ They found no ‘anticuckoldry' behaviour at all: males never approached their females aggressively after testing the model at any nesting stage. Instead, females often approached the male model and, in any case, attacked female models more than males attacked male models. ‘This violent response resulted in the near destruction of the female model after presentations and its complete demise on the third, as a female flew off with the model's head early in the experiment to lose it for us in the brush' (1978, p. 969). Yet, instead of calling Barash's selected story into question, they merely devise one of their own to render both results in the adaptationist mode. Perhaps, they conjecture, replacement females are scarce in their species and abundant in Barash's. Since Barash's males can replace a potentially ‘unfaithful' female, they can afford to be choosy and possessive. Eastern bluebird males are stuck with uncommon mates and had best be respectful. They conclude:‘If we did not support Barash's suggestion that male bluebirds show anticuckoldry adaptations, we suggest that both studies still had “results that are consistent with the expectations of evolutionary theory\" (Barash 1976, p. 1099), as we presume any careful study would.' But what good is a theory that cannot fail in careful study (since by‘evolutionary theory', they clearly mean the action of natural selection applied to particular cases, rather than the fact of transmutation itself).")]

#zh(id: "S023")[#text("我们批评之后，Morton等（1978）在近缘的东蓝鸲Sialia sialis中重复实验，加入若干变化，包括雌鸟标本。他们写道，原想确认Barash的结论代表“至少在蓝鸲属中广泛存在的演化事实。不幸的是，我们未能做到”。他们完全没有发现“防戴绿帽”行为：任何筑巢阶段，雄鸟试探标本后，都没有攻击性地接近自己的雌鸟。相反，雌鸟常接近雄鸟标本；无论如何，雌鸟对雌鸟标本的攻击，比雄鸟对雄鸟标本更多。“这种猛烈反应，使雌鸟标本在两次展示后几乎毁坏，第三次则彻底完蛋：实验刚开始，一只雌鸟便叼走标本的头，丢进灌木，让我们无法找回。”（1978：969）但他们没有质疑Barash选择的故事，而是另编故事，把两种结果都放入适应主义模式：也许本物种替代雌鸟稀少，而Barash的物种较多。后者可以更换可能“不忠”的雌鸟，因而能够挑剔和占有；东蓝鸲雄鸟则只能与稀少配偶相处，最好尊重她们。他们总结：“虽然我们不支持雄性蓝鸲表现防不忠适应的建议，但认为两个研究仍都有‘符合演化理论预期的结果’（Barash 1976：1099），我们假定任何仔细研究都会如此。”然而，一个在仔细研究中不可能失败的理论，有什么用？这里的“演化理论”，显然指自然选择在具体案例中的作用，而不是物种发生转变这个事实本身。")]

== 4. The Master's Voice Re-examined / 4. 重新审视大师的声音

#html.p(id: "en-S024")[#text("Since Darwin has attained sainthood (if not divinity) among evolutionary biologists, and since all sides invoke God's allegiance, Darwin has often been depicted as a radical selectionist at heart who invoked other mechanisms only in retreat, and only as a result of his age's own lamented ignorance about the mechanisms of heredity. This view is false. Although Darwin regarded selection as the most important of evolutionary mechanisms (as do we), no argument from opponents angered him more than the common attempt to caricature and trivialize his theory by stating that it relied exclusively upon natural selection. In the last edition of the Origin, he wrote (1872, p. 395):")]

#zh(id: "S024")[#text("达尔文在演化生物学家中既然已成圣——甚至成神——而各方都宣称神站在自己一边，他就经常被描绘为内心激进的选择主义者，只在退却时援引其他机制，而且只因为当时对遗传机制的无知。这种观点是错的。虽然达尔文和我们一样，把选择视为最重要的演化机制，但反对者的论证中，没有什么比声称他的理论完全依靠自然选择这种歪曲和轻视，更令他愤怒。在《物种起源》最后一版，他写道（1872：395）：")]

#html.p(id: "en-S025")[#text("‘As my conclusions have lately been much misrepresented, and it has been stated that I attribute the modification of species exclusively to natural selection, I may be permitted to remark that in the first edition of this work, and subsequently, I placed in a most conspicuous position -- namely at the close of the Introduction-the following words:‘I am convinced that natural selection has been the main, but not the exclusive means of modification.'This has been of no avail. Great is the power of steady misinterpretation.'")]

#zh(id: "S025")[#text("“近来我的结论受到许多误解，有人说我把物种变化完全归于自然选择，请允许我指出：在本书第一版以及后续版本中，我都在极醒目的位置，即引言结尾，写下：‘我确信自然选择是变化的主要手段，但不是唯一手段。’这却毫无作用。持续误解的力量何其巨大。”")]

#html.p(id: "en-S058")[#text("Romanes, whose once famous essay (1900) on Darwin's pluralism versus the panselectionism of Wallace and Weismann deserves a resurrection, noted of this passage (1900, p. 5): ‘In the whole range of Darwin's writings there cannot be found a passage so strongly worded as this: it presents the only note of bitterness in all the thousands of pages which he has published.' Apparently, Romanes did not know the letter Darwin wrote to Nature in1880, in whichhe castigated Sir Wyville Thomson for caricaturing his theory as panselectionist (1880, p. 32):")]

#zh(id: "S058")[#text("罗曼尼斯那篇曾经著名、讨论达尔文多元论与华莱士、魏斯曼泛选择主义差异的1900年文章，值得重新受到注意。他评述这段话说：“在达尔文全部著作中，找不到措辞如此强烈的另一段；在他发表的数千页文字中，这是唯一流露苦涩的地方。”（1900：5）显然，罗曼尼斯不知道达尔文1880年写给《自然》的信，信中严厉批评威维尔·汤姆森爵士，把其理论歪曲成泛选择主义（1880：32）：")]

#html.p(id: "en-S026")[#text("‘I am sorry to find that Sir Wyville Thomson does not understand the principle of natural selection.. . If he had done so, he could not have written the following sentence in the Introduction to the Voyage of the Challenger:“The character of the abyssal fauna refuses to give the least support to the theory which refers the evolution of species to extreme variation guided only by natural selection.\" This is a standard of criticism not uncommonly reached by theologians and metaphysicians when they write on scientific subjects, but is something new as coming from a naturalist... Can Sir Wyville Thomson name any one who has said that the evolution of species depends only on natural selection? As far as concerns myself, I believe that no one has brought forward so many observations on the effects of the use and disuse of parts, as I have done in my“Variation of Animals and Plants under Domestication\"; and these observations were made for this special object. I have likewise there adduced a considerable body of facts, showing the direct action of external conditions on organisms.'")]

#zh(id: "S026")[#text("“遗憾的是，威维尔·汤姆森爵士不理解自然选择原理……如果理解，他便不会在《挑战者号航行记》引言中写下：‘深海动物群的特征，完全不支持那种把物种演化归于仅受自然选择引导的极端变异的理论。’神学家和形而上学家论科学时，常达到这种批评水准，但出自博物学家却是新鲜事……汤姆森爵士能说出谁主张物种演化只依靠自然选择吗？就我而言，我相信没有人在器官使用和不使用的影响方面，提出过像我在《家养动物和栽培植物的变异》中那么多的观察；这些观察正是为此目的而作。我还列举大量事实，显示外部条件对生物体的直接作用。”")]

#html.p(id: "en-S059")[#text("We do not now regard all of Darwin's subsidiary mechanisms as significant or even valid, though many, including direct modification and correlation of growth, are very important. But we should cherish his consistent attitude of pluralism in attempting to explain Nature's complexity.")]

#zh(id: "S059")[#text("如今，我们并不认为达尔文提出的所有辅助机制都重要，甚至都成立；但其中许多机制，包括直接改变和生长相关，十分重要。我们应珍视他解释自然复杂性时一贯的多元态度。")]

== 5. A Partial Typology of Alternatives to the Adaptationist Programme / 5. 适应主义纲领之外的部分替代解释分类

#html.p(id: "en-S028")[#text("In Darwin's pluralistic spirit, we present an incomplete hierarchy of alternatives to immediate adaptation for the explanation of form, function, and behaviour.")]

#zh(id: "S028")[#text("秉承达尔文的多元精神，我们提出一个不完整的层级分类，列出在解释形态、功能和行为时，即时适应之外的替代方案。")]

#html.p(id: "en-S029")[#text("(1) No adaptation and no selection at all. At present, population geneticists are sharply divided on the question of how much genetic polymorphism within populations and how much of the genetic differences between species is, in fact, the result of natural selection as opposed to purely random factors. Populations are finite in size and the isolated populations that form the first step in the speciation process are often founded by a very small number of individuals. As a result of this restriction in population size, frequencies of alleles change by genetic drift, a kind of random genetic sampling error. The stochastic process of change in gene frequency by random genetic drift, including the very strong sampling process that goes on when a new isolated population is formed from a few immigrants, has several important consequences. First, populations and species will become genetically differentiated, and even fixed for different alleles at a locus in the complete absence of any selective force at all.")]

#zh(id: "S029")[#text("（1）既无适应，也完全没有选择。目前，种群遗传学家对一个问题意见尖锐分歧：种群内多少遗传多态性，以及物种间多少遗传差异，实际由自然选择而非纯随机因素造成。种群规模有限，形成物种形成第一步的隔离种群，常由极少数个体建立。由于规模受限，等位基因频率会通过遗传漂变改变，这是一种随机遗传抽样误差。随机漂变导致基因频率变化的随机过程，包括少数迁入者建立新隔离种群时极强的抽样过程，有几项重要后果。首先，完全没有任何选择力量时，种群和物种也会发生遗传分化，甚至在同一位点固定不同等位基因。")]

#html.p(id: "en-S030")[#text("Secondly, alleles can become fixed in a population in spite of natural selection. Even if an allele is favoured by natural selection, some proportion of population, depending upon the product of population size N and selection intensity s, will become homozygous for the less fit allele because of genetic drift. If Ns is large this random fixation for unfavourable alleles is a rare phenomenon, but if selection coefficients are on the order of the reciprocal of population size (Ns = 1) or smaller, fixation for deleterious alleles is common. If many genes are involved in influencing a metric character like shape, metabolism or behaviour, then the intensity of selection on each locus will be small and Ns per locus may be small. As a result, many of the loci may be fixed for non-optimal alleles.")]

#zh(id: "S030")[#text("其次，即使自然选择存在，等位基因仍可在种群中固定。即便某等位基因受到自然选择青睐，仍有一定比例的种群，因为漂变而成为适合度较低等位基因的纯合子；这个比例取决于种群规模N与选择强度s的乘积。若Ns很大，不利等位基因随机固定很少见；若选择系数约为种群规模的倒数，即Ns＝1，或更小，有害等位基因固定便很常见。若许多基因共同影响形态、代谢或行为等数量性状，每个位点的选择强度就较小，Ns也可能较小。因此，许多位点可能固定非最优等位基因。")]

#html.p(id: "en-S031")[#text("Thirdly, new mutations have a small chance of being incorporated into a population, even when selectively favoured. Genetic drift causes the immediate loss of most new mutations after their introduction. With a selection intensity s, a new favourable mutation has a probability of only 2s of ever being incorporated. Thus, one cannot claim that, eventually, a new mutation of just the right sort for some adaptive argument will occur and spread.‘Eventually’ becomes a very long time if only one in 1000 or one in 10000 of the‘right’mutations that do occur ever get incorporated in a population.")]

#zh(id: "S031")[#text("第三，即使受到选择青睐，新突变进入种群的机会也很小。遗传漂变会使绝大多数新突变出现后立即丢失。选择强度为s时，一个新的有利突变最终进入种群的概率只有2s。因此，不能说符合某种适应解释的新突变，迟早会出现并传播。如果真正出现的“正确”突变中，只有千分之一或万分之一最终进入种群，“迟早”就会意味着极其漫长的时间。")]

#html.p(id: "en-S032")[#text("(2) No adaptation and no selection on the part at issue; form of the part is a correlated consequence of selection directed elsewhere. Under this important category, Darwin ranked his 'mysterious' laws of the 'correlation of growth'. Today, we speak of pleiotropy, allometry, ‘material compensation’ (Rensch 1959, pp. 179-187) and mechanically forced correlations in D'Arcy Thompson's sense (1942; Gould 1971). Here we come face to face with organisms as integrated wholes, fundamentally not decomposable into independent and separately optimized parts.")]

#zh(id: "S032")[#text("（2）所讨论部分既无适应，也未受到选择；其形态是指向其他部位的选择所造成的相关后果。达尔文把“神秘的”生长相关规律归入这一重要类别。如今，我们谈论多效性、异速生长、“材料补偿”（Rensch 1959：179—187），以及达西·汤普森意义上的机械必然关联（1942；Gould 1971）。在这里，我们直面作为整合整体的生物体：从根本上，它们不能分解成相互独立、分别优化的部分。")]

#html.p(id: "en-S033")[#text("Although allometric patterns are as subject to selection as static morphology itself (Gould 1966), some regularities in relative growth are probably not under immediate adaptive control. For example, we do not doubt that the famous 0.66 interspecific allometry of brain size in all major vertebrate groups represents a selected ‘design criterion,’ though its significance remains elusive (Jerison 1973). It is too repeatable across too wide a taxonomic range to represent much else than a series of creatures similarly well designed for their different sizes. But another common allometry, the 0.2 to 0.4 intraspecific scaling among homeothermic adults differing in body size, or among races within a species, probably does not require a selectionist story though many, including one of us, have tried to provide one (Gould 1974). R. Lande (personal communication) has used the experiments of Falconer (1973) to show that selection upon body size alone yields a brain-body slope across generations of 0.35 in mice.")]

#zh(id: "S033")[#text("尽管异速生长模式与静态形态一样可以受到选择（Gould 1966），相对生长中的某些规律，很可能不受即时适应的控制。例如，我们不怀疑，所有主要脊椎动物类群中，脑大小著名的0.66种间异速指数，代表一种被选择的“设计准则”，尽管其意义仍不清楚（Jerison 1973）。它在如此广泛的分类范围中反复出现，除了不同体型生物具有相似良好设计，很难有别的解释。但另一常见异速关系，即体型不同的恒温动物成体之间，或同物种不同群体之间0.2至0.4的种内标度，很可能不需要选择主义故事，尽管包括我们一人在内，许多人尝试提供这种解释（Gould 1974）。R. Lande在私人通信中依据Falconer（1973）的实验指出，仅对体型施加选择，就能使小鼠跨世代的脑—体关系斜率达到0.35。")]

#html.p(id: "en-S034")[#text("More compelling examples abound in the literature on selection for altering the timing of maturation (Gould 1977). At least three times in the evolution of arthropods (mites, flies and beetles), the same complex adaptation has evolved, apparently for rapid turnover of generations in strongly r-selected feeders on superabundant but ephemeral fungal resources: females reproduce as larvae and grow the next generation within their bodies. Offspring eat their mother from inside and emerge from her hollow shell, only to be devoured a few days later by their own progeny. It would be foolish to seek adaptive significance in paedomorphic morphology per se; it is primarily a by-product of selection for rapid cycling of generations. In more interesting cases, selection for small size (as in animals of the interstitial fauna) or rapid maturation (dwarf males of many crustaceans) has occurred by progenesis (Gould 1977, pp. 324-336), and descendant adults contain a mixture of ancestral juvenile and adult features. Many biologists have been tempted to find primary adaptive meaning for the mixture, but it probably arises as a byproduct of truncated maturation, leaving some features ‘behind’in the larval state, while allowing others, more strongly correlated with sexual maturation, to retain the adult configuration of ancestors.")]

#zh(id: "S034")[#text("关于选择改变成熟时间的文献中，有许多更有说服力的例子（Gould 1977）。节肢动物演化至少三次——螨、蝇和甲虫——出现同样的复杂适应，似乎是为了使取食极丰富但短暂真菌资源、受到强烈r选择的生物，快速更新世代：雌性以幼体状态繁殖，在体内孕育下一代。子代从内部吃掉母亲，从其空壳中钻出，几天后又被自己的子代吃掉。为幼态形态本身寻找适应意义是愚蠢的；它主要是对快速世代循环施加选择的副产物。在更有趣的案例中，对小体型的选择，例如间隙动物，或对快速成熟的选择，例如许多甲壳类的矮小雄性，通过早熟发生（Gould 1977：324—336），使后代成体混合了祖先的幼体与成体特征。许多生物学家试图赋予这种混合首要适应意义，但它很可能只是成熟过程截短的副产物：一些特征“落后”在幼体状态，另一些与性成熟更强相关的特征，则保留祖先的成体构型。")]

#html.p(id: "en-S035")[#text("(3)The decoupling of selection and adaptation. (i) Selection without adaptation. Lewontin (1979) has presented the following hypothetical example:‘A mutation which doubles the fecundity of individuals will sweep through a population rapidly. If there has been no change in efficiency of resource utilization, the individuals will leave no more offspring than before, but simply lay twice as many eggs, the excess dying because of resource limitation. In what sense are the individuals or the population as a whole better adapted than before? Indeed, if a predator on immature stages is led to switch to the species now that immatures are more plentiful, the population size may actually decrease as a consequence, yet natural selection at all times will favour individuals with higher fecundity.'")]

#zh(id: "S035")[#text("（3）选择与适应脱钩。（i）有选择而无适应。Lewontin（1979）提出如下假想例子：“使个人繁殖力翻倍的突变，会迅速席卷种群。如果资源利用效率没有变化，个体留下的子代数量并不比以前更多，只是产卵翻倍，多余子代因资源有限而死亡。个体或整个种群，在哪种意义上比以前适应得更好？事实上，如果捕食未成熟阶段的捕食者，因其数量更多而转向这个物种，种群规模可能反而下降，但自然选择始终有利于繁殖力更高的个体。”")]

#html.p(id: "en-S036")[#text("(ii)Adaptation without selection. Many sedentary marine organisms, sponges and corals in particular, are well adapted to the flow régimes in which they live. A wide spectrum of 'good design' may be purely phenotypic in origin, largely induced by the current itself. (We may be sure of this in numerous cases, when genetically identical individuals of a colony assume different shapes in different microhabitats.) Larger patterns of geographic variation are often adaptive and purely phenotypic as well. Sweeney & Vannote (1978), for example, showed that many hemimetabolous aquatic insects reach smaller adult size with reduced fecundity when they grow at temperatures above and below their optima. Coherent, climatically correlated patterns in geographic distribution for these insects - so often taken as a priori signs of genetic adaptation - may simply reflect this phenotypic plasticity.")]

#zh(id: "S036")[#text("（ii）有适应而无选择。许多固着海洋生物，特别是海绵和珊瑚，十分适应其生活环境的水流状况。大量“良好设计”可能纯粹源于表型，主要由水流本身诱导。许多案例中，群体内遗传相同的个体，在不同微生境中呈现不同形状，足以确认这一点。更大范围的地理变异也常具有适应性，却同样纯属表型。例如，Sweeney和Vannote（1978）显示，许多不完全变态水生昆虫，在高于或低于最适温度的环境中生长，成体更小、繁殖力降低。这些昆虫地理分布中与气候一致相关的模式，常被先验地看作遗传适应的标志，却可能仅仅反映这种表型可塑性。")]

#html.p(id: "en-S037")[#text("‘Adaptation’- the good fit of organisms to their environment - can occur at three hierarchical levels with different causes. It is unfortunate that our language has focused on the common result and called all three phenomena‘adaptation': the differences in process have been obscured and evolutionists have often been misled to extend the Darwinian mode to the other two levels as well. First, we have what physiologists call‘adaptation': the phenotypic plasticity that permits organisms to mould their form to prevailing circumstances during ontogeny. Human ‘adaptations’ to high altitude fall into this category (while others, like resistance of sickling heterozygotes to malaria, are genetic and Darwinian). Physiological adaptations are not heritable, though the capacity to develop them presumably is. Secondly, we have a ‘heritable’form of non-Darwinian adaptation in humans (and, in rudimentary ways, in a few other advanced social species): cultural adaptation (with heritability imposed by learning). Much confused thinking in human sociobiology arises from a failure to distinguish this mode from Darwinian adaptation based on genetic variation. Finally, we have adaptation arising from the conventional Darwinian mechanism of selection upon genetic variation. The mere existence of a good fit between organism and environment is insufficient evidence for inferring the action of natural selection.")]

#zh(id: "S037")[#text("“适应”，即生物体与环境良好匹配，可以在三个层级发生，原因各不相同。遗憾的是，我们的语言集中于共同结果，把三种现象都称作“适应”，掩盖了过程差异，使演化学者常错误地把达尔文模式扩展到其他两个层级。首先是生理学家所谓的“适应”：生物体在个体发育过程中，根据当前环境塑造自身形态的表型可塑性。人类对高海拔的“适应”属于此类；而镰状细胞杂合子抵抗疟疾等其他例子，则属于遗传和达尔文式适应。生理适应不能遗传，尽管产生这种适应的能力可能可以遗传。其次，人类以及少数较高级社会性物种的初级形式，具有一种“可传递”的非达尔文适应：文化适应，通过学习实现传递。人类社会生物学中许多混乱思维，来自未区分这种模式与基于遗传变异的达尔文适应。最后，才是通过选择遗传变异这一常规达尔文机制产生的适应。仅仅存在生物与环境的良好匹配，不足以推断自然选择发挥了作用。")]

#html.p(id: "en-S038")[#text("(4) Adaptation and selection but no selective basis for differences among adaptations. Species of related organisms, or subpopulations within a species, often develop different adaptations as solutions to the same problem. When multiple adaptive peaks’ are occupied, we usually have no basis for asserting that one solution is better than another. The solution followed in any spot is a result of history; the first steps went in one direction, though others would have led to adequate prosperity as well. Every naturalist has his favourite illustration. In the West Indian land snail Cerion, for example, populations living on rocky and windy coasts almost always develop white, thick and relatively squat shells for conventional adaptive reasons. We can identify at least two different developmental pathways to whiteness from the mottling of early whorls in all Cerion, twopaths to thickened shells and three styles of allometryleading to squat shells. All 12 combinations can be identified in Bahamian populations, but would it be fruitful to ask why - in the sense of optimal design rather than historical contingency - Cerion from eastern Long Island evolved one solution, and Cerion from Acklins Island another?")]

#zh(id: "S038")[#text("（4）有适应，也有选择，但不同适应之间的差异没有选择基础。近缘物种或同一物种的亚种群，常为解决同一问题形成不同适应。当多个“适应峰”被占据时，通常没有依据断言某种方案优于另一种。某地采用的方案是历史结果：最初几步走向了某个方向，尽管其他方向也能带来充分繁荣。每个博物学家都有自己偏爱的例子。西印度陆生蜗牛Cerion生活在岩石多、风大的海岸时，几乎总会因常规适应原因，形成白色、厚、相对矮胖的壳。所有Cerion早期螺层都有斑纹，但我们能识别两条变白的发育路径、两条增厚路径，以及三种导致矮胖壳的异速生长方式。巴哈马种群中，十二种组合都能找到。但追问长岛东部和阿克林岛为何演化出不同方案，若问的是最优设计而非历史偶然性，真的富有成果吗？")]

#html.p(id: "en-S039")[#text("(5)Adaptation and selection, butthe adaptation is a secondary utilization of parts present for reasons of architecture, development or history. We have already discussed this neglected subject in the first section on spandrels, spaces and cannibalism. If blushing turns out to be an adaptation affected by sexual selection in humans, it will not help us to understand why blood is red. The immediate utility of an organic structure often says nothing at all about the reason for its being.")]

#zh(id: "S039")[#text("（5）有适应和选择，但适应只是对因构造、发育或历史原因已经存在的部分的次生利用。我们已在第一节有关拱肩、空间和食人习俗的讨论中涉及这个被忽视的问题。如果脸红确实是人类性选择产生的适应，它也不能帮助解释血液为什么是红色。生物结构的即时用途，往往完全不能说明它为何存在。")]

#html.p(id: "en-S040")[#text("In continental Europe, evolutionists have never been much attracted to the Anglo-American penchant for atomizing organisms into parts and trying to explain each as a direct adaptation. Their general alternative exists in both a strong and a weak form. In the strong form, as advocated by such major theorists as Schindewolf (1950), Remane (1971), and Grasse (1977), natural selection under the adaptationist programme can explain superficial modifications of the Bauplan that fit structure to environment: why moles are blind, giraffes have long necks, and ducks webbed feet, for example. But the important steps of evolution, the construction of the Bauplan itself and the transition between Bauplane, must involve some other unknown, and perhaps ‘internal', mechanism. We believe that English biologists have been right in rejecting this strong form as close to an appeal to mysticism.")]

#zh(id: "S040")[#text("在欧洲大陆，演化学者从未特别热衷于英美式倾向：把生物体拆成部分，并尝试把每部分解释为直接适应。其总体替代观点有强、弱两种版本。强版本由Schindewolf（1950）、Remane（1971）和Grassé（1977）等主要理论家倡导，认为适应主义纲领中的自然选择，只能解释使结构符合环境的基本体制表面改变，例如鼹鼠失明、长颈鹿长颈、鸭子蹼足。但演化的重要步骤——基本体制本身的建立，以及不同体制间的转变——必须涉及其他未知、可能“内部”的机制。我们认为，英国生物学家正确地拒绝了这种近乎诉诸神秘主义的强版本。")]

#html.p(id: "en-S042")[#text("But the argument has a weaker - and paradoxically powerful - form that has not been appreciated, but deserves to be. It also acknowledges conventional selection for superficial modifications of the Bauplan. It also denies that the adaptationist programme (atomization plus optimizing selection on parts) can do much to explain Bauplane and the transitions between them. But it does not therefore resort to a fundamentally unknown process. It holds instead that the basic body plans of organisms are so integrated and so replete with constraints upon adaptation (categories 2 and 5 of our typology) that conventional styles of selective arguments can explain little of interest about them. It does not deny that change, when it occurs, may be mediated by natural selection, but it holds that constraints restrict possible paths and modes of change so strongly that the constraints themselves become much the most interesting aspect of evolution.")]

#zh(id: "S042")[#text("但这一论证还有较弱、却矛盾地更有力量的版本，尚未得到应有认识。它同样承认常规选择能改变基本体制表层，同样否认适应主义纲领——拆成原子部分，再对部分施加优化选择——能够充分解释基本体制及其转变。但它不因此诉诸根本未知的过程。相反，它认为生物基本体制高度整合，且充满对适应的约束，即我们的第2、5类，以至于常规选择论证几乎不能解释其中有意义的东西。它不否认变化发生时可能由自然选择推动，但认为约束强烈限制了变化的可能路径和方式，使约束本身成为演化最值得关注的方面。")]

#html.p(id: "en-S043")[#text("Rupert Riedl, the Austrian zoologist whohas tried to develop this thesis for English audiences (1977 and 1975, now being translated into English by R. Jefferies), writes:")]

#zh(id: "S043")[#text("奥地利动物学家鲁珀特·里德尔，试图向英语读者阐明这一论点。他的1975年著作正由R. Jefferies译成英文，1977年也发表了相关工作。他写道：")]

#html.p(id: "en-S044")[#text("* The living world happens to be crowded by universal patterns of organization which, most obviously, find no direct explanation through environmental conditions or adaptive radiation, but exist primarily through universal requirements which can only be expected under the systems conditions of complex organization itself... This is not self-evident, for the whole of the huge and profound thought collected in the field of morphology, from Goethe to Remane, has virtually been cut off from modern biology. It is not taught in most American universities. Even the teachers who could teach it have disappeared.'")]

#zh(id: "S044")[#text("“生命世界充满普遍的组织模式。显然，环境条件或适应辐射不能直接解释它们；它们主要来自复杂组织自身系统条件所必然要求的普遍需求……这并非不言自明，因为从歌德到雷马内，形态学领域积累的全部浩繁深刻思想，实际上几乎与现代生物学隔绝。在大多数美国大学，它们不被教授。连能够教授它们的老师，也已经消失了。”")]

#html.p(id: "en-S045")[#text("Constraints upon evolutionary change may be ordered into at least two categories. All evolutionists are familiar with phyletic constraints, as embodied in Gregory's classic distinction (1936) between habitus and heritage. We acknowledge a kind of phyletic inertia in recognizing, for example, that humans are not optimally designed for upright posture because so much of our Bauplan evolved for quadrupedal life. We also invoke phyletic constraint in explaining why no molluscs fly in air and no insects are as large as elephants.")]

#zh(id: "S045")[#text("对演化变化的约束，至少可以分为两类。所有演化学者都熟悉系统发育约束，体现为格雷戈里（1936）对适应形态与遗产的经典区分。例如，我们认识到，人类并非为直立姿势作了最优设计，因为基本体制许多部分是在四足生活中演化的，这就是某种系统发育惯性。解释为什么没有软体动物在空中飞行、没有昆虫像大象那样大时，我们也援引系统发育约束。")]

#html.p(id: "en-S046")[#text("Developmental constraints, a subcategory of phyletic restrictions, may hold the most powerful rein of all over possible evolutionary pathways. In complex organisms, early stages of ontogeny are remarkably refractory to evolutionary change, presumably because the differentiation of organ systems and their integration into a functioning body is such a delicate process, so easily derailed by early errors with accumulating effects. Von Baer's fundamental embryological laws (1828) represent little more than a recognition that early stages are both highly conservative and strongly restrictive of later development. Haeckel's. biogenetic law, the primary subject of late nineteenth century evolutionary biology, rested upon a misreading of the same data (Gould 1977). If development occurs in integrated packages, and cannot be pulled apart piece by piece in evolution, then the adaptationist programme cannot explain the alteration of developmental programmes underlying nearly all changes of Bauplan.")]

#zh(id: "S046")[#text("发育约束是系统发育限制的一个子类，可能对演化的可能路径具有最强控制。复杂生物的早期个体发育阶段，格外难以发生演化变化；大概因为器官系统的分化，以及整合成可运作身体，是一个极其精细、容易被早期错误及其累积效应扰乱的过程。冯·贝尔的基本胚胎学规律（1828），实质上就是认识到：早期阶段既高度保守，又强烈限制后续发育。海克尔的生物发生律，曾是19世纪末演化生物学的主要主题，却来自对同样数据的误读（Gould 1977）。如果发育以整合成组的方式发生，演化中无法一块块拆开，那么适应主义纲领就不能解释几乎所有基本体制变化背后的发育程序改变。")]

#html.p(id: "en-S056")[#text("The German palaeontologist A. Seilacher, whose work deserves far more attention than it has received, has emphasized what he calls‘bautechnischer', or architectural, constraints (Seilacher 1970). These arise not from former adaptations retained in a new ecological setting (phyletic constraints as usually understood), but as architectural restrictions that never were adaptations, but rather the necessary consequences of materials and designs selected to build basic Bauplane. We devoted the first section of this paper to non-biological examples in this category. Spandrels must exist once a blueprint specifies that a dome shall rest on rounded arches. Architectural constraints can exert a far-ranging influence upon organisms as well. The subject is full of potential insight because it has rarely been acknowledged at all.")]

#zh(id: "S056")[#text("德国古生物学家A.塞拉赫的工作，远比现在受到的关注更值得重视。他强调所谓“构造技术”或建筑约束（Seilacher 1970）。它们不是在新生态环境中保留的旧适应——通常理解的系统发育约束——而是从未成为适应的构造限制，是建造基本体制时所选材料和设计的必然后果。本文第一节讨论了这一类非生物例子：一旦设计规定穹顶架在圆拱上，拱肩就必然存在。建筑约束也能对生物产生深远影响。这一领域极具洞见潜力，因为它几乎从未被承认。")]

#html.figure(id: "F003", class: "essay-paper-figure")[
#image("assets/figure-03.png")
]

#html.p(id: "en-C003", class: "essay-original-caption")[#text("Figure 3. The range of divaricate patterns in molluscs. E, F, H, and L are non-functional in Seilacher’s judgement. A–D are functional ribs (but these are far less common than non-functional ribs of the form E). G is the mimetic Arca zebra. K is Corculum. See text for details.")]

#zh(id: "C003")[#text("图3．软体动物中各种叉分纹样。塞拉赫认为E、F、H和L没有功能。A至D是有功能的肋纹，但远不如E型无功能肋纹常见。G是拟态的Arca zebra，K是Corculum。详见正文。图中分别列出沟槽、肋纹、颜色和矿物组构，并比较无功能、高变异的形式与有功能、低变异的形式。")]

#html.p(id: "en-S048")[#text("In a fascinating example, Seilacher (1972) has shown that the divaricate form of architecture (figure 3) occurs again and again in all groups of molluscs, and in brachiopods as well. This basic form expresses itself in a wide variety of structures: raised ornamental lines (not growth lines because they do not conform to the mantle margin at any time), patterns of coloration, internal structures in the mineralization of calcite, and incised grooves. He does not know what generates this pattern and feels thattraditional andnearly exclusivefocus on the adaptive value of each manifestation has diverted attention from questions of its genesis in growth and also prevented its recognition as a general phenomenon. It must arise from some characteristic pattern of inhomogeneity in the growing mantle, probably from the generation of interference patterns around regularly spaced centres; simple computer simulations can generate the form in this manner (Waddington & Cowe 1969). The general pattern may not be a direct adaptation at all.")]

#zh(id: "S048")[#text("塞拉赫（1972）提出一个精彩例子：叉分构造（图3）反复出现于所有软体动物类群，也见于腕足动物。这种基本形式表现为多样结构：凸起装饰线——不是生长线，因为它们从不符合外套膜边缘——颜色图案、方解石矿化内部结构，以及刻入的沟槽。他不知道什么产生这种模式，认为传统上几乎只关注每种表现的适应价值，既使人忽略它在生长中如何产生，也妨碍认识它是一种一般现象。它必然来自生长外套膜中某种特定的不均一模式，很可能来自规则间隔的中心周围产生的干涉图案；简单计算机模拟便能如此生成这种形式（Waddington 与 Cowe 1969）。这个总体模式，可能完全不是直接适应。")]

#html.p(id: "en-S049")[#text("Seilacher then argues that most manifestations of the pattern are probably non-adaptive. His reasons vary, but seem generally sound to us. Some are based on field observations: colour patterns that remain invisible because clams possessing them either live buried in sediments or remain covered with a periostracum so thick that the colours cannot be seen. Others rely on more general principles: presence only in odd and pathological individuals, rarity as a developmental anomaly, excessive variability compared with much reduced variability when the same general structure assumes a form judged functional on engineering grounds.")]

#zh(id: "S049")[#text("塞拉赫继而认为，这种模式的绝大多数表现，很可能没有适应性。他的理由不尽相同，但总体上我们认为合理。有些基于实地观察：拥有某些颜色图案的贝类埋在沉积物中，或覆盖着太厚的壳皮，颜色始终不可见。其他理由依靠更一般的原则：只出现在异常和病态个体中；作为发育异常而十分罕见；或者变异极大，而同样结构一旦呈现工程学上被判断为有功能的形式，变异便大幅减少。")]

#html.p(id: "en-S050")[#text("In a distinct minority of cases, the divaricate pattern becomes functional in each of the four categories (figure 3). Divaricate ribs may act as scoops and anchors in burrowing (Stanley 1970), but they are not properly arranged for such function in most clams. The colour chevrons are mimetic in one species (Pteria zebra) that lives on hydrozoan branches; here the variabilityis strongly reduced. The mineralization chevrons are probably adaptive in only one remarkable creature, the peculiar bivalve Corculum cardissa (in other species, they either appear in odd specimens or only as post-mortem products of shell erosion). This clam is uniquely flattened in an anterio-posterior direction. It lies on the substrate, posterior up. Distributed over its rear end are divaricate triangles of mineralization. They are translucent, while the rest of the shell is opaque. Under these windows dwell endosymbiotic algae!")]

#zh(id: "S050")[#text("在少数明确案例中，四类叉分模式都能获得功能（图3）。叉分肋纹可在掘穴时充当铲和锚（Stanley 1970），但绝大多数蛤的肋纹排列并不适合此功能。某种生活在水螅类枝条上的Pteria zebra，其V形颜色纹具有拟态功能，此时变异显著减少。矿化V形纹可能只在一个特别的生物中具有适应性，即奇特的双壳类Corculum cardissa；其他物种中，它们只见于异常个体，或死亡后贝壳侵蚀的产物。这种贝类独特地沿前后方向变扁，躺在底面上，后端朝上。后端分布着叉分矿化三角，它们透明，其余壳则不透明。而在这些窗下，生活着内共生藻类！")]

#html.p(id: "en-S051")[#text("All previous literature on divaricate structure has focused on its adaptive significance (and failed to find any in most cases). But Seilacher is probably right in representing this case as the spandrels, ceiling holes and sacrificed bodies of our first section. The divaricatepattern is a fundamental architectural constraint. Occasionally, since it is there, it is used to beneficial effect. But we cannot understand the pattern or its evolutionary meaning by viewing these infrequent and secondary adaptations as a reason for the pattern itself.")]

#zh(id: "S051")[#text("此前所有有关叉分结构的文献，都集中于其适应意义，而且大多数情况下找不到意义。但塞拉赫很可能正确：这个案例就像第一节的拱肩、拱顶空隙和祭品尸体。叉分模式是一项基本建筑约束。偶尔，因为它已经存在，便被利用来产生好处。但把这些罕见、次生的适应视为模式本身的原因，无法理解这种模式及其演化意义。")]

#html.p(id: "en-S052")[#text("Galton (1909, p. 257) contrasted the adaptationist programme with a focus on constraints and modes of development by citing a telling anecdote about Herbert Spencer's fingerprints:")]

#zh(id: "S052")[#text("高尔顿（1909：257）借一个关于赫伯特·斯宾塞指纹的生动轶事，把适应主义纲领与关注约束和发育方式的观点作了对照：")]

#html.p(id: "en-S053")[#text("·Much has been written, but the last word has not been said, on the rationale of these curious papillary ridges; why in one man and in one finger they form whorls and in another loops. I may mention a characteristic anecdote of Herbert Spencer in connection with this. He asked me to show him my Laboratory and to take his prints, which I did. Then I spoke of the failure to discover the origin of these patterns, and how the fingers of unborn children had been dissected to ascertain their earliest stages, and so forth. Spencer remarked that this was beginning in the wrong way; that I ought to consider the purpose the ridges had to fulfil, and to work backwards. Here, he said, it was obvious that the delicate mouths of the sudorific glands required the protection given to them by the ridges on either side of them, and therefrom he elaborated a consistent and ingenious hypothesis at great length. I replied that his arguments were beautiful and deserved to be true, but it happened that the mouths of the ducts did not run in the valleys between the crests, but along the crests of the ridges themselves.")]

#zh(id: "S053")[#text("“关于这些奇特乳突纹脊的原因，人们写过许多，却尚无定论：为什么某个人、某根手指上是旋涡，另一个却是环纹？我可以讲一个典型的斯宾塞轶事。他请我带他看实验室并采指纹，我照做了。随后，我谈到我们无法发现这些图案的起源，以及如何解剖胎儿手指以确定最早阶段等。斯宾塞说，这样起步不对；我应先考虑纹脊必须实现的目的，再倒推。他说，很明显，汗腺细小的开口，需要两旁纹脊保护，并据此长篇发挥出一个连贯巧妙的假说。我回答，他的论证很美，值得成为真实，但遗憾的是，导管开口不在纹脊之间的沟里，而在纹脊的顶上。”")]

#html.p(id: "en-S055")[#text("We feel that the potential rewards of abandoning exclusive focus on the adaptationist programme are very great indeed. We do not offer a council of despair, as adaptationists have charged; for non-adaptive does not mean nonintelligible. We welcome the richness that a pluralistic approach, so akin to Darwin's spirit, can provide. Under the adaptationist programme, the great historic themes of developmental morphology and Bauplan were largely abandoned; for if selection can break any correlation and optimize parts separately, then an organism's integration counts for little. Too often, the adaptationist programme gave us an evolutionary biology of parts and genes, but not of organisms. It assumed that all transitions could occur step by step and underrated the importance of integrated developmental blocks and pervasive constraints of history and architecture. A pluralistic view could put organisms, with all their recalcitrant, yet intelligible, complexity, back into evolutionary theory.")]

#zh(id: "S055")[#text("我们认为，放弃对适应主义纲领的独占关注，潜在收获极大。我们并非像适应主义者指责的那样鼓吹绝望，因为非适应并不等于不可理解。我们欢迎与达尔文精神相近的多元方法所带来的丰富性。在适应主义纲领下，发育形态学与基本体制等重要历史主题，几乎被放弃了：如果选择能打破任何关联，分别优化各部分，生物体的整合就无足轻重。适应主义纲领太常给我们一种有关部分和基因的演化生物学，却不是有关生物体的。它假定所有转变都能一步步发生，低估了整合的发育模块，以及历史和构造广泛约束的重要性。多元观点能够把生物体及其顽固、却可理解的复杂性，重新带回演化理论。")]

== References / 参考文献

#html.p(id: "en-R001")[#text("Baer, K. E. von 1828 Entwicklungsgeschichte der Tiere. Konigsberg: Borntrager.")]

#zh(id: "R001")[#text("Baer, K. E. von（1828），《动物发育史》。柯尼斯堡：Bornträger。")]

#html.p(id: "en-R002")[#text("Barash, D. P. 1976 Male response to apparent female adultery in the mountain bluebird: an evolutionary interpretation. Am. Nat.110,1097-1101.")]

#zh(id: "R002")[#text("Barash, D. P.（1976），《山蓝鸲雄性对雌性表面不忠的反应：演化解释》。Am. Nat. 110：1097—1101。")]

#html.p(id: "en-R003")[#text("Coon, C. S., Garn, S. M. & Birdsell, J. B. 1950 Races. Springfeld, Ohio: C. Thomas.")]

#zh(id: "R003")[#text("Coon, C. S.、Garn, S. M.与Birdsell, J. B.（1950），《种族》。俄亥俄州斯普林菲尔德：C. Thomas。")]

#html.p(id: "en-R004")[#text("Costa, R. & Bisol, P. M. 1978 Genetic variability in deep-sea organisms. Biol. Bull. 155, 125-133.")]

#zh(id: "R004")[#text("Costa, R.与Bisol, P. M.（1978），《深海生物的遗传变异性》。Biol. Bull. 155：125—133。")]

#html.p(id: "en-R005")[#text("Darwin, C. 1872 The origin of species. London: John Murray.")]

#zh(id: "R005")[#text("Darwin, C.（1872），《物种起源》。伦敦：John Murray。")]

#html.p(id: "en-R006")[#text("Darwin, C. 1880 Sir Wyville Thomson and natural selection. Nature, Lond. 23, 32.")]

#zh(id: "R006")[#text("Darwin, C.（1880），《威维尔·汤姆森爵士与自然选择》。Nature, Lond. 23：32。")]

#html.p(id: "en-R007")[#text("Davitashvili, L. S. 1961 Teoriya polovogo otbora [Theory of sexual selection]. Moscow: Akademii Nauk.")]

#zh(id: "R007")[#text("Davitashvili, L. S.（1961），《性选择理论》。莫斯科：科学院。")]

#html.p(id: "en-R008")[#text("Falconer, D. S. 1973 Replicated selection for body weight in mice. Genet. Res. 22, 291-321.")]

#zh(id: "R008")[#text("Falconer, D. S.（1973），《小鼠体重的重复选择实验》。Genet. Res. 22：291—321。")]

#html.p(id: "en-R009")[#text("Galton, F. 1909 Memories of my life. London: Methuen.")]

#zh(id: "R009")[#text("Galton, F.（1909），《我的生活回忆》。伦敦：Methuen。")]

#html.p(id: "en-R010")[#text("Gould, S. J. 1966 Allometry and size in ontogeny and phylogeny. Biol. Rev. 41,587-640.")]

#zh(id: "R010")[#text("Gould, S. J.（1966），《个体发育和系统发育中的异速生长与大小》。Biol. Rev. 41：587—640。")]

#html.p(id: "en-R011")[#text("Gould, S. J. 1971 D'Arcy Thompson and the science of form. New Literary Hist. 2(2), 229- 258.")]

#zh(id: "R011")[#text("Gould, S. J.（1971），《达西·汤普森与形态科学》。New Literary Hist. 2（2）：229—258。")]

#html.p(id: "en-R012")[#text("Gould, S. J. 1974 Allometry in primates, with emphasis on scaling and the evolution of the brain. In Approaches to primate paleobiology. Contrib. Primatol. 5, 244-292.")]

#zh(id: "R012")[#text("Gould, S. J.（1974），《灵长类的异速生长：重点讨论标度与脑的演化》，载《灵长类古生物学方法》。Contrib. Primatol. 5：244—292。")]

#html.p(id: "en-R013")[#text("Gould, S. J. 1977 Ontogeny and phylogeny. Cambridge, Mass.: Belknap Press.")]

#zh(id: "R013")[#text("Gould, S. J.（1977），《个体发育与系统发育》。马萨诸塞州剑桥：Belknap Press。")]

#html.p(id: "en-R014")[#text("Gould, S. J. 1978 Sociobiology: the art of storytelling. New Scient. 80, 530-533.")]

#zh(id: "R014")[#text("Gould, S. J.（1978），《社会生物学：讲故事的艺术》。New Scient. 80：530—533。")]

#html.p(id: "en-R015")[#text("Grasse, P.-P. 1977 Evolution of living organisms. New York: Academic Press.")]

#zh(id: "R015")[#text("Grassé, P.-P.（1977），《生命体的演化》。纽约：Academic Press。")]

#html.p(id: "en-R016")[#text("Gregory, W. K. 1936 Habitus factors in the skeleton of fossil and recent mammals. Proc. Am. phil. Soc.76,429-444.")]

#zh(id: "R016")[#text("Gregory, W. K.（1936），《化石与现生哺乳动物骨骼中的适应形态因素》。Proc. Am. phil. Soc. 76：429—444。")]

#html.p(id: "en-R017")[#text("Harner, M. 1977 The ecological basis for Aztec sacrifice. Am. Ethnologist 4, 117-135.")]

#zh(id: "R017")[#text("Harner, M.（1977），《阿兹特克人祭的生态基础》。Am. Ethnologist 4：117—135。")]

#html.p(id: "en-R018")[#text("Jerison, H. J. 1973 Evolution of the brain and intelligence. New York: Academic Press.")]

#zh(id: "R018")[#text("Jerison, H. J.（1973），《脑与智力的演化》。纽约：Academic Press。")]

#html.p(id: "en-R019")[#text("Lande, R. 1976 Natural selection and random genetic drift in phenotypic evolution. Evolution 30,314-334.")]

#zh(id: "R019")[#text("Lande, R.（1976），《表型演化中的自然选择与随机遗传漂变》。Evolution 30：314—334。")]

#html.p(id: "en-R020")[#text("Lande, R. 1978 Evolutionary mechanisms of limb loss in tetrapods. Evolution 32, 73-92.")]

#zh(id: "R020")[#text("Lande, R.（1978），《四足动物肢体丧失的演化机制》。Evolution 32：73—92。")]

#html.p(id: "en-R021")[#text("Lewontin, R. C. 1978 Adaptation. Scient. Am.239 (3), 156-169.")]

#zh(id: "R021")[#text("Lewontin, R. C.（1978），《适应》。Scient. Am. 239（3）：156—169。")]

#html.p(id: "en-R022")[#text("Lewontin, R. C. 1979 Sociobiology as an adaptationist program. Behav. Sci. (In the press.)")]

#zh(id: "R022")[#text("Lewontin, R. C.（1979），《作为适应主义纲领的社会生物学》。Behav. Sci.，待刊。")]

#html.p(id: "en-R023")[#text("Morton, E. S., Geitgey, M. S. & McGrath, S. 1978 On bluebird 'responses to apparent female adultery'. Am. Nat.112, 968-971.")]

#zh(id: "R023")[#text("Morton, E. S.、Geitgey, M. S.与McGrath, S.（1978），《论蓝鸲“对雌性表面不忠的反应”》。Am. Nat. 112：968—971。")]

#html.p(id: "en-R024")[#text("Ortiz de Montellano, B. R. 1978 Aztec cannibalism: an ecological necessity? Science N. Y. 200,611-617.")]

#zh(id: "R024")[#text("Ortiz de Montellano, B. R.（1978），《阿兹特克食人习俗：生态上的必需吗？》。Science, N.Y. 200：611—617。")]

#html.p(id: "en-R025")[#text("Remane, A.1971 Die Grundlagen des natürlichen Systems der vergleichenden Anatomie und der Phylogenetik. Konigstein-Taunus: Koeltz.")]

#zh(id: "R025")[#text("Remane, A.（1971），《自然系统、比较解剖学与系统发育学的基础》。柯尼希施泰因—陶努斯：Koeltz。")]

#html.p(id: "en-R026")[#text("Rensch, B. 1959 Evolution above the species level. New York: Columbia University Press.")]

#zh(id: "R026")[#text("Rensch, B.（1959），《物种层次以上的演化》。纽约：Columbia University Press。")]

#html.p(id: "en-R027")[#text("Riedl, R. 1975 Die Ordnung des Lebendigen. Hamburg: Paul Parey.")]

#zh(id: "R027")[#text("Riedl, R.（1975），《生命的秩序》。汉堡：Paul Parey。")]

#html.p(id: "en-R028")[#text("Riedl, R. 1977 A systems-analytical approach to macro-evolutionary phenomena. Q. Rev. Biol.52,351-370.")]

#zh(id: "R028")[#text("Riedl, R.（1977），《宏观演化现象的系统分析方法》。Q. Rev. Biol. 52：351—370。")]

#html.p(id: "en-R029")[#text("Romanes, G. J. 1900 The Darwinism of Darwin and of the post-Darwinian schools. In Darwin, and after Darwin, vol.2, new edn. London: Longmans, Green & Co.")]

#zh(id: "R029")[#text("Romanes, G. J.（1900），《达尔文的达尔文主义与后达尔文学派》，载《达尔文及其后》，第2卷，新版。伦敦：Longmans, Green & Co.。")]

#html.p(id: "en-R030")[#text("Rudwick, M. J. S.1964 The function of zig-zag deflections in the commissures of fossil brachiopods. Palaeontology7,135-171.")]

#zh(id: "R030")[#text("Rudwick, M. J. S.（1964），《化石腕足动物壳缝锯齿状偏转的功能》。Palaeontology 7：135—171。")]

#html.p(id: "en-R031")[#text("Sahlins, M. 1978 Culture as protein and profit. New York review of books, 23 Nov., pp. 45-53.")]

#zh(id: "R031")[#text("Sahlins, M.（1978），《作为蛋白质与利润的文化》。New York Review of Books，11月23日：45—53。")]

#html.p(id: "en-R032")[#text("Schindewolf, O. H.1950 Grundfragen der Palaontologie. Stuttgart: Schweizerbart.")]

#zh(id: "R032")[#text("Schindewolf, O. H.（1950），《古生物学的基本问题》。斯图加特：Schweizerbart。")]

#html.p(id: "en-R033")[#text("Seilacher, A.1970 Arbeitskonzept zur Konstruktionsmorphologie. Lethaia 3,393-396.")]

#zh(id: "R033")[#text("Seilacher, A.（1970），《构造形态学的工作概念》。Lethaia 3：393—396。")]

#html.p(id: "en-R034")[#text("Seilacher, A. 1972 Divaricate patterns in pelecypod shells. Lethaia 5, 325-343.")]

#zh(id: "R034")[#text("Seilacher, A.（1972），《双壳类贝壳中的叉分纹样》。Lethaia 5：325—343。")]

#html.p(id: "en-R035")[#text("Shea, B. T. 1977 Eskimo craniofacial morphology, cold stress and the maxillary sinus. Am. J. phys. Anthrop.47,289-300.")]

#zh(id: "R035")[#text("Shea, B. T.（1977），《爱斯基摩人的颅面形态、寒冷应激与上颌窦》。Am. J. phys. Anthrop. 47：289—300。")]

#html.p(id: "en-R036")[#text("Stanley, S. M. 1970 Relation of shell form to life habits in the Bivalvia (Mollusca). Mem. geol. Soc. Am. no.125, 296 pp.")]

#zh(id: "R036")[#text("Stanley, S. M.（1970），《双壳类软体动物壳形与生活习性的关系》。Mem. geol. Soc. Am.，第125号，296页。")]

#html.p(id: "en-R037")[#text("Sweeney, B. W. & Vannote, R. L. 1978 Size variation and the distribution of hemimetabolous aquatic insects: two thermal equilibrium hypotheses. Science, N. Y. 200,444-446.")]

#zh(id: "R037")[#text("Sweeney, B. W.与Vannote, R. L.（1978），《不完全变态水生昆虫的大小变异与分布：两个热平衡假说》。Science, N.Y. 200：444—446。")]

#html.p(id: "en-R038")[#text("Thompson, D. W. 1942 Growth and form. New York: Macmillan.")]

#zh(id: "R038")[#text("Thompson, D. W.（1942），《生长与形态》。纽约：Macmillan。")]

#html.p(id: "en-R039")[#text("Waddington, C. H. & Cowe, J. R. 1969 Computer simulation of a molluscan pigmentation pattern. J. theor. Biol.25,219-225.")]

#zh(id: "R039")[#text("Waddington, C. H.与Cowe, J. R.（1969），《软体动物色素图案的计算机模拟》。J. theor. Biol. 25：219—225。")]

#html.p(id: "en-R040")[#text("Wallace, A. R. 1899 Darwinism. London: Macmillan.")]

#zh(id: "R040")[#text("Wallace, A. R.（1899），《达尔文主义》。伦敦：Macmillan。")]

#html.p(id: "en-R041")[#text("Wilson, E. O. 1978 On human nature. Cambridge, Mass.: Harvard University Press.")]

#zh(id: "R041")[#text("Wilson, E. O.（1978），《论人性》。马萨诸塞州剑桥：Harvard University Press。")]
