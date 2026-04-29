Independent Impact
Independent Impact is a platform that allows reporting, quantification and verification of human impact in a radically open and transparent manner.

The platform is open to anyone to act as a project implementer, validator, verifier, or methodology developer. All agents and methods, however, are subject to ongoing peer review by community members. Actions on the platform are governed by a hierarchy of reputation requirements.

Philosophy
Transparent, not prescriptive
Independent Impact is built on the recognition that no single impact accounting standard can meet the needs of everyone, everywhere. Requirements such as which impacts are quantified, which metrics are used, the level of assurance required, and the desired accuracy of estimates will always vary by user and use case.

The role of an impact accounting platform is therefore not to prescribe a specific set of outcomes, metrics, assurance levels, or estimation methods. Instead, it must be designed so that users can clearly understand what the tokenised impacts on the platform represent. With that clarity, users can make their own informed choices in line with their specific requirements.

Open but meritocratic
Independent Impact is founded on the ideal of mass participation in generating shared benefits for all. In principle, participation should be as open and as easy as possible. For the platform to be effective, however, it must also drive continual improvements in quality and uphold an ethos of truth-seeking and mutual respect.

The solution to the tension between openness and quality is reputation. Every agent and control (e.g. methodologies) on the platform carries reputation derived from ongoing community evaluation. Users gain reputation by making quality contributions—whether through project submissions, execution of activities, or participation in evaluation and verification.

The reputations of both the creators of an artefact and those who evaluated or verified it will be visible to potential buyers, ensuring accountability and fostering trust.

Immutable but accessible
The platform must be both secure and immutable. Technologies such as content-addressed storage and distributed ledger systems can provide guarantees of immutability for artefacts and transactions. At the same time, the philosophy of Independent Impact demands maximum transparency.

This means that anyone must be able to query all artefacts and events easily. The twin requirements of immutability and accessibility, therefore, drive architecture and technology choices for Independent Impact.

Technology
The core technical architecture of Independent Impact reflects and enables its philosophy. We have carefully chosen proven standards and components to ensure transparency, auditability, and long-term scalability:

Hedera Consensus Service for event journaling
W3C Decentralised Identifiers (DIDs) for identification
W3C Verifiable Credentials for credential issuance and verification
IPFS for immutable distributed document storage
Jellyfish for verifiable compute
Fluree as a cryptographically secured, immutable, time-travelable semantic database
Hedera Token Service for tokenisation of verified impacts
History
Aartum Whitepaper
What Independent Impact is today and what it will still become started with a vision articulated in the 2017 Aartum Whitepaper. The Aartum Whitepaper envisioned "It is conceivable that a state of affairs can come to exist where unique cryptographic representations of verified communal benefits function as a symbol of value in a way similar to how paper money represented gold at the time of the gold standard".

The Whitepaper identified the veracity of the data stored in the blockchain as the "basic problem that must be addressed in a blockchain-based ecosystem that tokenises real world outcomes" and set out an approach to support the quality of such data based on transparency, identity and reputation. Although Aartum envisioned an implementation on Hyperledger Sawtooth and focused on a cryptocurrency of which the value was derived from verified outcomes of communal benefits, the basic principles articulated in the Aartum Whitepaper remain valid and were taken over by Independent Impact in 2024.

AIA ontology suite
While developing Aartum, we realised that there was a need for a fundamental ontology for anthropogenic impact accounting to form the basis on which we can compare quantifications of human impact. In the context of the Climate Action and Accounting Special Interest Group of the Hyperledger Foundation (now Linux Foundation Decentralized Trust), we started contributing to the development of an ontology for anthropogenic impact accounting. The work culminated in the mid-2025 release of a suite of four ontologies: the Anthropogenic Impact Accounting Ontology (AIAO), the Impact Ontology, the Claim Ontology, and the Information Communication Ontology.

From Hyperledger Sawtooth to Hedera
After initial trials with Hyperledger Sawtooth, we started experimentation with the then very new Hedera Guardian. Our first major project was a cookstove policy, a field in which we have substantial experience. The Hedera Guardian Improved Cookstove Policy was published in August 2023.

The policy consisted of four subpolicies:

Improved Cookstove Policy (main)
Improved Cookstove Policy - Agent Application Subpolicy
Improved Cookstove Policy - PDD Validation Subpolicy
Improved Cookstove Policy - MR Verification Subpolicy
Independent Cookstove Standard
Working on implementing an improved cookstove using these four policies on the Guardian, we became aware of some limitations when using the Guardian UI for our use case. We then developed our own front-end while still using the Guardian API

Jellyfish
One of the needs that became very clear from our experience is the need for a verifiable compute solution. Jellyfish was our solution: A verifiable compute solution based on Hedera, R and IPFS.

Launch of Independent Impact
Adaptation methodology

Independent Impact namespace [AIAO extension]

Protocol

Methodology library

Current active features
PDD validation workflow

Data Explorer: Chatbot

Planned expansion
Methodology development workflow
Develop the reputation ecosystem
First-mile data collection apps