#import "../index.typ": template, tufted
#show: template.with(
  title: "Blog",
  description: "Some blog examples",
)

= 博客 / Blog

== 2026

#tufted.blog-entry(
  date: datetime(year: 2026, month: 10, day: 3),
  path: "2026-10-3 Beyond Genetic Diversity/",
  title: "Bryond Genetic Diversity",
)

== 2025

#tufted.blog-entry(
  date: datetime(year: 2025, month: 10, day: 30),
  path: "2025-10-30-normal-distribution/",
  title: "Normal Distribution",
)
#tufted.blog-entry(
  date: datetime(year: 2025, month: 4, day: 16),
  path: "2025-04-16-monkeys-apes",
  title: "Monkeys vs Apes",
)

== 2024

#tufted.blog-entry(
  date: "2024-10-04",
  path: "2024-10-04-iterators-generators/",
  title: "Iterators vs Generators in Python",
)
