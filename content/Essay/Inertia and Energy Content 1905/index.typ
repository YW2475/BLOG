#import "../index.typ": template, tufted
#import "../../_essay/bilingual.typ": zh, zh-caption
#show: template.with(
  title: "Does the Inertia of a Body Depend upon its Energy-Content?",
  author: "Albert Einstein",
  date: "1905",
  lang: "en",
  css: ("/assets/custom.css", "/assets/essay.css"),
)

= Does the Inertia of a Body Depend upon its Energy-Content? / 物体的惯性是否取决于它的能量含量？

#html.p(id: "en-S001")[#text("The results of the previous investigation lead to a very interesting conclusion, which is here to be deduced.")]

#zh(id: "S001")[#text("前一项研究的结果，导向一个很有意思的结论；下面就来推导这个结论。")]

#html.p(id: "en-S002")[#text("I based that investigation on the Maxwell-Hertz equations for empty space, together with the Maxwellian expression for the electromagnetic energy of space, and in addition the principle that:—")]

#zh(id: "S002")[#text("那项研究以真空中的麦克斯韦—赫兹方程组、麦克斯韦关于空间电磁能的表达式为基础，此外还采用了下述原理：")]

#html.p(id: "en-S003")[#text("The laws by which the states of physical systems alter are independent of the alternative, to which of two systems of coordinates, in uniform motion of parallel translation relatively to each other, these alterations of state are referred (principle of relativity).")]

#zh(id: "S003")[#text("两个坐标系彼此作匀速平行移动时，物理系统状态变化所遵循的规律，不依赖于我们选用哪一个坐标系来描述这些变化（相对性原理）。")]

#html.p(id: "en-S004")[#text("With these principles * as my basis I deduced inter alia the following result ( § 8 ):—")]

#zh(id: "S004")[#text("以这些原理*为基础，我推导出的一些结果中，包括下面这一项（第8节）：")]

#html.p(id: "en-S005")[#text("Let a system of plane waves of light, referred to the system of co-ordinates ( x, y, z ), possess the energy l ; let the direction of the ray (the wave-normal) make an angle φ with the axis of x of the system. If we introduce a new system of co-ordinates ( ξ, η, ζ ) moving in uniform parallel translation with respect to the system ( x, y, z ), and having its origin of co-ordinates in motion along the axis of x with the velocity v , then this quantity of light—measured in the system ( ξ, η, ζ )—possesses the energy")]

#zh(id: "S005")[#text("设一组平面光波，在坐标系(x, y, z)中具有能量l；光线的方向，即波面的法线方向，与该坐标系的x轴成φ角。如果引入一个相对于(x, y, z)作匀速平行移动的新坐标系(ξ, η, ζ)，且其坐标原点沿x轴以速度v运动，那么这部分光在(ξ, η, ζ)中测得的能量为")]

#html.div(id: "E001")[$ l^ast = l (1 - v/c cos phi)/sqrt(1-v^2/c^2) $]

#html.p(id: "en-S006")[#text("where c denotes the velocity of light. We shall make use of this result in what follows.")]

#zh(id: "S006")[#text("其中c表示光速。下面将使用这个结果。")]

#html.p(id: "en-S007")[#text("Let there be a stationary body in the system ( x, y, z ), and let its energy—referred to the system ( x, y, z ) be E₀ . Let the energy of the body relative to the system ( ξ, η, ζ ) moving as above with the velocity v , be H₀ .")]

#zh(id: "S007")[#text("设坐标系(x, y, z)中有一个静止物体，其相对于该坐标系的能量为E₀。设这个物体相对于上述以速度v运动的坐标系(ξ, η, ζ)的能量为H₀。")]

#html.p(id: "en-S008")[#text("Let this body send out, in a direction making an angle φ with the axis of x , plane waves of light, of energy ½L measured relatively to ( x, y, z ), and simultaneously an equal quantity of light in the opposite direction. Meanwhile the body remains at rest with respect to the system ( x, y, z ). The principle of energy must apply to this process, and in fact (by the principle of relativity) with respect to both systems of co-ordinates. If we call the energy of the body after the emission of light E₁ or H₁ respectively, measured relatively to the system ( x, y, z ) or ( ξ, η, ζ ) respectively, then by employing the relation given above we obtain")]

#zh(id: "S008")[#text("让这个物体沿与x轴成φ角的方向，发出相对于(x, y, z)测得能量为½L的平面光波，同时沿相反方向发出等量的光。在此过程中，物体相对于(x, y, z)保持静止。能量原理必须适用于这一过程，而且根据相对性原理，它必须对两个坐标系都成立。如果把发光后物体相对于(x, y, z)和(ξ, η, ζ)测得的能量分别记为E₁和H₁，那么利用上面的关系，得到")]

#html.div(id: "E002")[$ E_0 &= E_1 + 1/2 L + 1/2 L \ H_0 &= H_1 + 1/2 L (1-v/c cos phi)/sqrt(1-v^2/c^2) + 1/2 L (1+v/c cos phi)/sqrt(1-v^2/c^2) \ &= H_1 + L/sqrt(1-v^2/c^2) $]

#html.p(id: "en-S009")[#text("By subtraction we obtain from these equations")]

#zh(id: "S009")[#text("将这些方程相减，得到")]

#html.div(id: "E003")[$ H_0 - E_0 - (H_1 - E_1) = L (1/sqrt(1-v^2/c^2)-1) $]

#html.p(id: "en-S010")[#text("The two differences of the form H − E occurring in this expression have simple physical significations. H and E are energy values of the same body referred to two systems of co-ordinates which are in motion relatively to each other, the body being at rest in one of the two systems (system ( x, y, z )). Thus it is clear that the difference H − E can differ from the kinetic energy K of the body, with respect to the other system ( ξ, η, ζ ), only by an additive constant C, which depends on the choice of the arbitrary additive constants of the energies H and E. Thus we may place")]

#zh(id: "S010")[#text("这个表达式中，两个形如H−E的差值有简单的物理意义。H和E是同一物体相对于两个彼此运动的坐标系的能量值；物体在其中一个坐标系，即(x, y, z)中静止。因此显然，差值H−E与物体相对于另一个坐标系(ξ, η, ζ)的动能K之间，只能相差一个加法常数C。这个常数取决于我们为能量H和E选择的任意加法常数。因此，可以写成")]

#html.div(id: "E004")[$ H_0 - E_0 &= K_0 + C \ H_1 - E_1 &= K_1 + C $]

#html.p(id: "en-S011")[#text("since C does not change during the emission of light. So we have")]

#zh(id: "S011")[#text("因为C在发光过程中不改变。所以有")]

#html.div(id: "E005")[$ K_0 - K_1 = L (1/sqrt(1-v^2/c^2)-1) $]

#html.p(id: "en-S012")[#text("The kinetic energy of the body with respect to ( ξ, η, ζ ) diminishes as a result of the emission of light, and the amount of diminution is independent of the properties of the body. Moreover, the difference K₀ − K₁ , like the kinetic energy of the electron ( § 10 ), depends on the velocity.")]

#zh(id: "S012")[#text("物体相对于(ξ, η, ζ)的动能，因发光而减少；减少的数值与物体的性质无关。此外，差值K₀−K₁与电子的动能一样（第10节），取决于速度。")]

#html.p(id: "en-S013")[#text("Neglecting magnitudes of fourth and higher orders we may place")]

#zh(id: "S013")[#text("忽略四阶及更高阶的量，可以写成")]

#html.div(id: "E006")[$ K_0 - K_1 = 1/2 L/c^2 v^2 $]

#html.p(id: "en-S014")[#text("From this equation it directly follows that:—")]

#zh(id: "S014")[#text("由这个方程直接得到：")]

#html.p(id: "en-S015")[#text("If a body gives off the energy L in the form of radiation, its mass diminishes by L/c² . The fact that the energy withdrawn from the body becomes energy of radiation evidently makes no difference, so that we are led to the more general conclusion that")]

#zh(id: "S015")[#text("如果物体以辐射的形式放出能量L，它的质量就减少L/c²。显然，从物体中取出的能量变成辐射能这一事实，并不会造成什么区别。因此，我们得到更一般的结论：")]

#html.p(id: "en-S016")[#text("The mass of a body is a measure of its energy-content; if the energy changes by L, the mass changes in the same sense by L/(9 × 10²⁰) , the energy being measured in ergs, and the mass in grammes.")]

#zh(id: "S016")[#text("物体的质量是其能量含量的量度；如果能量改变L，质量就沿同一方向改变L/(9×10²⁰)，这里能量以尔格计，质量以克计。")]

#html.p(id: "en-S017")[#text("It is not impossible that with bodies whose energy-content is variable to a high degree (e.g. with radium salts) the theory may be successfully put to the test.")]

#zh(id: "S017")[#text("对于能量含量变化很大的物体，例如镭盐，并非不可能通过实验成功检验这个理论。")]

#html.p(id: "en-S018")[#text("If the theory corresponds to the facts, radiation conveys inertia between the emitting and absorbing bodies.")]

#zh(id: "S018")[#text("如果理论与事实相符，那么辐射就在发射物体与吸收物体之间传递惯性。")]

#html.p(id: "en-S019")[#text("* The principle of the constancy of the velocity of light is of course contained in Maxwell’s equations.")]

#zh(id: "S019")[#text("* 光速恒定原理当然已包含在麦克斯韦方程组中。")]
