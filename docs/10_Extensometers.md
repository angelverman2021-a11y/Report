# Existing Technology 10: Extensometers (Multipoint Borehole MPBX & Wire Extensometers)

> **Document Type:** Research & Benchmark Analysis  
> **Problem Statement ID:** SIH25071 | **Ministry of Mines** | **Category:** Software  
> **Prepared For:** Smart India Hackathon (SIH 2025)

---

## 1. Background & Working Principle

Extensometers measure axial displacement between down-hole anchors or across surface tension cracks.
* **MPBX (Multi-Point Borehole Extensometer):** Fiberglass rods anchored at multiple depths (e.g., 10m, 25m, 50m) connect to vibrating-wire or potentiometric displacement transducers at the borehole collar.
* **Wire Extensometers:** A stainless steel wire anchored to an unstable crest passes over a spring-loaded pulley connected to a rotary sensor on stable ground.

```mermaid
flowchart LR
    A[Deep Anchors 10m, 30m, 50m] -->|Rigid Fiberglass Rods| B[Borehole Electronic Collar Head]
    B -->|Linear Variable Differential Transformer LVDT| C[Axial Rock Mass Dilation ΔL]
    C -->|Real-Time Threshold Switch| D[Tension Crack Opening Alert]
```

---

## 2. Strengths & Limitations

### Pros:
* **Sub-Millimeter Dilation Precision:** Measures rock mass separation with $\pm 0.01\text{ mm}$ accuracy.
* **Direct Real-Time Trigger:** Easily wired to simple threshold alarm switches.

### Cons:
* **Extreme Mechanical Fragility:** Surface wires frequently snap from falling rocks, heavy rain, animals, or haul trucks.
* **Anchor Loosening:** Blast vibrations cause anchor slippage, giving false stability readings.

---

## 3. What is Doable & How We Adopt It for SIH25071

| Extensometer Method | Traditional Approach | Proposed SIH25071 AI Innovation |
| :--- | :--- | :--- |
| **Physical Tension Wires** | Vulnerable mechanical wires | **Virtual Optical Extensometer:** High-zoom telephoto cameras track sub-pixel crack edge dilation non-contact. |
| **Borehole Rod Data** | Isolated standalone logger | Integrated via LoRa RS-485 bridge to feed the dynamic Factor of Safety model. |

---

## 4. References
1. **Sellers, E. J.** (2007). *Review of extensometer applications in deep mining excavations*. ACARP Report.
