# Thiruppugazh-KG

Thiruppugazh-KG is a semantically annotated knowledge graph dataset constructed from the _Thiruppugazh_ corpus, a classical Tamil devotional literary work composed by the 14th-century saint-poet Arunagirinathar.

This repository provides the annotated dataset, knowledge graph resources, annotation schema, and supporting materials used for computational analysis of Tamil devotional literature.

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

| Attribute    | Details                         |
| ------------ | ------------------------------- |
| Title        | Thiruppugazh (திருப்புகழ்)      |
| Author       | Arunagirinathar (அருணகிரிநாதர்) |
| Century      | 15th century CE                 |
| Language     | Tamil                           |
| Genre        | Devotional / Bhakti poetry      |
| Deity        | Lord Murugan (Karthikeya)       |
| No. of Songs | 1,335                           |

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

## Repository Structure

```text
.
 dataset/
 thiruppugazh_kg.json
 schema.json
 sample_records.json

 neo4j/
 import/
 cypher_queries/
 graph_dump/

 annotation_guidelines/
 annotation_guidelines.pdf

 figures/
 knowledge_graph_figures/

 paper/
 ACL2026_camera_ready.pdf

 README.md
```

---

## Technology Stack

| Component        | Tool / Technology                            |
| ---------------- | -------------------------------------------- |
| Graph Database   | [Neo4j](https://neo4j.com/)                  |
| Graph Algorithms | Neo4j Graph Data Science (PageRank, Louvain) |
| Annotation       | Manual semantic annotation                   |
| Language         | Tamil (low-resource)                         |

## Getting Started

### Prerequisites

- Neo4j (4.0+)
- Python 3.8+ (for data processing scripts)
- JSON/YAML parsing libraries

### Quick Start

1. **Load the dataset**

   ```bash
   # Python example to load the dataset
   import json
   with open('dataset/thiruppugazh_kg.json', 'r') as f:
       data = json.load(f)
   ```

2. **Import into Neo4j**
   - Refer to `neo4j/import/` directory for import scripts
   - Use Cypher queries in `neo4j/cypher_queries/` for common operations

3. **Explore the data**
   - Review `dataset/sample_records.json` for example records
   - Consult `annotation_guidelines/` for understanding the schema

---

## Authors

- Garthigan Kumarasamy
- Jubeerathan Thevakumar
- Sathurgini Uthayakumar
- Disne Kajanath
- Narthana Sivalingam
- Uthayasanker Thayasivam

---

## Citation

If you use this dataset or framework in your research, please cite this work
(citation details to be added upon publication).

---

## Contact

For questions or contributions, please
Garthigan Kumarasamy
garthigank.25@cse.mrt.ac.lk
