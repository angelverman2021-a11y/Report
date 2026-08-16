# Existing Technology 17: Weather Stations (Automated Micro-Weather Stations - AWS)

> **Document Type:** Research & Benchmark Analysis  
> **Problem Statement ID:** SIH25071 | **Ministry of Mines** | **Category:** Software  
> **Prepared For:** Smart India Hackathon (SIH 2025)

---

## 1. Background & Working Principle

Automated Weather Stations (AWS) installed along the pit rim continuously log atmospheric variables:
* **Parameters Monitored:** Rainfall intensity ($I$ in $\text{mm/hr}$), cumulative precipitation, ambient temperature, relative humidity, barometric pressure, and wind speed.
* **Rainfall Threshold Physics:** Rainfall infiltration reduces matrix suction and increases pore water pressure. Models use Caine intensity-duration power laws:
  $$I = \alpha \cdot D^{-\beta}$$
  and Antecedent Moisture Index (AMI) over a 7-day rolling window to quantify rock mass water saturation.

```mermaid
flowchart LR
    A[Micro-Weather Station Rain Gauge] -->|Real-Time Tipping Bucket mm/hr| B[Rainfall Infiltration Model]
    B -->|7-Day Rolling Summation| C[Antecedent Moisture Index AMI]
    C -->|Dynamically Lowers Slope FoS| D[Automated Sensitivity Scaling for Vision/IoT]
```

---

## 2. Strengths & Limitations

### Advantages:
* **Monitors Primary Failure Trigger:** Monsoon cloudbursts trigger over 70% of open-cast slope collapses in India.
* **Low Capex & High Durability:** Weather stations cost ₹30,000 – ₹1.5 Lakh and operate reliably for years.

### Limitations:
* **Indirect Proxy Only:** Rain alone does not predict *which* bench will fail; requires geotechnical spatial coupling.

---

## 3. What is Doable & How We Adopt It for SIH25071

| Weather Feature | Conventional Usage | Proposed SIH25071 Implementation |
| :--- | :--- | :--- |
| **Rainfall Trigger** | Passive environmental logging | **Dynamic AI Sensitivity Booster:** When rainfall rate $> 15\text{ mm/hr}$, AI automatically boosts optical tracking sensitivity and wakes IoT tilt nodes into 10 Hz burst mode. |

---

## 4. References
1. **Caine, N.** (1980). *The rainfall intensity-duration control of shallow landslides and debris flows*. Geografiska Annaler.
