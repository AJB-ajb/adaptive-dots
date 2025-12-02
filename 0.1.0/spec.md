# adaptive-dots Specification

Automatically replace `...`, `…`, or `dots` in math mode with the appropriate variant (`dots` or `dots.c`) based on surrounding operators, mimicking LaTeX `amsmath` `\dots` behavior.

## Behavior

**Decision rule**: If *either* the previous or next non-space sibling is a "centered operator", use `dots.c` (centered ⋯). Otherwise, use `dots` (baseline …).

### Centered Operators

Binary arithmetic, logical, set, and relational operators trigger centered dots:
- Arithmetic: `+`, `−`, `-`, `×`, `⋅`, `·`, `*`, `∗`, `±`, `∓`, `÷`, `∘`
- Tensor/direct: `⊕`, `⊗`, `⊙`
- Logical: `∧`, `∨`, `⊻`
- Set: `∪`, `∩`, `∖`
- Relational: `=`, `≠`, `≈`, `≡`, `∼`, `<`, `>`, `≤`, `≥`, `≪`, `≫`

All other operators (including `,`, `;`) produce baseline dots.

## Edge Cases

- **Multiple dots in one equation**: Each handled independently
- **Dots at start/end**: Only the existing neighbor is checked
- **No recognized operator adjacent**: Default to baseline `dots`
