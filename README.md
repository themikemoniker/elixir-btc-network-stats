# 🪙 Bitcoin Mining Profitability Dashboard

A real-time **Elixir + Phoenix LiveView** web application that tracks and analyzes **Bitcoin mining metrics** such as network difficulty, hashrate, BTC price, and profitability ratios for miners.

The project is developed in **stages**, each producing a functional, self-contained application — evolving from a basic metrics viewer to a full analytics platform with real-time updates, user customization, and alerts.

---

## 🚀 Overview

**Tech Stack:**  
- Elixir + Phoenix (LiveView, PubSub, Ecto)
- PostgreSQL
- Oban (background jobs)
- Req (HTTP client)
- Chart.js or LiveView hooks for charts
- Fly.io or Gigalixir for deployment

**Estimated Duration:** 5–6 weeks (10–15 hrs/week)  
**Goal:** Build a complete, production-ready web app for monitoring Bitcoin mining profitability in real-time.

---

## 🧭 Roadmap

| Stage | Focus | Duration | Deliverable |
|-------|--------|-----------|-------------|
| **1. MVP** | Fetch & display Bitcoin network stats | ~1 week | Static metrics dashboard |
| **2. Real-Time Data** | Background jobs + live charts | ~1.5 weeks | Auto-updating dashboard with historical charts |
| **3. Profitability Analytics** | Derived metrics & ratios | ~1.5 weeks | Mining profitability analytics dashboard |
| **4. User Customization** | Auth + personalized analytics | ~1 week | User-specific profitability dashboard |
| **5. Alerts & Deployment** | Notifications + production | ~1 week | Full production-ready app with alerts |

---

## 🪜 Stage Details & Tasks

### 🟢 Stage 1 — MVP: Bitcoin Network Metrics Dashboard

**Goal:** Fetch Bitcoin metrics and display them on a simple Phoenix LiveView dashboard.

**Duration:** ~1 week

**Tasks**
- [ ] Setup Phoenix project (`mix phx.new mining_insights`)
- [ ] Add dependencies (`req`, `ecto_sql`, `phoenix_live_view`)
- [ ] Create `Crypto.Metric` schema and migration
- [ ] Implement `Crypto.Fetcher` to pull:
  - Difficulty
  - Hashrate
  - BTC price
- [ ] Store data in PostgreSQL
- [ ] Build LiveView page with a “Refresh” button
- [ ] Format and display metrics neatly

**Deliverable:**  
Basic Phoenix app displaying Bitcoin metrics fetched from APIs.

---

### ⚡ Stage 2 — Real-Time Updates + Historical Data

**Goal:** Automate data collection and visualize time-series metrics live.

**Duration:** ~1.5 weeks

**Tasks**
- [ ] Add `Oban` for scheduled background jobs
- [ ] Implement `Crypto.FetchWorker` (runs every 5 mins)
- [ ] Save all metrics with timestamps
- [ ] Use `Phoenix.PubSub` to push live updates
- [ ] Add charts for:
  - Difficulty over time
  - Hashrate over time
  - BTC price over time
- [ ] Add time filters (24h, 7d)
- [ ] Write integration tests for workers

**Deliverable:**  
Real-time dashboard with automated updates and live charts.

---

### 🧮 Stage 3 — Derived Mining Profitability Analytics

**Goal:** Compute and visualize profitability ratios and derived metrics.

**Duration:** ~1.5 weeks

**Tasks**
- [ ] Create `ProfitabilityMetric` schema/table
- [ ] Implement `Analytics.Calculator`:
  - Hashprice (USD/TH/s/day)
  - Profit margin estimate
  - Difficulty-to-price ratio
- [ ] Schedule periodic analytics computation
- [ ] Chart profitability metrics
- [ ] Add “Mining Profitability Index” section
- [ ] Write tests for calculation logic

**Deliverable:**  
Dashboard showing live mining profitability metrics and trends.

---

### ⚖️ Stage 4 — User Customization & Interaction

**Goal:** Add user accounts and personalized profitability analytics.

**Duration:** ~1 week

**Tasks**
- [ ] Generate authentication (`mix phx.gen.auth`)
- [ ] Create `user_settings` schema:
  - Electricity cost ($/kWh)
  - Miner efficiency (J/TH)
- [ ] Add LiveView form to edit settings
- [ ] Compute personalized profitability:

revenue = hashprice_usd * hashrate_user
cost = power_usage * electricity_cost
profit = revenue - cost

- [ ] Store user-specific profitability
- [ ] Display personalized results

**Deliverable:**  
Interactive, user-specific mining profitability dashboard.

---

### 🔔 Stage 5 — Alerts, History & Deployment

**Goal:** Add notifications, historical analytics, and deploy to production.

**Duration:** ~1 week

**Tasks**
- [ ] Implement alert system:
- Email / webhook if profitability < threshold
- [ ] Cache recent metrics with ETS or ConCache
- [ ] Add historical analytics (7d / 30d averages)
- [ ] Add trend indicators (green/red arrows)
- [ ] Prepare for deployment:
- `mix release`
- Deploy to Fly.io or Gigalixir
- [ ] Add optional `/api/metrics` endpoint

**Deliverable:**  
Production-ready app with live alerts, historical insights, and deployment pipeline.

---

## 🧩 Development Flow

1. Start with Stage 1 and get a working MVP.  
2. Commit and tag each stage (`v1-mvp`, `v2-realtime`, etc.).  
3. Test and document new features as you go.  
4. Work iteratively with AI tools for:
 - Generating schema modules
 - Writing API clients
 - Building LiveView components
 - Optimizing queries

---

## 🧠 Key Elixir Concepts Practiced

| Concept | Used In |
|----------|----------|
| `GenServer` | Background data fetching |
| `Oban` | Scheduled jobs & retries |
| `Phoenix LiveView` | Real-time dashboard |
| `Ecto` | Database modeling & queries |
| `PubSub` | Live updates |
| `ETS` / `ConCache` | Caching |
| `Mix Releases` | Deployment |

---

## 💡 Future Enhancements

- Support for multiple coins (LTC, Kaspa)
- API endpoints for third-party integrations
- Miner profitability comparisons (ASIC vs GPU)
- Integration with Luxor Hashrate Index API

---

## 🧰 Setup & Run

```bash
git clone https://github.com/<yourusername>/mining_insights.git
cd mining_insights

mix deps.get
mix ecto.setup
mix phx.server
visit http://localhost:4000

