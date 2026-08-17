# 06. Technology Selection & Prototype Screening Matrix

> **Document Type:** Master Research & Architecture Report  
> **Problem Statement ID:** SIH25071  
> **Problem Statement Title:** AI-Based Rockfall Risk Prediction & Early-Warning System for Open-Pit Mines  
> **Organization:** Ministry of Mines | **Category:** Software | **Theme:** Disaster Management  
> **Target System:** MINE-SAFE AI Platform  
> **Target File:** `docs/06_TECHNOLOGY_SELECTION.md`

---

## 1. The Technology Selection Strategy

> **Foundational Principle:**  
> *"The 26 technologies researched in this project represent the broad industrial and scientific research landscape. A carefully selected and realistically implementable subset forms the core of our SIH25071 student MVP prototype, while capital-prohibitive and specialized hardware systems remain as researched background data inputs and future industrial extensions."*

To transition from theoretical research to a working software prototype, we evaluated all 26 technologies across five standardized criteria:
1. **Monitoring Value:** Direct geological relevance to rockfall or slope deformation detection.
2. **AI Relevance:** Amenability to automated feature extraction, computer vision, and predictive modeling.
3. **Prototype Feasibility:** Realistic capability of a student team to implement, emulate, or integrate within hackathon scope.
4. **Cost / Complexity:** Hardware expense, deployment friction, and computational overhead.
5. **Final Status:** Categorized as `[PROTOTYPE]`, `[RESEARCHED]`, `[DATA INPUT]`, or `[FUTURE]`.

---

## 2. Final Technology Selection Matrix

| # | Technology | Monitoring Value | AI Relevance | Prototype Feasibility | Cost / Complexity | Final Status |
| :---: | :--- | :---: | :---: | :---: | :---: | :--- |
| **01** | **Slope Stability Radar (SSR)** | **HIGH** | **HIGH** | LOW (Hardware Prohibitive) | **HIGH** | `[RESEARCHED / FUTURE]` |
| **02** | **Ground-Based InSAR (GB-InSAR)** | **HIGH** | **HIGH** | LOW (Hardware Prohibitive) | **HIGH** | `[RESEARCHED / FUTURE]` |
| **03** | **Satellite InSAR (SBAS)** | **HIGH** | **HIGH** | **HIGH** (via Open Sentinel API) | **LOW** | `[DATA INPUT]` |
| **04** | **Total Station & Prisms (AMTS)** | **MEDIUM** | **HIGH** | **HIGH** (via Optical Flow AI) | **MEDIUM** | `[PROTOTYPE]` |
| **05** | **GNSS / GPS Monitoring** | **HIGH** | **HIGH** | **HIGH** (IoT RTK Node) | **MEDIUM** | `[PROTOTYPE]` |
| **06** | **LiDAR Laser Scanning (TLS)** | **HIGH** | **HIGH** | **MEDIUM** (Dataset Processing) | **HIGH** | `[RESEARCHED]` |
| **07** | **Drone Photogrammetry** | **HIGH** | **HIGH** | **HIGH** (WebODM Pipeline) | **MEDIUM** | `[PROTOTYPE]` |
| **08** | **UAV LiDAR** | **HIGH** | **HIGH** | LOW (Hardware Prohibitive) | **HIGH** | `[RESEARCHED]` |
| **09** | **Inclinometers (Subsurface)** | **HIGH** | **MEDIUM** | **MEDIUM** (Data Ingestion) | **HIGH** | `[DATA INPUT]` |
| **10** | **Extensometers (Wire & MPBX)** | **MEDIUM** | **MEDIUM** | **MEDIUM** (Data Ingestion) | **MEDIUM** | `[RESEARCHED]` |
| **11** | **Piezometers (Vibrating Wire)** | **HIGH** | **HIGH** | **HIGH** (IoT Ingestion) | **MEDIUM** | `[PROTOTYPE]` |
| **12** | **Crack / Joint Meters** | **HIGH** | **HIGH** | **HIGH** (LoRa Node) | **LOW** | `[PROTOTYPE]` |
| **13** | **Tiltmeters (MEMS)** | **HIGH** | **HIGH** | **HIGH** (LoRa Node) | **LOW** | `[PROTOTYPE]` |
| **14** | **Strain Gauges** | **MEDIUM** | **MEDIUM** | **MEDIUM** (Data Ingestion) | **LOW** | `[DATA INPUT]` |
| **15** | **TDR Reflectometry** | **MEDIUM** | **MEDIUM** | LOW (Hardware Prohibitive) | **MEDIUM** | `[RESEARCHED]` |
| **16** | **Seismic Geophones** | **HIGH** | **HIGH** | **HIGH** (Audio/Signal ML) | **MEDIUM** | `[PROTOTYPE]` |
| **17** | **Weather Stations (AWS)** | **HIGH** | **HIGH** | **HIGH** (MQTT / API Ingestion) | **LOW** | `[PROTOTYPE]` |
| **18** | **Groundwater Monitoring Wells** | **MEDIUM** | **MEDIUM** | **MEDIUM** (Data Ingestion) | **MEDIUM** | `[RESEARCHED]` |
| **19** | **CCTV Fixed Optical Cameras** | **HIGH** | **HIGH** | **HIGH** (RTSP Stream) | **LOW** | `[PROTOTYPE]` |
| **20** | **Computer Vision AI** | **HIGH** | **HIGH** | **HIGH** (Edge Python) | **LOW** | `[PROTOTYPE]` |
| **21** | **Manual Geological Inspection** | **MEDIUM** | **HIGH** | **HIGH** (Mobile Field App) | **LOW** | `[PROTOTYPE]` |
| **22** | **Numerical Slope Stability (FEM)** | **HIGH** | **HIGH** | **MEDIUM** (Surrogate Priors) | **HIGH** | `[RESEARCHED / FUTURE]` |
| **23** | **AI / Machine Learning Prediction** | **HIGH** | **HIGH** | **HIGH** (XGBoost / LSTM) | **LOW** | `[PROTOTYPE]` |
| **24** | **IoT Wireless Sensor Networks** | **HIGH** | **HIGH** | **HIGH** (ESP32 LoRaWAN) | **LOW** | `[PROTOTYPE]` |
| **25** | **Digital Twin / 3D Mine View** | **HIGH** | **HIGH** | **HIGH** (CesiumJS WebGL) | **LOW** | `[PROTOTYPE]` |
| **26** | **Early-Warning TARP Systems** | **HIGH** | **HIGH** | **HIGH** (Rule + Relay Engine) | **LOW** | `[PROTOTYPE]` |

---

## 3. Tiered Technology Architecture for SIH25071

```
+---------------------------------------------------------------------------------------------------+
|                        MINE-SAFE AI THREE-TIER IMPLEMENTATION ARCHITECTURE                        |
+---------------------------------------------------------------------------------------------------+
|  TIER 1: CORE STUDENT MVP PROTOTYPE [PROTOTYPE]                                                   |
|  - Edge Computer Vision: Optical flow rock mass tracking, YOLO boulder detection, crack masks    |
|  - Wireless IoT Sensor Nodes: ESP32 microcontrollers with MEMS tilt and potentiometer crackmeters |
|  - Meteorological Ingestion: Rainfall intensity (mm/hr) and antecedent moisture calculations      |
|  - Multi-Modal AI Engine: XGBoost tabular risk classifier, LSTM trend forecaster, SHAP XAI        |
|  - 3D Mine Monitoring Prototype: Interactive WebGL/WebGPU 3D terrain canvas with Zone IDs        |
|  - Dynamic TARP Early-Warning: Multi-tier rule engine triggering simulated sirens, radio, and SMS |
|  - Human-in-the-Loop Field App: Digital mobile logging interface for geotechnical observations   |
|                                                                                                   |
|  TIER 2: RESEARCH / DATA INPUTS [DATA INPUT] [RESEARCHED]                                         |
|  - Satellite InSAR: Copernicus Sentinel-1 SBAS regional subsidence velocity maps via API         |
|  - Drone Photogrammetry: WebODM SfM processing for generating 3D terrain meshes                   |
|  - Hydrogeological Piezometers: Pore-water pressure telemetry feeding effective stress models     |
|  - Blast Vibration Data: Triaxial geophone PPV logs for dynamic shock correlation                |
|  - Physics-Based Priors: Pre-computed FEM Factor of Safety envelopes and DEM runout trajectories  |
|                                                                                                   |
|  TIER 3: FUTURE INDUSTRIAL INTEGRATIONS [FUTURE SCOPE]                                            |
|  - Slope Stability Radar (SSR) hardware deployment trailers                                       |
|  - Terrestrial Laser Scanners (TLS) for automated daily millimeter volumetric surveys             |
|  - Deep borehole inclinometer (IPI) multi-level sensor string drilling and installation           |
|  - Direct API integration with commercial Autonomous Haulage Fleet Management Systems (FMS)      |
+---------------------------------------------------------------------------------------------------+
```
