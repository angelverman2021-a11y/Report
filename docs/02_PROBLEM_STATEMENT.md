# 02. Problem Statement & Mining Context

> **Document Type:** Master Research & Architecture Report  
> **Problem Statement ID:** SIH25071  
> **Problem Statement Title:** AI-Based Rockfall Prediction and Alert System for Open-Pit Mines  
> **Organization:** Ministry of Mines | **Category:** Software | **Theme:** Disaster Management  
> **Target System:** MINE-SAFE AI Platform  
> **Target File:** `docs/02_PROBLEM_STATEMENT.md`

---

## 1. Background & Operational Significance

India is one of the world's leading producers of metallic and non-metallic minerals, including coal, iron ore, bauxite, limestone, and zinc. Over **80% of India's total mining production is extracted via open-cast (surface) mining methods**, characterized by deep, terraced bench excavations extending hundreds of meters below ground surface.

In these environments, **rockfalls, bench failures, and large-scale highwall collapses** represent the single most frequent and lethal geomechanical hazard. A sudden release of rock mass—ranging from individual detached boulders ($0.5\text{ to } 5\text{ m}^3$) to multi-bench mass failures ($>50,000\text{ m}^3$)—poses severe operational and life-safety risks:

```
+---------------------------------------------------------------------------------------------------+
|                            OPEN-PIT SLOPE HAZARD IMPACT SPECTRUM                                  |
+---------------------------------------------------------------------------------------------------+
|  1. HUMAN CASUALTIES: Direct impact on heavy machinery operators, drillers, and haul truck drivers|
|  2. EQUIPMENT DAMAGE: Destruction of multi-crore electric rope shovels, excavators, and dumpers.   |
|  3. HAUL ROAD BLOCKAGE: Severing primary transportation corridors, halting entire pit production. |
|  4. ECONOMIC LOSSES: Unplanned mine shutdowns costing between ₹50 Lakhs to ₹5 Crores per day.     |
|  5. REGULATORY SHUTDOWNS: DGMS statutory inquiries and potential permanent lease cancellation.    |
+---------------------------------------------------------------------------------------------------+
```

---

## 2. Regulatory & Statutory Framework (DGMS Guidelines)

In India, mine safety standards are governed by the **Mines Act, 1952**, the **Coal Mines Regulations (CMR, 2017)**, and the **Metalliferous Mines Regulations (MMR, 1961)**, enforced by the **Directorate General of Mines Safety (DGMS)** under the Ministry of Labour & Employment.

### Key Statutory Mandates:
* **DGMS (Tech) Circular No. 02 of 2020:** Mandates scientific slope stability monitoring in all deep open-cast mines (depth $>50\text{ m}$) using continuous or regular instrumentation.
* **Statutory Responsibility:** Under Indian law, the statutory responsibility for slope stability and personnel evacuation resides strictly with the certified **Mine Manager** and appointed **Geotechnical Officers**. Any automated system must function as a **decision-support and early-warning tool**, preserving the legal chain of command.
* **Trigger Action Response Plans (TARP):** Mines are required to establish predefined, standardized action tiers linked to geotechnical deformation thresholds to ensure orderly evacuation before structural collapse occurs.

---

## 3. Physical & Environmental Failure Triggers

Slope instability in open-pit mines is governed by complex, coupled interactions between geological structures, mechanical stress redistributions, hydrogeology, and dynamic shocks:

```
                         Kinematic Failure Trigger Hierarchy
                                         ▲
                                        / \
                                       /   \  Dynamic Triggers (Blasting PPV, Monsoonal Storms)
                                      /─────\
                                     /       \  Hydrogeological Pressurization (Pore Pressure u)
                                    /─────────\
                                   /           \  Progressive Rock Mass Creep & Tension Cracking
                                  /─────────────\
                                 /               \  Static Geological Weakness (Joints, Faults, RMR)
                                └─────────────────┘
```
*Figure 2.1: Physical hierarchy of factors leading to open-cast rock slope failure.*

1. **Geological Discontinuities `[EXISTING]`:** Pre-existing planes of mechanical weakness—including joints, faults, bedding planes, and foliation—determine kinematically permissible failure modes (**planar slide, wedge failure, toppling, or raveling rockfall**).
2. **Hydro-Mechanical Coupling `[EXISTING]`:** Rainwater infiltration into open tension cracks builds hydrostatic cleft pressure, reducing Terzaghi effective stress ($\sigma' = \sigma - u$) along critical shear planes and causing rapid strength degradation.
3. **Mining Excavation Stress Redistribution `[EXISTING]`:** As benches are excavated, confining stresses are removed from the rock mass, inducing stress concentrations at the bench toe and tensile stress release at the bench crest.
4. **Production Blasting Shocks `[EXISTING]`:** Dynamic ground vibrations from heavy production blasts subject fractured rock blocks to transient peak accelerations that trigger sudden detachments.

---

## 4. Current Industry State & The Need for Innovation

While large Tier-1 mines in India deploy specialized instrumentation, the broader mining sector faces severe technological bottlenecks:

```
+---------------------------------------------------------------------------------------------------+
|                        THE THREE DILEMMAS OF EXISTING SLOPE MONITORING                            |
+---------------------------------------------------------------------------------------------------+
|  1. THE COST BARRIER: High-end radar systems cost ₹5+ Crores, excluding over 95% of small/medium  |
|     mines from acquiring continuous real-time slope monitoring instrumentation.                   |
|  2. THE SPATIAL BLINDNESS BARRIER: Point sensors (prisms, crackmeters) monitor discrete spots; a   |
|     deadly failure 5 meters away occurs with zero warning.                                        |
|  3. THE HUMAN VIGILANCE BARRIER: Manual CCTV monitoring suffers severe operator fatigue, while    |
|     disconnected vendor spreadsheets delay emergency evacuation orders by 15–45 minutes.          |
+---------------------------------------------------------------------------------------------------+
```

---

## 5. Scope of the SIH25071 Challenge

The **Smart India Hackathon Problem Statement (SIH25071)** specifically tasks student innovators with building an **AI-Based Rockfall Prediction and Alert System for Open-Pit Mines**.

Our response to this challenge is **MINE-SAFE AI**: a software platform designed to ingest multi-source monitoring data, apply physics-informed feature engineering, compute explainable risk scores, project dynamic risk fields onto an interactive 3D mine model, and automate TARP early-warning alerts to protect human lives and equipment across the Indian mining sector.
