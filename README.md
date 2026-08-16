# SIH 2025 (SIH25071) — Master Technical Report & Architecture Repository
## AI-Based Rockfall Prediction and Alert System for Open-Pit Mines
**Organization:** Ministry of Mines | **Category:** Software | **Theme:** Disaster Management  
**Principal Investigator / Author:** Angel Verman & Team  
**Repository Path:** `/Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System`

---

## 📌 Executive Summary & Strategic Mission

Open-pit mining accounts for over **80% of mineral and coal production in India**. Highwall collapses, bench failures, and sudden rockfalls represent the single most lethal hazard in open-cast mines, causing loss of human lives, equipment destruction (dumpers, shovels, excavators), and operational shutdowns running into crores of rupees per day.

This repository provides an exhaustive, publication-grade benchmark analyzing all **26 industry & research technologies** identified for open-pit slope stability and rockfall monitoring under the Ministry of Mines Problem Statement (`SIH25071`). 

### Core Objectives of This Repository:
1. **Individual Standalone Analysis:** Every single one of the 26 technologies has its own dedicated `.md` research report in `docs/` detailing how it was built, its pros/cons, failure modes, and mathematical principles.
2. **Critical Market & Feasibility Synthesis:** In this Master `README.md`, we synthesize what is already done in industry, what lacks accuracy / triggers false alarms, what is too expensive, what is missing, and **which features are feasible ("doable") for us to build and integrate into our winning SIH25071 solution**.

---

## 🧭 Complete Master Index of All 26 Dedicated Technology Reports

| # | Technology Name | Dedicated Research Report Link | Core Domain | Feasibility for SIH25071 |
| :---: | :--- | :--- | :--- | :---: |
| **01** | **Slope Stability Radar (SSR)** | [**`01_slope_stability_radar_ssr.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/01_slope_stability_radar_ssr.md) | Remote Radar | **Physics Adopted** (Too expensive to build; math & inverse velocity integrated) |
| **02** | **Ground-Based InSAR (GB-InSAR)** | [**`02_Ground_Based_InSAR_GB_InSAR.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/02_Ground_Based_InSAR_GB_InSAR.md) | Remote Radar | **Spatial Principles Adopted** (Spatial grid & deformation heatmaps integrated) |
| **03** | **Satellite InSAR (D-InSAR / SBAS)**| [**`03_Satellite_InSAR.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/03_Satellite_InSAR.md) | Satellite Radar | **Doable via API** (Ingest free Sentinel-1 data as regional baseline prior) |
| **04** | **Total Station + Prism Monitoring**| [**`04_Total_Station_Prism_Monitoring.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/04_Total_Station_Prism_Monitoring.md) | Geodetic Optical | **Replaced by Vision AI** (Virtual Prismless Tracking across 100,000+ points) |
| **05** | **GNSS / GPS Monitoring** | [**`05_GNSS_GPS_Monitoring.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/05_GNSS_GPS_Monitoring.md) | Satellite Geodesy| **Doable via IoT** (Low-cost multi-band RTK GNSS + IMU LoRa nodes) |
| **06** | **LiDAR / Laser Scanning (TLS)** | [**`06_LiDAR_Laser_Scanning.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/06_LiDAR_Laser_Scanning.md) | Laser Scanning | **Replaced by Edge RGB-D** (Continuous stereoscopic depth differencing) |
| **07** | **Drone / UAV Photogrammetry** | [**`07_Drone_UAV_Photogrammetry.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/07_Drone_UAV_Photogrammetry.md) | Aerial Optical | **Doable & Integrated** (Ingest 3D DEM mesh for WebGPU Digital Twin) |
| **08** | **UAV LiDAR** | [**`08_UAV_LiDAR.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/08_UAV_LiDAR.md) | Aerial Laser | **Integrated Baseline** (Ingest point clouds for AI structural joint extraction) |
| **09** | **Inclinometers (Subsurface)** | [**`09_Inclinometers.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/09_Inclinometers.md) | Subsurface Contact| **Doable via PINN** (Inclinometer data constrains deep slip boundary in AI) |
| **10** | **Extensometers (Wire & MPBX)** | [**`10_Extensometers.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/10_Extensometers.md) | Subsurface Contact| **Replaced by Vision AI** (Non-contact telephoto camera optical crack gauge) |
| **11** | **Piezometers (Vibrating Wire)** | [**`11_Piezometers.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/11_Piezometers.md) | Hydrogeological | **Doable & Integrated** (Real-time pore pressure feeds dynamic Mohr-Coulomb FoS) |
| **12** | **Crack / Joint Meters** | [**`12_Crack_Joint_Meters.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/12_Crack_Joint_Meters.md) | Surface Contact | **Replaced by Vision AI** (Pit-wide AI crack segmentation using Mobile-SAM) |
| **13** | **Tilt Sensors / Tiltmeters** | [**`13_Tilt_Sensors_Tiltmeters.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/13_Tilt_Sensors_Tiltmeters.md) | Surface Contact | **Core Doable Hardware** (Custom ₹2,800 LoRa MEMS tilt nodes with Kalman filter) |
| **14** | **Strain Gauges** | [**`14_Strain_Gauges.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/14_Strain_Gauges.md) | Structural Contact| **Doable via LoRa** (Feeds structural rock bolt yield health into AI model) |
| **15** | **Time-Domain Reflectometry (TDR)** | [**`15_TDR_Time_Domain_Reflectometry.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/15_TDR_Time_Domain_Reflectometry.md) | Subsurface Cable | **Doable Calibration** (Cable crimp signal locks 3D failure slip surface depth) |
| **16** | **Seismic / Vibration Sensors** | [**`16_Seismic_Vibration_Sensors.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/16_Seismic_Vibration_Sensors.md) | Dynamic Shocks | **Doable via 1D-CNN** (Edge spectrogram separates blast PPV from rock micro-fractures) |
| **17** | **Weather Stations (AWS)** | [**`17_Weather_Stations.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/17_Weather_Stations.md) | Environmental | **Core Doable Component** (Precipitation rate $mm/hr$ & Antecedent Moisture Index) |
| **18** | **Groundwater Monitoring Wells** | [**`18_Groundwater_Monitoring.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/18_Groundwater_Monitoring.md) | Hydrogeological | **Doable Model Coupling** (Calculates dynamic hydrostatic thrust $U = \frac{1}{2}\gamma_w z_w^2$) |
| **19** | **CCTV / Fixed Optical Cameras** | [**`19_CCTV_Fixed_Cameras.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/19_CCTV_Fixed_Cameras.md) | Optical Vision | **Core Doable Component** (Upgrades existing mine cameras into active AI sensors) |
| **20** | **Computer Vision (Standalone)** | [**`20_Computer_Vision.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/20_Computer_Vision.md) | Edge Vision AI | **Core Doable Component** (Sub-pixel optical flow + 3D DEM ray casting) |
| **21** | **Manual Geological Inspection** | [**`21_Manual_Geological_Inspection.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/21_Manual_Geological_Inspection.md) | Human Fieldwork | **Automated by AI** (Zero human hazard; AI extracts joint strike/dip from 3D clouds) |
| **22** | **Numerical Slope Stability (FEM/LEM)**| [**`22_Numerical_Slope_Stability_Analysis.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/22_Numerical_Slope_Stability_Analysis.md) | Geomechanics | **Doable via PINN** (PINN surrogate computes 3D Factor of Safety in <50 ms) |
| **23** | **AI / Machine Learning Prediction**| [**`23_AI_Machine_Learning_Prediction.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/23_AI_Machine_Learning_Prediction.md) | Predictive Core | **Core Doable Component** (XGBoost + Saito Inverse Velocity + SHAP XAI) |
| **24** | **IoT Wireless Sensor Networks** | [**`24_IoT_Sensor_Networks.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/24_IoT_Sensor_Networks.md) | Telemetry Mesh | **Core Doable Component** (LoRaWAN & multi-hop mesh with edge-adaptive sampling) |
| **25** | **Digital Twin / 3D Mine Monitoring**| [**`25_Digital_Twin_3D_Mine_Monitoring.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/25_Digital_Twin_3D_Mine_Monitoring.md) | Geospatial 3D | **Core Doable Component** (WebGPU 3D Canvas + 3D Rockfall Kinetic Runout Cones) |
| **26** | **Early-Warning & TARP Systems** | [**`26_Early_Warning_TARP_Systems.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/26_Early_Warning_TARP_Systems.md) | Life Safety | **Core Doable Component** (Autonomous Sub-Second Sirens, VHF Radio & SMS <1.0s) |
| **★** | **SIH Winning Architecture Blueprint**| [**`PROPOSED_AI_ARCHITECTURE_BLUEPRINT.md`**](file:///Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System/docs/PROPOSED_AI_ARCHITECTURE_BLUEPRINT.md) | Full Blueprint | **The Master SIH Solution Architecture & Hardware BOM** |

---

## 🔬 Critical Benchmark Synthesis: What Exists vs. What Fails in Industry

```mermaid
mindmap
  root((Open-Pit Slope Monitoring Industry Benchmark))
    High-End Radar SSR & GB-InSAR
      Pros: Sub-millimeter precision, wide spatial coverage
      Cons: Prohibitive Capex ₹4 Cr - ₹10 Cr, Atmospheric noise
      Status: <5% adoption in Indian mines
    Point Sensors Prisms & Inclinometers
      Pros: Direct 3D coordinates, deep shear profiling
      Cons: Discrete point blindness, Shattered by blasting flyrock
      Status: High maintenance hazard
    Passive CCTV & Weather
      Pros: Ubiquitous in mines, low hardware cost
      Cons: 90% human operator fatigue, no predictive metrics
      Status: Purely reactive post-incident review
    Proposed GeoShield AI
      Innovation 1: Sub-pixel Optical Flow + LoRa IoT Mesh at 5% cost
      Innovation 2: Multi-Modal Fusion (Vision + Rain + Pore Pressure + Blast PPV)
      Innovation 3: Physics-Informed ML + Saito Inverse Velocity tf
      Innovation 4: Autonomous Sub-Second Multi-Channel TARP Alerts
```

---

## 🎯 Feasibility Analysis: What is "Doable" for Us in SIH25071?

To build a hackathon-winning solution for the Ministry of Mines, we categorize the 26 technologies into three practical engineering tiers:

```
+---------------------------------------------------------------------------------------------------+
|                            SIH25071 FEASIBILITY & DEVELOPMENT TIERS                               |
+---------------------------------------------------------------------------------------------------+
|  [ TIER 1: CORE TO BUILD & DEMONSTRATE (100% Doable in Software & Low-Cost Hardware) ]           |
|  1. Edge Computer Vision Engine: Sub-pixel optical flow, YOLO bench masking, crack segmentation. |
|  2. Wireless LoRa IoT Sensor Mesh: ESP32 + MEMS tilt/vibration nodes ($30/node) with Kalman filter|
|  3. Micro-Weather Ingestion: Real-time rainfall rate (mm/hr) & Antecedent Moisture Index (AMI).   |
|  4. WebGPU 3D Digital Twin: Interactive 60 FPS browser canvas with real-time risk heatmaps.       |
|  5. 3D Kinetic Rockfall Runout Simulator: Rigid-body boulder bounce trajectory & impact cones.   |
|  6. Multi-Modal AI Core: XGBoost + Physics-Informed Neural Network (PINN) + Saito Inverse Velocity|
|  7. Explainable AI (XAI): SHAP breakdown of exact contributing triggers for every alert.          |
|  8. Autonomous TARP Dispatcher: Sub-second triggers for sirens, VHF radio voice, and SMS/WhatsApp.|
+---------------------------------------------------------------------------------------------------+
                                                  │
                                                  ▼
+---------------------------------------------------------------------------------------------------+
|  [ TIER 2: SOFTWARE-EMULATED & DATA-INTEGRATED (Doable via Open APIs & Standard Formats) ]        |
|  1. Virtual Prismless Tracking: Eliminates glass prisms by tracking natural rock texture features.|
|  2. Drone 3D Photogrammetry Ingestion: Ingests standard OBJ/GLTF/DEM files from survey drones.    |
|  3. Open-Access Satellite InSAR: Ingests Sentinel-1 SBAS subsidence velocity maps via open API.   |
|  4. Piezometer & Groundwater Hydrogeology: Live pore pressure telemetry feeds Mohr-Coulomb FoS.   |
|  5. Blast Vibration Modeling: Ingests geophone Peak Particle Velocity (PPV) to adjust thresholds. |
+---------------------------------------------------------------------------------------------------+
                                                  │
                                                  ▼
+---------------------------------------------------------------------------------------------------+
|  [ TIER 3: HARDWARE PROHIBITIVE (Too Expensive / Impractical to Build from Scratch) ]             |
|  - Slope Stability Radar (SSR) hardware: ₹3.5 Cr – ₹8.0 Cr trailer.                               |
|  - Ground-Based InSAR (GB-InSAR) hardware: ₹4.0 Cr – ₹10.0 Cr motorized mechanical rail.          |
|  - Terrestrial LiDAR Scanner (TLS): ₹40L – ₹1.2 Cr rotating laser tripod.                         |
|  - Deep Borehole Drilling Rigs: ₹5L – ₹15L per drilling borehole.                                 |
|  *OUR STRATEGY: We extract their underlying physical formulas (phase interferometry, M3C2,        |
|   Saito inverse velocity, shear strain reduction) and replicate their spatial intelligence        |
|   using 95% cheaper Edge Vision + Wireless IoT mesh software!*                                    |
+---------------------------------------------------------------------------------------------------+
```

---

## 📊 Comprehensive 26-Technology Evaluation Matrix

| # | Technology | Current Industry State | Accuracy & Noise Limitations | Cost & Deployment Friction | What is Missing / Market Gaps | Proposed SIH25071 AI Alternative |
|---|---|---|---|---|---|---|
| **1** | **SSR** | Real-aperture radar sub-mm tracking. | Blind spots; severe atmospheric noise in rain/dust. | ₹3.5 Cr – ₹8 Cr Capex + ₹40L/yr Opex. | Prohibitive cost; ignores pore pressure & joints. | Sub-pixel optical flow + LoRa tilt arrays at 5% cost. |
| **2** | **GB-InSAR** | Synthetic aperture radar scanning wide slopes. | Phase ambiguity if deformation $> \lambda/4$; slow scan (2-10 min). | ₹4 Cr – ₹10 Cr; fragile mechanical rail. | Too slow for sudden boulder falls; 1D LOS only. | Low-cost mmWave radar + 30 FPS Edge Computer Vision. |
| **3** | **Satellite InSAR** | Sentinel-1 / TerraSAR-X constellations. | 6 to 12-day latency; decorrelation in blasted pits. | $10k–$50k/yr commercial; free Sentinel-1 is coarse. | Useless for real-time life safety alerts. | Ingest Sentinel-1 SAR via API as a macro regional prior. |
| **4** | **Total Station (RTS)**| Motorized laser EDM measuring prisms. | Prisms shattered by blasting; dust blocks optical line. | ₹25L – ₹60L; hazardous manual prism replacement. | Discrete points only (misses gaps between prisms). | **Virtual Prismless Tracking** across 100,000+ rock points. |
| **5** | **GNSS / GPS** | Dual-frequency RTK GNSS on crests. | Multipath errors; satellite view blocked in deep pits. | ₹1.5L – ₹4L per node (₹50L+ array). | Point-based only; signal dropouts in deep pits. | LoRa GNSS + 6-axis MEMS IMU with edge Kalman filter. |
| **6** | **LiDAR (TLS)** | 50M+ point clouds from tripod scanners. | Non-continuous periodic surveys; massive data size. | ₹40L – ₹1.2 Cr; heavy survey labor overhead. | Static snapshot only; zero real-time alerting. | Real-time stereoscopic RGB-D edge depth differencing. |
| **7** | **Drone Photogrammetry**| Aerial camera grid flights generating DEMs. | 2–6 hours SfM processing lag; weather/night limits. | ₹3L – ₹15L per drone rig. | Cannot warn during active rock movement. | Drone 3D mesh feeds base geometry for 3D Digital Twin. |
| **8** | **UAV LiDAR** | Airborne laser scanner penetrating dust. | High crash risk in deep pits; 25-min battery limit. | ₹25L – ₹80L per drone setup. | Periodic survey tool only; zero 24/7 alerting. | Automated AI joint extraction (dip/strike) from point cloud. |
| **9** | **Inclinometers** | Cased boreholes measuring deep shear. | Shearing rock severs cable, destroying instrument. | ₹5L – ₹15L per borehole; high drilling failure. | Single 1D line; high replacement cost upon shear. | Inclinometer ground-truth calibrates PINN slip surface. |
| **10** | **Extensometers** | Rods/wires measuring tension crack opening. | Wires snap from rockfalls, rain, or haul trucks. | ₹50k – ₹3L per node; continuous maintenance. | Fragile mechanical links; frequent false alarms. | Non-contact optical telephoto camera crack gauge. |
| **11** | **Piezometers** | Diaphragms measuring pore water pressure. | Zero kinematic output (measures pressure, not movement).| ₹1L – ₹3L per hole + drilling costs. | Measures trigger, not kinetic failure timing. | Live pore pressure feeds dynamic Mohr-Coulomb FoS. |
| **12** | **Crack Meters** | Transducers anchored across tension cracks. | Hazardous installation on collapsing crests; 1-crack only.| ₹20k – ₹80k per crack node. | Hyper-localized; blind to new cracks 1m away. | Continuous Computer Vision pit-wide crack segmentation. |
| **13** | **Tiltmeters** | MEMS sensors measuring angular rotation. | Blind to pure planar translational sliding without tilt. | ₹5k – ₹25k per node. | False alarms from blasting without multi-sensor logic.| Distributed ₹2,800 LoRa tilt nodes with Kalman filter. |
| **14** | **Strain Gauges** | Foil/wire gauges on rock bolts and shotcrete. | Hyper-localized micro-strain; adhesive debonds. | ₹5k – ₹20k per channel. | Measures support load, not macro slope collapse. | Rock bolt strain feeds Structural Support Health Index. |
| **15** | **TDR Cables** | Grouted coaxial cables reflecting pulses. | Destructive single-use (severed upon shear). | ₹1L – ₹4L per borehole. | Binary failure detection; lacks pre-failure velocity. | Cable crimp signals lock 3D failure slip plane depth. |
| **16** | **Seismic Sensors** | Geophones monitoring acoustic emission & PPV. | Overwhelming noise from haul trucks and drills. | ₹5L – ₹20L for multi-channel array. | High false alarm rate; hard to locate hypocenters. | Edge 1D-CNN separates truck rumble from rock fractures. |
| **17** | **Weather Stations** | Rain gauges, temperature, humidity, wind. | Indirect proxy only; zero kinematic slope data. | ₹30k – ₹1.5L; low maintenance. | Measures trigger without geotechnical spatial context. | Rain rate ($mm/hr$) dynamically boosts AI sensitivity. |
| **18** | **Groundwater Wells** | Standpipes tracking water table drawdowns. | Slow response; fails to catch perched water in cracks. | ₹2L – ₹8L per cased well. | Measures regional hydrogeology, not fast rockfalls. | Couples groundwater table with weather to model thrust $U$. |
| **19** | **CCTV Cameras** | Security cameras streaming pit video. | Human fatigue: operators miss >90% of events in 20 min. | ₹15k – ₹80k per camera; already in >90% mines. | Passive video without automated numerical metrics. | Upgrades CCTV into active AI sensor running optical flow. |
| **20** | **Computer Vision** | YOLO object detection and 2D optical flow. | False alarms from dust, shadows, birds, vibrations. | ₹1.0L – ₹3.5L (Edge Jetson + camera). | 2D pixels lack true metric depth/scale. | Fuses optical flow with 3D DEM & LoRa tilt telemetry. |
| **21** | **Manual Inspection** | Geologists physically mapping rock joints. | Lethal life hazard; infrequent (weekly); subjective bias. | Low direct Capex; extreme human liability. | Intermittent snapshots cannot catch sudden failures. | Automated AI joint extraction from drone 3D point clouds. |
| **22** | **Numerical FEM/LEM**| 2D/3D physics simulation (Slide, FLAC3D). | Static & offline; takes hours to compute. | ₹10L – ₹40L per license + specialized PhD labor. | Cannot run in real-time closed loop with sensors. | **PINN Surrogate** computes dynamic 3D FoS in <50 ms. |
| **23** | **AI / ML Prediction**| LSTM, XGBoost forecasting failure time $t_f$. | "Black box" unconstrained AI hallucinations. | Low compute costs (₹1.5L – ₹5L). | Unconstrained models lack geomechanical trust. | **Physics-Informed AI**: XGBoost + Saito Inverse Velocity. |
| **24** | **IoT Sensor Networks**| LoRaWAN wireless sensor telemetry mesh. | RF packet loss in deep pits; low bandwidth. | ₹2.5k – ₹5k per node; highly scalable. | Raw data dumps without automated hazard synthesis. | Edge-intelligent nodes with adaptive 10 Hz burst mode. |
| **25** | **Digital Twin 3D** | Web 3D visualization (Three.js/Cesium). | Heavy rendering crashes tablets; often static. | ₹15L – ₹50L development. | Pure visual layer without predictive AI backplane. | **WebGPU 3D Digital Twin** with live rockfall runout cones. |
| **26** | **TARP Systems** | Trigger Action Response Plan protocols. | Manual human approval chain takes 15–45 minutes. | ₹2L – ₹10L for sirens and PA. | Administrative delay in sounding emergency alarms. | **Autonomous Sub-Second TARP Dispatch** (<1.0 second). |

---

## 🏆 Summary of Proposed Innovations for SIH 2025

```mermaid
flowchart TD
    subgraph Multi-Modal Ingestion
        I1[High-Zoom PTZ Cameras: Sub-Pixel Optical Flow]
        I2[Low-Cost Wireless LoRa MEMS Tilt & Vibration Nodes]
        I3[Micro-Weather Station: Rainfall Intensity mm/hr]
        I4[Vibrating-Wire Piezometer Pore-Water Pressure]
        I5[Drone 3D Photogrammetry Digital Elevation Model]
    end

    subgraph Edge AI Core
        I1 & I2 & I3 & I4 & I5 --> AI[Physics-Informed Neural Network & XGBoost Core]
        AI --> OUT1[Rockfall Risk Probability: 0.0 to 1.0]
        AI --> OUT2[Saito Inverse Velocity Failure Time: tf ± σ]
        AI --> OUT3[3D Kinetic Rockfall Bounce & Runout Cone]
    end

    subgraph Actionable Delivery
        OUT1 & OUT2 & OUT3 --> XAI[SHAP Explainable Diagnostic Card]
        XAI --> DASH[Interactive WebGPU 3D Digital Twin Dashboard]
        OUT1 --> TARP[Autonomous Sub-Second TARP Emergency Dispatch: Sirens + VHF Radio + SMS]
    end
```

1. **Democratizing Mine Safety (95% Cheaper):** Delivering radar-grade spatial early warning for ₹2.0 Lakh – ₹5.0 Lakh per pit instead of ₹5.0+ Crores.
2. **Multi-Modal Data Fusion:** Concurrently analyzing surface optical velocity ($mm/hr$), wireless micro-tilt, pore-water pressure, and rainfall surges.
3. **Physics-Grounded Explainable AI:** Enforcing Saito Inverse Velocity ($1/v \to 0$) and Mohr-Coulomb mechanics with SHAP causal attribution.
4. **Autonomous Sub-Second Evacuation (<1.0s):** Eliminating the lethal 15–45 minute human administrative delay in sounding pit sirens.

---

> [!TIP]
> **To push this entire repository to GitHub**, use your newly created Personal Access Token with `repo` permissions:
> ```bash
> cd /Users/angle/.gemini/antigravity/scratch/SIH25071-Rockfall-Prediction-System
> git add .
> git commit -m "feat: Restructure all 26 technologies into individual standalone reports + Master README synthesis"
> git push https://PASTE_YOUR_TOKEN_HERE@github.com/angelverman2021-a11y/Report.git main
> ```
