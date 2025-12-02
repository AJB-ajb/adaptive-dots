// Test document for adaptive-dots package

#import "src/lib.typ": adaptive-dots, ldots, cdots

#set page(width: 16cm, height: auto, margin: 1cm)
#set text(font: "New Computer Modern")

= adaptive-dots Test Document

== Without adaptive-dots (baseline comparison)

Notice how all dots appear at baseline level:

- List with commas: $a_1, a_2, ..., a_n$ (should be baseline)
- Sum with plus: $1 + 2 + ... + n$ (should be centered)
- Product with dot: $1 dot.op 2 dot.op ... dot.op n$ (should be centered)
- Product with cdot: $1 ⋅ 2 ⋅ ... ⋅ n$ (should be centered)

#line(length: 100%)

== With adaptive-dots

#show: adaptive-dots

=== Should use baseline dots (…)

- List notation: $a_1, a_2, ..., a_n$
- Sequence: $x_1, x_2, x_3, ..., x_n$
- Set elements: ${1, 2, ..., 100}$
- Tuple: $(a, b, ..., z)$
- Just dots: $a ... b$

=== Should use centered dots (⋯)

- Addition: $1 + 2 + ... + n$
- Subtraction: $n - (n-1) - ... - 1$
- Multiplication (cdot): $1 ⋅ 2 ⋅ ... ⋅ n$
- Multiplication (times): $a × b × ... × z$
- Equality chain: $a = b = ... = z$
- Inequality: $a < b < ... < z$
- Union: $A ∪ B ∪ ... ∪ Z$
- Intersection: $A ∩ B ∩ ... ∩ Z$
- Logical and: $p ∧ q ∧ ... ∧ r$
- Logical or: $p ∨ q ∨ ... ∨ r$
- Implication: $a → b → ... → z$

=== Mixed contexts

- Sum definition: $sum_(i=1)^n a_i = a_1 + a_2 + ... + a_n$
- Product definition: $product_(i=1)^n a_i = a_1 ⋅ a_2 ⋅ ... ⋅ a_n$
- Matrix row: $(a_(1,1), a_(1,2), ..., a_(1,n))$

=== Edge cases

- Dots at start: $... + a + b$
- Dots at end: $a + b + ...$
- Multiple dots: $a, ..., b + ... + c$
- Unicode ellipsis: $1 + 2 + … + n$

=== Forcing explicit dot variants

Use `ldots` and `cdots` to override auto-detection:

- Force baseline in sum context: $1 + 2 + ldots + n$ (baseline despite +)
- Force centered in list context: $a, b, cdots, z$ (centered despite commas)
- Native `dots.c` still works: $1, 2, dots.c, n$
- Native `dots.v` for vertical: $mat(1; dots.v; n)$

#line(length: 100%)

== Debug: repr() output

#let show-repr(label, expr) = [
  - #label: #raw(repr(expr))
]

#show-repr("$...$", $...$)
#show-repr("$…$", $…$)
#show-repr("$dots$", $dots$)
#show-repr("$dots.c$", $dots.c$)
#show-repr("$ldots$", $ldots$)
#show-repr("$cdots$", $cdots$)
#show-repr("$+$", $+$)
#show-repr("$,$", $,$)
