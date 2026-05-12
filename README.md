# Thiruppugazh-KG

Thiruppugazh-KG is a semantically annotated knowledge graph dataset constructed from the _Thiruppugazh_ corpus, a classical Tamil devotional literary work composed by the 14th-century saint-poet Arunagirinathar.

This repository provides the annotated dataset, knowledge graph resources, annotation schema, and supporting materials used for computational analysis of Tamil devotional literature.

---

## Overview

The dataset contains semantic annotations for 1,335 Tamil devotional hymns, including:

- Named entities
- Devotional themes
- Mythological events
- Philosophical concepts
- Symbolic imagery
- Sacred locations
- Inter-entity relationships

Using these annotations, a Neo4j-based knowledge graph was constructed to support semantic querying, graph analytics, and digital humanities research.

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

## Dataset Contents

### `dataset/`

- **thiruppugazh_kg.json** - Complete annotated dataset with all 1,335 hymns
- **schema.json** - JSON schema defining the annotation structure
- **sample_records.json** - Sample records for reference

### `neo4j/`

- **import/** - CSV/JSON files for Neo4j import
- **cypher_queries/** - Pre-built Cypher queries for common graph operations
- **graph_dump/** - Database dump files

### `annotation_guidelines/`

- **annotation_guidelines.pdf** - Detailed annotation guidelines used for semantic labeling

### `figures/`

- **knowledge_graph_figures/** - Visualizations and diagrams of the knowledge graph

### `paper/`

- **ACL2026_camera_ready.pdf** - Peer-reviewed paper describing the dataset and methodology

---

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

If you use this dataset in your research, please cite:

```bibtex
@inproceedings{thiruppugazh2026,
  title={Thiruppugazh-KG: A Semantically Annotated Knowledge Graph Dataset of Classical Tamil Devotional Literature},
  author={Kumarasamy, Garthigan and Thevakumar, Jubeerathan and Uthayakumar, Sathurgini and Kajanath, Disne and Sivalingam, Narthana and Thayasivam, Uthayasanker},
  booktitle={Proceedings of the Sixth Workshop on Speech, Vision, and Language Technologies for Dravidian Languages},
  year={2026}
}
```

---

## Contact

For questions or contributions, please
Garthigan Kumarasamy
garthigank.25@cse.mrt.ac.lk
