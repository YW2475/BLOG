#import "../index.typ": template, tufted
#import "../../_essay/bilingual.typ": zh, zh-caption

// Blog/article metadata. This follows the structure of the provided template.
#show: template.with(
  title: "Attention Is All You Need",
  description: "Transformer 原论文的逐段中英对照：自注意力、编码器与解码器、训练及机器翻译实验。",
  author: "Ashish Vaswani, Noam Shazeer, Niki Parmar, Jakob Uszkoreit, Llion Jones, Aidan N. Gomez, Łukasz Kaiser, Illia Polosukhin",
  extra-info: "NeurIPS 2017 · 中英逐段对照",
  date: datetime(year: 2017, month: 12, day: 4),
  lang: "en",
  css: ("/assets/custom.css", "/assets/essay.css", "/Essay/Attention is All you Need 2017/assets/article.css"),
)

= Attention Is All You Need / 注意力就是你所需要的

*Abstract:* The dominant sequence transduction models are based on complex recurrent or convolutional neural networks that include an encoder and a decoder. The best performing models also connect the encoder and decoder through an attention mechanism. We propose a new simple network architecture, the Transformer, based solely on attention mechanisms, dispensing with recurrence and convolutions entirely. Experiments on two machine translation tasks show these models to be superior in quality while being more parallelizable and requiring significantly less time to train. Our model achieves 28.4 BLEU on the WMT 2014 English-to-German translation task, improving over the existing best results, including ensembles, by over 2 BLEU. On the WMT 2014 English-to-French translation task, our model establishes a new single-model state-of-the-art BLEU score of 41.0 after training for 3.5 days on eight GPUs, a small fraction of the training costs of the best models from the literature.

#zh(id: "S001")[*摘要：* 主流的序列转换模型依赖包含编码器和解码器的复杂循环神经网络或卷积神经网络。表现最好的模型还通过注意力机制连接编码器与解码器。我们提出一种新的简单网络架构 Transformer，它完全基于注意力机制，彻底去除了循环和卷积。在两项机器翻译任务上的实验表明，这些模型在质量上更优，同时更易于并行化，训练所需时间也显著减少。在 WMT 2014 英语到德语翻译任务上，我们的模型达到 28.4 BLEU，比此前包括集成模型在内的最佳结果提高了超过 2 BLEU。在 WMT 2014 英语到法语翻译任务上，模型在八块 GPU 上训练 3.5 天后达到 41.0 BLEU，刷新了单模型的最佳水平，训练成本仅为已有最佳模型的一小部分。]

= Introduction / 引言

Recurrent neural networks, long short-term memory @ref12 and gated recurrent @ref07 neural networks in particular, have been firmly established as state of the art approaches in sequence modeling and transduction problems such as language modeling and machine translation @ref29 @ref02 @ref05. Numerous efforts have since continued to push the boundaries of recurrent language models and encoder-decoder architectures @ref31 @ref21 @ref13.

#zh(id: "S002")[循环神经网络，尤其是长短期记忆网络 @ref12 和门控循环神经网络 @ref07，已经成为语言建模、机器翻译等序列建模与序列转换问题中的先进方法 @ref29 @ref02 @ref05。此后，大量研究持续推动循环语言模型和编码器—解码器架构的发展 @ref31 @ref21 @ref13。]

Recurrent models typically factor computation along the symbol positions of the input and output sequences. Aligning the positions to steps in computation time, they generate a sequence of hidden states $h_t$, as a function of the previous hidden state $h_(t-1)$ and the input for position $t$. This inherently sequential nature precludes parallelization within training examples, which becomes critical at longer sequence lengths, as memory constraints limit batching across examples. Recent work has achieved significant improvements in computational efficiency through factorization tricks @ref18 and conditional computation @ref26, while also improving model performance in case of the latter. The fundamental constraint of sequential computation, however, remains.

#zh(id: "S003")[循环模型通常沿输入和输出序列的符号位置分解计算。它们将位置与计算时间步对应起来，根据上一隐藏状态 $h_(t-1)$ 和位置 $t$ 的输入生成隐藏状态序列 $h_t$。这种固有的顺序性使单个训练样本内部无法并行计算；当序列较长时，这一问题尤为突出，因为内存限制了跨样本批处理的规模。近期研究借助分解技巧 @ref18 和条件计算 @ref26 显著提高了计算效率，后者还改善了模型性能。然而，顺序计算这一根本约束仍然存在。]

Attention mechanisms have become an integral part of compelling sequence modeling and transduction models in various tasks, allowing modeling of dependencies without regard to their distance in the input or output sequences @ref02 @ref16. In all but a few cases @ref22, however, such attention mechanisms are used in conjunction with a recurrent network.

#zh(id: "S004")[注意力机制已成为多种任务中表现出色的序列建模与转换模型的重要组成部分，使模型能够建立依赖关系，而不受相关位置在输入或输出序列中距离的限制 @ref02 @ref16。不过，除少数情况 @ref22 外，这些注意力机制都与循环网络结合使用。]

In this work we propose the Transformer, a model architecture eschewing recurrence and instead relying entirely on an attention mechanism to draw global dependencies between input and output. The Transformer allows for significantly more parallelization and can reach a new state of the art in translation quality after being trained for as little as twelve hours on eight P100 GPUs.

#zh(id: "S005")[本文提出 Transformer：一种不使用循环结构、完全依靠注意力机制建立输入和输出之间全局依赖关系的模型架构。Transformer 能够实现显著更多的并行计算，只需在八块 P100 GPU 上训练十二小时，就能达到新的先进翻译水平。]

#html.div(class: "essay-paper-info")[
31st Conference on Neural Information Processing Systems (NIPS 2017), Long Beach, CA, USA.
#zh-caption[第 31 届神经信息处理系统大会（NIPS 2017），美国加利福尼亚州长滩。]
#link("https://arxiv.org/abs/1706.03762")[论文来源 / Source]
]

= Background / 背景

The goal of reducing sequential computation also forms the foundation of the Extended Neural GPU @ref20, ByteNet @ref15 and ConvS2S @ref08, all of which use convolutional neural networks as basic building block, computing hidden representations in parallel for all input and output positions. In these models, the number of operations required to relate signals from two arbitrary input or output positions grows in the distance between positions, linearly for ConvS2S and logarithmically for ByteNet. This makes it more difficult to learn dependencies between distant positions @ref11. In the Transformer this is reduced to a constant number of operations, albeit at the cost of reduced effective resolution due to averaging attention-weighted positions, an effect we counteract with Multi-Head Attention as described in section 3.2.

#zh(id: "S006")[减少顺序计算也是 Extended Neural GPU @ref20、ByteNet @ref15 和 ConvS2S @ref08 的核心目标。它们都以卷积神经网络为基本构件，并行计算所有输入和输出位置的隐藏表示。在这些模型中，关联任意两个输入或输出位置的信号所需的操作次数随位置间距离增加：ConvS2S 呈线性增长，ByteNet 呈对数增长。这使远距离位置之间的依赖关系更难学习 @ref11。在 Transformer 中，所需操作次数降为常数，但对注意力加权位置取平均会降低有效分辨率；我们通过第 3.2 节介绍的多头注意力来抵消这一影响。]

Self-attention, sometimes called intra-attention, is an attention mechanism relating different positions of a single sequence in order to compute a representation of the sequence. Self-attention has been used successfully in a variety of tasks including reading comprehension, abstractive summarization, textual entailment and learning task-independent sentence representations @ref04 @ref22 @ref23 @ref19.

#zh(id: "S007")[自注意力有时也称为序列内注意力，是一种通过关联同一序列中的不同位置来计算序列表示的注意力机制。自注意力已经成功应用于阅读理解、生成式摘要、文本蕴含以及与具体任务无关的句子表示学习等多种任务 @ref04 @ref22 @ref23 @ref19。]

End-to-end memory networks are based on a recurrent attention mechanism instead of sequence-aligned recurrence and have been shown to perform well on simple-language question answering and language modeling tasks @ref28.

#zh(id: "S008")[端到端记忆网络采用循环注意力机制，而非与序列位置对齐的循环结构，并且已在简单语言问答和语言建模任务中取得良好表现 @ref28。]

To the best of our knowledge, however, the Transformer is the first transduction model relying entirely on self-attention to compute representations of its input and output without using sequence-aligned RNNs or convolution. In the following sections, we will describe the Transformer, motivate self-attention and discuss its advantages over models such as @ref14 @ref15 and @ref08.

#zh(id: "S009")[然而，据我们所知，Transformer 是第一个完全依赖自注意力来计算输入与输出表示、且不使用与序列对齐的循环神经网络（RNN）或卷积的序列转换模型。接下来的各节将介绍 Transformer，说明使用自注意力的动机，并讨论它相对于 @ref14、@ref15 和 @ref08 等模型的优势。]

= Model Architecture / 模型架构

Most competitive neural sequence transduction models have an encoder-decoder structure @ref05 @ref02 @ref29. Here, the encoder maps an input sequence of symbol representations $(x_1, ..., x_n)$ to a sequence of continuous representations $z = (z_1, ..., z_n)$. Given $z$, the decoder then generates an output sequence $(y_1, ..., y_m)$ of symbols one element at a time. At each step the model is auto-regressive @ref09, consuming the previously generated symbols as additional input when generating the next.

#zh(id: "S010")[大多数有竞争力的神经序列转换模型采用编码器—解码器结构 @ref05 @ref02 @ref29。编码器将符号表示的输入序列 $(x_1, ..., x_n)$ 映射为连续表示序列 $z = (z_1, ..., z_n)$。给定 $z$ 后，解码器逐个生成输出符号，得到序列 $(y_1, ..., y_m)$。模型在每一步都采用自回归方式 @ref09：生成下一个符号时，将此前已生成的符号作为附加输入。]

The Transformer follows this overall architecture using stacked self-attention and point-wise, fully connected layers for both the encoder and decoder, shown in the left and right halves of Figure 1, respectively.

#zh(id: "S011")[Transformer 沿用这一总体架构，在编码器和解码器中都使用堆叠的自注意力层与逐位置全连接层，分别如图 1 的左半部分和右半部分所示。]

#figure(
  image("assets/figure1-transformer.png", width: 66%),
  caption: [The Transformer - model architecture. #zh-caption[Transformer 模型架构。]],
) <fig-transformer>

== Encoder and Decoder Stacks / 编码器与解码器堆叠

*Encoder:* The encoder is composed of a stack of $N = 6$ identical layers. Each layer has two sub-layers. The first is a multi-head self-attention mechanism, and the second is a simple, position-wise fully connected feed-forward network. We employ a residual connection @ref10 around each of the two sub-layers, followed by layer normalization @ref01. That is, the output of each sub-layer is

#zh(id: "S012")[*编码器：* 编码器由 $N = 6$ 个相同的层堆叠而成。每层包含两个子层：第一个是多头自注意力机制，第二个是简单的逐位置全连接前馈网络。我们在两个子层周围分别使用残差连接 @ref10，之后执行层归一化 @ref01。也就是说，每个子层的输出为：]

$ "LayerNorm"(x + "Sublayer"(x)), $

where $"Sublayer"(x)$ is the function implemented by the sub-layer itself. To facilitate these residual connections, all sub-layers in the model, as well as the embedding layers, produce outputs of dimension $d_"model" = 512$.

#zh(id: "S013")[其中，$"Sublayer"(x)$ 是子层自身实现的函数。为便于使用这些残差连接，模型中的所有子层以及嵌入层都输出维度为 $d_"model" = 512$ 的表示。]

*Decoder:* The decoder is also composed of a stack of $N = 6$ identical layers. In addition to the two sub-layers in each encoder layer, the decoder inserts a third sub-layer, which performs multi-head attention over the output of the encoder stack. Similar to the encoder, we employ residual connections around each of the sub-layers, followed by layer normalization. We also modify the self-attention sub-layer in the decoder stack to prevent positions from attending to subsequent positions. This masking, combined with fact that the output embeddings are offset by one position, ensures that the predictions for position $i$ can depend only on the known outputs at positions less than $i$.

#zh(id: "S014")[*解码器：* 解码器同样由 $N = 6$ 个相同的层堆叠而成。除了编码器每层中的两个子层外，解码器还加入第三个子层，对编码器堆叠的输出执行多头注意力。与编码器类似，每个子层周围都有残差连接，之后进行层归一化。我们还修改了解码器堆叠中的自注意力子层，防止当前位置关注后续位置。这种掩码机制与输出嵌入错开一个位置的处理相结合，确保位置 $i$ 的预测只能依赖位置小于 $i$ 的已知输出。]

== Attention / 注意力

An attention function can be described as mapping a query and a set of key-value pairs to an output, where the query, keys, values, and output are all vectors. The output is computed as a weighted sum of the values, where the weight assigned to each value is computed by a compatibility function of the query with the corresponding key.

#zh(id: "S015")[注意力函数可以描述为将一个查询和一组键值对映射为输出，其中查询、键、值和输出均为向量。输出是各个值的加权和，每个值的权重由查询与相应键之间的相容性函数计算得到。]

=== Scaled Dot-Product Attention / 缩放点积注意力

We call our particular attention “Scaled Dot-Product Attention” (Figure 2). The input consists of queries and keys of dimension $d_k$, and values of dimension $d_v$. We compute the dot products of the query with all keys, divide each by $sqrt(d_k)$, and apply a softmax function to obtain the weights on the values.

#zh(id: "S016")[我们将所使用的注意力称为“缩放点积注意力”（图 2）。输入包含维度为 $d_k$ 的查询与键，以及维度为 $d_v$ 的值。我们计算查询与所有键的点积，将每个点积除以 $sqrt(d_k)$，再应用 softmax 函数，得到各个值的权重。]

In practice, we compute the attention function on a set of queries simultaneously, packed together into a matrix $Q$. The keys and values are also packed together into matrices $K$ and $V$. We compute the matrix of outputs as:

#zh(id: "S017")[实际计算时，我们同时对一组查询计算注意力，并将这些查询组合成矩阵 $Q$。键和值也分别组合成矩阵 $K$ 和 $V$。输出矩阵计算如下：]

$ "Attention"(Q, K, V) = "softmax"((Q K^T) / sqrt(d_k)) V $ <eq-attention>

The two most commonly used attention functions are additive attention @ref02, and dot-product (multiplicative) attention. Dot-product attention is identical to our algorithm, except for the scaling factor of $1 / sqrt(d_k)$. Additive attention computes the compatibility function using a feed-forward network with a single hidden layer. While the two are similar in theoretical complexity, dot-product attention is much faster and more space-efficient in practice, since it can be implemented using highly optimized matrix multiplication code.

#zh(id: "S018")[最常用的两种注意力函数是加性注意力 @ref02 和点积（乘性）注意力。点积注意力与我们的算法相同，只是没有 $1 / sqrt(d_k)$ 这一缩放因子。加性注意力通过只有一个隐藏层的前馈网络计算相容性函数。两者的理论复杂度相近，但点积注意力在实际运行中更快、更节省空间，因为它可以通过高度优化的矩阵乘法代码实现。]

While for small values of $d_k$ the two mechanisms perform similarly, additive attention outperforms dot product attention without scaling for larger values of $d_k$ @ref03. We suspect that for large values of $d_k$, the dot products grow large in magnitude, pushing the softmax function into regions where it has extremely small gradients. To counteract this effect, we scale the dot products by $1 / sqrt(d_k)$.

#zh(id: "S019")[当 $d_k$ 较小时，两种机制的表现相近；但当 $d_k$ 较大时，加性注意力优于未经缩放的点积注意力 @ref03。我们推测，较大的 $d_k$ 会使点积的数值幅度增大，将 softmax 推入梯度极小的区域。为抵消这一影响，我们用 $1 / sqrt(d_k)$ 对点积进行缩放。]

#figure(
  grid(
    columns: (1fr, 1.55fr),
    gutter: 18pt,
    align: center,
    image("assets/figure2-scaled-dot-product.png", width: 80%),
    image("assets/figure2-multi-head.png", width: 90%),
  ),
  caption: [(left) Scaled Dot-Product Attention. (right) Multi-Head Attention consists of several attention layers running in parallel. #zh-caption[左：缩放点积注意力。右：多头注意力由多个并行运行的注意力层组成。]],
) <fig-attention>

#footnote[To illustrate why the dot products get large, assume that the components of $q$ and $k$ are independent random variables with mean 0 and variance 1. Then their dot product, $q dot k = sum_(i=1)^(d_k) q_i k_i$, has mean 0 and variance $d_k$. #zh-caption[为说明点积为何变大，假设 $q$ 与 $k$ 的各分量都是均值为 0、方差为 1 的独立随机变量，则它们的点积 $q dot k = sum_(i=1)^(d_k) q_i k_i$ 的均值为 0、方差为 $d_k$。]]

=== Multi-Head Attention / 多头注意力

Instead of performing a single attention function with $d_"model"$-dimensional keys, values and queries, we found it beneficial to linearly project the queries, keys and values $h$ times with different, learned linear projections to $d_k$, $d_k$ and $d_v$ dimensions, respectively. On each of these projected versions of queries, keys and values we then perform the attention function in parallel, yielding $d_v$-dimensional output values. These are concatenated and once again projected, resulting in the final values, as depicted in Figure 2.

#zh(id: "S020")[我们发现，相比仅对维度为 $d_"model"$ 的键、值和查询执行一次注意力计算，使用不同的可学习线性投影，将查询、键和值分别投影 $h$ 次到 $d_k$、$d_k$ 和 $d_v$ 维空间更有益。然后对每组投影后的查询、键和值并行执行注意力计算，得到 $d_v$ 维输出。这些输出被拼接后再次投影，形成图 2 所示的最终输出。]

Multi-head attention allows the model to jointly attend to information from different representation subspaces at different positions. With a single attention head, averaging inhibits this.

#zh(id: "S021")[多头注意力使模型能够同时关注不同位置、不同表示子空间中的信息。而使用单个注意力头时，平均操作会限制这一能力。]

$ "MultiHead"(Q, K, V) = "Concat"("head"_1, ..., "head"_h) W^O $

$ "where" thin "head"_i = "Attention"(Q W_i^Q, K W_i^K, V W_i^V) $

where the projections are parameter matrices

#zh(id: "S022")[其中，各个投影由以下参数矩阵表示：]

$ W_i^Q in RR^(d_"model" times d_k), quad W_i^K in RR^(d_"model" times d_k), quad W_i^V in RR^(d_"model" times d_v) $

and

#zh(id: "S023")[以及：]

$ W^O in RR^(h d_v times d_"model"). $

In this work we employ $h = 8$ parallel attention layers, or heads. For each of these we use $d_k = d_v = d_"model" / h = 64$. Due to the reduced dimension of each head, the total computational cost is similar to that of single-head attention with full dimensionality.

#zh(id: "S024")[本文使用 $h = 8$ 个并行的注意力层，即注意力头。对每个注意力头，都有 $d_k = d_v = d_"model" / h = 64$。由于每个头的维度较低，总计算成本与使用完整维度的单头注意力相近。]

=== Applications of Attention in our Model / 注意力在模型中的应用

The Transformer uses multi-head attention in three different ways:

#zh(id: "S025")[Transformer 以三种方式使用多头注意力：]

- In “encoder-decoder attention” layers, the queries come from the previous decoder layer, and the memory keys and values come from the output of the encoder. This allows every position in the decoder to attend over all positions in the input sequence. This mimics the typical encoder-decoder attention mechanisms in sequence-to-sequence models such as @ref31 @ref02 @ref08.

  #zh(id: "S026")[在“编码器—解码器注意力”层中，查询来自解码器的前一层，作为记忆的键和值来自编码器的输出。这使解码器中的每个位置都能关注输入序列中的所有位置。这种方式对应于 @ref31、@ref02 和 @ref08 等序列到序列模型中常见的编码器—解码器注意力机制。]
- The encoder contains self-attention layers. In a self-attention layer all of the keys, values and queries come from the same place, in this case, the output of the previous layer in the encoder. Each position in the encoder can attend to all positions in the previous layer of the encoder.

  #zh(id: "S027")[编码器包含自注意力层。在自注意力层中，所有键、值和查询都来自同一处，即编码器中的前一层输出。编码器中的每个位置都可以关注前一层的所有位置。]
- Similarly, self-attention layers in the decoder allow each position in the decoder to attend to all positions in the decoder up to and including that position. We need to prevent leftward information flow in the decoder to preserve the auto-regressive property. We implement this inside of scaled dot-product attention by masking out (setting to $-infinity$) all values in the input of the softmax which correspond to illegal connections. See Figure 2.

  #zh(id: "S028")[类似地，解码器中的自注意力层使每个位置能够关注解码器中不晚于当前位置的所有位置。为了保持自回归性质，必须防止信息向左传播。我们在缩放点积注意力内部实现这一点：在 softmax 的输入中，对所有对应非法连接的值施加掩码，将它们设为 $-infinity$。见图 2。]

== Position-wise Feed-Forward Networks / 逐位置前馈网络

In addition to attention sub-layers, each of the layers in our encoder and decoder contains a fully connected feed-forward network, which is applied to each position separately and identically. This consists of two linear transformations with a ReLU activation in between.

#zh(id: "S029")[除了注意力子层，编码器和解码器的每一层还包含一个全连接前馈网络。该网络在各个位置分别应用，且使用相同的变换。它由两个线性变换组成，中间使用 ReLU 激活函数。]

$ "FFN"(x) = max(0, x W_1 + b_1) W_2 + b_2 $ <eq-ffn>

While the linear transformations are the same across different positions, they use different parameters from layer to layer. Another way of describing this is as two convolutions with kernel size 1.

#zh(id: "S030")[虽然不同位置使用相同的线性变换，但不同层使用不同的参数。另一种理解方式是：它相当于两个卷积核大小为 1 的卷积。]

The dimensionality of input and output is $d_"model" = 512$, and the inner-layer has dimensionality $d_"ff" = 2048$.

#zh(id: "S031")[输入和输出的维度为 $d_"model" = 512$，中间层的维度为 $d_"ff" = 2048$。]

== Embeddings and Softmax / 嵌入与 Softmax

Similarly to other sequence transduction models, we use learned embeddings to convert the input tokens and output tokens to vectors of dimension $d_"model"$. We also use the usual learned linear transformation and softmax function to convert the decoder output to predicted next-token probabilities. In our model, we share the same weight matrix between the two embedding layers and the pre-softmax linear transformation, similar to @ref24. In the embedding layers, we multiply those weights by $sqrt(d_"model")$.

#zh(id: "S032")[与其他序列转换模型类似，我们使用可学习的嵌入，将输入和输出词元转换为 $d_"model"$ 维向量。我们也使用常见的可学习线性变换和 softmax 函数，将解码器输出转换为下一词元的预测概率。与 @ref24 类似，我们让两个嵌入层及 softmax 前的线性变换共享同一个权重矩阵。在嵌入层中，我们将这些权重乘以 $sqrt(d_"model")$。]

== Positional Encoding / 位置编码

Since our model contains no recurrence and no convolution, in order for the model to make use of the order of the sequence, we must inject some information about the relative or absolute position of the tokens in the sequence. To this end, we add “positional encodings” to the input embeddings at the bottoms of the encoder and decoder stacks. The positional encodings have the same dimension $d_"model"$ as the embeddings, so that the two can be summed. There are many choices of positional encodings, learned and fixed @ref08.

#zh(id: "S033")[由于模型不包含循环或卷积，为了让模型利用序列顺序，我们必须加入有关词元相对位置或绝对位置的信息。因此，我们在编码器和解码器堆叠的底部，将“位置编码”加到输入嵌入中。位置编码与嵌入具有相同的 $d_"model"$ 维度，因此两者可以直接相加。位置编码有许多选择，包括可学习的和固定的编码 @ref08。]


In this work, we use sine and cosine functions of different frequencies:

#zh(id: "S034")[本文使用不同频率的正弦与余弦函数：]

$ "PE"_("(pos, 2i)") = sin("pos" / 10000^(2i / d_"model")) $

$ "PE"_("(pos, 2i+1)") = cos("pos" / 10000^(2i / d_"model")) $

where $"pos"$ is the position and $i$ is the dimension. That is, each dimension of the positional encoding corresponds to a sinusoid. The wavelengths form a geometric progression from $2 pi$ to $10000 dot 2 pi$. We chose this function because we hypothesized it would allow the model to easily learn to attend by relative positions, since for any fixed offset $k$, $"PE"_("pos"+k)$ can be represented as a linear function of $"PE"_"pos"$.

#zh(id: "S035")[其中，$"pos"$ 表示位置，$i$ 表示维度。也就是说，位置编码的每个维度对应一个正弦函数。波长构成从 $2 pi$ 到 $10000 dot 2 pi$ 的等比数列。我们选择这种函数，是因为我们认为它可以让模型容易地学会基于相对位置进行注意力计算：对于任意固定偏移 $k$，$"PE"_("pos"+k)$ 都可以表示为 $"PE"_"pos"$ 的线性函数。]

We also experimented with using learned positional embeddings @ref08 instead, and found that the two versions produced nearly identical results (see Table 3 row (E)). We chose the sinusoidal version because it may allow the model to extrapolate to sequence lengths longer than the ones encountered during training.

#zh(id: "S036")[我们还尝试了可学习的位置嵌入 @ref08，发现两种版本的结果几乎相同（见表 3 的 (E) 行）。我们选择正弦版本，是因为它可能使模型能够外推到比训练时所见序列更长的序列。]

= Why Self-Attention / 为什么使用自注意力

#figure(
  table(
    columns: (1.45fr, 1fr, 0.8fr, 1fr),
    inset: 4pt,
    stroke: (x: none, y: 0.4pt),
    table.header(
      [*Layer Type*], [*Complexity per Layer*], [*Sequential Operations*], [*Maximum Path Length*],
    ),
    [Self-Attention], [$cal(O)(n^2 dot d)$], [$cal(O)(1)$], [$cal(O)(1)$],
    [Recurrent], [$cal(O)(n dot d^2)$], [$cal(O)(n)$], [$cal(O)(n)$],
    [Convolutional], [$cal(O)(k dot n dot d^2)$], [$cal(O)(1)$], [$cal(O)(log_k(n))$],
    [Self-Attention (restricted)], [$cal(O)(r dot n dot d)$], [$cal(O)(1)$], [$cal(O)(n / r)$],
  ),
  caption: [Maximum path lengths, per-layer complexity and minimum number of sequential operations for different layer types. $n$ is the sequence length, $d$ is the representation dimension, $k$ is the kernel size of convolutions and $r$ the size of the neighborhood in restricted self-attention. #zh-caption[不同层类型的最大路径长度、每层复杂度和顺序操作的最少次数。$n$ 为序列长度，$d$ 为表示维度，$k$ 为卷积核大小，$r$ 为受限自注意力的邻域大小。]],
) <tab-complexity>


In this section we compare various aspects of self-attention layers to the recurrent and convolutional layers commonly used for mapping one variable-length sequence of symbol representations $(x_1, ..., x_n)$ to another sequence of equal length $(z_1, ..., z_n)$, with $x_i, z_i in RR^d$, such as a hidden layer in a typical sequence transduction encoder or decoder. Motivating our use of self-attention we consider three desiderata.

#zh(id: "S037")[本节从多个方面比较自注意力层与循环层、卷积层。后两者常用于将可变长度的符号表示序列 $(x_1, ..., x_n)$ 映射为等长序列 $(z_1, ..., z_n)$，其中 $x_i, z_i in RR^d$，例如典型序列转换编码器或解码器中的隐藏层。为说明使用自注意力的动机，我们考虑三个期望满足的条件。]

One is the total computational complexity per layer. Another is the amount of computation that can be parallelized, as measured by the minimum number of sequential operations required.

#zh(id: "S038")[第一个是每层的总计算复杂度。第二个是可并行计算的程度，以所需顺序操作的最少次数衡量。]

The third is the path length between long-range dependencies in the network. Learning long-range dependencies is a key challenge in many sequence transduction tasks. One key factor affecting the ability to learn such dependencies is the length of the paths forward and backward signals have to traverse in the network. The shorter these paths between any combination of positions in the input and output sequences, the easier it is to learn long-range dependencies @ref11. Hence we also compare the maximum path length between any two input and output positions in networks composed of the different layer types.

#zh(id: "S039")[第三个是网络中远距离依赖之间的路径长度。学习远距离依赖是许多序列转换任务中的关键挑战。影响这种学习能力的一个重要因素，是前向和反向信号在网络中必须经过的路径长度。输入和输出序列任意位置组合之间的路径越短，就越容易学习远距离依赖 @ref11。因此，我们也比较了由不同类型层构成的网络中，任意两个输入或输出位置之间的最大路径长度。]

As noted in Table 1, a self-attention layer connects all positions with a constant number of sequentially executed operations, whereas a recurrent layer requires $cal(O)(n)$ sequential operations. In terms of computational complexity, self-attention layers are faster than recurrent layers when the sequence length $n$ is smaller than the representation dimensionality $d$, which is most often the case with sentence representations used by state-of-the-art models in machine translations, such as word-piece @ref31 and byte-pair @ref25 representations. To improve computational performance for tasks involving very long sequences, self-attention could be restricted to considering only a neighborhood of size $r$ in the input sequence centered around the respective output position. This would increase the maximum path length to $cal(O)(n/r)$. We plan to investigate this approach further in future work.

#zh(id: "S040")[如表 1 所示，自注意力层只需常数次顺序操作即可连接所有位置，而循环层需要 $cal(O)(n)$ 次顺序操作。从计算复杂度看，当序列长度 $n$ 小于表示维度 $d$ 时，自注意力层比循环层更快。在先进机器翻译模型使用的句子表示中，这种情况最为常见，例如 word-piece @ref31 和字节对表示 @ref25。为改善涉及极长序列的任务中的计算性能，可以将自注意力限制在以相应输出位置为中心、大小为 $r$ 的输入邻域内。这会将最大路径长度增加到 $cal(O)(n/r)$。我们计划在未来研究这一方法。]

A single convolutional layer with kernel width $k < n$ does not connect all pairs of input and output positions. Doing so requires a stack of $cal(O)(n/k)$ convolutional layers in the case of contiguous kernels, or $cal(O)(log_k(n))$ in the case of dilated convolutions @ref15, increasing the length of the longest paths between any two positions in the network. Convolutional layers are generally more expensive than recurrent layers, by a factor of $k$. Separable convolutions @ref06, however, decrease the complexity considerably, to $cal(O)(k dot n dot d + n dot d^2)$. Even with $k = n$, however, the complexity of a separable convolution is equal to the combination of a self-attention layer and a point-wise feed-forward layer, the approach we take in our model.

#zh(id: "S041")[卷积核宽度为 $k < n$ 的单个卷积层不能连接所有输入和输出位置对。若使用连续卷积，需要堆叠 $cal(O)(n/k)$ 个卷积层；若使用膨胀卷积 @ref15，则需要 $cal(O)(log_k(n))$ 个卷积层，这会增加网络中任意两个位置之间最长路径的长度。卷积层的计算成本通常比循环层高 $k$ 倍。不过，可分离卷积 @ref06 能将复杂度显著降至 $cal(O)(k dot n dot d + n dot d^2)$。即使 $k = n$，可分离卷积的复杂度也与一个自注意力层和一个逐位置前馈层的组合相同，而这正是本文模型采用的方法。]

As side benefit, self-attention could yield more interpretable models. We inspect attention distributions from our models and present and discuss examples in the appendix. Not only do individual attention heads clearly learn to perform different tasks, many appear to exhibit behavior related to the syntactic and semantic structure of the sentences.

#zh(id: "S042")[自注意力还可能使模型更具可解释性。我们检查了模型中的注意力分布，并在附录中展示和讨论了示例。不仅不同注意力头明显学会了执行不同任务，而且许多头的行为似乎与句子的句法和语义结构有关。]

= Training / 训练

This section describes the training regime for our models.

#zh(id: "S043")[本节介绍模型的训练方案。]

== Training Data and Batching / 训练数据与批处理

We trained on the standard WMT 2014 English-German dataset consisting of about 4.5 million sentence pairs. Sentences were encoded using byte-pair encoding @ref03, which has a shared source-target vocabulary of about 37000 tokens. For English-French, we used the significantly larger WMT 2014 English-French dataset consisting of 36M sentences and split tokens into a 32000 word-piece vocabulary @ref31. Sentence pairs were batched together by approximate sequence length. Each training batch contained a set of sentence pairs containing approximately 25000 source tokens and 25000 target tokens.

#zh(id: "S044")[我们使用标准 WMT 2014 英语—德语数据集训练，该数据集包含约 450 万个句对。句子采用字节对编码 @ref03，源语言与目标语言共享一个约 37000 个词元的词表。对于英语—法语任务，我们使用规模大得多的 WMT 2014 英语—法语数据集，共包含 3600 万个句对，并将词元划分到一个含 32000 个 word-piece 的词表中 @ref31。句对按照大致相近的序列长度组成批次。每个训练批次约包含 25000 个源语言词元和 25000 个目标语言词元。]

== Hardware and Schedule / 硬件与训练安排

We trained our models on one machine with 8 NVIDIA P100 GPUs. For our base models using the hyperparameters described throughout the paper, each training step took about 0.4 seconds. We trained the base models for a total of 100,000 steps or 12 hours. For our big models (described on the bottom line of Table 3), step time was 1.0 seconds. The big models were trained for 300,000 steps (3.5 days).

#zh(id: "S045")[我们在一台配备 8 块 NVIDIA P100 GPU 的机器上训练模型。对于使用文中所述超参数的基础模型，每个训练步约耗时 0.4 秒。基础模型共训练 100000 步，约 12 小时。对于大模型（见表 3 最后一行），每步耗时 1.0 秒，总共训练 300000 步，约 3.5 天。]

== Optimizer / 优化器

We used the Adam optimizer @ref17 with $beta_1 = 0.9$, $beta_2 = 0.98$ and $epsilon = 10^(-9)$. We varied the learning rate over the course of training, according to the formula:

#zh(id: "S046")[我们使用 Adam 优化器 @ref17，参数为 $beta_1 = 0.9$、$beta_2 = 0.98$ 和 $epsilon = 10^(-9)$。学习率按以下公式变化：]

$ "lrate" = d_"model"^(-0.5) dot min("step_num"^(-0.5), "step_num" dot "warmup_steps"^(-1.5)) $ <eq-lrate>

This corresponds to increasing the learning rate linearly for the first $"warmup_steps"$ training steps, and decreasing it thereafter proportionally to the inverse square root of the step number. We used $"warmup_steps" = 4000$.

#zh(id: "S047")[这意味着在最初的 $"warmup_steps"$ 个训练步中线性增加学习率，之后使其与步数的平方根倒数成比例下降。我们使用 $"warmup_steps" = 4000$。]

== Regularization / 正则化

We employ three types of regularization during training:

#zh(id: "S048")[训练过程中采用三种正则化方式：]

*Residual Dropout.* We apply dropout @ref27 to the output of each sub-layer, before it is added to the sub-layer input and normalized. In addition, we apply dropout to the sums of the embeddings and the positional encodings in both the encoder and decoder stacks. For the base model, we use a rate of $P_"drop" = 0.1$.

#zh(id: "S049")[*残差 Dropout。* 我们对每个子层的输出应用 dropout @ref27，然后再将其与子层输入相加并归一化。此外，编码器和解码器中嵌入与位置编码之和也应用 dropout。对于基础模型，我们采用 $P_"drop" = 0.1$。]

*Label Smoothing.* During training, we employed label smoothing of value $epsilon_"ls" = 0.1$ @ref30. This hurts perplexity, as the model learns to be more unsure, but improves accuracy and BLEU score.

#zh(id: "S050")[*标签平滑。* 训练时，我们使用 $epsilon_"ls" = 0.1$ 的标签平滑 @ref30。这会使模型的预测更加不确定，从而损害困惑度表现，但能改善准确率和 BLEU 分数。]

#figure(
  table(
    columns: (2.4fr, 0.75fr, 0.75fr, 1.1fr, 1.1fr),
    inset: 3.5pt,
    stroke: (x: none, y: 0.4pt),
    table.header(
      [*Model*], [*BLEU EN-DE*], [*BLEU EN-FR*], [*Cost EN-DE*], [*Cost EN-FR*],
    ),
    [ByteNet @ref15], [23.75], [], [], [],
    [Deep-Att + PosUnk @ref32], [], [39.2], [], [$1.0 dot 10^20$],
    [GNMT + RL @ref31], [24.6], [39.92], [$2.3 dot 10^19$], [$1.4 dot 10^20$],
    [ConvS2S @ref08], [25.16], [40.46], [$9.6 dot 10^18$], [$1.5 dot 10^20$],
    [MoE @ref26], [26.03], [40.56], [$2.0 dot 10^19$], [$1.2 dot 10^20$],
    [Deep-Att + PosUnk Ensemble @ref32], [], [40.4], [], [$8.0 dot 10^20$],
    [GNMT + RL Ensemble @ref31], [26.30], [41.16], [$1.8 dot 10^20$], [$1.1 dot 10^21$],
    [ConvS2S Ensemble @ref08], [26.36], [41.29], [$7.7 dot 10^19$], [$1.2 dot 10^21$],
    [Transformer (base model)], [27.3], [38.1], [], [$3.3 dot 10^18$],
    [Transformer (big)], [28.4], [41.0], [], [$2.3 dot 10^19$],
  ),
  caption: [The Transformer achieves better BLEU scores than previous state-of-the-art models on the English-to-German and English-to-French newstest2014 tests at a fraction of the training cost. Training cost is in FLOPs. #zh-caption[在英语到德语和英语到法语的 newstest2014 测试中，Transformer 以此前先进模型的一小部分训练成本取得更高的 BLEU 分数。训练成本以浮点运算次数（FLOPs）计。]],
) <tab-results>

= Results / 结果

== Machine Translation / 机器翻译

On the WMT 2014 English-to-German translation task, the big transformer model (Transformer (big) in Table 2) outperforms the best previously reported models (including ensembles) by more than 2.0 BLEU, establishing a new state-of-the-art BLEU score of 28.4. The configuration of this model is listed in the bottom line of Table 3. Training took 3.5 days on 8 P100 GPUs. Even our base model surpasses all previously published models and ensembles, at a fraction of the training cost of any of the competitive models.

#zh(id: "S051")[在 WMT 2014 英语到德语翻译任务上，大型 Transformer 模型（表 2 中的 Transformer (big)）比此前报告的最佳模型（包括集成模型）提高了超过 2.0 BLEU，达到新的最佳水平 28.4 BLEU。该模型的配置列于表 3 最后一行。训练在 8 块 P100 GPU 上耗时 3.5 天。即使是基础模型，也超过了此前发表的所有模型和集成模型，而训练成本仅为这些有竞争力模型的一小部分。]

On the WMT 2014 English-to-French translation task, our big model achieves a BLEU score of 41.0, outperforming all of the previously published single models, at less than 1/4 the training cost of the previous state-of-the-art model. The Transformer (big) model trained for English-to-French used dropout rate $P_"drop" = 0.1$, instead of 0.3.

#zh(id: "S052")[在 WMT 2014 英语到法语翻译任务上，大模型达到 41.0 BLEU，超过此前发表的所有单模型，训练成本不到此前最佳模型的四分之一。用于英语到法语任务的 Transformer (big) 采用 $P_"drop" = 0.1$ 的 dropout 概率，而不是 0.3。]

For the base models, we used a single model obtained by averaging the last 5 checkpoints, which were written at 10-minute intervals. For the big models, we averaged the last 20 checkpoints. We used beam search with a beam size of 4 and length penalty $alpha = 0.6$ @ref31. These hyperparameters were chosen after experimentation on the development set. We set the maximum output length during inference to input length + 50, but terminate early when possible @ref31.

#zh(id: "S053")[对于基础模型，我们将最后 5 个检查点取平均，得到一个单模型；这些检查点每隔 10 分钟保存一次。对于大模型，我们对最后 20 个检查点取平均。我们使用束宽为 4、长度惩罚为 $alpha = 0.6$ 的束搜索 @ref31。这些超参数通过开发集上的实验选定。推理时，最大输出长度设为输入长度加 50，但在可能时提前终止生成 @ref31。]

Table 2 summarizes our results and compares our translation quality and training costs to other model architectures from the literature. We estimate the number of floating point operations used to train a model by multiplying the training time, the number of GPUs used, and an estimate of the sustained single-precision floating-point capacity of each GPU.

#zh(id: "S054")[表 2 汇总了结果，并将翻译质量和训练成本与已有文献中的其他模型架构进行比较。我们将训练时间、GPU 数量以及每块 GPU 持续单精度浮点计算能力的估计值相乘，估算模型训练所需的浮点运算次数。]

#footnote[We used values of 2.8, 3.7, 6.0 and 9.5 TFLOPS for K80, K40, M40 and P100, respectively. #zh-caption[对 K80、K40、M40 和 P100，我们分别采用 2.8、3.7、6.0 和 9.5 TFLOPS 的计算能力估计值。]]

== Model Variations / 模型变体

To evaluate the importance of different components of the Transformer, we varied our base model in different ways, measuring the change in performance on English-to-German translation on the development set, newstest2013. We used beam search as described in the previous section, but no checkpoint averaging. We present these results in Table 3.

#zh(id: "S055")[为评估 Transformer 各组件的重要性，我们以不同方式改变基础模型，并在英语到德语翻译开发集 newstest2013 上衡量性能变化。我们采用上一节描述的束搜索，但不对检查点取平均。结果见表 3。]

In Table 3 rows (A), we vary the number of attention heads and the attention key and value dimensions, keeping the amount of computation constant, as described in Section 3.2.2. While single-head attention is 0.9 BLEU worse than the best setting, quality also drops off with too many heads.

#zh(id: "S056")[在表 3 的 (A) 组中，我们改变注意力头的数量，以及注意力键和值的维度，同时按照第 3.2.2 节所述保持计算量不变。单头注意力比最佳设置低 0.9 BLEU，但头数过多时，翻译质量同样会下降。]

#[
// This wide table needs an in-flow caption instead of a side note.
#show figure.caption: it => {
  it.supplement + sym.space.nobreak + it.counter.display() + it.separator + it.body
}
#show figure: it => html.figure(class: "attention-variations", {
  html.div(class: "attention-variations-scroll", it.body)
  html.figcaption(it.caption)
})
#figure(
  block(width: 100%)[
    #set text(size: 7pt)
    #table(
      columns: (0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr, 0.3fr),
      inset: 2pt,
      stroke: 0.3pt,

      table.header(
        [*Grp*], [*$N$*], [*$d_"model"$*], [*$d_"ff"$*], [*$h$*],
        [*$d_k$*], [*$d_v$*], [*$P_"drop"$*], [*$epsilon_"ls"$*],
        [*train steps*], [*PPL*], [*BLEU*], [*params ×10^6*],
      ),
      [base], [6], [512], [2048], [8], [64], [64], [0.1], [0.1], [100K], [4.92], [25.8], [65],
      [(A)], [], [], [], [1], [512], [512], [], [], [], [5.29], [24.9], [],
      [], [], [], [], [4], [128], [128], [], [], [], [5.00], [25.5], [],
      [], [], [], [], [16], [32], [32], [], [], [], [4.91], [25.8], [],
      [], [], [], [], [32], [16], [16], [], [], [], [5.01], [25.4], [],
      [(B)], [], [], [], [], [16], [], [], [], [], [5.16], [25.1], [58],
      [], [], [], [], [], [32], [], [], [], [], [5.01], [25.4], [60],
      [(C)], [2], [], [], [], [], [], [], [], [], [6.11], [23.7], [36],
      [], [4], [], [], [], [], [], [], [], [], [5.19], [25.3], [50],
      [], [8], [], [], [], [], [], [], [], [], [4.88], [25.5], [80],
      [], [], [256], [], [], [32], [32], [], [], [], [5.75], [24.5], [28],
      [], [], [1024], [], [], [128], [128], [], [], [], [4.66], [26.0], [168],
      [], [], [], [1024], [], [], [], [], [], [], [5.12], [25.4], [53],
      [], [], [], [4096], [], [], [], [], [], [], [4.75], [26.2], [90],
      [(D)], [], [], [], [], [], [], [0.0], [], [], [5.77], [24.6], [],
      [], [], [], [], [], [], [], [0.2], [], [], [4.95], [25.5], [],
      [], [], [], [], [], [], [], [], [0.0], [], [4.67], [25.3], [],
      [], [], [], [], [], [], [], [], [0.2], [], [5.47], [25.7], [],
      [(E)], table.cell(colspan: 9)[positional embedding instead of sinusoids], [4.92], [25.7], [],
      [big], [6], [1024], [4096], [16], [], [], [0.3], [], [300K], [4.33], [26.4], [213],
    )
  ],
  caption: [Variations on the Transformer architecture. Unlisted values are identical to those of the base model. All metrics are on the English-to-German translation development set, newstest2013. Listed perplexities are per-wordpiece, according to our byte-pair encoding, and should not be compared to per-word perplexities. #zh-caption[Transformer 架构的不同变体。未列出的参数值与基础模型相同。所有指标均在英语到德语翻译开发集 newstest2013 上评估。表中困惑度基于我们的字节对编码，按 word-piece 计算，不能与按词计算的困惑度直接比较。]],
) <tab-variations>
]

In Table 3 rows (B), we observe that reducing the attention key size $d_k$ hurts model quality. This suggests that determining compatibility is not easy and that a more sophisticated compatibility function than dot product may be beneficial. We further observe in rows (C) and (D) that, as expected, bigger models are better, and dropout is very helpful in avoiding over-fitting. In row (E) we replace our sinusoidal positional encoding with learned positional embeddings @ref08, and observe nearly identical results to the base model.

#zh(id: "S057")[在表 3 的 (B) 组中，我们观察到减小注意力键的维度 $d_k$ 会损害模型质量。这说明计算相容性并不容易，使用比点积更复杂的相容性函数可能有所帮助。此外，(C) 和 (D) 组表明，正如预期，更大的模型表现更好，dropout 对防止过拟合十分有用。在 (E) 行，我们将正弦位置编码替换为可学习的位置嵌入 @ref08，得到的结果与基础模型几乎相同。]

= Conclusion / 结论

In this work, we presented the Transformer, the first sequence transduction model based entirely on attention, replacing the recurrent layers most commonly used in encoder-decoder architectures with multi-headed self-attention.

#zh(id: "S058")[本文提出 Transformer，这是第一个完全基于注意力的序列转换模型，用多头自注意力替代编码器—解码器架构中最常使用的循环层。]

For translation tasks, the Transformer can be trained significantly faster than architectures based on recurrent or convolutional layers. On both WMT 2014 English-to-German and WMT 2014 English-to-French translation tasks, we achieve a new state of the art. In the former task our best model outperforms even all previously reported ensembles.

#zh(id: "S059")[对于翻译任务，Transformer 的训练速度显著快于基于循环层或卷积层的架构。在 WMT 2014 英语到德语和英语到法语任务上，我们均取得新的最佳结果。在前一个任务中，最佳模型甚至超过了此前报告的所有集成模型。]

We are excited about the future of attention-based models and plan to apply them to other tasks. We plan to extend the Transformer to problems involving input and output modalities other than text and to investigate local, restricted attention mechanisms to efficiently handle large inputs and outputs such as images, audio and video. Making generation less sequential is another research goals of ours.

#zh(id: "S060")[我们对基于注意力的模型的前景充满期待，并计划将它们应用于其他任务。我们计划将 Transformer 扩展到输入、输出模态不限于文本的问题，并研究局部受限的注意力机制，以高效处理图像、音频和视频等大型输入与输出。进一步减少生成过程的顺序性，也是我们的研究目标之一。]

The code we used to train and evaluate our models is available at #link("https://github.com/tensorflow/tensor2tensor")[https://github.com/tensorflow/tensor2tensor].

#zh(id: "S061")[用于训练和评估模型的代码可在 #link("https://github.com/tensorflow/tensor2tensor")[https://github.com/tensorflow/tensor2tensor] 获取。]

*Acknowledgements.* We are grateful to Nal Kalchbrenner and Stephan Gouws for their fruitful comments, corrections and inspiration.

#zh(id: "S062")[*致谢。* 感谢 Nal Kalchbrenner 和 Stephan Gouws 提出的富有启发性的意见、更正和建议。]

#bibliography("refs.bib", title: "References / 参考文献", style: "ieee")
