# Core Engineering Principles

These principles apply unless a repository defines stricter rules.

## 1. Occam’s Razor

Do not introduce concepts, abstractions, states, mechanisms, or exceptions unless they are necessary.

This does not mean minimizing complexity at all costs. Complete systems may be complex, but their complexity should emerge from a small set of **distilled, essential structures**, composed through abstraction, encapsulation, and nesting.

Distilled is not the same as simple.

A superficially simple primitive may merely push complexity onto every caller. Prefer a small number of expressive, coherent primitives over many narrow primitives connected by ad hoc conventions.

Optimize for the minimum **conceptual surface area**, not the minimum line count.

Prefer:

* composition over special cases;
* general invariants over repeated local patches;
* a small coherent core over many overlapping mechanisms;
* removing a concept over adding machinery to compensate for it.

Before adding a new entity, determine whether it expresses an essential distinction or merely preserves accidental complexity.

## 2. Test-Driven Development

Treat tests as executable specifications of observable behavior.

For new behavior or bug fixes, define the contract with a failing test before entrenching the implementation. Implement the smallest coherent change, then refactor without changing the tested semantics.

Test stable contracts, invariants, boundaries, and meaningful failure modes. Do not encode incidental implementation details as requirements.

Avoid:

* tests written only to increase coverage;
* excessive mocking;
* snapshots without semantic assertions;
* duplicated assertions across layers;
* large test infrastructures for unstable behavior.

A regression is not fully fixed until its reintroduction can be detected.

Tests should make incorrect changes difficult without making valid refactoring expensive.

## 3. Single Source of Truth

Every fact, rule, schema, configuration value, or state transition must have one semantic owner.

Other representations must be derived, generated, referenced, cached, or validated against that source. They must not become independent authorities.

When duplication is necessary, make the relationship explicit:

* identify the canonical source;
* derive secondary forms mechanically where possible;
* define synchronization and invalidation rules;
* prevent silent divergence.

SSOT does not require centralizing all code. It requires that each truth be defined exactly once.

When two representations disagree, remove the competing authority rather than adding reconciliation logic.

## 4. Eliminate Slop

Do not over-engineer unstable functionality. Early implementation should establish the correct behavior and expose the essential model, not anticipate every hypothetical requirement.

After the behavior is proven, perform a deliberate simplification pass.

Remove:

* speculative abstractions;
* one-use wrappers and interfaces;
* redundant validation;
* temporary branches and flags;
* stale compatibility paths;
* unnecessary configuration;
* duplicated logic;
* defensive handling for states that should be structurally impossible;
* tests that preserve implementation shape rather than semantics.

Ask:

1. Is this design appropriate for the project’s current stage?
2. Can the same behavior be expressed with fewer concepts, states, or execution paths?
3. Did implementation reveal that any abstraction is unnecessary?
4. Can a stronger invariant replace several defensive patches?

Prefer deleting code over explaining unnecessary code. Prefer repairing the model over accumulating exceptions around it.

## Governing Principle

> Build complete systems from distilled foundations. Define behavior explicitly, represent each truth once, and continuously remove accidental complexity.
