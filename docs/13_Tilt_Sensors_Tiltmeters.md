# Existing Technology 13: Tilt Sensors & Tiltmeters

> **Document Type:** Research & Benchmark Analysis  
> **Problem Statement ID:** SIH25071 | **Ministry of Mines** | **Category:** Software  
> **Prepared For:** Smart India Hackathon (SIH 2025)

---

## 1. Background & Working Principle

MEMS (Micro-Electro-Mechanical Systems) bi-axial and tri-axial tiltmeters measure changes in gravitational acceleration ($\Delta g$) to compute angular rotation with high resolution (up to $0.001^\circ$).
* **Physical Principle:** Fixed to rock blocks, bench crests, or retaining fences to detect forward rotational toppling, backward rotation, and structural tilt.

```mermaid
flowchart LR
    A[Rock Mass Toppling / Rotation] -->|MEMS Accelerometer Axis Tilting| B[Gravitational Component Shift Δg]
    B -->|Trigonometric Inversion: θ = arcsin Δg/g| C[Triaxial Angular Rotation θx, θy]
    C -->|Wireless LoRa Mesh| D[Continuous Surface Rotational Kinematics]
```

---

## 2. Strengths & Limitations

### Advantages:
* **Ultra-Low Cost & Low Power:** Low-cost solid-state components (₹2,500 – ₹5,000/node) operating for 2–5 years on lithium batteries.
* **LoRa Mesh Compatible:** Easily deployed in high density across hazardous rock cliffs.

### Limitations:
* **Insensitive to Pure Translation:** If an entire rock slab slides down a planar joint without tilting, the tiltmeter reads $0^\circ$ rotation despite massive dangerous displacement.
* **Vibration Noise:** Blast shockwaves and haul truck rumbling cause transient tilt spikes.

---

## 3. What is Doable & How We Adopt It for SIH25071

| Tilt Concept | Conventional Usage | Proposed SIH25071 Implementation |
| :--- | :--- | :--- |
| **Hardware Nodes** | Expensive commercial telemetry | Custom ESP32 + SX1262 LoRa + MPU6050 nodes ($30/node) deployed in high density. |
| **Vibration Rejection** | Basic running average | **Edge Kalman Filter + Vision AI:** Fuses tilt telemetry with camera optical flow to confirm true rotation vs blast noise. |

---

## 4. References
1. **Intrieri, E., et al.** (2015). *Wireless sensor networks for landslide monitoring*. Landslides, 12(3), pp. 493–505.
