# 09. Data Acquisition & Dataset Strategy

> **Document Type:** Master Research & Architecture Report  
> **Problem Statement ID:** SIH25071  
> **Problem Statement Title:** AI-Based Rockfall Prediction and Alert System for Open-Pit Mines  
> **Organization:** Ministry of Mines | **Category:** Software | **Theme:** Disaster Management  
> **Target System:** MINE-SAFE AI Platform  
> **Target File:** `docs/09_DATA_STRATEGY.md`

---

## 1. Tri-Partite Data Strategy Overview

To train, evaluate, and validate the **MINE-SAFE AI** software platform without relying on expensive, proprietary industrial radar databases, our team established a rigorous **Tri-Partite Data Acquisition Strategy**:

```
+---------------------------------------------------------------------------------------------------+
|                            TRI-PARTITE DATA ACQUISITION ARCHITECTURE                              |
+---------------------------------------------------------------------------------------------------+
|  [ A. REAL / PUBLIC OPEN DATA ]                                                                   |
|  - Copernicus Sentinel-1 Synthetic Aperture Radar (SAR) imagery for regional SBAS interferometry  |
|  - OpenTopography / USGS 30m and 1m Digital Elevation Models (DEM) for 3D terrain meshes          |
|  - Indian Meteorological Department (IMD) / NOAA historical monsoonal rainfall records           |
|  - Published open-access landslide/rockfall deformation datasets (Zenodo, Mendeley Data)          |
|                                                                                                   |
|  [ B. PROTOTYPE HARDWARE SENSOR TELEMETRY ]                                                       |
|  - Custom ESP32-S3 wireless LoRa nodes streaming triaxial MEMS tilt and potentiometer crack data  |
|  - Real-time 4K camera RTSP optical feeds processed for sub-pixel optical flow and crack masks   |
|  - Simulated GNSS NMEA sentence streams and digital tipping-bucket rain gauge pulses              |
|                                                                                                   |
|  [ C. SYNTHETIC PHYSICS-BASED SIMULATION DATA ]                                                   |
|  - Yade DEM (Discrete Element Method) kinetic rockfall trajectory and boulder runout simulations  |
|  - OpenSees Finite Element shear strength reduction failure scenarios under extreme rainfall      |
|  - Geotechnical tertiary creep acceleration curves modeled via Saito inverse velocity math        |
+---------------------------------------------------------------------------------------------------+
```

> **Mandatory Scientific Integrity Disclosure:**  
> *"Synthetic simulation data is strictly utilized for rare-event failure mode modeling, anomaly testing, and prototype UI demonstration. Under no circumstances is synthetic data represented as real-world mine collapse data in this report."*

---

## 2. Real & Public Data Sources

| Data Modality | Source Organization / Portal | Format / Resolution | Use in MINE-SAFE AI |
| :--- | :--- | :--- | :--- |
| **Satellite Radar (SAR)** | ESA Copernicus Open Access Hub | Sentinel-1 Single Look Complex (SLC) | Baseline regional subsidence prior via MintPy SBAS |
| **Digital Elevation Model** | OpenTopography / SRTM | GeoTIFF / 1m–30m DTM | 3D reality mesh generation in WebGPU Digital Twin |
| **Meteorological Rain Data**| IMD / NOAA GFS Open API | Hourly precipitation ($mm/hr$) | Antecedent Moisture Index ($\text{API}_7$) feature |
| **Rockfall Scars & Cracks** | Zenodo Open Geodata Repository | RGB Imagery & Point Clouds | Training DeepCrack segmentation and YOLOv8 |

---

## 3. Data Cleaning, Validation & Feature Engineering Pipeline

Raw sensor measurements collected from harsh open-pit environments contain high-frequency noise, blasting vibrations, missing packets, and thermal drifts. Before feeding the AI engine, telemetry undergoes a 4-step pipeline:

```
+---------------------------------------------------------------------------------------------------+
|                             DATA PREPROCESSING & FEATURE PIPELINE                                 |
+---------------------------------------------------------------------------------------------------+
|  1. OUTLIER & BLAST FILTERING:                                                                    |
|     - Rejects extreme single-sample spikes (>50 mm/s) coinciding with scheduled blast windows.    |
|     - Applies a 5-point moving median filter to eliminate electromagnetic interference (EMI).     |
|                                                                                                   |
|  2. TEMPORAL INTERPOLATION & RESAMPLING:                                                          |
|     - Resamples asynchronous sensor packets into a uniform 1-minute time-series grid.              |
|     - Applies forward-fill imputation for missing packets up to a 5-minute timeout window.        |
|                                                                                                   |
|  3. THERMAL EXPANSION COMPENSATION:                                                               |
|     - Corrects crackmeter length readings using measured ambient temperature (T):                 |
|       Δd_corrected = Δd_raw - α_steel * L_0 * (T - T_ref)                                         |
|                                                                                                   |
|  4. KINEMATIC FEATURE DERIVATIVES:                                                                |
|     - Displacement Velocity:      v(t) = [d(t) - d(t - Δt)] / Δt                                  |
|     - Creep Acceleration:         a(t) = [v(t) - v(t - Δt)] / Δt                                  |
|     - Saito Inverse Velocity:     IV(t) = 1 / v(t)  (where IV -> 0 indicates imminent collapse!)  |
|     - Pore Pressure Ratio:        r_u = u / (γ * H)                                               |
+---------------------------------------------------------------------------------------------------+
```

---

## 4. Illustrative Standardized JSON Payload

Below is an illustrative payload schema utilized in prototype message routing:

```json
{
  "zone_id": "ZONE_B3_EAST",
  "timestamp": "2026-08-17T23:50:00.000Z",
  "data_status": "SYNTHETIC_PROTOTYPE_DATA",
  "kinematic_telemetry": {
    "optical_flow_velocity_mm_per_hr": 14.2,
    "crack_dilation_rate_mm_per_day": 3.8,
    "mems_tilt_angle_deg": 0.125,
    "saito_inverse_velocity_hr_per_mm": 0.0704
  },
  "environmental_telemetry": {
    "pore_water_pressure_kpa": 195.0,
    "rainfall_intensity_mm_per_hr": 35.0,
    "antecedent_moisture_index_7day": 142.5
  },
  "ai_risk_evaluation": {
    "composite_risk_score": 0.82,
    "risk_level": "HIGH",
    "forecast_horizon_hours": 4.5,
    "prediction_confidence_pct": 94.8
  }
}
```
*Note: All values in the payload above represent synthetic test bench parameters for prototype demonstration.*
