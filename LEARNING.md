# AI Engineering from Scratch — Learning Plan

**Goal:** Understand AI well enough to debug and design the AI systems I
ship (chatbots, RAG, agents) without guessing — using `ima-crm` as the
live target.

**Source of truth.** Tick a lesson by changing `- [ ]` to `- [x]` after
you finish it. Run `learn ai-engineering` to print the next lesson.

---

## Core concepts

The five things to walk away with, in plain language:

- A neural network layer is just a matrix multiplied by a vector, then
  passed through a small non-linear function. There is nothing magical.
- "Attention" is a way for the model to look at every other position in
  its input and decide what to focus on. The Q×Kᵀ / √d step is literally
  the dot-product similarity we already covered.
- An LLM generates one token at a time. Each token is sampled from a
  probability distribution (softmax over the layer's output). Temperature
  reshapes that distribution.
- A RAG system is two stages: encode the question + documents into the
  same vector space, then retrieve the nearest neighbours and ask the
  LLM to use them. The embedding model and chunking strategy decide
  most of the quality.
- An agent is a chatbot with a loop: it can call tools, observe results,
  and decide what to do next. The loop is what separates it from a
  single prompt/response.

## Curriculum shape

20 phases, 511 lessons, ~237K LOC across Python / TypeScript / Rust /
Julia. The plan below keeps ~20 lessons that map onto the five core
ideas above, in roughly this order: math foundation → transformer →
tokenisation & sampling → LLM engineering → agents.

## Lessons

Tier 1 — Math foundation
- [ ] phases/01-math-foundations/01-linear-algebra-intuition
- [ ] phases/01-math-foundations/02-vectors-matrices-operations
- [ ] phases/01-math-foundations/06-probability-and-distributions

Tier 2 — Transformer
- [ ] phases/07-transformers-deep-dive/02-self-attention-from-scratch
- [ ] phases/07-transformers-deep-dive/03-multi-head-attention
- [ ] phases/07-transformers-deep-dive/04-positional-encoding

Tier 3 — Tokenisation & sampling
- [ ] phases/10-llms-from-scratch/01-tokenizers
- [ ] phases/10-llms-from-scratch/02-building-a-tokenizer
- [ ] phases/10-llms-from-scratch/04-pre-training-mini-gpt

Tier 4 — LLM engineering
- [ ] phases/11-llm-engineering/01-prompt-engineering
- [ ] phases/11-llm-engineering/06-rag
- [ ] phases/11-llm-engineering/09-function-calling
- [ ] phases/11-llm-engineering/10-evaluation

Tier 5 — Agents
- [ ] phases/14-agent-engineering/01-the-agent-loop
- [ ] phases/14-agent-engineering/06-tool-use-and-function-calling
- [ ] phases/14-agent-engineering/07-memory-virtual-context-memgpt
- [ ] phases/13-tools-and-protocols/06-mcp-fundamentals

## Stop condition

You can, without referring to notes, explain to a teammate why a
specific `ima-crm/services/chatbot` failure happened and fix it.