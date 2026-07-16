# Wonderla Visitor Revenue & Customer Segmentation Analytics

End-to-end analytics project built for the Wonderla Data Analyst —Marketing & Growth pre-interview assignment.
SQL for KPI analysis, Python for data prep and customer value scoring, and Power BI for a two-page stakeholder dashboard.

> **Dataset note:** This project uses a synthetic visitor dataset
> > (3,000 records) that I generated myself, since I did not have access to Wonderla's actual visitor data. It's structured to reflect a realistic multi-park visitor revenue and engagement scenario, and was built to demonstrate a complete analytics workflow — data cleaning, SQL aggregation, Python-based scoring and hypothesis testing, and BI dashboarding — end to end.

## Business framing

Wonderla's marketing and growth teams need visibility into which customer segments, acquisition channels, and pricing strategies actually drive revenue and retention, rather than applying broad, undifferentiated campaigns. Without segment- and channel-level analysis, marketing spend risks being allocated inefficiently, and early signs of customer disengagement go unaddressed until they show up as lost revenue.

## Repo structure:
<img width="455" height="224" alt="image" src="https://github.com/user-attachments/assets/f1b38eb8-77fb-4aea-8385-8824c1a700e6" />



## How to reproduce

1. **Python — clean and score the data:**
```bash
   pip install pandas
   python "python/Python-scoring layer.py"
```
   Reads the raw dataset, writes the scored output used by Power BI.

2. **SQL:**
   The table was created using SQL Server Management Studio's **Import Flat File** wizard directly against the raw CSV/Excel export, rather
   than a manual `CREATE TABLE` script — so this repo's `.sql` file contains the analysis queries only. To reproduce: import 
   `data/raw/wonderla_synthetic_visitor_data` via the Import Flat File wizard, then run the queries in `sql/Wanderla_Derived_Metrics.sql`
   against the resulting table.

3. **Power BI:**
   Open `powerbi/Assignment.pbix` in Power BI Desktop. If the data source path doesn't resolve, repoint it to    `data/processed/wonderla_scored.xlsx`.

## Key insights

1. **Revenue is concentrated in a few segments.** School/College Group bookings contribute 44.8% of total revenue — the single largest
   revenue driver in the dataset.
2. **Referral is the highest-value acquisition channel.** Referral bookings generate the highest revenue per booking (₹30,717) of any
   campaign source, ahead of both organic and paid search, despite having one of the lowest booking volumes.
3. **At-risk customers are a broad-based, measurable segment.** 707 of 3,000 customers (23.6%) are flagged at-risk, with meaningfully lower
   satisfaction (2.55 vs 3.55) and lower average revenue (₹23,155 vs ₹27,634) than the remaining 2,293.
4. **Discounting is not a reliable lever.** Statistical testing found no meaningful relationship between discount percentage and either
   customer satisfaction (r = 0.0155) or total revenue (r = -0.0071).
5. **A composite value score cleanly separates high- and low-value customers**, with the top tier generating over 10x the average revenue of the bottom tier. Note: the score is weighted 60% on revenue rank, so this separation is partly definitional rather than a fully independent finding.

## Business impact

This analysis gives Wonderla's marketing team a concrete basis for reallocating effort: shifting incentive spend toward referral generation rather than broad paid acquisition, treating the ~24% at-risk customer base as a defined retention target, and avoiding blanket discounting as a satisfaction or revenue lever.

## Tools

SQL Server (T-SQL) · Python (pandas) · Power BI

## Limitations

This is a single-snapshot synthetic dataset — one row per customer, no repeat-visit history, so retention/frequency metrics are reported as
given labels rather than derived from behavior over time. There's also no funnel/impression data, so "conversion rate" isn't measurable — only
completed-booking channel mix.
