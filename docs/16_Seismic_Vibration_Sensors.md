# Existing Technology 16: Seismic & Vibration Sensors (Microseismic & Blast Geophones)

> **Document Type:** Research & Benchmark Analysis  
> **Problem Statement ID:** SIH25071 | **Ministry of Mines** | **Category:** Software  
> **Prepared For:** Smart India Hackathon (SIH 2025)

---

## 1. Background & Working Principle

Triaxial geophones and piezoelectric accelerometers monitor two critical vibrational dynamic regimes in open-pit mines:
1. **Blast Vibration Monitoring:** Measures Peak Particle Velocity ($\text{PPV}$ in $\text{mm/s}$) to evaluate compliance with DGMS blast safety standards:
   $$\text{PPV} = K \left(\frac{D}{\sqrt{Q}}\right)^{-\beta}$$
2. **Microseismic Acoustic Emissions (AE):** Records high-frequency stress waves (100 Hz – 10 kHz) generated when micro-fractures propagate inside the rock mass prior to macroscopic slope failure.

```mermaid
flowchart LR
    A[Production Blast or Micro-Fracturing] -->|Elastic P and S Stress Waves| B[Triaxial Geophone Array]
    B -->|High-Speed DAQ kHz Sampling| C[Signal Spectrogram & PPV Analysis]
    C -->|1D-CNN Noise Filter| D[Separates Blast vs Machinery vs Rock Micro-Cracking]
```

---

## 2. Strengths & Limitations

### Pros:
* **True Precursor Detection:** Detects internal micro-cracking hours before physical displacement appears on highwall surfaces.
* **Blast Shock Assessment:** Directly measures the dynamic shaking degrading bench factor of safety.

### Cons:
* **Overwhelming Machinery Noise:** 100-tonne haul trucks, rotary drills, and excavators generate massive continuous vibrational noise.
* **Spatial Location Error:** Triangulating microseismic hypocenters in heavily fractured highwalls has high spatial uncertainty ($\pm 20\text{ to }50\text{ m}$).

---

## 3. What is Doable & How We Adopt It for SIH25071

| Seismic Concept | Traditional Method | Proposed SIH25071 AI Innovation |
| :--- | :--- | :--- |
| **Noise Filtering** | Manual post-blast filtering | **Edge 1D-CNN Spectrogram Classifier:** Automatically separates haul-truck rumble from true rock fracture micro-tremors in real-time. |
| **Blast PPV Coupling** | Standalone blast report | Real-time blast PPV feeds directly into the AI model to dynamically lower slope safety thresholds after heavy blasts. |

---

## 4. References
1. **Directorate General of Mines Safety (DGMS).** (2010). *DGMS (Tech) Circular No. 07 of 2010: Permissible Peak Particle Velocity (PPV) levels*.
2. **Cai, M., et al.** (2007). *Microseismic monitoring of rock mass instability in deep mines*. International Journal of Rock Mechanics and Mining Sciences.
