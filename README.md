# -movielens-20M-low-resource-pipeline-
A memory-efficient data engineering pipeline processing multi-million-row datasets (MovieLens scale) on an ultra-constrained local machine (4GB RAM) without cloud infrastructure.

# Low-Resource Big Data Pipeline: MovieLens Processing on Ultra-Constrained Hardware

## 📌 Project Description
In modern data engineering, heavy cloud infrastructure and high-end workstations (16GB to 32GB+ RAM) are often considered mandatory for processing large datasets. This project challenges that convention. It acts as a proof-of-concept demonstrating that **strict memory management, early filtering, and clean algorithmic optimization** can successfully process multi-million-row datasets (*MovieLens 20M scale*) on ultra-constrained local hardware.

Built to run entirely on a system with **4 GB RAM and an Intel Core i3 (1.2 GHz) processor**—matching the hardware capacity of a standard smartphone—this pipeline executes ingestion, deduplication, type casting, filtering, and export safely without encountering Out-Of-Memory (OOM) crashes.

---

## 💻 Hardware Environment & Constraints
* **Host Machine:** Standard Local Machine
* **System Memory (RAM):** 4 GB 
* **Processor:** Intel Core i3 (1.2 GHz)
* **Core Technology Stack:** R (`tidyverse`, `readr`), Data Pipeline Architecture, Data Cleaning & Optimization.

---

## 📊 Data Architecture & Pipeline Flow
The data architecture is explicitly designed to minimize intermediate dataframes and prevent memory overloads on low-RAM setups:

[ Raw Dataset Source (CSV) ]
│
▼
[ Chunked Streaming / Ingestion (read_csv) ]
▶ Loads data incrementally to control buffer usage on 4GB RAM.
│
▼
[ Deduplication Layer (distinct()) ]
▶ Strips redundant rows immediately to save memory space.
│
▼
[ Explicit Type Casting & Optimization ]
▶ Converts generic data formats to strict low-byte types (as.integer, as.numeric).
│
▼
[ Early Performance Filtering (movieId > 250 & rating > 2.5) ]
▶ Drops irrelevant noise at the earliest stage of execution.
│
▼
[ Column Projection / Selection (userId, movieId, rating) ]
▶ Discards unused metadata columns to shrink memory footprint.
│
▼
[ Optimized Persistence (write.csv) ]
▶ Clean, production-ready output saved locally for downstream analytics (SQL/Tableau).
