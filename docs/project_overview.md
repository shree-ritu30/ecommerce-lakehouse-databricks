# Project Overview

## Objective
Build an end-to-end e-commerce lakehouse that ingests raw transactional data, applies data-quality transformations, creates analytical Gold tables, processes historical order events with Structured Streaming, and orchestrates the pipeline with Databricks Jobs.

## Business questions
- How does delivered-order revenue change over time?
- Which product categories generate the most revenue?
- Which sellers contribute the most revenue?
- How long do deliveries take, and how does delivery performance vary by order status?

## Scope note
The streaming component replays historical Olist records from files. It demonstrates Structured Streaming and checkpointing, but is not a live production event integration.
