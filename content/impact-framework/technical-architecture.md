---
title: "Technical Architecture"
slug: "technical-architecture"
description: "Independent Impact combines decentralised identity, verifiable data, and distributed compute to make impact accounting trustworthy and auditable."
layout: "frameless"
aliases:
  - /features/platform-architecture/
---

{{< features-section
    title="Technical Architecture"
    description="Independent Impact combines decentralised identity, verifiable data, and distributed compute to safeguard integrity across the impact lifecycle."
>}}

{{< feature
    title="Hedera Consensus Service"
    description="Event journaling on Hedera provides a tamper-evident record of submissions, evaluations, and verifications across the platform."
    features="Immutable event history,Transparent sequencing of actions,Low-latency consensus"
    imagePosition="right"
>}}

{{< feature
    title="W3C Decentralised Identifiers"
    description="DIDs anchor every participant’s identity, linking actions to accountable agents while keeping the system open to new entrants."
    features="Standards-based identifiers,Interoperable agent onboarding,Verifiable agent controls"
    imagePosition="right"
>}}

{{< feature
    title="W3C Verifiable Credentials"
    description="Verifiable credentials encode evaluations, validations, and impact claims so that downstream users can trust the provenance of every assertion."
    features="Cryptographically signed attestations,Portable credentials,Selective disclosure for relying parties"
    imagePosition="right"
>}}

{{< feature
    title="IPFS for Artefacts"
    description="Impact documentation lives in content-addressed storage, ensuring artefacts stay accessible and immutable long after issuance."
    features="Permanent artefact references,Peer-to-peer distribution,Integrity checking through hashes"
    imagePosition="right"
>}}

{{< feature
    title="Jellyfish Verifiable Compute"
    description="Deterministic verification pipelines executed with Jellyfish make quantitative assessments reproducible and auditable."
    features="Transparent calculation workflows,Provenance for computational steps,Extensible verification logic"
    imagePosition="right"
>}}

{{< feature
    title="Fluree Semantic Database"
    description="Fluree’s cryptographically secured, time-travelable graph keeps the platform’s knowledge base coherent while preserving historical context."
    features="Traceable data lineage,Granular access controls,Immutable version history"
    imagePosition="right"
>}}

{{< feature
    title="Hedera Token Service"
    description="Verified impacts can be tokenised, making it possible to transact on outcomes whose provenance and assurance are transparent to every buyer."
    features="Programmable impact tokens,Reputation-aware issuance,Integration with broader ecosystems"
    imagePosition="right"
>}}

{{< /features-section >}}

{{< feature-paragraph
    title="Architectural Principles"
    width="max-w-4xl"
    align="left"
    padding="py-8 sm:py-12"
>}}
Independent Impact implements technologies that reinforce transparency and accountability at every layer of the impact lifecycle. The stack is intentionally modular so the platform can incorporate new methodologies, data sources, and assurance requirements without sacrificing integrity.
{{< /feature-paragraph >}}

{{< feature-paragraph
    title="Hedera Consensus Service"
    width="max-w-4xl"
    align="left"
    padding="py-8 sm:py-12"
>}}
Hedera Consensus Service captures an immutable, ordered log of platform events. This journal confirms when artefacts were submitted, who evaluated them, and what decisions were taken. It underpins dispute resolution by providing a shared timeline of actions.
{{< /feature-paragraph >}}

{{< feature-paragraph
    title="Decentralised Identifiers and Verifiable Credentials"
    width="max-w-4xl"
    align="left"
    padding="py-8 sm:py-12"
>}}
Participants manage verifiable digital identities using W3C Decentralised Identifiers. Evaluations, validations, and credentials issued through the platform are represented as W3C Verifiable Credentials, so any relying party can independently inspect provenance and assurance.
{{< /feature-paragraph >}}

{{< feature-paragraph
    title="IPFS and Fluree for Data Integrity"
    width="max-w-4xl"
    align="left"
    padding="py-8 sm:py-12"
>}}
Artefacts associated with impact claims are pinned to IPFS, giving each document a content-derived address that proves its integrity. Fluree provides a cryptographically secured, time-travelable semantic database, allowing users to query current and historical states of projects, agents, and methodologies.
{{< /feature-paragraph >}}

{{< feature-paragraph
    title="Verifiable Compute with Jellyfish"
    width="max-w-4xl"
    align="left"
    padding="py-8 sm:py-12"
>}}
Quantitative assessments often rely on complex calculations. Jellyfish executes these computations in a verifiable manner, producing reproducible outputs with clear provenance of the data and logic used.
{{< /feature-paragraph >}}

{{< feature-paragraph
    title="Tokenisation Pathways"
    width="max-w-4xl"
    align="left"
    padding="py-8 sm:py-12"
>}}
Once an impact claim has passed through peer review and verification, it can be tokenised via the Hedera Token Service. Tokenisation links the reputation of creators, validators, and verifiers to the resulting assets, giving buyers confidence in both the process and its outcomes.
{{< /feature-paragraph >}}
