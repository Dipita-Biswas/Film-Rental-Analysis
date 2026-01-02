# Film Rental Performance Analysis using SQL & Tableau

This project analyzes a relational film rental database using **SQL for data extraction, transformation, and KPI development**, and **Tableau for interactive dashboarding and insight communication**. The goal is to convert raw transactional data into business-ready insights that support decisions related to revenue performance, customer behavior, film demand, and store operations.

## Problem Statement
Transactional databases store large volumes of operational data but are not directly usable for business decision-making. This project addresses that gap by using SQL to create analytical datasets and Tableau to visualize key performance indicators, enabling stakeholders to quickly understand trends, identify top-performing films, and evaluate store-level performance.

## Dataset Description
The project uses a relational film rental database containing multiple interconnected tables, including:
- Film
- Category
- Inventory
- Rental
- Payment
- Customer
- Store

The data structure supports complex joins and aggregations required for analytical reporting.  

The database follows a normalized relational schema, with clearly defined primary and foreign key relationships across films, categories, inventory, rentals, payments, customers, staff, and stores, as illustrated in the entity-relationship diagram below.


<img width="1755" height="1684" alt="image" src="https://github.com/user-attachments/assets/a07e5355-4041-4696-8da8-af6a0d5c7e0f" />   

## Project Structure

## Project Objectives
- Design and build a SQL-based **Film Data Warehouse** by integrating data from multiple transactional tables.
- Transform raw rental and payment data into **KPI-ready analytical datasets** for business reporting.
- Use advanced SQL techniques (joins, aggregations, subqueries, conditional logic) to answer decision-driven business questions.
- Develop **Tableau visualizations and an executive dashboard** to communicate insights clearly to senior management.
- Support data-driven decisions related to **content acquisition, pricing strategy, inventory planning, and geographic expansion**.


## SQL: Data Warehouse 

To support analysis and dashboarding, I designed and created a **Film Data Warehouse** from the Sakila transactional database. The warehouse combines data from **6+ tables** (film, category, film_category, inventory, rental, payment, customer, store, address/city/country as needed) and computes business-relevant aggregates such as **rental counts, total revenue, average rental duration, and geographic demand patterns**. The final warehouse was exported from MySQL to an Excel/CSV file for Tableau visualizations.

### Data Warehouse Preview
Below is a preview of the first 25 rows of the final data warehouse:

<img width="1755" height="1684" alt="image" src="https://github.com/user-attachments/assets/bf289ff3-602d-41b8-ad6d-15a7eac2dd2f" />

### What the Film Data Warehouse Tracks
The Film Data Warehouse tracks film performance, rental trends, and revenue insights to help Sakila optimize movie selection, pricing, and inventory management. It consolidates key metrics like rental counts, revenue, average rental duration, and regional preferences to support data-driven decision-making.

### Key Insights Tracked
- **Film Popularity** – Identifies the most and least rented films by time and location  
- **Revenue Analysis** – Tracks top-grossing films and best-performing categories  
- **Rental Duration** – Measures how long customers keep each film  
- **Actor Influence** – Identifies actors starring in high-rented films  
- **Regional Trends** – Finds which film categories are popular in different countries  

### Business Benefits
1. **Better Film Selection** – Stock high-demand films and reduce underperformers  
2. **Optimized Pricing** – Adjust rental rates for high-grossing films and categories  
3. **Improved Customer Experience** – Personalize film recommendations by region  

## SQL: Queries on Data Warehouse

All SQL logic used to answer the questions below is documented in a single, well-commented file for reproducibility and review.  
**SQL file:** *(Link to be added)*

---

### Query 1: Top 5 Most Profitable Categories
**Business Question:** What film categories generate the highest total revenue?

**Why this matters:**  
Helps prioritize inventory investment, licensing decisions, and marketing spend toward the most profitable genres.

**Key Findings:**
- Sports generates the highest total revenue, indicating strong and consistent demand.
- Sci-Fi and Animation also perform strongly, highlighting customer interest in visually engaging content.
- Drama and Comedy remain reliable revenue drivers due to broad audience appeal.

---

### Query 2: Top 10 Films by Total Revenue
**Business Question:** Which individual films generate the highest total revenue?

**Why this matters:**  
Identifies flagship titles that can be prioritized for promotion, inventory availability, and bundling strategies.

**Key Findings:**
- Top-earning films span multiple genres, suggesting diverse customer preferences.
- Sports, Action, and Drama titles appear frequently among top performers.
- Niche films also generate strong revenue, indicating value in targeted content offerings.

---

### Query 3: Actors Appearing in High-Revenue Films
**Business Question:** Which actors appear most frequently in high-revenue films, and how much revenue do their films generate?

**Why this matters:**  
Star power influences rental demand. Identifying revenue-driving actors supports smarter licensing and marketing strategies.

**Key Findings:**
- Gina Degeneres leads in total revenue contribution, indicating strong box-office appeal.
- Top actors appear across multiple films and genres, suggesting broad audience reach.
- Both male and female actors contribute meaningfully to revenue-generating content.

---

### Query 4: Top Cities by Rental Volume
**Business Question:** Which cities rent the highest number of films?

**Why this matters:**  
Helps target high-demand locations with localized promotions, inventory allocation, and customer engagement strategies.

**Key Findings:**
- A small number of cities account for a disproportionately high number of rentals.
- Demand is strong across both large metropolitan and smaller regional cities.
- High-performing cities represent opportunities for targeted loyalty programs.

---

### Query 5: Most Rented Film in Each Category
**Business Question:** Which film has the highest number of rentals within each category?

**Why this matters:**  
Identifies category-level “hero titles” that can be featured in promotions and curated collections.

**Key Findings:**
- Many categories show ties among top-rented films, indicating shared customer interest.
- Demand within categories is spread across multiple strong titles rather than a single blockbuster.
- Maintaining variety within categories is critical to meeting customer preferences.

---

### Query 6: Highest-Grossing Film in Each Category
**Business Question:** Which film generates the highest total revenue within each category?

**Why this matters:**  
Supports premium pricing strategies, promotional placement, and content acquisition planning.

**Key Findings:**
- Several categories have multiple revenue leaders, indicating diversified spending.
- Revenue is not always driven by the most rented film, highlighting pricing effects.
- Bundling top-grossing films by category could increase incremental revenue.

---

### Query 7: Countries Generating the Highest Revenue
**Business Question:** Which countries contribute the most revenue from film rentals?

**Why this matters:**  
Informs geographic investment, localization strategy, and regional content planning.

**Key Findings:**
- India and China generate the highest total revenue, showing strong market potential.
- The US and Japan remain stable, high-value mature markets.
- Emerging markets present growth opportunities with localized offerings.

---

### Query 8: Revenue Contribution by Budget Category
**Business Question:** How do films of different budget levels contribute to total revenue?

**Why this matters:**  
Guides content acquisition strategy by balancing premium titles and cost-efficient content.

**Key Findings:**
- High-budget films generate the majority of total revenue.
- Mid-budget films contribute significantly and provide strong value.
- Low-budget films are numerous but generate limited revenue, supporting a selective long-tail strategy.

---

### Query 9: Distribution of Films Across Categories
**Business Question:** How is the film catalog distributed across categories?

**Why this matters:**  
Helps assess whether inventory mix aligns with customer demand and revenue contribution.

**Key Findings:**
- Inventory is relatively balanced across categories.
- Some high-revenue categories may be under-represented in film count.
- Comparing catalog share with revenue highlights optimization opportunities.

## Tableau: Visualizations & Dashboard 

This section presents five Tableau visualizations and one consolidated dashboard built on the **Film Data Warehouse**. The visuals highlight rental performance, revenue distribution, geographic trends, and customer preferences to support senior management decision-making across **content strategy, pricing, inventory, and market expansion**.

---

### Dashboard: Data-Driven Insights for Strategic Decision-Making in Film Rentals
The dashboard combines the five visualizations below into a single executive view. It enables leadership to quickly identify revenue drivers, category-level demand shifts, and geographic opportunities to optimize operations and growth strategy.

<img width="1755" height="1684" alt="image" src="https://github.com/user-attachments/assets/fc3e7a08-047a-43d1-bd0f-01f4812e35c6" />


---

### Geographic Revenue Insights
This visualization shows total revenue across countries. Bubble size represents revenue volume, and color distinguishes rental locations.

<img width="295" height="635" alt="image" src="https://github.com/user-attachments/assets/5d6b8143-ea7d-4573-8925-e3562a22effc" />


**Business Impact:**
- **Market Expansion:** Identifies high-revenue countries for strategic investment and growth.
- **Underperforming Regions:** Highlights low-revenue markets for targeted diagnostics (pricing, availability, competition).
- **Localized Marketing:** Supports region-specific campaigns and content curation.

**Management Decisions:**
- Increase marketing and content investment in top-performing countries.
- Investigate and address barriers in low-revenue regions (pricing, selection, store coverage).
- Consider partnerships or exclusive content bundles in high-growth markets.

---

### Monthly Rental Trends by Category
This stacked bar chart shows monthly rental volume over time segmented by film category, revealing demand shifts and seasonality.

<img width="435" height="412" alt="image" src="https://github.com/user-attachments/assets/db9266d5-1ce6-4136-9214-284ed47e8a18" />


**Business Impact:**
- **Seasonality Analysis:** Identifies peak demand periods for better planning.
- **Category Trends:** Tracks which genres rise or decline over time.
- **Demand Forecasting:** Supports inventory planning and promotional scheduling.

**Management Decisions:**
- Allocate advertising spend to peak months and categories with momentum.
- Expand catalog depth in consistently high-demand genres.
- Use promotions or discounts during off-peak months to stabilize revenue.

---

### Rental Performance by Genre
This treemap/heatmap shows rental volume by genre. Larger areas represent categories with higher rental activity.

<img width="468" height="285" alt="image" src="https://github.com/user-attachments/assets/0aec42bb-9e4e-4b1c-9021-2482b12563d7" />


**Business Impact:**
- **Content Strategy Optimization:** Informs licensing priorities by customer demand.
- **Personalized Recommendations:** Supports recommendation logic using genre preference signals.
- **Revenue Optimization:** Guides investment in genres with strong engagement.

**Management Decisions:**
- Prioritize licensing and featuring high-performing genres.
- Reassess underperforming categories (refresh catalog, reposition, or reduce spend).
- Use genre insights to improve discovery and customer retention.

---

### Top 5 Most Rented Films
This visualization highlights the five most rented films. Bubble size represents total rentals.

<img width="373" height="349" alt="image" src="https://github.com/user-attachments/assets/783f8e38-bd46-4645-9839-7bced88682a7" />


**Business Impact:**
- **Customer Engagement:** Reveals what customers consistently choose.
- **Recommendation Systems:** Enables “similar titles” promotion strategies.
- **Licensing & Negotiation:** Strengthens negotiation leverage with distributors.

**Management Decisions:**
- Feature top-rented films prominently to drive conversion.
- Secure continued licensing or exclusivity for highest-demand titles.
- Bundle similar films to increase rental frequency.

---

### Top 10 Revenue-Generating Films
This chart highlights the top ten films contributing the most to total revenue.

<img width="468" height="279" alt="image" src="https://github.com/user-attachments/assets/3352ae2d-9e60-428e-9dcd-76a7054eceb0" />


**Business Impact:**
- **Maximizing Profitability:** Identifies titles that justify premium placement or pricing.
- **Content Acquisition:** Guides purchasing of similar high-revenue films.
- **Bundling Strategy:** Enables pairing top and mid-tier films to lift overall sales.

**Management Decisions:**
- Apply premium pricing or featured placement to top revenue-driving films.
- Invest in similar titles (genre, actors, themes) to replicate success.
- Bundle lower-performing films with top earners to improve catalog performance.

## Key Insights & Business Recommendations

- **Revenue is highly concentrated in a few categories (Sports, Sci-Fi, Animation).**  
  → Prioritize licensing, inventory allocation, and marketing spend toward these high-performing genres to maximize ROI.

- **A small set of films drives a disproportionate share of total rentals and revenue.**  
  → Feature these “hero titles” prominently on the platform and bundle them with mid-performing films to lift overall catalog performance.

- **High-budget films generate the majority of revenue, while mid-budget films provide strong supporting returns.**  
  → Adopt a tiered content acquisition strategy: invest heavily in premium titles, maintain a strong mid-budget pipeline, and selectively curate low-budget films for niche audiences.

- **Rental demand varies significantly by geography, with certain countries and cities emerging as high-value markets.**  
  → Use localized pricing, promotions, and content curation strategies to deepen penetration in top-performing regions and unlock growth in emerging markets.

- **Customer preferences are diverse across genres, with demand spread across multiple strong titles rather than a single blockbuster per category.**  
  → Maintain a balanced and well-curated content library to ensure availability, reduce stockout risk, and improve customer satisfaction.

- **Seasonal and temporal patterns affect rental behavior across categories.**  
  → Align marketing campaigns, promotions, and inventory planning with peak demand periods while using discounts or bundles to stimulate off-peak rentals.

- **Actor presence correlates with higher-performing films.**  
  → Leverage actor-level insights to guide licensing decisions and design actor-focused collections or promotional campaigns.












