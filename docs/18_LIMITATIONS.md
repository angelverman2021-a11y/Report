# 18. Technical & Operational Limitations

> **Document Type:** Master Research & Architecture Report  
> **Problem Statement ID:** SIH25071  
> **Problem Statement Title:** AI-Based Rockfall Prediction and Alert System for Open-Pit Mines  
> **Organization:** Ministry of Mines | **Category:** Software | **Theme:** Disaster Management  
> **Target System:** MINE-SAFE AI Platform  
> **Target File:** `docs/18_LIMITATIONS.md`

---

## 1. Transparency in System Boundaries

> **Mandatory Scientific Disclosure:**  
> *"No slope stability monitoring system—regardless of whether it uses multi-crore radars or cutting-edge AI—can guarantee infallible prediction of every individual rock detachment. Geotechnical rock masses are inherently non-linear, heterogeneous, and fractured. Acknowledging operational boundaries is essential for safe mine engineering."*

---

## 2. Identified Technical & Operational Limitations

```
+---------------------------------------------------------------------------------------------------+
|                            MINE-SAFE AI SYSTEM LIMITATION MATRIX                                  |
+---------------------------------------------------------------------------------------------------+
|  1. OPTICAL & VISION ATTENUATION (Atmospheric Limits):                                            |
|     - Dense fog, monsoon cloudbursts, and heavy post-blast dust clouds degrade optical contrast.  |
|     - Nighttime monitoring requires high-power infrared illuminators or edge thermal cameras.     |
|     - Mitigation: Multi-sensor fusion falls back onto LoRa tiltmeters and piezometers during zero |
|       visibility conditions.                                                                      |
|                                                                                                   |
|  2. SUBSURFACE STRUCTURAL BLINDNESS (Surface vs. Deep Planes):                                   |
|     - Optical flow and surface crackmeters only measure surface deformations.                     |
|     - Deep-seated planar or rotational failures (>30m deep) may exhibit minimal surface dilation  |
|       prior to rapid brittle failure.                                                             |
|     - Mitigation: Ingest borehole piezometric pore pressure and subsurface inclinometer data.     |
|                                                                                                   |
|  3. SITE-SPECIFIC MODEL GENERALIZATION BOUNDARIES:                                                |
|     - AI models trained on a hard-rock iron ore highwall cannot be directly transferred to a soft |
|       sedimentary coal or bauxite mine without domain adaptation and recalibration.               |
|     - Mitigation: Transfer learning + active learning fine-tuning on site-specific lithology.     |
|                                                                                                   |
|  4. WIRELESS RF PROPAGATION IN DEEP PITS:                                                         |
|     - Deep, narrow pits with high conductive mineral content (e.g., magnetite) attenuate RF signals|
|     - Mitigation: Deploy directional Yagi antennas and multi-hop LoRa repeater nodes on berms.    |
|                                                                                                   |
|  5. STATUTORY & HUMAN-IN-THE-LOOP DEPENDENCY:                                                     |
|     - The software is a decision-support platform, NOT an autonomous authority to restart mining. |
|     - Requires trained geotechnical engineers to validate alerts and authorize mine bench re-entry|
+---------------------------------------------------------------------------------------------------+
```
