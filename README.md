# MINE-SAFE AI: AI-Based Rockfall Prediction & Autonomous TARP System for Open-Pit Mines

> **Smart India Hackathon (SIH 2025) — Research & Software Engineering Proposal**  
> **Problem Statement ID:** SIH25071  
> **Ministry / Organization:** Ministry of Mines | **Category:** Software | **Theme:** Disaster Management  
> **Principal Investigator / Author:** Angel Verman & Team  
> **Target Repository:** `https://github.com/angelverman2021-a11y/Report.git`

---

## 1. Project Positioning Statement

> **Core Scientific Positioning:**  
> *"The proposed contribution is not the physical invention of a new geological monitoring sensor, but an integrated software intelligence platform that combines heterogeneous monitoring data, physics-informed features, AI-based risk estimation, explainable predictions, spatial 3D visualization, and actionable early-warning logic to support geotechnical engineers and mine managers."*

---

## 2. Problem Statement & Context

Open-pit mining accounts for over **80% of mineral and coal extraction in India**. As surface mines excavate deeper into complex geological formations, **rockfalls, bench shear failures, and highwall collapses** represent the single most lethal hazard to personnel and heavy equipment (electric rope shovels, excavators, and haul trucks).

### Regulatory & Operational Drivers (DGMS Guidelines):
Under **DGMS (Tech) Circular No. 02 of 2020** and the **Coal Mines Regulations (CMR 2017)**, open-cast mines are statutorily required to maintain scientific slope monitoring and execute **Trigger Action Response Plans (TARP)**. However, Indian mining operations face severe technological bottlenecks:

```
+---------------------------------------------------------------------------------------------------+
|                        WHY EXISTING MINE MONITORING SYSTEMS ARE INSUFFICIENT                      |
+---------------------------------------------------------------------------------------------------+
|  1. EXTREME CAPITAL COST: Slope Stability Radar (SSR) units cost ₹4.0 to ₹8.0 Crores, excluding   |
|     >95% of active open-cast mines in India from continuous real-time slope monitoring.           |
|  2. SPATIAL POINT BLINDNESS: Traditional in-situ sensors (prisms, crackmeters) monitor discrete    |
|     spots; catastrophic mass failures occurring 5 meters away remain completely undetected.      |
|  3. ISOLATED VENDOR SILOS: Radar, piezometers, weather stations, and total stations operate on     |
|     disconnected proprietary databases, delaying emergency evacuation orders by 15–45 minutes.    |
|  4. RIGID STATIC THRESHOLDS: Legacy TARP systems rely on static displacement thresholds that      |
|     trigger high false-alarm rates during benign plastic creep or miss rapid brittle failures.    |
+---------------------------------------------------------------------------------------------------+
```

---

## 3. Visual System Architecture & Project Assets

| 3D Digital Twin Command Center | 4K Edge AI Computer Vision Analytics |
| :---: | :---: |
| ![Digital Twin](docs/assets/digital_twin_dashboard.jpg) | ![Edge Vision](docs/assets/rockfall_edge_vision_ai.jpg) |
| *WebGPU 3D Reality Mesh with Zone Risk Overlays* | *30 FPS Sub-Pixel Optical Flow & YOLOv8 Boulder Detection* |
| **Pit-Rim Autonomous Monitoring Station** | **In-Situ Wireless LoRa Geotechnical Node** |
| ![Pit-Rim Station](docs/assets/pit_rim_monitoring_station.jpg) | ![LoRa Node](docs/assets/geotech_lora_sensor_node.jpg) |
| *Solar PTZ Camera, LoRa Mast, AWS & 120 dB Siren* | *Custom Low-Cost (₹5,500) Crest Crackmeter & MEMS Node* |

---

## 4. The Proposed Solution: MINE-SAFE AI

**MINE-SAFE AI** resolves these limitations by introducing a unified software intelligence layer structured around the core philosophy:

$$\mathbf{Risk} \times \mathbf{Location} \times \mathbf{Time}$$

Instead of displaying raw, disconnected numbers, the system processes heterogeneous telemetry to deliver **zone-level spatial risk intelligence**:

```
Monitoring Data (14 Modalities)
      ↓
AI Multi-Modal Analysis & Feature Engineering
      ↓
Current Risk Score (Safe / Moderate / High / Critical)
      ↓
Risk Velocity (Rate of Deterioration dRisk/dt)
      ↓
Future Risk Forecast (Trajectory & Saito Collapse Horizon tf)
      ↓
Explainable Risk & Prediction Confidence (SHAP Breakdown)
      ↓
3D Predictive Risk Map (Dynamic WebGPU Mine Mesh)
      ↓
Smart Alerts & Sub-Second TARP Evacuation (<1.0s)
```

---

## 5. Master 20-Chapter Research & Design Documentation

The complete research and engineering report is organized into the following master chapters:

| # | Master Documentation Chapter Link | Core Engineering Focus |
| :---: | :--- | :--- |
| **01** | [**`01_EXECUTIVE_SUMMARY.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/01_EXECUTIVE_SUMMARY.md) | Executive summary, positioning statement, status badges, and scope boundaries. |
| **02** | [**`02_PROBLEM_STATEMENT.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/02_PROBLEM_STATEMENT.md) | Indian mining background, DGMS statutory guidelines, and failure mechanics. |
| **03** | [**`03_EXISTING_TECHNOLOGY_LANDSCAPE.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/03_EXISTING_TECHNOLOGY_LANDSCAPE.md) | Exhaustive review of all 26 existing monitoring technologies across 8 domains. |
| **04** | [**`04_TECHNOLOGY_COMPARISON.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/04_TECHNOLOGY_COMPARISON.md) | Multi-dimensional benchmark comparison across coverage, sampling rate, physics, and cost. |
| **05** | [**`05_RESEARCH_GAPS.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/05_RESEARCH_GAPS.md) | Analysis of 8 critical industry research gaps and operational bottlenecks. |
| **06** | [**`06_TECHNOLOGY_SELECTION.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/06_TECHNOLOGY_SELECTION.md) | Technology Selection Matrix filtering the 26 technologies into student MVP vs. future scope. |
| **07** | [**`07_PROPOSED_SOLUTION.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/07_PROPOSED_SOLUTION.md) | Detailed architecture of MINE-SAFE AI, 11 core features, and innovation claims. |
| **08** | [**`08_SYSTEM_ARCHITECTURE.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/08_SYSTEM_ARCHITECTURE.md) | 5-tier decoupled software architecture and industrial hardware Bill of Materials (BOM). |
| **09** | [**`09_DATA_STRATEGY.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/09_DATA_STRATEGY.md) | Tri-partite data strategy (Public InSAR, student hardware telemetry, synthetic simulations). |
| **10** | [**`10_AI_ML_ARCHITECTURE.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/10_AI_ML_ARCHITECTURE.md) | Core tabular ML (XGBoost), LSTM trend forecaster, Saito collapse horizon, and SHAP XAI. |
| **11** | [**`11_SENSOR_FUSION.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/11_SENSOR_FUSION.md) | Heterogeneous sampling rate alignment and 2D-to-3D optical flow ray casting. |
| **12** | [**`12_NUMERICAL_MODEL.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/12_NUMERICAL_MODEL.md) | Integration of numerical geomechanics (Mohr-Coulomb, DEM rockfall runout) as AI features. |
| **13** | [**`13_DIGITAL_TWIN.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/13_DIGITAL_TWIN.md) | 3D Mine Monitoring & Digital Twin prototype, WebGPU canvas, Zone Intel, and Risk Filters. |
| **14** | [**`14_EARLY_WARNING_TARP.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/14_EARLY_WARNING_TARP.md) | 4-tier TARP engine, sub-second sirens/VHF dispatch, and Human-in-the-Loop governance. |
| **15** | [**`15_PROTOTYPE_IMPLEMENTATION.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/15_PROTOTYPE_IMPLEMENTATION.md) | Student MVP prototype implementation scope, open-source stack, and dependencies. |
| **16** | [**`16_VALIDATION_AND_METRICS.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/16_VALIDATION_AND_METRICS.md) | Safety evaluation metrics for imbalanced data, False Negative penalties, and testing plan. |
| **17** | [**`17_SECURITY_AND_RELIABILITY.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/17_SECURITY_AND_RELIABILITY.md) | Fail-safe store-and-forward buffering, dual-path networks, RBAC, and DGMS audit logs. |
| **18** | [**`18_LIMITATIONS.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/18_LIMITATIONS.md) | Technical and operational limitations (atmospheric vision attenuation, subsurface blindness). |
| **19** | [**`19_FUTURE_SCOPE.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/19_FUTURE_SCOPE.md) | 3-phase post-hackathon industrial roadmap and autonomous haulage fleet integration. |
| **20** | [**`20_REFERENCES.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/20_REFERENCES.md) | Consolidated, verified academic, regulatory, and open-source references. |

---

## 6. The 26 Monitored Technologies Research Index

Every technology has its own dedicated research report in [`docs/technologies/`](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies):

| # | Technology Name | Report Link | Status Badge | Scope in MINE-SAFE AI |
| :---: | :--- | :--- | :---: | :--- |
| **01** | **Slope Stability Radar (SSR)** | [**`01_SSR.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies/01_Slope_Stability_Radar_SSR.md) | `[EXISTING]` `[RESEARCHED]` | Saito inverse velocity math adopted in AI; hardware in future scope. |
| **02** | **Ground-Based InSAR** | [**`02_GB_InSAR.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies/02_Ground_Based_InSAR_GB_InSAR.md) | `[EXISTING]` `[RESEARCHED]` | Spatial deformation heatmapping principles adopted in 3D risk field. |
| **03** | **Satellite InSAR (SBAS)** | [**`03_Sat_InSAR.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies/03_Satellite_InSAR_DInSAR_PSInSAR_SBAS.md) | `[EXISTING]` `[PROTOTYPE]` | Copernicus Sentinel-1 SBAS subsidence velocity maps ingested via API. |
| **04** | **Total Station & Prisms** | [**`04_Total_Station.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies/04_Total_Station_Prism_Monitoring.md) | `[EXISTING]` `[PROTOTYPE]` | 3D vector math adapted into **Virtual Prismless Optical Tracking**. |
| **05** | **GNSS / GPS Monitoring** | [**`05_GNSS_GPS.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies/05_GNSS_GPS_Monitoring.md) | `[EXISTING]` `[PROTOTYPE]` | Multi-band RTK GNSS IoT telemetry node on highwall crest. |
| **06** | **LiDAR Laser Scanning** | [**`06_LiDAR.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies/06_LiDAR_Laser_Scanning.md) | `[EXISTING]` `[RESEARCHED]` | CloudCompare M3C2 change detection algorithms adopted for scar analysis. |
| **07** | **Drone Photogrammetry** | [**`07_Drone_Photo.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies/07_Drone_UAV_Photogrammetry.md) | `[EXISTING]` `[PROTOTYPE]` | WebODM SfM pipeline generates base 3D terrain reality mesh. |
| **08** | **UAV LiDAR** | [**`08_UAV_LiDAR.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies/08_UAV_LiDAR.md) | `[EXISTING]` `[RESEARCHED]` | Structural rock discontinuity extraction from point clouds. |
| **09** | **Inclinometers** | [**`09_Inclinometers.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies/09_Inclinometers.md) | `[EXISTING]` `[DATA INPUT]` | Subsurface shear depth profiles constrain numerical slip boundaries. |
| **10** | **Extensometers** | [**`10_Extensometers.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies/10_Extensometers.md) | `[EXISTING]` `[RESEARCHED]` | Point displacement math adapted into non-contact optical crack meters. |
| **11** | **Piezometers (VW)** | [**`11_Piezometers.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies/11_Piezometers.md) | `[EXISTING]` `[PROTOTYPE]` | Real-time pore pressure feeds dynamic Mohr-Coulomb Factor of Safety. |
| **12** | **Crack / Joint Meters** | [**`12_Crack_Meters.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies/12_Crack_Joint_Meters.md) | `[EXISTING]` `[PROTOTYPE]` | Custom wireless LoRa potentiometric crackmeter hardware node. |
| **13** | **Tiltmeters (MEMS)** | [**`13_Tiltmeters.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies/13_Tilt_Sensors_Tiltmeters.md) | `[EXISTING]` `[PROTOTYPE]` | Custom low-cost (₹2,800) LoRa MEMS tilt nodes with Kalman filter. |
| **14** | **Strain Gauges** | [**`14_Strain_Gauges.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies/14_Strain_Gauges.md) | `[EXISTING]` `[DATA INPUT]` | Ingested rock bolt yield strain telemetry. |
| **15** | **TDR Reflectometry** | [**`15_TDR.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies/15_TDR_Time_Domain_Reflectometry.md) | `[EXISTING]` `[RESEARCHED]` | Sub-nanosecond pulse reflection travel-time pins failure plane depth. |
| **16** | **Seismic Geophones** | [**`16_Seismic.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies/16_Seismic_Vibration_Sensors.md) | `[EXISTING]` `[PROTOTYPE]` | Edge 1D-CNN separates blast PPV from rock micro-fractures. |
| **17** | **Weather Stations** | [**`17_Weather.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies/17_Weather_Stations.md) | `[EXISTING]` `[PROTOTYPE]` | Precipitation rate (mm/hr) & Antecedent Moisture Index API. |
| **18** | **Groundwater Wells** | [**`18_Groundwater.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies/18_Groundwater_Monitoring.md) | `[EXISTING]` `[RESEARCHED]` | Standpipe phreatic heads model hydrostatic cleft thrust U. |
| **19** | **CCTV Fixed Cameras** | [**`19_CCTV_Cameras.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies/19_CCTV_Fixed_Cameras.md) | `[EXISTING]` `[PROTOTYPE]` | Upgrades existing 4K mine CCTV cameras via edge RTSP streaming. |
| **20** | **Computer Vision AI** | [**`20_Computer_Vision.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies/20_Computer_Vision.md) | `[EXISTING]` `[PROTOTYPE]` | Sub-pixel optical flow + YOLOv8 boulder detection + DeepCrack segmentation. |
| **21** | **Manual Inspection** | [**`21_Manual_Inspect.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies/21_Manual_Geological_Inspection.md) | `[EXISTING]` `[PROTOTYPE]` | Mobile field logging app for **Human-in-the-Loop active learning**. |
| **22** | **Numerical FEM/DEM** | [**`22_Numerical_FEM.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies/22_Numerical_Slope_Stability_Analysis.md) | `[EXISTING]` `[FUTURE]` | Pre-computed FEM Factor of Safety & DEM kinetic runout priors. |
| **23** | **AI / ML Prediction** | [**`23_AI_Prediction.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies/23_AI_Machine_Learning_Prediction.md) | `[EXISTING]` `[PROTOTYPE]` | XGBoost classifier + LSTM forecaster + SHAP explainability. |
| **24** | **IoT Sensor Networks** | [**`24_IoT_Networks.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies/24_IoT_Sensor_Networks.md) | `[EXISTING]` `[PROTOTYPE]` | 4-tier LoRaWAN mesh, MQTT v5.0 brokers, and InfluxDB time-series. |
| **25** | **Digital Twin 3D** | [**`25_Digital_Twin.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies/25_Digital_Twin_3D_Mine_Monitoring.md) | `[EXISTING]` `[PROTOTYPE]` | Interactive 3D WebGPU browser Digital Twin with Zone Intel. |
| **26** | **Early-Warning TARP** | [**`26_TARP_Systems.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/technologies/26_Early_Warning_TARP_Systems.md) | `[EXISTING]` `[PROTOTYPE]` | Automated 4-tier TARP dispatcher for sirens, VHF radio & SMS. |

---

## 7. The 11 Core Features of MINE-SAFE AI

1. **Interactive 3D Mine `[PROTOTYPE]`:** Full-pit 6-DoF WebGPU 3D reality mesh with unique Zone IDs (e.g., `ZONE-B3-NORTH`) and dynamic surface risk heatmaps.
2. **AI-Based Risk Assessment `[PROTOTYPE]`:** Multi-modal data fusion producing a Composite Risk Score ($\mathcal{R}_z \in [0.0, 1.0]$) categorized into **Safe, Moderate, High, and Critical**.
3. **Risk Velocity ($\mathbf{d\text{Risk}/dt}$) `[PROTOTYPE]`:** Real-time kinematic time-derivative tracking that detects rapidly deteriorating highwall sectors.
4. **Future Risk Forecast `[PROTOTYPE]`:** Deep time-series neural forecasting coupled with the physical **Saito Inverse Velocity Model** ($\text{IV} = 1/v \to 0$) to extrapolate future risk trajectories and statistical failure horizons ($t_f \pm \sigma$).
5. **Computer Vision Evidence `[PROTOTYPE]`:** Live 4K optical camera analytics providing visual evidence through sub-pixel Lucas-Kanade optical flow, DeepCrack tension crack segmentation, and YOLOv8 falling boulder tracking.
6. **Explainable Risk (SHAP Causal Attribution) `[PROTOTYPE]`:** Local Shapley value decomposition explaining the exact physical drivers behind elevated risk scores (e.g., creep acceleration + pore pressure + crack opening + rain infiltration).
7. **Prediction Confidence Index ($\mathbf{C_{\text{pred}}}$) `[PROTOTYPE]`:** Reliability metric based on sensor density, telemetry freshness ($<60\text{ s}$), packet delivery ratio ($PDR$), and model uncertainty.
8. **Predictive Risk Field `[PROTOTYPE]`:** Continuous 3D dynamic scalar risk layer $\mathcal{R}(x, y, z, t)$ mapped across highwalls and intersecting active haul roads with kinetic runout cones.
9. **Smart Alerts & Autonomous TARP Dispatch `[PROTOTYPE]`:** Multi-tier Trigger Action Response Plan with sub-second ($<1.0\text{ s}$) multi-broadcast dispatch across high-decibel pit sirens ($>120\text{ dB}$), two-way VHF emergency radio, and SMS.
10. **Zone Intelligence (Interactive Drill-Down) `[PROTOTYPE]`:** 1-click smooth camera zoom into any Zone ID opening deep time-series charts, live camera crops, geological joint dip/strike, and a **[Back to Full Mine]** overview button.
11. **Unified Risk Filter Bar `[PROTOTYPE]`:** Global 1-click toolbar to filter the 3D Digital Twin by status: **[All]**, **[Safe]**, **[Moderate]**, **[High]**, and **[Critical]**.

---

## 8. Verified Working Links & Open-Source Codebases

* **3D Geospatial & Digital Twins:**
  * [CesiumJS GitHub](https://github.com/CesiumGS/cesium) | [Live Sandbox Demo](https://sandcastle.cesium.com)
  * [Three.js Engine](https://github.com/mrdoob/three.js) | [Live Examples](https://threejs.org/examples)
  * [WebODM Photogrammetry](https://github.com/OpenDroneMap/WebODM) | [Official Portal](https://www.opendronemap.org/webodm)
  * [CloudCompare M3C2 Processing](https://github.com/CloudCompare/CloudCompare)
* **Edge Computer Vision & AI:**
  * [Ultralytics YOLOv8](https://github.com/ultralytics/ultralytics) | [Docs](https://docs.ultralytics.com)
  * [ByteTrack Multi-Target Tracker](https://github.com/ifzhang/ByteTrack)
  * [OpenCV Library](https://github.com/opencv/opencv) | [Docs](https://docs.opencv.org)
  * [DeepCrack Segmentation](https://github.com/yhlleo/DeepCrack)
  * [SHAP (SHapley Additive exPlanations)](https://github.com/shap/shap)
* **Geotechnical Numerical Physics & Simulation:**
  * [OpenSees FEM Framework](https://github.com/OpenSees/OpenSees) | [Official Portal](https://opensees.berkeley.edu)
  * [Yade DEM Rock Mechanics](https://github.com/yade-dev/yade) | [Docs](https://yade-dem.org)
  * [FloPy (MODFLOW-6 Python Interface)](https://github.com/modflowpy/flopy)
* **Radar, InSAR & Geodesy:**
  * [MintPy SBAS InSAR Tool](https://github.com/insarlab/MintPy)
  * [RTKLIB High-Precision Positioning](https://github.com/tomojitakasu/RTKLIB)
  * [ESA Copernicus Open Access Hub](https://dataspace.copernicus.eu)
* **IoT & Telemetry Infrastructure:**
  * [Eclipse Mosquitto MQTT Broker](https://github.com/eclipse/mosquitto)
  * [ThingsBoard IoT Platform](https://github.com/thingsboard/thingsboard) | [Live Demo](https://demo.thingsboard.io)
  * [ChirpStack LoRaWAN Stack](https://github.com/chirpstack/chirpstack)
  * [InfluxDB Time-Series Database](https://github.com/influxdata/influxdb)

---

## 9. Instructions to Push Updates to GitHub

To push the complete, restructured repository to GitHub:

```bash
cd /Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System
git add .
git commit -m "refactor: Complete audit, restructuring, 20 master chapters, and 26-tech categorization"
git push https://PASTE_YOUR_TOKEN_HERE@github.com/angelverman2021-a11y/Report.git main
```
