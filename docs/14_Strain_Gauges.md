# Existing Technology 14: Strain Gauges

> **Document Type:** Research & Benchmark Analysis  
> **Problem Statement ID:** SIH25071 | **Ministry of Mines** | **Category:** Software  
> **Prepared For:** Smart India Hackathon (SIH 2025)

---

## 1. Background & Working Principle

Foil and vibrating-wire strain gauges measure microscopic structural deformation ($\mu\epsilon = \Delta L/L$) when bonded to rock surfaces, rock bolts, steel tendons, or shotcrete linings.
* **Piezoresistive Physics:** Mechanical stretching of a metallic foil changes its electrical resistance:
  $$\frac{\Delta R}{R} = GF \cdot \varepsilon$$
  where $GF$ is the Gauge Factor (~2.0 for constantan alloy).

```mermaid
flowchart LR
    A[Rock Bolt / Anchor Tendon Tension] -->|Micro-Deformation ΔL| B[Foil / Vibrating-Wire Strain Gauge]
    B -->|Wheatstone Bridge Voltage Shift| C[Micro-Strain Telemetry με]
    C -->|Calculates Tensile Stress: σ = E * ε| D[Support Yield Load Warning]
```

---

## 2. Strengths & Limitations

### Advantages:
* **Support Load Diagnostics:** Directly reveals whether rock bolts or cable anchors are reaching their ultimate tensile strength before snapping.

### Limitations:
* **Hyper-Localized:** Measures deformation over a 50 mm strip; completely blind to adjacent unbolted rock masses.
* **Environmental Debonding:** Heat, moisture, and blast vibrations cause adhesive failure from rock faces.

---

## 3. What is Doable & How We Adopt It for SIH25071

| Strain Gauge Concept | Traditional Method | Proposed SIH25071 AI Implementation |
| :--- | :--- | :--- |
| **Rock Bolt Health** | Standalone analog strain reader | Integrated via LoRa RS-485 bridge to feed the **Structural Support Health Index** into the AI engine. |

---

## 4. References
1. **Stillborg, B.** (1994). *Professional Users Handbook for Rock Bolting*. Trans Tech Publications.
