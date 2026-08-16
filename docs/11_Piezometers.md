# Existing Technology 11: Piezometers (Vibrating Wire & Casagrande)

> **Document Type:** Research & Benchmark Analysis  
> **Problem Statement ID:** SIH25071 | **Ministry of Mines** | **Category:** Software  
> **Prepared For:** Smart India Hackathon (SIH 2025)

---

## 1. Background & Working Principle

Piezometers measure pore-water pressure ($u$) inside rock mass joints and along potential slip planes.
* **Vibrating Wire Piezometer (VWP) Physics:** Water pressure against a stainless steel diaphragm alters the tension of an internal steel wire plucked by an electromagnetic coil:
  $$f = \frac{1}{2L} \sqrt{\frac{T}{m}}, \quad u = K(f_0^2 - f^2)$$
  where $f$ is resonant frequency, $T$ is wire tension proportional to water head, and $K$ is calibration factor.

```mermaid
flowchart LR
    A[Groundwater Infiltration in Highwall] -->|Hydrostatic Head on Diaphragm| B[Vibrating Wire Piezometer in Borehole]
    B -->|Resonant Frequency Shift Δf| C[Pore-Water Pressure u in kPa]
    C -->|Reduces Effective Normal Stress: σ' = σ - u| D[Direct Shear Strength Reduction]
```

---

## 2. Geotechnical Importance & Limitations

### Core Strength:
* **Measures the Primary Trigger of Failure:** Over 70% of open-cast slope failures in India are triggered by monsoon pore-water pressure buildup, which reduces effective normal stress ($\sigma' = \sigma - u$) and slashes shear strength ($\tau = c' + \sigma' \tan\phi'$).

### Limitations:
* **No Direct Kinematic Output:** Piezometers measure water pressure only. They cannot tell you if the rock is currently moving, sliding, or detaching.
* **Grout Permeability Lag:** Improper borehole grouting causes hydraulic response delays of days or weeks.

---

## 3. What is Doable & How We Adopt It for SIH25071

| Piezometer Concept | Traditional Usage | Proposed SIH25071 Implementation |
| :--- | :--- | :--- |
| **Static Thresholds** | Manual water level charts | **Live Dynamic FoS Coupling:** Real-time pore pressure feeds the Mohr-Coulomb stability engine to continuously update safety factors. |
| **Wireless Telemetry** | Manual weekly readings | Solar LoRa RS-485 nodes transmit pore pressure every 60 seconds directly into the AI pipeline. |

---

## 4. References
1. **Terzaghi, K.** (1943). *Theoretical Soil Mechanics*. John Wiley & Sons.
2. **Dunnicliff, J.** (1993). *Geotechnical Instrumentation for Monitoring Field Performance*.
