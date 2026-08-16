# Existing Technology 6: Terrestrial LiDAR / Laser Scanning (TLS)

> **Document Type:** Research & Benchmark Analysis  
> **Problem Statement ID:** SIH25071 | **Ministry of Mines** | **Category:** Software  
> **Prepared For:** Smart India Hackathon (SIH 2025)

---

## 1. Background & Working Principle

Terrestrial Laser Scanners (TLS) (e.g., RIEGL VZ-2000i, Leica ScanStation) emit millions of high-frequency laser pulses (Time-of-Flight - ToF) across a rotating optical mirror to create dense 3D point clouds.
* **Point Cloud Comparison:** Multiscale Model-to-Model Cloud Comparison (M3C2) calculates normal-distance surface change between epoch $T_1$ and $T_2$ point clouds:
  $$\Delta d = \mathbf{n} \cdot (\mathbf{P}_{T2} - \mathbf{P}_{T1})$$

```mermaid
flowchart LR
    A[Terrestrial LiDAR Unit] -->|500,000 Laser Pulses/sec| B[Highwall 3D Point Cloud 50M Points]
    B -->|M3C2 Spatial Algorithm| C[3D Surface Normal Distance Differencing]
    C -->|Point Cloud Subtraction| D[Volumetric Bulging & Erosion Heatmap]
```

---

## 2. Advantages & Limitations

### Pros:
* **Massive Spatial Detail:** Resolves structural joints, undercuts, overhangs, and falling rock volumes down to centimeters.
* **Direct Volume Calculation:** Accurately computes cubic meters ($m^3$) of fallen or bulging rock masses.

### Critical Cons:
* **Periodic Snapshot Only:** Must be hauled manually on heavy tripods; cannot provide 24/7 continuous real-time alerts during active shifts.
* **Gigabyte Processing Bottleneck:** Requires heavy desktop workstations to register and filter 50M+ points.
* **High Capex:** ₹40 Lakh – ₹1.2 Crore per industrial scanner.

---

## 3. What is Doable & How We Adopt It for SIH25071

| TLS Concept | Commercial TLS System | Proposed SIH25071 AI Innovation |
| :--- | :--- | :--- |
| **Volumetric Change** | Periodic 3D point cloud differencing | **Real-Time Edge Depth-Differencing:** Fixed stereoscopic RGB-D cameras compute continuous volume change at 30 FPS. |
| **Structural Joint Mapping** | Manual point cloud plane fitting | **Automated AI Joint Plane Detection:** Extracts joint dip/strike directly from baseline point clouds. |

---

## 4. References
1. **Lague, D., Brodu, N., & Leroux, J.** (2013). *Accurate 3D comparison of complex topography with terrestrial laser scanner: Application to the M3C2 algorithm*. ISPRS Journal of Photogrammetry and Remote Sensing, 82, pp. 10–26.
