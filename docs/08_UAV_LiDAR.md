# Existing Technology 8: UAV LiDAR (Drone Laser Scanning)

> **Document Type:** Research & Benchmark Analysis  
> **Problem Statement ID:** SIH25071 | **Ministry of Mines** | **Category:** Software  
> **Prepared For:** Smart India Hackathon (SIH 2025)

---

## 1. Background & Working Principle

UAV LiDAR systems (e.g., DJI M350 RTK + Zenmuse L2) integrate a lightweight pulsed laser scanner, calibrated GNSS receiver, and high-precision Inertial Measurement Unit (IMU) onto a heavy-lift multirotor drone.
* **Multi-Return Penetration:** Emits up to 240,000 pulses/second with multiple returns (up to 5 returns per pulse), penetrating safety mesh, loose talus, and vegetation to measure true rock geometry.

```mermaid
flowchart LR
    A[UAV Airborne LiDAR Unit] -->|Multiple Laser Return Pulses| B[Raw Point Cloud Echoes]
    B -->|GNSS + IMU Position Integration| C[Georeferenced 3D Point Cloud]
    C -->|Ground Filtering & Classification| D[Bare-Earth Highwall Digital Terrain Model]
```

---

## 2. Advantages & Industry Limitations

### Strengths:
* **Vegetation & Dust Penetration:** Accurately maps vegetated highwalls and undercut benches where photogrammetry fails.
* **Rapid Topographic Coverage:** Scans square kilometers in 20-minute flight missions.

### Limitations:
* **High Equipment Capex & Crash Risk:** ₹25 Lakh – ₹80 Lakh per rig; high crash risk from deep pit thermal updrafts and blast dust.
* **Periodic Survey Only:** Incapable of providing continuous, second-by-second warnings during active excavation shifts.

---

## 3. What is Doable & How We Adopt It for SIH25071

| Feature | UAV LiDAR Method | Proposed SIH25071 AI Innovation |
| :--- | :--- | :--- |
| **Baseline Topography** | High-precision initial scan | Ingested as initial baseline mesh; daily monitoring handled by fixed low-cost edge vision & IoT. |
| **Structural Joint Planes** | Manual point cloud slicing | **Automated AI RANSAC plane fitting** to extract highwall dip, strike, and joint persistence. |

---

## 4. References
1. **Jaboyedoff, M., et al.** (2012). *Use of LiDAR in landslide investigations: a review*. Natural Hazards, 61(1), pp. 5–28.
