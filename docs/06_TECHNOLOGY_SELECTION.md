# 06. Technology Selection & Prototype Screening Matrix

> **Document Type:** Master Research & Architecture Report  
> **Problem Statement ID:** SIH25071  
> **Problem Statement Title:** AI-Based Rockfall Prediction and Alert System for Open-Pit Mines  
> **Organization:** Ministry of Mines | **Category:** Software | **Theme:** Disaster Management  
> **Target System:** MINE-SAFE AI Platform  
> **Target File:** `docs/06_TECHNOLOGY_SELECTION.md`

---

## 1. The Technology Selection Strategy

> **Foundational Principle:**  
> *"The 26 technologies researched in this project represent the broad industrial and scientific research landscape. A carefully selected and realistically implementable subset forms the core of our SIH25071 student MVP prototype, while capital-prohibitive and specialized hardware systems remain as researched background data inputs and future industrial extensions."*

To transition from theoretical research to a working, hackathon-ready software prototype, we evaluated all 26 technologies using an objective **Multi-Criteria Decision Matrix** across eight engineering factors:

1. **Relevance to Rockfall Prediction:** Direct causal or kinematic relationship to slope collapse.
2. **Data Usefulness:** Quality, temporal resolution, and feature value for AI models.
3. **Prototype Feasibility:** Realistic capability of a student team to implement/simulate within SIH constraints.
4. **Hardware Dependency:** Requirement for multi-crore specialized machinery vs. standard accessible sensors.
5. **Capital Cost:** Cost feasibility for widespread deployment in small/medium Indian mines.
6. **Software Integration Ease:** Compatibility with open-standard APIs, MQTT, and Python toolkits.
7. **AI Compatibility:** Amenability to automated feature extraction, computer vision, and machine learning.
8. **Real-Time Capability:** Ability to deliver sub-second data streams for early-warning dispatch.

---

## 2. Master Technology Selection Matrix

| # | Technology Name | Research Value | Prototype Feasibility | Hardware Cost | AI Compatibility | Real-Time Capability | SIH Priority & Scope |
| :---: | :--- | :---: | :---: | :---: | :---: | :---: | :--- |
| **01** | **Slope Stability Radar (SSR)** | **High** | Low (Hardware Prohibitive) | Very High (₹4–8 Cr) | High (Kinematics) | High (1–5 min) | `[RESEARCHED / FUTURE]` (Math & Saito IV adopted into AI) |
| **02** | **Ground-Based InSAR** | **High** | Low (Hardware Prohibitive) | Very High (₹4–10 Cr)| High (2D Grids) | Medium (2–10 min) | `[RESEARCHED / FUTURE]` (Spatial deformation concepts adopted) |
| **03** | **Satellite InSAR (SBAS)**| **High** | **High (via Open APIs)** | **Low (Free Data)** | **High (Priors)** | Low (6–12 days) | `[PROPOSED / PROTOTYPE]` (Sentinel-1 SAR ingested via API) |
| **04** | **Total Station & Prisms**| Medium | **High (via Vision AI)** | High (Physical RTS) | **High (Vectors)** | Low (30–60 min) | `[PROTOTYPE]` (**Virtual Prismless Optical Tracking** replaces prisms) |
| **05** | **GNSS / GPS Monitoring** | **High** | **High (IoT RTK Node)** | Moderate (₹1.5L) | **High (Time-Series)**| **High (1–10 Hz)** | `[PROTOTYPE]` (Low-cost multi-band RTK GNSS node telemetry) |
| **06** | **LiDAR Laser Scanning** | **High** | Medium (Dataset Ingestion)| High (₹40L–1.2 Cr) | **High (Point Clouds)**| Low (Periodic) | `[RESEARCHED]` (CloudCompare M3C2 change detection algorithms adopted) |
| **07** | **Drone Photogrammetry** | **High** | **High (WebODM Pipeline)**| Moderate (₹3L–15L) | **High (3D Meshes)** | Low (Post-flight) | `[PROTOTYPE]` (Drone 3D DEM mesh forms base of 3D Digital Twin) |
| **08** | **UAV LiDAR** | **High** | Low (Hardware Prohibitive) | High (₹25L–80L) | **High (Joint Sets)**| Low (Periodic) | `[RESEARCHED]` (Structural joint extraction from point clouds) |
| **09** | **Inclinometers** | **High** | Medium (Data Ingestion) | High (Borehole cost)| Medium (1D Profile)| Medium | `[RESEARCHED / DATA INPUT]` (Subsurface slip depth constrains models) |
| **10** | **Extensometers** | Medium | Medium (Data Ingestion) | Moderate (₹50k–3L) | Medium (1D Crack) | **High (Continuous)**| `[RESEARCHED]` (Replaced by non-contact optical crack gauges) |
| **11** | **Piezometers (VW)** | **High** | **High (IoT Ingestion)** | Moderate (₹1L–3L) | **High (Physics)** | **High (Continuous)**| `[PROTOTYPE]` (Pore pressure directly feeds dynamic Mohr-Coulomb FoS) |
| **12** | **Crack / Joint Meters** | **High** | **High (LoRa Sensor Node)**| Low (₹5k–25k) | **High (Time-Series)**| **High (Continuous)**| `[PROTOTYPE]` (Custom LoRa potentiometric crackmeter hardware) |
| **13** | **Tiltmeters (MEMS)** | **High** | **High (LoRa Sensor Node)**| **Very Low (₹2,800)** | **High (Time-Series)**| **High (10–100 Hz)**| `[PROTOTYPE]` (Custom ₹2,800 LoRa MEMS biaxial tilt nodes with Kalman filter) |
| **14** | **Strain Gauges** | Medium | Medium (IoT Ingestion) | Low (₹5k–20k) | Medium (Load) | **High (100 Hz)** | `[RESEARCHED / DATA INPUT]` (Structural rock bolt yield health feature) |
| **15** | **TDR Reflectometry** | Medium | Low (Hardware Prohibitive) | Moderate (Borehole) | Medium (Binary) | Low | `[RESEARCHED]` (Cable crimp reflection locks failure plane depth) |
| **16** | **Seismic Geophones** | **High** | **High (MiniSEED/Audio)** | Moderate (₹5L–20L) | **High (1D-CNN)** | **High (100–1000 Hz)**| `[PROTOTYPE]` (Edge 1D-CNN separates blast PPV from rock micro-fractures) |
| **17** | **Weather Stations** | **High** | **High (HTTP/MQTT API)** | **Low (₹15k–30k)** | **High (Priors)** | **High (1 min)** | `[PROTOTYPE]` (Rainfall rate mm/hr & Antecedent Moisture Index API) |
| **18** | **Groundwater Wells** | Medium | Medium (Hydrology Model) | Moderate (Borehole) | Medium (Hydro) | Medium | `[RESEARCHED]` (Coupled with weather to model hydrostatic cleft thrust U) |
| **19** | **CCTV Fixed Cameras** | **High** | **High (RTSP Stream)** | **Low (Ubiquitous)** | **High (Edge CV)** | **High (30 FPS)** | `[PROTOTYPE]` (Upgrades existing mine cameras into active AI sensors) |
| **20** | **Computer Vision AI** | **High** | **High (Jetson Python)** | **Low to Moderate** | **High (Direct CV)** | **High (30 FPS)** | `[PROTOTYPE]` (Sub-pixel optical flow + YOLOv8 + DeepCrack segmentation) |
| **21** | **Manual Inspection** | Medium | **High (Mobile App)** | **Zero Hardware** | **High (Ground Truth)**| Low (Intermittent)| `[PROTOTYPE]` (Mobile field app for **Human-in-the-Loop active learning**) |
| **22** | **Numerical FEM/DEM** | **High** | Medium (Surrogate PINN) | High (Commercial SW)| **High (Physics)** | Low (Offline) | `[RESEARCHED / FUTURE]` (OpenSees/Yade DEM pre-computes FoS & runout) |
| **23** | **AI / ML Prediction** | **High** | **High (Python / XGBoost)**| **Zero Capex** | **Core ML Model** | **High (<100 ms)** | `[PROTOTYPE]` (XGBoost classifier + LSTM forecaster + SHAP explainability) |
| **24** | **IoT Sensor Networks**| **High** | **High (ESP32 / LoRa)** | **Low (₹3.5k–5.5k)** | **High (Backbone)** | **High (Real-Time)** | `[PROTOTYPE]` (4-tier LoRaWAN mesh, MQTT v5.0, and InfluxDB time-series) |
| **25** | **Digital Twin 3D** | **High** | **High (CesiumJS / WebGL)**| **Zero Capex** | **High (Spatial UI)**| **High (60 FPS)** | `[PROTOTYPE]` (Interactive 3D WebGPU browser Digital Twin with Zone Intel) |
| **26** | **Early-Warning TARP** | **High** | **High (Rule + Relay Engine)**| **Low (₹5k–15k)** | **High (Decision)** | **High (<1.0 s)** | `[PROTOTYPE]` (Automated 4-tier TARP dispatcher for sirens, VHF & SMS) |

---

## 3. Tiered Technology Classification for MINE-SAFE AI

```
+---------------------------------------------------------------------------------------------------+
|                        MINE-SAFE AI THREE-TIER IMPLEMENTATION ARCHITECTURE                        |
+---------------------------------------------------------------------------------------------------+
|  TIER 1: THE CORE STUDENT MVP PROTOTYPE [PROTOTYPE] (100% Implemented in Software & Hardware)    |
|  - Edge Computer Vision (4K Optical Flow, YOLOv8 Boulder Detection, DeepCrack Segmentation)       |
|  - Custom Wireless LoRa IoT Sensor Nodes (ESP32-S3 + MEMS Tilt + Potentiometric Crackmeters)      |
|  - Micro-Weather Ingestion (Rainfall Rate mm/hr & Antecedent Moisture Index API)                  |
|  - Multi-Modal AI Engine (XGBoost Risk Classifier + LSTM Trend Forecaster + Saito Failure Window) |
|  - Explainable AI Engine (SHAP Local Causal Feature Attribution Cards)                            |
|  - Interactive 3D WebGPU Mine Digital Twin (Zone Intelligence, 6-DoF Navigation, Risk Filters)   |
|  - Automated Sub-Second TARP Dispatcher (Relay Sirens, VHF Radio Voice Broadcast, SMS)           |
|  - Geotechnical Mobile Logging App (Human-in-the-Loop Active Learning Ground Truth)               |
|                                                                                                   |
|  TIER 2: RESEARCHED & EMULATED DATA INPUTS [RESEARCHED / DATA INPUT] (Integrated via APIs)        |
|  - Sentinel-1 Satellite InSAR (Free Copernicus SBAS Subsidence Velocity Maps via API)             |
|  - Drone Photogrammetry Reality Meshes (WebODM OBJ/GLTF 3D Tiles Ingestion)                       |
|  - Borehole Piezometer Hydrogeology (Simulated / Ingested Pore Pressure Telemetry)                |
|  - Blast Vibration Waveforms (Triaxial Geophone PPV Logs & Microseismic Event Frequency)          |
|  - Physics-Based Numerical Priors (Pre-computed OpenSees FEM FoS & Yade DEM 3D Runout Cones)     |
|                                                                                                   |
|  TIER 3: CAPITAL-PROHIBITIVE INDUSTRIAL SYSTEMS [FUTURE SCOPE] (Researched Mathematical Base)     |
|  - Ground-Based Slope Stability Radar (SSR) & Real-Aperture Radar Hardware Trailers (₹4–8 Cr)    |
|  - Terrestrial LiDAR Laser Scanners (TLS) (₹40L–1.2 Cr)                                           |
|  - Deep In-Place Inclinometer (IPI) String Drilling & Grouting Rigs (₹5L–15L per borehole)        |
|  - Commercial Desktop Geotechnical Suites (Rocscience RS3, Itasca FLAC3D, Bentley PLAXIS)        |
+---------------------------------------------------------------------------------------------------+
```
