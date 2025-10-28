---
title: "Technical Architecture"
slug: "technical-architecture"
description: "Independent Impact combines decentralised identity, verifiable data, and distributed compute to make impact accounting trustworthy and auditable."
aliases:
  - /features/platform-architecture/
---

{{< features-section
    title="Technical Architecture"
    description="Independent Impact combines decentralised identity, verifiable data, and distributed compute to make impact accounting trustworthy and auditable."
>}}

{{< feature
    title="Event journaling on Hedera"
    description="Every submission, evaluation, and verification step is immutably recorded using the Hedera Consensus Service, providing a tamper-evident timeline of actions."
>}}

{{< feature
    title="Verifiable identities and attestations"
    description="W3C DIDs anchor agent identities while W3C Verifiable Credentials encode attestations that buyers and peers can independently verify."
>}}

{{< feature
    title="Immutable artefact storage"
    description="Project documentation and evidentiary artefacts are stored on IPFS, ensuring they remain accessible and provably unaltered."
>}}

{{< feature
    title="Reputation-aware tokenisation"
    description="The Hedera Token Service allows verified outcomes to be tokenised with clear links to the agents and controls responsible for their quality."
>}}

{{< /features-section >}}

{{< section-container class="py-16" >}}
## Architectural Principles

Independent Impact implements technologies that reinforce transparency and accountability at every layer of the impact lifecycle. The stack is intentionally modular so the platform can incorporate new methodologies, data sources, and assurance requirements without sacrificing integrity.

### Hedera Consensus Service

Hedera Consensus Service captures an immutable, ordered log of platform events. This journal confirms when artefacts were submitted, who evaluated them, and what decisions were taken. It underpins dispute resolution by providing a shared timeline of actions.

### Decentralised Identifiers and Verifiable Credentials

Participants manage verifiable digital identities using W3C Decentralised Identifiers. Evaluations, validations, and credentials issued through the platform are represented as W3C Verifiable Credentials, so any relying party can independently inspect provenance and assurance.

### IPFS and Fluree for Data Integrity

Artefacts associated with impact claims are pinned to IPFS, giving each document a content-derived address that proves its integrity. Fluree provides a cryptographically secured, time-travelable semantic database, allowing users to query current and historical states of projects, agents, and methodologies.

### Verifiable Compute with Jellyfish

Quantitative assessments often rely on complex calculations. Jellyfish executes these computations in a verifiable manner, producing reproducible outputs with clear provenance of the data and logic used.

### Tokenisation Pathways

Once an impact claim has passed through peer review and verification, it can be tokenised via the Hedera Token Service. Tokenisation links the reputation of creators, validators, and verifiers to the resulting assets, giving buyers confidence in both the process and its outcomes.
{{< /section-container >}}
