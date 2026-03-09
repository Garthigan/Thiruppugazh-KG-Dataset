# Thiruppugazh-KG-Dataset

A knowledge graph (KG) dataset constructed from the *Thiruppugazh* corpus — a 15th-century collection of 1,335 Tamil devotional songs composed by **Arunagirinathar** in praise of Lord Murugan.

---

## Abstract

This research presents the construction of a knowledge graph from the Thiruppugazh corpus. Manual semantic annotations span entities, themes, mythological events, philosophical concepts, imagery, and sacred places, enabling graph-based analysis using **Neo4j**. The resulting KG reveals dominant devotional patterns and sacred geographies. Graph algorithms — including **PageRank** and **Louvain community detection** — identify central entities such as Murugan and prominent temples like Thiruchendur, and uncover answers to research questions on mythological distributions and thematic clusters in Tamil literature.

---

## Contributions

- **Annotated Dataset** — A novel, manually annotated dataset covering entities, themes, mythology, philosophy, imagery, and places across the Thiruppugazh corpus.
- **Murugan Devotional Knowledge Graph** — A structured KG representing the devotional, mythological, and geographic dimensions of the corpus.
- **Digital Humanities Framework** — A reusable framework for constructing knowledge graphs from classical religious texts, advancing computational studies in low-resource languages.

---

## Corpus

| Attribute | Details |
|-----------|---------|
| Title | Thiruppugazh (திருப்புகழ்) |
| Author | Arunagirinathar (அருணகிரிநாதர்) |
| Century | 15th century CE |
| Language | Tamil |
| Genre | Devotional / Bhakti poetry |
| Deity | Lord Murugan (Karthikeya) |
| No. of Songs | 1,335 |

---

## Annotation Schema

Semantic annotations cover the following categories:

- **Entities** — deities, saints, and named persons
- **Themes** — devotional and philosophical themes
- **Mythological Events** — stories and events from Hindu mythology
- **Philosophy** — spiritual and philosophical concepts
- **Imagery** — poetic and symbolic imagery
- **Places** — sacred geographies and temples (e.g., Thiruchendur, Palani)

---

## Knowledge Graph

The KG is implemented in **Neo4j** and modelled as a property graph. It supports:

- Querying relationships between entities, places, and themes
- Identifying structurally important nodes via **PageRank**
- Detecting thematic communities via **Louvain community detection**

### Key Findings

- **Murugan** is the most central entity in the devotional network.
- **Thiruchendur** is among the most prominent sacred sites referenced.
- Thematic clusters reflect distinct devotional, mythological, and philosophical sub-corpora.

---

## Technology Stack

| Component | Tool / Technology |
|-----------|------------------|
| Graph Database | [Neo4j](https://neo4j.com/) |
| Graph Algorithms | Neo4j Graph Data Science (PageRank, Louvain) |
| Annotation | Manual semantic annotation |
| Language | Tamil (low-resource) |

---

## Research Questions

1. What are the dominant devotional patterns in the Thiruppugazh corpus?
2. How are mythological events distributed across the songs?
3. What thematic clusters emerge from the corpus?
4. Which sacred geographies are most frequently referenced?

---

## Citation

If you use this dataset or framework in your research, please cite this work (citation details to be added upon publication).

---

## License

To be specified by the repository owner.
