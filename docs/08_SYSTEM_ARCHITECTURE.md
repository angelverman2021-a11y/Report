# 08. Multi-Tier System Architecture & Prototype Hardware

> **Document Type:** Master Research & Architecture Report  
> **Problem Statement ID:** SIH25071  
> **Problem Statement Title:** AI-Based Rockfall Risk Prediction & Early-Warning System for Open-Pit Mines  
> **Organization:** Ministry of Mines | **Category:** Software | **Theme:** Disaster Management  
> **Target System:** MINE-SAFE AI Platform  
> **Target File:** `docs/08_SYSTEM_ARCHITECTURE.md`

---

## 1. Multi-Tier System Architecture Overview

**MINE-SAFE AI** is structured into five decoupled architectural tiers designed for resilient edge execution and centralized supervisory monitoring:

```
                  ┌────────────────────────────────────────────────────────┐
                  │      5. 3D MINE MONITORING & COMMAND CENTER TIER       │
                  │   WebGL / CesiumJS 3D Reality Mesh | Zone Drill-Down   │
                  └───────────────────────────▲────────────────────────────┘
                                              │ WebSocket / HTTP REST API
                  ┌───────────────────────────┴────────────────────────────┐
                  │      4. TARP DECISION SUPPORT & ALERTING TIER          │
                  │   4-Tier TARP Engine | Siren Relay | Radio / SMS Logic │
                  └───────────────────────────▲────────────────────────────┘
                                              │ Risk Score & Feature Stream
                  ┌───────────────────────────┴────────────────────────────┐
                  │      3. AI ANALYTICAL & EXPLAINABILITY TIER            │
                  │   XGBoost Classifier | LSTM Forecaster | SHAP Engine   │
                  └───────────────────────────▲────────────────────────────┘
                                              │ Synchronized Feature Vector
                  ┌───────────────────────────┴────────────────────────────┐
                  │      2. DATA VALIDATION & TIME-SERIES STORE TIER       │
                  │   Quality Filter | Kinematic Derivatives | InfluxDB    │
                  └───────────────────────────▲────────────────────────────┘
                                              │ MQTT / TLS Transport
                  ┌───────────────────────────┴────────────────────────────┐
                  │      1. SENSOR INGESTION & EDGE SENSING TIER           │
                  │   Optical Cameras | LoRa Geotech Nodes | Weather AWS   │
                  └────────────────────────────────────────────────────────┘
```
*Figure 8.1: Five-tier decoupled software architecture of the MINE-SAFE AI platform.*

---

## 2. Detailed Tier Specifications

### Tier 1: Sensor Ingestion & Edge Sensing
* **Edge Optical Ingestion:** Optical video streams (RTSP) from pit-rim cameras are ingested by local edge compute modules for frame extraction and optical flow analysis.
* **In-Situ Wireless Telemetry:** Low-power wireless nodes transmit displacement, crack aperture, and MEMS tilt measurements over private **LoRaWAN (865–867 MHz frequency band in India)** to a sector gateway.
* **Meteorological Ingestion:** Precipitation rates ($mm/hr$), temperature, and barometric pressure are gathered from automated weather sensors.

### Tier 2: Data Validation & Time-Series Store
* **Telemetry Broker:** An open-standard MQTT broker handles sensor payload ingestion with QoS delivery guarantees.
* **Time-Series Persistence:** **InfluxDB** provides optimized storage for multi-modal time-series telemetry with millisecond precision.
* **Data Quality Sentinel:** Detects missing packets, voltage drops, out-of-range sensor readings, and blasting vibration intervals.

### Tier 3: AI Analytical & Explainability Engine
* **Core Risk Classifier:** Gradient boosted decision trees (**XGBoost / Random Forest**) evaluate multi-sensor feature vectors to generate normalized zone risk scores ($\mathcal{R}_z \in [0.0, 1.0]$).
* **Temporal Trend Forecaster:** Recurrent network (LSTM / GRU) predicts deformation trends over near-term forecast windows.
* **Explainability Core:** **SHAP TreeExplainer** generates additive feature contribution breakdowns for human review.

### Tier 4: TARP Decision Support & Alert Dispatch
* **Rule-Based & AI TARP Engine:** Evaluates composite risk scores against predefined operational action tiers.
* **Multi-Channel Alert Dispatch:** Triggers physical warning relays, radio broadcasts, and digital notifications for mine personnel.

### Tier 5: 3D Visualization & Command Center
* **Interactive 3D Terrain View:** Renders the open-cast pit reality mesh in CesiumJS / Three.js.
* **Zone Intelligence Drawer:** Smooth camera navigation into specific highwall sectors with time-series diagnostic overlays.

---

## 3. Illustrative Prototype Hardware Bill of Materials (BOM)

To demonstrate technical feasibility within student and prototype boundaries, the hardware architecture uses accessible components:

### A. Pit-Rim Edge Compute & Gateway Unit (Illustrative Prototype)
| Component | Specifications | Purpose | Status |
| :--- | :--- | :--- | :--- |
| **Edge Processor** | NVIDIA Jetson / Industrial ARM SBC | Optical flow extraction and edge model inference | `[PROTOTYPE]` |
| **Optical IP Camera** | High-Definition PTZ Camera (RTSP) | Highwall surface video streaming | `[PROTOTYPE]` |
| **LoRaWAN Gateway** | 8-Channel Gateway (865–867 MHz) | Sensor packet aggregation | `[PROTOTYPE]` |
| **Power Management** | Solar Panel + Battery Backup | Continuous off-grid bench testing | `[PROTOTYPE]` |
| **Alert Unit** | Industrial Relay Module + Acoustic Siren | Multi-channel early-warning testing | `[PROTOTYPE]` |

### B. In-Situ Wireless Geotechnical Sensor Node (Illustrative Prototype)
| Component | Specifications | Purpose | Status |
| :--- | :--- | :--- | :--- |
| **Microcontroller** | ESP32-S3 (Dual-core, low power) | Sensor readout, calibration, and packetization | `[PROTOTYPE]` |
| **Wireless Transceiver** | Semtech SX1262 LoRa Module | Long-range wireless telemetry | `[PROTOTYPE]` |
| **MEMS Inclinometer** | ADXL355 Triaxial Accelerometer | Highwall tilt tracking | `[PROTOTYPE]` |
| **Crackmeter Transducer** | Linear Potentiometer / LVDT | Tension crack dilation monitoring | `[PROTOTYPE]` |
| **Enclosure & Power** | Weatherproof IP67 casing + Battery | Environmental protection against dust and rain | `[PROTOTYPE]` |
