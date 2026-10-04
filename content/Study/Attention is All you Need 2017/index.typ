#import "../index.typ": template, tufted

// Blog/article metadata. This follows the structure of the provided template.
#show: template.with(
  title: "Attention Is All You Need",
  description: "A Typst transcription of Vaswani et al. (2017), introducing the Transformer architecture based entirely on attention.",
  date: datetime(year: 2017, month: 12, day: 4),
  lang: "en",
)

= Attention Is All You Need

*Abstract:* The dominant sequence transduction models are based on complex recurrent or convolutional neural networks that include an encoder and a decoder. The best performing models also connect the encoder and decoder through an attention mechanism. We propose a new simple network architecture, the Transformer, based solely on attention mechanisms, dispensing with recurrence and convolutions entirely. Experiments on two machine translation tasks show these models to be superior in quality while being more parallelizable and requiring significantly less time to train. Our model achieves 28.4 BLEU on the WMT 2014 English-to-German translation task, improving over the existing best results, including ensembles, by over 2 BLEU. On the WMT 2014 English-to-French translation task, our model establishes a new single-model state-of-the-art BLEU score of 41.0 after training for 3.5 days on eight GPUs, a small fraction of the training costs of the best models from the literature.

= Introduction

Recurrent neural networks, long short-term memory @ref12 and gated recurrent @ref07 neural networks in particular, have been firmly established as state of the art approaches in sequence modeling and transduction problems such as language modeling and machine translation @ref29 @ref02 @ref05. Numerous efforts have since continued to push the boundaries of recurrent language models and encoder-decoder architectures @ref31 @ref21 @ref13.

Recurrent models typically factor computation along the symbol positions of the input and output sequences. Aligning the positions to steps in computation time, they generate a sequence of hidden states $h_t$, as a function of the previous hidden state $h_(t-1)$ and the input for position $t$. This inherently sequential nature precludes parallelization within training examples, which becomes critical at longer sequence lengths, as memory constraints limit batching across examples. Recent work has achieved significant improvements in computational efficiency through factorization tricks @ref18 and conditional computation @ref26, while also improving model performance in case of the latter. The fundamental constraint of sequential computation, however, remains.

Attention mechanisms have become an integral part of compelling sequence modeling and transduction models in various tasks, allowing modeling of dependencies without regard to their distance in the input or output sequences @ref02 @ref16. In all but a few cases @ref22, however, such attention mechanisms are used in conjunction with a recurrent network.

In this work we propose the Transformer, a model architecture eschewing recurrence and instead relying entirely on an attention mechanism to draw global dependencies between input and output. The Transformer allows for significantly more parallelization and can reach a new state of the art in translation quality after being trained for as little as twelve hours on eight P100 GPUs.

#align(center)[#text(size: 8.5pt)[31st Conference on Neural Information Processing Systems (NIPS 2017), Long Beach, CA, USA.]]

= Background

The goal of reducing sequential computation also forms the foundation of the Extended Neural GPU @ref20, ByteNet @ref15 and ConvS2S @ref08, all of which use convolutional neural networks as basic building block, computing hidden representations in parallel for all input and output positions. In these models, the number of operations required to relate signals from two arbitrary input or output positions grows in the distance between positions, linearly for ConvS2S and logarithmically for ByteNet. This makes it more difficult to learn dependencies between distant positions @ref11. In the Transformer this is reduced to a constant number of operations, albeit at the cost of reduced effective resolution due to averaging attention-weighted positions, an effect we counteract with Multi-Head Attention as described in section 3.2.

Self-attention, sometimes called intra-attention, is an attention mechanism relating different positions of a single sequence in order to compute a representation of the sequence. Self-attention has been used successfully in a variety of tasks including reading comprehension, abstractive summarization, textual entailment and learning task-independent sentence representations @ref04 @ref22 @ref23 @ref19.

End-to-end memory networks are based on a recurrent attention mechanism instead of sequence-aligned recurrence and have been shown to perform well on simple-language question answering and language modeling tasks @ref28.

To the best of our knowledge, however, the Transformer is the first transduction model relying entirely on self-attention to compute representations of its input and output without using sequence-aligned RNNs or convolution. In the following sections, we will describe the Transformer, motivate self-attention and discuss its advantages over models such as @ref14 @ref15 and @ref08.

= Model Architecture

Most competitive neural sequence transduction models have an encoder-decoder structure @ref05 @ref02 @ref29. Here, the encoder maps an input sequence of symbol representations $(x_1, ..., x_n)$ to a sequence of continuous representations $z = (z_1, ..., z_n)$. Given $z$, the decoder then generates an output sequence $(y_1, ..., y_m)$ of symbols one element at a time. At each step the model is auto-regressive @ref09, consuming the previously generated symbols as additional input when generating the next.

The Transformer follows this overall architecture using stacked self-attention and point-wise, fully connected layers for both the encoder and decoder, shown in the left and right halves of Figure 1, respectively.

#figure(
  image("assets/figure1-transformer.png", width: 66%),
  caption: [The Transformer - model architecture.],
) <fig-transformer>

== Encoder and Decoder Stacks

*Encoder:* The encoder is composed of a stack of $N = 6$ identical layers. Each layer has two sub-layers. The first is a multi-head self-attention mechanism, and the second is a simple, position-wise fully connected feed-forward network. We employ a residual connection @ref10 around each of the two sub-layers, followed by layer normalization @ref01. That is, the output of each sub-layer is

$ "LayerNorm"(x + "Sublayer"(x)), $

where $"Sublayer"(x)$ is the function implemented by the sub-layer itself. To facilitate these residual connections, all sub-layers in the model, as well as the embedding layers, produce outputs of dimension $d_"model" = 512$.

*Decoder:* The decoder is also composed of a stack of $N = 6$ identical layers. In addition to the two sub-layers in each encoder layer, the decoder inserts a third sub-layer, which performs multi-head attention over the output of the encoder stack. Similar to the encoder, we employ residual connections around each of the sub-layers, followed by layer normalization. We also modify the self-attention sub-layer in the decoder stack to prevent positions from attending to subsequent positions. This masking, combined with fact that the output embeddings are offset by one position, ensures that the predictions for position $i$ can depend only on the known outputs at positions less than $i$.

== Attention

An attention function can be described as mapping a query and a set of key-value pairs to an output, where the query, keys, values, and output are all vectors. The output is computed as a weighted sum of the values, where the weight assigned to each value is computed by a compatibility function of the query with the corresponding key.

=== Scaled Dot-Product Attention

We call our particular attention “Scaled Dot-Product Attention” (Figure 2). The input consists of queries and keys of dimension $d_k$, and values of dimension $d_v$. We compute the dot products of the query with all keys, divide each by $sqrt(d_k)$, and apply a softmax function to obtain the weights on the values.

In practice, we compute the attention function on a set of queries simultaneously, packed together into a matrix $Q$. The keys and values are also packed together into matrices $K$ and $V$. We compute the matrix of outputs as:

$ "Attention"(Q, K, V) = "softmax"((Q K^T) / sqrt(d_k)) V $ <eq-attention>

The two most commonly used attention functions are additive attention @ref02, and dot-product (multiplicative) attention. Dot-product attention is identical to our algorithm, except for the scaling factor of $1 / sqrt(d_k)$. Additive attention computes the compatibility function using a feed-forward network with a single hidden layer. While the two are similar in theoretical complexity, dot-product attention is much faster and more space-efficient in practice, since it can be implemented using highly optimized matrix multiplication code.

While for small values of $d_k$ the two mechanisms perform similarly, additive attention outperforms dot product attention without scaling for larger values of $d_k$ @ref03. We suspect that for large values of $d_k$, the dot products grow large in magnitude, pushing the softmax function into regions where it has extremely small gradients. To counteract this effect, we scale the dot products by $1 / sqrt(d_k)$.

#figure(
  grid(
    columns: (1fr, 1.55fr),
    gutter: 18pt,
    align: center,
    image("assets/figure2-scaled-dot-product.png", width: 80%),
    image("assets/figure2-multi-head.png", width: 90%),
  ),
  caption: [(left) Scaled Dot-Product Attention. (right) Multi-Head Attention consists of several attention layers running in parallel.],
) <fig-attention>

#footnote[To illustrate why the dot products get large, assume that the components of $q$ and $k$ are independent random variables with mean 0 and variance 1. Then their dot product, $q dot k = sum_(i=1)^(d_k) q_i k_i$, has mean 0 and variance $d_k$.]

=== Multi-Head Attention

Instead of performing a single attention function with $d_"model"$-dimensional keys, values and queries, we found it beneficial to linearly project the queries, keys and values $h$ times with different, learned linear projections to $d_k$, $d_k$ and $d_v$ dimensions, respectively. On each of these projected versions of queries, keys and values we then perform the attention function in parallel, yielding $d_v$-dimensional output values. These are concatenated and once again projected, resulting in the final values, as depicted in Figure 2.

Multi-head attention allows the model to jointly attend to information from different representation subspaces at different positions. With a single attention head, averaging inhibits this.

$ "MultiHead"(Q, K, V) = "Concat"("head"_1, ..., "head"_h) W^O $

$ "where" thin "head"_i = "Attention"(Q W_i^Q, K W_i^K, V W_i^V) $

where the projections are parameter matrices

$ W_i^Q in RR^(d_"model" times d_k), quad W_i^K in RR^(d_"model" times d_k), quad W_i^V in RR^(d_"model" times d_v) $

and

$ W^O in RR^(h d_v times d_"model"). $

In this work we employ $h = 8$ parallel attention layers, or heads. For each of these we use $d_k = d_v = d_"model" / h = 64$. Due to the reduced dimension of each head, the total computational cost is similar to that of single-head attention with full dimensionality.

=== Applications of Attention in our Model

The Transformer uses multi-head attention in three different ways:

- In “encoder-decoder attention” layers, the queries come from the previous decoder layer, and the memory keys and values come from the output of the encoder. This allows every position in the decoder to attend over all positions in the input sequence. This mimics the typical encoder-decoder attention mechanisms in sequence-to-sequence models such as @ref31 @ref02 @ref08.
- The encoder contains self-attention layers. In a self-attention layer all of the keys, values and queries come from the same place, in this case, the output of the previous layer in the encoder. Each position in the encoder can attend to all positions in the previous layer of the encoder.
- Similarly, self-attention layers in the decoder allow each position in the decoder to attend to all positions in the decoder up to and including that position. We need to prevent leftward information flow in the decoder to preserve the auto-regressive property. We implement this inside of scaled dot-product attention by masking out (setting to $-infinity$) all values in the input of the softmax which correspond to illegal connections. See Figure 2.

== Position-wise Feed-Forward Networks

In addition to attention sub-layers, each of the layers in our encoder and decoder contains a fully connected feed-forward network, which is applied to each position separately and identically. This consists of two linear transformations with a ReLU activation in between.

$ "FFN"(x) = max(0, x W_1 + b_1) W_2 + b_2 $ <eq-ffn>

While the linear transformations are the same across different positions, they use different parameters from layer to layer. Another way of describing this is as two convolutions with kernel size 1.

The dimensionality of input and output is $d_"model" = 512$, and the inner-layer has dimensionality $d_"ff" = 2048$.

== Embeddings and Softmax

Similarly to other sequence transduction models, we use learned embeddings to convert the input tokens and output tokens to vectors of dimension $d_"model"$. We also use the usual learned linear transformation and softmax function to convert the decoder output to predicted next-token probabilities. In our model, we share the same weight matrix between the two embedding layers and the pre-softmax linear transformation, similar to @ref24. In the embedding layers, we multiply those weights by $sqrt(d_"model")$.

== Positional Encoding

Since our model contains no recurrence and no convolution, in order for the model to make use of the order of the sequence, we must inject some information about the relative or absolute position of the tokens in the sequence. To this end, we add “positional encodings” to the input embeddings at the bottoms of the encoder and decoder stacks. The positional encodings have the same dimension $d_"model"$ as the embeddings, so that the two can be summed. There are many choices of positional encodings, learned and fixed @ref08.


In this work, we use sine and cosine functions of different frequencies:

$ "PE"_("(pos, 2i)") = sin("pos" / 10000^(2i / d_"model")) $

$ "PE"_("(pos, 2i+1)") = cos("pos" / 10000^(2i / d_"model")) $

where $"pos"$ is the position and $i$ is the dimension. That is, each dimension of the positional encoding corresponds to a sinusoid. The wavelengths form a geometric progression from $2 pi$ to $10000 dot 2 pi$. We chose this function because we hypothesized it would allow the model to easily learn to attend by relative positions, since for any fixed offset $k$, $"PE"_("pos"+k)$ can be represented as a linear function of $"PE"_"pos"$.

We also experimented with using learned positional embeddings @ref08 instead, and found that the two versions produced nearly identical results (see Table 3 row (E)). We chose the sinusoidal version because it may allow the model to extrapolate to sequence lengths longer than the ones encountered during training.

= Why Self-Attention

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
  caption: [Maximum path lengths, per-layer complexity and minimum number of sequential operations for different layer types. $n$ is the sequence length, $d$ is the representation dimension, $k$ is the kernel size of convolutions and $r$ the size of the neighborhood in restricted self-attention.],
) <tab-complexity>


In this section we compare various aspects of self-attention layers to the recurrent and convolutional layers commonly used for mapping one variable-length sequence of symbol representations $(x_1, ..., x_n)$ to another sequence of equal length $(z_1, ..., z_n)$, with $x_i, z_i in RR^d$, such as a hidden layer in a typical sequence transduction encoder or decoder. Motivating our use of self-attention we consider three desiderata.

One is the total computational complexity per layer. Another is the amount of computation that can be parallelized, as measured by the minimum number of sequential operations required.

The third is the path length between long-range dependencies in the network. Learning long-range dependencies is a key challenge in many sequence transduction tasks. One key factor affecting the ability to learn such dependencies is the length of the paths forward and backward signals have to traverse in the network. The shorter these paths between any combination of positions in the input and output sequences, the easier it is to learn long-range dependencies @ref11. Hence we also compare the maximum path length between any two input and output positions in networks composed of the different layer types.

As noted in Table 1, a self-attention layer connects all positions with a constant number of sequentially executed operations, whereas a recurrent layer requires $cal(O)(n)$ sequential operations. In terms of computational complexity, self-attention layers are faster than recurrent layers when the sequence length $n$ is smaller than the representation dimensionality $d$, which is most often the case with sentence representations used by state-of-the-art models in machine translations, such as word-piece @ref31 and byte-pair @ref25 representations. To improve computational performance for tasks involving very long sequences, self-attention could be restricted to considering only a neighborhood of size $r$ in the input sequence centered around the respective output position. This would increase the maximum path length to $cal(O)(n/r)$. We plan to investigate this approach further in future work.

A single convolutional layer with kernel width $k < n$ does not connect all pairs of input and output positions. Doing so requires a stack of $cal(O)(n/k)$ convolutional layers in the case of contiguous kernels, or $cal(O)(log_k(n))$ in the case of dilated convolutions @ref15, increasing the length of the longest paths between any two positions in the network. Convolutional layers are generally more expensive than recurrent layers, by a factor of $k$. Separable convolutions @ref06, however, decrease the complexity considerably, to $cal(O)(k dot n dot d + n dot d^2)$. Even with $k = n$, however, the complexity of a separable convolution is equal to the combination of a self-attention layer and a point-wise feed-forward layer, the approach we take in our model.

As side benefit, self-attention could yield more interpretable models. We inspect attention distributions from our models and present and discuss examples in the appendix. Not only do individual attention heads clearly learn to perform different tasks, many appear to exhibit behavior related to the syntactic and semantic structure of the sentences.

= Training

This section describes the training regime for our models.

== Training Data and Batching

We trained on the standard WMT 2014 English-German dataset consisting of about 4.5 million sentence pairs. Sentences were encoded using byte-pair encoding @ref03, which has a shared source-target vocabulary of about 37000 tokens. For English-French, we used the significantly larger WMT 2014 English-French dataset consisting of 36M sentences and split tokens into a 32000 word-piece vocabulary @ref31. Sentence pairs were batched together by approximate sequence length. Each training batch contained a set of sentence pairs containing approximately 25000 source tokens and 25000 target tokens.

== Hardware and Schedule

We trained our models on one machine with 8 NVIDIA P100 GPUs. For our base models using the hyperparameters described throughout the paper, each training step took about 0.4 seconds. We trained the base models for a total of 100,000 steps or 12 hours. For our big models (described on the bottom line of Table 3), step time was 1.0 seconds. The big models were trained for 300,000 steps (3.5 days).

== Optimizer

We used the Adam optimizer @ref17 with $beta_1 = 0.9$, $beta_2 = 0.98$ and $epsilon = 10^(-9)$. We varied the learning rate over the course of training, according to the formula:

$ "lrate" = d_"model"^(-0.5) dot min("step_num"^(-0.5), "step_num" dot "warmup_steps"^(-1.5)) $ <eq-lrate>

This corresponds to increasing the learning rate linearly for the first $"warmup_steps"$ training steps, and decreasing it thereafter proportionally to the inverse square root of the step number. We used $"warmup_steps" = 4000$.

== Regularization

We employ three types of regularization during training:

*Residual Dropout.* We apply dropout @ref27 to the output of each sub-layer, before it is added to the sub-layer input and normalized. In addition, we apply dropout to the sums of the embeddings and the positional encodings in both the encoder and decoder stacks. For the base model, we use a rate of $P_"drop" = 0.1$.

*Label Smoothing.* During training, we employed label smoothing of value $epsilon_"ls" = 0.1$ @ref30. This hurts perplexity, as the model learns to be more unsure, but improves accuracy and BLEU score.

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
  caption: [The Transformer achieves better BLEU scores than previous state-of-the-art models on the English-to-German and English-to-French newstest2014 tests at a fraction of the training cost. Training cost is in FLOPs.],
) <tab-results>

= Results

== Machine Translation

On the WMT 2014 English-to-German translation task, the big transformer model (Transformer (big) in Table 2) outperforms the best previously reported models (including ensembles) by more than 2.0 BLEU, establishing a new state-of-the-art BLEU score of 28.4. The configuration of this model is listed in the bottom line of Table 3. Training took 3.5 days on 8 P100 GPUs. Even our base model surpasses all previously published models and ensembles, at a fraction of the training cost of any of the competitive models.

On the WMT 2014 English-to-French translation task, our big model achieves a BLEU score of 41.0, outperforming all of the previously published single models, at less than 1/4 the training cost of the previous state-of-the-art model. The Transformer (big) model trained for English-to-French used dropout rate $P_"drop" = 0.1$, instead of 0.3.

For the base models, we used a single model obtained by averaging the last 5 checkpoints, which were written at 10-minute intervals. For the big models, we averaged the last 20 checkpoints. We used beam search with a beam size of 4 and length penalty $alpha = 0.6$ @ref31. These hyperparameters were chosen after experimentation on the development set. We set the maximum output length during inference to input length + 50, but terminate early when possible @ref31.

Table 2 summarizes our results and compares our translation quality and training costs to other model architectures from the literature. We estimate the number of floating point operations used to train a model by multiplying the training time, the number of GPUs used, and an estimate of the sustained single-precision floating-point capacity of each GPU.

#footnote[We used values of 2.8, 3.7, 6.0 and 9.5 TFLOPS for K80, K40, M40 and P100, respectively.]

== Model Variations

To evaluate the importance of different components of the Transformer, we varied our base model in different ways, measuring the change in performance on English-to-German translation on the development set, newstest2013. We used beam search as described in the previous section, but no checkpoint averaging. We present these results in Table 3.

In Table 3 rows (A), we vary the number of attention heads and the attention key and value dimensions, keeping the amount of computation constant, as described in Section 3.2.2. While single-head attention is 0.9 BLEU worse than the best setting, quality also drops off with too many heads.

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
      [(E)], table.cell(colspan: 9)[positional embedding instead of sinusoids], [], [4.92], [25.7], [],
      [big], [6], [1024], [4096], [16], [], [], [0.3], [], [300K], [4.33], [26.4], [213],
    )
  ],
  caption: [Variations on the Transformer architecture. Unlisted values are identical to those of the base model. All metrics are on the English-to-German translation development set, newstest2013. Listed perplexities are per-wordpiece, according to our byte-pair encoding, and should not be compared to per-word perplexities.],
) <tab-variations>

In Table 3 rows (B), we observe that reducing the attention key size $d_k$ hurts model quality. This suggests that determining compatibility is not easy and that a more sophisticated compatibility function than dot product may be beneficial. We further observe in rows (C) and (D) that, as expected, bigger models are better, and dropout is very helpful in avoiding over-fitting. In row (E) we replace our sinusoidal positional encoding with learned positional embeddings @ref08, and observe nearly identical results to the base model.

= Conclusion

In this work, we presented the Transformer, the first sequence transduction model based entirely on attention, replacing the recurrent layers most commonly used in encoder-decoder architectures with multi-headed self-attention.

For translation tasks, the Transformer can be trained significantly faster than architectures based on recurrent or convolutional layers. On both WMT 2014 English-to-German and WMT 2014 English-to-French translation tasks, we achieve a new state of the art. In the former task our best model outperforms even all previously reported ensembles.

We are excited about the future of attention-based models and plan to apply them to other tasks. We plan to extend the Transformer to problems involving input and output modalities other than text and to investigate local, restricted attention mechanisms to efficiently handle large inputs and outputs such as images, audio and video. Making generation less sequential is another research goals of ours.

The code we used to train and evaluate our models is available at #link("https://github.com/tensorflow/tensor2tensor")[https://github.com/tensorflow/tensor2tensor].

*Acknowledgements.* We are grateful to Nal Kalchbrenner and Stephan Gouws for their fruitful comments, corrections and inspiration.

#bibliography("refs.bib", title: "References", style: "ieee")
