#import "../index.typ": template, tufted
#import "@preview/lilaq:0.6.0" as lq
// 如需生成 RSS feed，必须填写 title、description 和 date 元数据
#show: template.with(
  title: "Beyond Genetic Diversity",
  description: "对于论文和目前的育种工作的一些设想。",
  date: datetime(year: 2026, month: 10, day: 3),
  lang: "zh",
)


= Beyond Genetic Diversity: Preserving Future Options in Breeding

#zh(id: "S001")[ #text(_"If we use, to achieve our purposes, a mechanical agency with whose operation we cannot efficiently interfere once we have started it, because the action is so fast and irrevocable that we have not the data to intervene before the action is complete, then we had better be quite sure that the purpose put into the machine is the purpose which we really desire and not merely a colorful imitation of it."   ― Norbert Wiener_)]

在了解育种模型后，我产生了一定的思考，现在的模型都在越来越追求精准，甚至盲目地上神经网络类似“军备竞赛”，这样真的会对育种产生帮助吗？所以我产生了一个疑问：

*“追求短期的精准，是否会损失育种的长期收益？”*

*“如果育种模型越来越准确地把资源集中到它认为最好的材料上，这一定对长期育种有利吗？”*


#tufted.margin-note(
  image("imgs/plant.png"),)

育种是一个系统的过程，而模型只是作为其中一个预测器的组件。传统的机器学习模型在现实世界中进行采样，如果模型出现偏差，可以再次从现实中进行采样。但是育种的特殊之处在于，这是一个_dual control_的过程,预测模型既从现实世界中获取信息，也指导人们改造现实世界。

这就会导致一个结果：*是否我们无法发现模型的错误或偏差，仅仅只是因为在模型的指导下我们把证明材料删除了？*，而这种删除是否会导致模型出现不可见的偏差并逐渐累积？

为此我们设计了一些实验，以回答几个问题：

- 随着选择对当前目标变得越来越准确，未来的遗传选择空间会发生什么？
- 一个遗传选项能否仍然在遗传上存在，却系统性地从观测中消失？
- 观测范围的收窄是否先于遗传损失发生？传统多样性指标能否揭示这两个过程？
- 如果育种必须淘汰材料，能否比随机探索更高效地保留未来选择空间？
- 如果把此前被低度代表的材料重新送回表型测定，模型能否恢复之前没有学到的信息？

== 结果

=== 1.对当前目标越准确的选择，会让未来可利用的遗传选项越来越少
短期遗传增益会提高，但长期可保留的未来遗传可能性会下降，而且即使使用完全知道当前真实遗传价值的“理想排序”，这种现象仍然存在。

=== 2.遗传上仍然存在的材料，可以在观测上被系统性忽略
即使候选群体本身完全相同，不同选择策略也会让某些遗传选项更少进入表型测定和训练数据，因此“还存在”和“能被看到”并不是一回事。

=== 3.观测范围的收窄发生在遗传选项真正丢失之前，而且传统遗传多样性指标不一定能发现这个过程
在遗传选项还几乎都存在的时候，模型导向的选择已经开始减少对某些材料的观测；随后经过多轮选择，这些遗传选项才进一步真正消失。

=== 4.有针对性地保留当前选择中代表不足的材料，比随机保留更高效
如果必须淘汰大部分材料，那么优先保留那些在当前已选材料中缺乏代表性的基因型，可以在付出相近短期收益代价的情况下，保留更多未来遗传可能性。

=== 5.只要遗传材料还没有真正消失，把被忽略的材料重新送回表型测定，就有可能让模型重新学到之前没有学到的信息
重新扩大观测范围后，模型对隐藏遗传效应的识别可以恢复，预测误差也会下降；但模型学会了这些信息，并不代表当前育种目标就会主动选择这些材料

把_Breeding optionality_和_Genetic diversity_拆开还是很麻烦的，因为我们观察到两个指标的趋势是同方向运动，可以认为两个指标是一定程度上相互交织的，但是数值又有差异，因为我们认为在Genetic diversity背后还隐藏着一个机制。

#figure(image("imgs/fig0.png"), caption: [相互交织的两个机制])
