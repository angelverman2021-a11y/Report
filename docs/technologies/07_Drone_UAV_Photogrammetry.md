# Existing Technology 7: Drone / UAV Photogrammetry

> **Document Type:** Research & Benchmark Analysis 
> **Problem Statement ID:** SIH25071 
> **Problem Statement Title:** AI-Based Rockfall Prediction and Alert System for Open-Pit Mines 
> **Organization:** Ministry of Mines | **Category:** Software | **Theme:** Disaster Management 
> **Prepared For:** Smart India Hackathon (SIH 2025) Research & Development Documentation 
> **Target File:** `docs/technologies/07_Drone_UAV_Photogrammetry.md`
> **Technology Status:** [EXISTING] [PROTOTYPE] | WebODM SfM pipeline generates base 3D terrain reality mesh

---

## Executive Summary

Unmanned Aerial Vehicle (**UAV / Drone**) Photogrammetry is an optical remote-sensing and 3D reconstruction methodology widely adopted across the open-pit mining industry for topographic surveying, bench volume reconciliation, and geotechnical structural mapping. By flying automated aerial missions with high-resolution digital cameras, drones capture overlapping multi-angle photographs of highwalls and benches. These images are processed using **Structure-from-Motion (SfM)** and **Multi-View Stereo (MVS)** algorithms to reconstruct photorealistic 3D point clouds, Digital Surface Models (**DSMs**), and high-resolution orthomosaics with centimeter-level Ground Sample Distance (**GSD**).

This report evaluates Drone Photogrammetry as an **existing spatial monitoring technology**. It explains optical camera geometry, bundle adjustment math, multi-temporal change detection, automated discontinuity mapping, and structural joint extraction. Furthermore, it benchmarks verified open-source toolkits (such as **WebODM**, **COLMAP**, and **Meshroom/AliceVision**), assesses practical mining limitations (such as processing latency and flight restrictions), and defines how drone 3D meshes serve as the foundational geometric baseline for our **multi-modal AI early-warning architecture for SIH25071**.

---

## 1. Introduction to Drone / UAV Photogrammetry

### What is UAV Photogrammetry?
**UAV Photogrammetry** is the science of extracting reliable 3D geometric measurements, dense surface models, and spatial maps from overlapping 2D digital aerial photographs captured by camera-equipped drones.

```mermaid
flowchart TD
 UAV[Autonomous Survey Drone Flight] -->|Overlapping 4K/20MP Digital Photos| CAM[Multi-Angle Optical Imagery]
 CAM -->|Structure-from-Motion SfM Algorithm| SFM[Sparse 3D Point Cloud & Camera Poses]
 SFM -->|Multi-View Stereo MVS Dense Matching| MVS[Dense 3D Point Cloud & Textured Mesh]
 MVS -->|Rasterization & Orthorectification| PROD[Digital Surface Model DSM & Orthomosaic]
 PROD -->|Multi-Temporal Epoch Differencing| RISK[3D Slope Change & Rockfall Scar Detection]
```
*Figure 1.1: High-level data transformation flow in drone photogrammetric monitoring.*

### Photogrammetry vs. LiDAR: Fundamental Differences

| Parameter | Drone / UAV Photogrammetry | Terrestrial / UAV LiDAR |
| :--- | :--- | :--- |
| **Sensing Nature** | **Passive Optical** (Captures reflected ambient sunlight). | **Active Laser** (Emits near-infrared laser pulses). |
| **Sensor Hardware** | Standard high-resolution RGB camera (e.g., 20 MP to 45 MP CMOS). | Specialized pulsed laser scanner + high-grade IMU. |
| **Point Derivation** | Algorithmic pixel matching (SfM / MVS). | Direct Time-of-Flight (ToF) laser pulse distance measurement. |
| **Color & Texture** | **Native Photorealistic RGB Texture** on every point. | Intensity reflectivity (RGB requires co-registered camera). |
| **Vegetation & Shadow Penetration**| [REJECTED] Cannot see beneath dense vegetation or deep shadows. | [CONFIRMED] Multiple laser pulse returns penetrate vegetation. |
| **Hardware Capital Cost** | **Low to Moderate** (₹1.5 Lakh – ₹8.0 Lakh per drone package). | **High to Extreme** (₹25 Lakh – ₹1.2 Crore per LiDAR unit). |
| **Open-Cast Mine Role** | Topographic mapping, crack segmentation, 3D Digital Twin mesh. | Bare-earth filtering, structural penetration in heavy dust. |

### Why is it a Popular Low-to-Medium Cost Method?
Drone photogrammetry has democratized 3D mapping in mining because enterprise drones (such as DJI Mavic 3 Enterprise RTK or Matrice 300) cost a fraction of traditional laser scanners or slope stability radars. A single 25-minute flight can capture high-resolution geometry of a multi-kilometer open-cast pit, generating spatial datasets that would take human land surveyors weeks to capture manually.

---

## 2. Basic Working Principle

```mermaid
flowchart TD
 S1[1. Autonomous Drone Grid Mission Planning] -->|Pre-Programmed Waypoints & Oblique Camera Angles| S2[2. Overlapping Aerial Image Capture]
 S2 -->|75% Forward Overlap & 70% Side Overlap| S3[3. Feature Keypoint Extraction SIFT/ORB]
 S3 -->|Matches Keypoints Across Multiple Views| S4[4. Structure-from-Motion SfM Bundle Adjustment]
 S4 -->|Estimates 3D Coordinates & Camera Poses| S5[5. Sparse 3D Point Cloud Generation]
 S5 -->|Multi-View Stereo MVS Depth-Map Fusion| S6[6. Dense 3D Point Cloud & Triangulated Mesh]
 S6 -->|RTK Geotags & Ground Control Points GCPs| S7[7. Absolute Coordinate Georeferencing WGS84/UTM]
 S7 -->|Raster Generation| S8[8. Orthomosaic & Digital Surface Model DSM]
 S8 -->|Multi-Temporal Differencing DoD & M3C2| S9[9. Surface Displacement & Rockfall Scar Detection]
 S9 -->|AI Multi-Modal Fusion Core| S10[10. Geotechnical Hazard Assessment & Alert]
```
*Figure 2.1: End-to-end processing workflow of UAV photogrammetry for open-pit slope monitoring.*

### Simple Language Explanation:
1. A survey drone flies automated grid lines across the open-pit mine, taking hundreds of overlapping photos from different angles.
2. Advanced computer vision algorithms find matching features (like unique rock textures, joint lines, and boulders) that appear in several different photos.
3. By analyzing how these features shift position between photos, the software calculates the exact 3D position of every rock surface point (Structure-from-Motion).
4. The output is a high-density 3D digital model and a photorealistic map of the entire pit.
5. Comparing this week's 3D model with last week's model highlights exactly where benches are bulging outward or where boulders have detached and fallen.

---

## 3. Core Photogrammetry Concepts

```
 Drone Camera Image 1 Drone Camera Image 2
 [] []
 \ /
 \ Line of Sight 1 / Line of Sight 2
 \ /
 \ /
 
 [ Target Rock Feature Point P(X, Y, Z)]
```
*Figure 3.1: Optical ray intersection principle in multi-view stereophotogrammetry.*

### 1. Structure-from-Motion (SfM)
SfM is the mathematical process of simultaneously estimating 3D scene geometry and camera positions from an unordered set of overlapping 2D photographs. It detects scale-invariant feature points (e.g., SIFT, SURF, ORB) across images, matches corresponding features, and solves the **Collinearity Equations** via non-linear least-squares **Bundle Adjustment**:

$$\begin{bmatrix} x - x_0 \\ y - y_0 \end{bmatrix} = -f \begin{bmatrix} \frac{m_{11}(X - X_C) + m_{12}(Y - Y_C) + m_{13}(Z - Z_C)}{m_{31}(X - X_C) + m_{32}(Y - Y_C) + m_{33}(Z - Z_C)} \\ \frac{m_{21}(X - X_C) + m_{22}(Y - Y_C) + m_{23}(Z - Z_C)}{m_{31}(X - X_C) + m_{32}(Y - Y_C) + m_{33}(Z - Z_C)} \end{bmatrix}$$

where $(x, y)$ are image coordinates, $f$ is focal length, $(X_C, Y_C, Z_C)$ is camera center position, and $m_{ij}$ are elements of the camera rotation matrix.

### 2. Multi-View Stereo (MVS)
While SfM produces a *sparse* 3D point cloud (thousands of points), MVS computes pixel-by-pixel stereo disparity across all image pairs to generate a **dense 3D point cloud** containing tens of millions of spatial points.

### 3. Ground Sample Distance (GSD)
GSD is the real-world distance represented by one pixel on the ground. A smaller GSD means higher spatial resolution:

$$\text{GSD} = \frac{H \cdot S_w}{F \cdot I_w}$$

where $H$ is flight height above terrain, $S_w$ is camera sensor width ($\text{mm}$), $F$ is lens focal length ($\text{mm}$), and $I_w$ is image width in pixels. (e.g., Flying at $100\text{ m}$ with a 20 MP sensor yields $\text{GSD} \approx 2.5\text{ cm/pixel}$).

### 4. Overlap Requirements for Vertical Highwalls
Standard flat-terrain mapping uses $75\%$ forward and $70\%$ lateral overlap with a nadir (downward-looking) camera. However, steep open-pit highwalls ($60^\circ - 75^\circ$ slope angles) require **oblique camera angles ($30^\circ - 45^\circ$)** and horizontal flight paths to capture vertical bench faces and undercuts without geometric stretching.

### 5. Ground Control Points (GCPs) & RTK/PPK Geotagging
* **GCPs:** High-contrast targets surveyed with RTK GNSS on stable pit boundaries to anchor 3D models to absolute coordinates.
* **RTK/PPK Drones:** Modern survey drones record real-time kinematic GNSS coordinates for every camera shutter trigger, delivering sub-3 cm absolute accuracy without requiring surveyors to place manual targets in hazardous active pit areas.

---

## 4. How Drone Photogrammetry Detects Slope Changes

Repeated drone surveys of the same open-pit mine captured over time ($T_1, T_2, \dots, T_n$) produce comparative 3D models that reveal active geomechanical failure processes:

```mermaid
flowchart LR
 A[Drone Survey Baseline Epoch T1] --> C[Multi-Temporal 3D Model Comparison]
 B[Drone Survey Repeated Epoch T2] --> C
 C --> D1[Pre-Failure Bench Bulging & Shear Creep]
 C --> D2[Rockfall Scars: Detached Volume Cavities]
 C --> D3[Talus Accumulation on Catch Benches & Roads]
 C --> D4[Tension Crack Propagation along Bench Crests]
 C --> D5[Erosion & Weathering Gully Development]
```
*Figure 4.1: Geotechnical change phenomena identified through multi-temporal drone photogrammetry.*

---

## 5. Change Detection Methods in Photogrammetry

```mermaid
flowchart TD
 subgraph Photogrammetric Change Detection Approaches
 M1[DEM / DSM Differencing DoD] -->|Grid Elevation Subtraction: ΔZ = Z2 - Z1| R1[2D Vertical Height Change Raster]
 M2[Point Cloud Differencing M3C2] -->|Calculates True 3D Orthogonal Surface Distance| R2[3D Highwall Normal Bulging Vectors]
 M3[Orthomosaic Visual Feature Differencing] -->|Digital Image Correlation DIC| R3[Planar Pixel Motion & Crack Tracking]
 M4[AI Computer Vision Segmentation] -->|Mobile-SAM / YOLOv11 Semantic Segmentation| R4[Automated Crack Length & Width Growth]
 end
```
*Figure 5.1: Comparative algorithms for multi-temporal photogrammetric change detection.*

### 1. DSM Differencing (DoD — DEM of Difference)
Subtracts coregistered Digital Surface Models cell-by-cell:
$$\Delta Z(x, y) = \text{DSM}_{T2}(x, y) - \text{DSM}_{T1}(x, y)$$
* *Application:* Excellent for calculating volumetric stockpiles, overburden dump settling, and overall pit excavation progress.

### 2. Multi-temporal 3D Point Cloud Differencing (M3C2)
Directly calculates true orthogonal distance between multi-temporal photogrammetric point clouds, resolving bulging and undercuts on steep vertical benches where 2.5D DSM differencing fails.

### 3. AI Computer Vision Crack Detection on Orthophotos
High-resolution orthomosaics ($< 2\text{ cm/pixel}$) are fed into semantic segmentation deep networks (e.g., U-Net, Mobile-SAM) to automatically detect, trace, and measure the opening rate ($\Delta w$ in $\text{mm/week}$) of tension cracks along bench crests.

---

## 6. Drone Monitoring Setup in an Open-Pit Mine

```mermaid
flowchart TD
 subgraph Aerial Acquisition
 UAV[Enterprise RTK Survey Drone: DJI M300 / Mavic 3E] -->|Oblique & Nadir Grid Flight Path| IMGS[Raw 4K/20MP Geotagged Image Dataset]
 end

 subgraph Photogrammetry Engine
 IMGS --> SFM_MVS[Open-Source SfM/MVS Engine: WebODM / COLMAP]
 SFM_MVS --> MESH[3D Textured Surface Mesh PLY/OBJ]
 SFM_MVS --> DSM_RAST[High-Resolution DSM & Orthomosaic GeoTIFF]
 end

 subgraph Feature Extraction & Geotechnics
 MESH --> M3C2[M3C2 3D Change Detection Engine]
 MESH --> STRUCT[Automated Geological Discontinuity Extractor]
 DSM_RAST --> CRACK[AI Computer Vision Tension Crack Segmenter]
 end

 subgraph Decision Support & TARP
 M3C2 & STRUCT & CRACK --> FUSION[Multi-Modal Feature Synchronization Core]
 FUSION --> AI[XGBoost & PINN Rockfall Risk Model]
 AI --> DASH[3D WebGPU Mine Digital Twin Dashboard]
 AI --> TARP[Sub-Second Multi-Channel Emergency Dispatch]
 end
```
*Figure 6.1: Hardware, processing, and AI architecture of an open-pit drone photogrammetry monitoring system.*

---

## 7. Flight Planning for Complex Highwalls

Surveying deep open-pit highwalls requires specialized multi-tier flight trajectories:

```
 Flight Path 1: Regional Nadir Grid (90° Camera)
 
 [Topographic Context & Dumps]
 
 
 Flight Path 2: Oblique Highwall Orbit (45° Camera)
 
 [Vertical Benches & Overhangs]
```

```mermaid
flowchart LR
 A[3D Terrain-Following Mission] --> B[Nadir Grid for Flat Pit Rims 90° Camera]
 A --> C[Oblique Wall-Facing Passes 45° Camera]
 A --> D[Automated Elevation Buffering for Deep Pits]
 B & C & D --> E[Eliminates Occlusions & Geometric Stretching on Vertical Cliffs]
```
*Figure 7.1: Multi-tiered flight trajectory planning for steep open-pit highwalls.*

---

## 8. Automated Structural Geology Discontinuity Mapping

Drone photogrammetric 3D textured meshes allow rock mechanics engineers to extract structural joint sets remotely without risking personnel on hazardous benches:

```mermaid
flowchart LR
 A[3D Textured Highwall Mesh] --> B[RANSAC Structural Plane Fitting]
 B --> C[Extracts Planar Discontinuity Clusters]
 C --> D[Computes Joint Dip α & Dip Direction β Angles]
 D --> E[Generates Stereonet Density Plots]
 E --> F[Kinematic Stability Failure Evaluation: Planar, Wedge, Toppling]
```
*Figure 8.1: Workflow for automated structural geological joint mapping from drone 3D meshes.*

---

## 9. Illustrative Time-Series Volumetric & Deformation Analysis

> **Important Data Disclaimer:** 
> *The following table and graphs represent **Synthetic / Illustrative Data** designed solely to explain multi-temporal drone survey trends. They do not represent real measurements from any specific mine.*

### Illustrative Synthetic Multi-Temporal Drone Survey Dataset

| Survey Mission | Elapsed Time (weeks) | Mean Bench Bulging ($\Delta d$, mm) | Active Tension Crack Width ($w$, mm) | Detached Rockfall Volume ($V$, $\text{m}^3$) | Geotechnical Assessment |
| :---: | :---: | :---: | :---: | :---: | :--- |
| **Mission 1** | 0 | 0.0 | 5.0 | 0.0 | Baseline Setup |
| **Mission 2** | 2 | +3.2 | 8.5 | 0.4 (Minor talus) | Secondary Steady Creep |
| **Mission 3** | 4 | +7.8 | 14.0 | 1.8 (Small spalls) | Secondary Creep Acceleration |
| **Mission 4** | 6 | +18.5 | 28.0 | 6.5 (Block detachment) | Transition to Tertiary Creep |
| **Mission 5** | 8 | +46.0 | 65.0 | 28.0 (Bench crest slip) | Critical Active Failure |

```mermaid
---
config:
 xyChart:
 width: 700
 height: 350
 themeVariables:
 xyChart:
 plotColorPalette: "#d9534f"
---
xychart-beta
 title "Illustrative Example: Drone-Derived Tension Crack Dilation vs Time (Synthetic Data)"
 x-axis "Elapsed Time (weeks)" [0, 2, 4, 6, 8]
 y-axis "Crack Opening Width (mm)" 0 --> 70
 line [5.0, 8.5, 14.0, 28.0, 65.0]
```
*Figure 9.1: Illustrative tension crack opening dilation curve extracted from multi-temporal drone surveys.*

---

## 10. Advantages of Drone Photogrammetry

* **Ultra-Low Cost per Survey:** Operational costs are 90% cheaper than terrestrial LiDAR and 95% cheaper than Slope Stability Radars.
* **100% Non-Contact Safety:** Completely eliminates the lethal hazard of sending surveyors onto active, collapsing benches.
* **Photorealistic True-Color 3D Geometry:** High-resolution RGB textures provide intuitive visual context of rock weathering, moisture seepage, and lithological contacts.
* **Centimeter-Level Spatial Resolution:** Achieves $\text{GSD} < 2.5\text{ cm/pixel}$, enabling automated detection of small tension cracks and detached boulder scars.
* **Master Baseline for 3D Digital Twins:** Generates lightweight 3D textured triangular meshes (`.obj` / `.gltf`) that directly feed in-browser WebGPU visualization canvases.

---

## 11. Critical Limitations of Drone Photogrammetry in Mining

```mermaid
mindmap
 root((Drone Photogrammetry Limitations))
 Processing Latency Bottleneck
 SfM bundle adjustment takes 2 to 6 hours
 Cannot provide real-time warning for sudden rockfalls
 Weather & Atmospheric Restrictions
 Cannot fly in high winds >35 km/h
 Grounded during heavy monsoon cloudbursts & thick fog
 Lighting & Deep Shadow Artifacts
 Steep pit walls cast deep shadows causing matching failure
 Direct midday sun causes intense glare on light rock faces
 Regulatory & Operational Constraints
 DGMS / DGCA flight permission requirements
 Airspace closure during active blast windows
 Zero Subsurface & Causal Insight
 Measures surface color & geometry only
 Blind to pore-water pressure, shear stress, and blast vibrations
```
*Figure 11.1: Environmental, computational, and operational limitations of drone photogrammetry in open-cast mines.*

---

## 12. Comprehensive 4-Way Technology Comparison

| Evaluation Dimension | Drone UAV Photogrammetry | UAV Drone LiDAR | Terrestrial LiDAR (TLS) | Slope Stability Radar (SSR) |
| :--- | :--- | :--- | :--- | :--- |
| **Primary Sensing Type** | **Passive Optical RGB Imagery** | Active Near-Infrared Laser | Active Near-Infrared Laser | Active Microwave Radar (Ku/X) |
| **Point Derivation Method**| Structure-from-Motion (SfM) | Direct Time-of-Flight (ToF) | Direct Time-of-Flight (ToF) | Differential Phase Interferometry |
| **True Photorealistic RGB**| **Native 4K / 20MP Textures** | Co-registered camera required | Co-registered camera required | [REJECTED] None (Radar heatmap only) |
| **Vegetation / Dust Penetration**| [REJECTED] Fails in dust & vegetation | **High (Multi-return pulses)** | Moderate (Scattering noise) | **Exceptional (Microwaves penetrate)**|
| **Measurement Update Rate** | Periodic (Hours of processing lag)| Periodic (Minutes of processing)| Periodic (Setup overhead) | **Continuous (Every 1 to 5 min)** |
| **System Capital Cost** | **₹1.5 Lakh – ₹8.0 Lakh (Low)** | ₹25 Lakh – ₹80 Lakh (High) | ₹40 Lakh – ₹1.2 Cr (High) | **₹3.5 Cr – ₹8.0 Cr (Extreme)** |
| **SIH25071 Strategic Role** | **Master 3D Terrain Digital Twin** | Structural joint baseline | High-precision baseline mesh | Real-time velocity kinematics |

---

## 13. Open-Source Photogrammetry & SfM Software Toolkits

To build our SIH25071 prototype, we evaluated verified open-source photogrammetry and Structure-from-Motion frameworks:

### Benchmarked Open-Source Photogrammetry Frameworks

| Tool Name | Official URL / Organization | Programming Language | Core Photogrammetric Capabilities | Supported Formats | SIH25071 Transferability | License |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **[WebODM (OpenDroneMap)](https://github.com/OpenDroneMap/WebODM)** | OpenDroneMap Community | Python, C++, Docker, NodeJS | Full automated pipeline for generating 3D textured meshes, georeferenced orthomosaics, and DSMs from raw drone photos. | GeoTIFF, OBJ, PLY, LAS/LAZ | **Core Pipeline:** Automated containerized backend for processing periodic drone survey missions into GIS assets. | AGPL-3.0 |
| **[COLMAP](https://github.com/colmap/colmap)** | Johannes L. Schönberger (ETH Zürich) | C++, CUDA | State-of-the-art Structure-from-Motion (SfM) and Multi-View Stereo (MVS) reconstruction engine. | PLY, NVM, Bundler | **Algorithmic Standard:** High-precision sparse/dense matching used for complex vertical highwall geometry. | BSD-3-Clause |
| **[Meshroom / AliceVision](https://github.com/alicevision/Meshroom)** | AliceVision Association / INRIA | Python, C++, CUDA | Node-based photogrammetric computer vision pipeline for dense 3D surface reconstruction and texture unrolling. | OBJ, PLY, ABC | Direct extraction of high-resolution 3D highwall meshes for WebGPU rendering. | MPL-2.0 |
| **[OpenSfM](https://github.com/mapillary/OpenSfM)** | Mapillary / Meta | Python, C++ | Lightweight Structure-from-Motion library built on OpenCV for rapid camera pose estimation and sparse point clouds. | JSON, PLY | Embedded inside lightweight edge Python processing workflows. | BSD-2-Clause |
| **[MicMac](https://github.com/micmacIGN/micmac)** | IGN (French National Mapping Agency) | C++, Shell | Scientific photogrammetry suite designed for high-accuracy geodetic and structural deformation measurements. | GeoTIFF, XML | Benchmark for rigorous geodetic bundle adjustment and error propagation. | CeCILL-B |

---

## 14. Standard Photogrammetric Data Formats

| Format Standard | File Extension | Data Structure & Content | SIH25071 Implementation Role |
| :--- | :--- | :--- | :--- |
| **GeoTIFF** | `.tif` / `.tiff` | Georeferenced raster image storing Orthomosaics (RGB) and DSM elevations. | Imported into the GIS mapping engine to display high-resolution pit surface imagery. |
| **Wavefront OBJ / GLTF**| `.obj` / `.gltf` | 3D triangular mesh geometry with associated UV texture bitmap images. | **Native format rendered in the WebGPU 3D Digital Twin** for 60 FPS in-browser simulation. |
| **ASPRS LAZ** | `.laz` | Dense compressed 3D point cloud with RGB color and intensity attributes. | Stored in daily archives for multi-temporal M3C2 change detection differencing. |

---

## 15. Complete Multi-Sensor Data Fusion Pipeline

```mermaid
flowchart TD
 subgraph 3D Photogrammetric Foundation
 A1[Periodic UAV Survey Flights: 1 flight/week] --> A2[WebODM / COLMAP SfM-MVS Pipeline]
 A2 --> A3[Photorealistic 3D Textured Mesh OBJ/GLTF]
 A2 --> A4[High-Resolution Orthomosaic & DSM GeoTIFF]
 A4 --> A5[AI Computer Vision Tension Crack Segmenter]
 end

 subgraph Real-Time Terrestrial & Spaceborne Telemetry
 B1[Edge PTZ Cameras: Sub-Pixel Optical Flow 30 FPS]
 B2[Low-Cost Wireless LoRa MEMS Tilt & Vibration Nodes]
 B3[Micro-Weather Station: Rainfall Intensity mm/hr]
 B4[Vibrating-Wire Piezometer Pore-Water Pressure]
 B5[Sentinel-1 InSAR Macro Subsidence Prior]
 end

 A3 & A4 & A5 & B1 & B2 & B3 & B4 & B5 --> FUSION[Multi-Modal Feature Synchronization Core]

 FUSION --> ML[Physics-Informed Neural Network & XGBoost Core]

 ML --> OUT_P[Rockfall Failure Probability: 0.0 to 1.0]
 ML --> OUT_T[Saito Inverse Velocity Failure Horizon tf ± σ]
 ML --> OUT_R[3D Kinetic Rockfall Bounce & Runout Hazard Cone]

 OUT_P & OUT_T & OUT_R --> XAI[SHAP Causal Factor Attribution Card]
 XAI --> DASH[3D WebGPU Mine Digital Twin Dashboard]
 OUT_P --> TARP[Sub-Second TARP Early-Warning Siren & Radio Dispatch]
```
*Figure 15.1: Master multi-sensor data fusion architecture incorporating drone 3D photogrammetry.*

---

## 16. AI / Machine Learning Feature Integration

| Feature Name | Symbol | Mathematical Definition | Unit | SIH25071 Geotechnical Role |
| :--- | :--- | :--- | :--- | :--- |
| **Drone Tension Crack Width** | $w_{\text{crack}}$ | Computer vision segmented width | $\text{mm}$ | Quantifies surface tensile fracture dilation. |
| **Crack Propagation Rate** | $\dot{w}_{\text{crack}}$ | $\Delta w / \Delta t$ | $\text{mm/week}$ | Identifies accelerating tensile fracture growth. |
| **DSM Volumetric Loss Rate** | $\dot{V}_{\text{DSM}}$ | $\Delta V_{\text{DoD}} / \Delta t$ | $\text{m}^3/\text{week}$| Measures rate of progressive bench rockfall mass loss. |
| **Sub-Pixel Vision Velocity** | $v_{\text{vision}}$ | Optical flow projected on 3D mesh | $\text{mm/hr}$ | Real-time continuous kinetic velocity (30 FPS). |
| **Wireless MEMS Tilt Rate** | $\dot{\theta}$ | First derivative of angular tilt | $\text{deg/hr}$ | Real-time rotational toppling warning. |
| **Pore-Water Pressure** | $u$ | Vibrating-wire piezometer pressure | $\text{kPa}$ | Destabilizing hydrostatic thrust. |
| **Rainfall Infiltration** | $I$ | Micro-weather tipping bucket | $\text{mm/hr}$ | Primary environmental failure trigger. |

---

## 17. Integration with 3D WebGPU Digital Twin & Runout Physics

A foundational innovation of our SIH25071 platform is using the **drone 3D textured mesh as the physical terrain collision model** for real-time kinetic rockfall runout simulations:

```mermaid
flowchart LR
 A[Drone 3D Triangular Mesh OBJ/GLTF] --> B[WebGPU Rigid-Body Physics Engine]
 C[Detached Boulder Mass & Gravity] --> B
 B --> D[Simulates Exact Bounce Heights & Trajectories]
 B --> E[Calculates Impact Envelopes on Lower Benches]
 D & E --> F[Real-Time 3D Rockfall Runout Cone on Active Haul Roads]
```
*Figure 17.1: Drone 3D mesh acting as the physical collision boundary for kinetic rockfall runout modeling.*

* **Dynamic Hazard Cones:** When edge vision cameras detect rock detachment on an upper bench, the simulation uses the drone 3D mesh to trace the boulder's exact bounce trajectory down the slope, highlighting endangered haul trucks and machinery in real-time.

---

## 18. Explainable AI (XAI) Diagnostic Breakdown

```mermaid
graph TD
 subgraph Explainable Alert Notification Card
 A["[CRITICAL / RED] LEVEL 4: CRITICAL ROCKFALL ALERT (Risk Probability: 93.4%)"]
 B[" Target Sector: Bench 4 - East Highwall (Grid Sector E-16)"]
 C[" Predicted Failure Window: 26 ± 6 minutes"]
 D[" Key Contributing Factors (SHAP Feature Importance):"]
 D1["• Rapid Tension Crack Opening from Drone Orthophoto (42 mm): +33% contribution"]
 D2["• Real-Time Optical Flow Velocity Surge (14.2 mm/hr): +26% contribution"]
 D3["• Heavy 24-hr Monsoon Precipitation (39 mm): +21% contribution"]
 D4["• Piezometric Hydrostatic Pressure Spike (14 kPa): +12% contribution"]
 D5["• Topographic Highwall Overhang Slope Factor: +8% contribution"]
 end
```
*Figure 18.1: Conceptual SHAP explainable alert diagnostic card for drone-informed alerts.*

---

## 19. Proposed SIH Decision-Support Dashboard Integration

```mermaid
flowchart TD
 subgraph Unified WebGPU 3D Dashboard
 D1[Interactive 3D Photorealistic Drone Mine Mesh with Real-Time Risk Heatmap]
 D2[High-Resolution Orthomosaic Overlay with Automated AI Crack Detections]
 D3[Multi-Temporal DSM Differencing Volumetric Loss & Gain Map]
 D4[Dynamic 3D Rockfall Kinetic Bounce Trajectory & Runout Cones]
 D5[Live Multi-Sensor Telemetry Streams: Weather, LoRa Tilt, Piezometers]
 D6[One-Click DGMS Statutory Safety Compliance & Inspection Logbook Export]
 end
```
*Figure 19.1: Functional architecture of the unified 3D decision-support dashboard.*

---

## 20. Benchmark: Traditional Drone Surveying vs. Proposed SIH Platform

| Feature / Dimension | Traditional Drone Photogrammetry | Proposed SIH25071 Multi-Modal Platform |
| :--- | :--- | :--- |
| **Operational Frequency** | Periodic surveys (weekly / monthly) | **Continuous 24/7 Monitoring (30 FPS Vision + IoT)** |
| **Immediate Life Safety Alerts**| [REJECTED] Impossible (2–6 hours processing lag) | **[CONFIRMED] Autonomous Sub-Second TARP Siren Dispatch (<1.0s)** |
| **3D Terrain Digital Twin** | Static CAD / GIS export | **Interactive 60 FPS WebGPU Dynamic Digital Twin** |
| **Atmospheric Noise Rejection** | Manual inspection | **Multi-Modal Cross-Validation (Vision + LoRa + InSAR)** |
| **Subsurface Awareness** | [REJECTED] Blind to subsurface conditions | **[CONFIRMED] Synchronized Vibrating-Wire Piezometer Telemetry** |
| **Kinetic Trajectory Modeling** | Offline post-mortem analysis | **Real-Time 3D Rigid-Body Boulder Bounce Simulation** |
| **System Capital Cost** | ₹3.0 Lakh – ₹12.0 Lakh (Drone rig) | **₹2.0L – ₹5.0L Complete Full-Pit Infrastructure** |

---

## 21. Research Gap Analysis

```
+---------------------------------------------------------------------------------------------------+
| BRIDGING THE RESEARCH GAP |
+---------------------------------------------------------------------------------------------------+
| [ STANDALONE DRONE LIMITATION ] High spatial resolution & photorealism, but |
| constrained by 2-6 hour processing latency & no 24/7 |
| second-by-second life-safety early warning. |
| [ PROPOSED SIH25071 INNOVATION ] Uses periodic drone flights to create the master 3D |
| digital twin mesh & detect crest cracks, then drives |
| continuous real-time alerting via low-cost fixed edge |
| vision cameras, wireless LoRa IoT, & physics-AI! |
+---------------------------------------------------------------------------------------------------+
```

---

## 22. Concepts Adopted from Drone Photogrammetry for SIH25071

| Drone Concept | Technical Mechanism | Proposed SIH25071 Implementation |
| :--- | :--- | :--- |
| **Master 3D Terrain Geometry** | Structure-from-Motion dense surface reconstruction. | Ingests drone 3D meshes as the base geometric canvas for the WebGPU 3D Digital Twin. |
| **Photorealistic Texture Mapping** | True-color 4K RGB surface projection. | Provides natural rock texture features used by edge computer vision for **Virtual Prismless Tracking**. |
| **AI Tension Crack Segmentation** | High-resolution orthomosaic imaging ($< 2\text{ cm/px}$).| Computer vision deep networks (Mobile-SAM) segment and track crest tension crack propagation. |
| **Volumetric Material Reconciliation**| Multi-temporal DSM differencing ($\Delta Z = Z_2 - Z_1$).| Computes volume loss of rockfall scars and volume gain of toe talus deposits automatically. |

---

## 23. Final Proposed System Architecture

```mermaid
flowchart TD
 subgraph SENSING["1. Multi-Modal Ingestion Layer"]
 S1[Periodic UAV Survey Mission Archive: Weekly 4K Flights]
 S2[Edge Optical PTZ CCTV Cameras: 4K/30FPS Continuous]
 S3[Wireless LoRa MEMS Tilt & Vibration Nodes]
 S4[Vibrating-Wire Borehole Piezometers]
 S5[Micro-Weather Station: Rain & Humidity]
 S6[Satellite InSAR Sentinel-1 Subsidence Prior]
 end

 subgraph PREPROCESSING["2. Edge Preprocessing & Feature Extraction"]
 S1 --> P1[WebODM SfM Processing & 3D Mesh Generation OBJ/GLTF]
 S2 --> P2[Sub-Pixel Optical Flow & 3D Ray-Casting]
 S3 & S4 --> P3[LoRa Mesh Telemetry Parser & Kalman Filter]
 S5 --> P4[Rainfall Infiltration Rate & Antecedent Moisture Index]
 S6 --> P5[Regional Macro Velocity Inversion]

 P1 & P2 & P3 & P4 & P5 --> FE[Unified Multi-Modal Feature Pipeline]
 FE --> F_GEO[Drone 3D Mesh, Crest Crack Width & Volumetric Loss]
 FE --> F_KIN[Real-Time Optical Flow Velocity & Saito Inverse Velocity]
 FE --> F_ENV[Rainfall Surge, Pore Pressure & Blast PPV]
 end

 subgraph AI_CORE["3. Multi-Modal AI & Geomechanical Core"]
 F_GEO & F_KIN & F_ENV --> ML_ENG[XGBoost & Physics-Informed Neural Network PINN Core]
 ML_ENG --> OUT_P[Rockfall Failure Probability: P_fail in 0.0 - 1.0]
 ML_ENG --> OUT_T[Predicted Time-to-Failure Window: tf ± σ]
 ML_ENG --> OUT_R[3D Kinetic Rockfall Bounce & Runout Hazard Cone]

 OUT_P & OUT_T --> XAI_ENG[SHAP Explainability Layer]
 XAI_ENG --> OUT_E[Causal Factor Attribution Card]
 end

 subgraph ACTION["4. Visualization & Autonomous Life-Safety Action"]
 OUT_P & OUT_T & OUT_R & OUT_E --> DASH[WebGPU 3D Digital Twin Dashboard]
 OUT_P --> TARP_DEC{Dynamic TARP Level Classifier}

 TARP_DEC -->|Level 1: Green| ACT_1[Continuous Baseline Logging]
 TARP_DEC -->|Level 2: Yellow| ACT_2[Advisory to Geotechnical Officer]
 TARP_DEC -->|Level 3: Orange| ACT_3[Warning: Machinery Relocation]
 TARP_DEC -->|Level 4: Red| ACT_4[CRITICAL DISPATCH: Sirens + VHF Radio + SMS <1s]

 ACT_1 & ACT_2 & ACT_3 & ACT_4 --> DASH
 end
```
*Figure 23.1: Complete end-to-end system architecture incorporating drone 3D photogrammetry into the real-time AI rockfall prediction pipeline.*

---

## 24. Summary of Visualizations Included

1. **Figure 1.1:** High-level data transformation flow in drone photogrammetric monitoring (Mermaid).
2. **Figure 2.1:** Complete processing workflow of UAV photogrammetry (Mermaid).
3. **Figure 3.1:** Optical ray intersection principle in multi-view stereophotogrammetry (ASCII).
4. **Figure 4.1:** Geotechnical change phenomena identified via drone photogrammetry (Mermaid).
5. **Figure 5.1:** Comparative algorithms for multi-temporal photogrammetric change detection (Mermaid).
6. **Figure 6.1:** Hardware, processing, and AI architecture of drone photogrammetry monitoring (Mermaid).
7. **Figure 7.1:** Multi-tiered flight trajectory planning for steep open-pit highwalls (Mermaid).
8. **Figure 8.1:** Workflow for automated structural geological joint mapping from drone 3D meshes (Mermaid).
9. **Figure 9.1:** Tension crack opening dilation vs. time graph (Mermaid xychart — synthetic data).
10. **Figure 11.1:** Drone photogrammetry limitations mindmap (Mermaid).
11. **Figure 15.1:** Multi-sensor data fusion pipeline incorporating drone 3D photogrammetry (Mermaid).
12. **Figure 17.1:** Real-time 3D rockfall kinetic bounce trajectory simulation on drone meshes (Mermaid).
13. **Figure 18.1:** SHAP explainable alert diagnostic card (Mermaid).
14. **Figure 19.1:** Unified 3D decision-support dashboard architecture (Mermaid).
15. **Figure 23.1:** Master end-to-end system architecture flowchart (Mermaid).

---

## 25. Conclusion

Drone / UAV Photogrammetry has revolutionized open-pit mining by providing **low-cost, high-resolution, photorealistic 3D terrain models, automated crest crack segmentation, and volumetric material loss quantification** without risking human surveyors.

However, its multi-hour processing latency, weather dependency, and non-continuous operational nature prevent it from functioning as a standalone real-time disaster early-warning system.

Our **SIH25071 platform** extracts the best of drone photogrammetry: **we use periodic drone flights to create the master 3D digital twin geometry and trace structural joint sets, then power continuous second-by-second life-safety monitoring through 95% cheaper edge computer vision, wireless LoRa IoT mesh nodes, and physics-informed AI**. This delivers an affordable, comprehensive disaster-prevention system tailored to the operational realities of Indian open-cast mining.

---

## 26. References & Verified Open-Source Repositories

### Research Papers & Official Publications:
1. **Westoby, M. J., et al.** (2012). *‘Structure-from-Motion’ photogrammetry: A low-cost, effective tool for geoscience applications*. Geomorphology, 179, pp. 300–314. [DOI: 10.1016/j.geomorph.2012.08.021](https://doi.org/10.1016/j.geomorph.2012.08.021) — *Foundational paper demonstrating Structure-from-Motion for high-resolution 3D topographic modeling.*
2. **Salvini, R., et al.** (2018). *Use of unmanned aerial vehicle (UAV) photogrammetry for rockfall hazard analysis: Map generation and kinematic analysis*. Landslides, 15(6), pp. 1163–1177. [DOI: 10.1007/s10346-017-0931-4](https://doi.org/10.1007/s10346-017-0931-4) — *Applies drone photogrammetric 3D point clouds to kinematic rock slope stability and runout analysis.*
3. **Colomina, I., & Molina, P.** (2014). *Unmanned aerial systems for photogrammetry and remote sensing: A review*. ISPRS Journal of Photogrammetry and Remote Sensing, 92, pp. 79–97. [DOI: 10.1016/j.isprsjprs.2014.02.013](https://doi.org/10.1016/j.isprsjprs.2014.02.013) — *Comprehensive review of UAV photogrammetric workflows, flight navigation, and camera calibration.*
4. **Schönberger, J. L., & Frahm, J.-M.** (2016). *Structure-from-Motion revisited*. IEEE Conference on Computer Vision and Pattern Recognition (CVPR 2016), pp. 4104–4113. [DOI: 10.1109/CVPR.2016.445](https://doi.org/10.1109/CVPR.2016.445) — *Defines the core geometric SfM pipeline implemented in COLMAP.*
5. **Directorate General of Mines Safety (DGMS).** (2020). *DGMS (Tech) Circular No. 02 of 2020: Standard Operating Procedures for scientific slope stability monitoring in open-cast mines*. Ministry of Labour & Employment, Government of India.
6. **Lundberg, S. M., & Lee, S.-I.** (2017). *A unified approach to interpreting model predictions*. Advances in Neural Information Processing Systems (NeurIPS 2017), 30, pp. 4765–4774.

### Verified Open-Source Frameworks & Repositories:
1. **WebODM (OpenDroneMap):** [https://github.com/OpenDroneMap/WebODM](https://github.com/OpenDroneMap/WebODM) — *Standard open-source drone mapping engine for generating 3D meshes, DSMs, and orthomosaics.*
2. **COLMAP (Structure-from-Motion and Multi-View Stereo):** [https://github.com/colmap/colmap](https://github.com/colmap/colmap) — *High-accuracy C++/CUDA SfM/MVS reconstruction library.*
3. **Meshroom / AliceVision:** [https://github.com/alicevision/Meshroom](https://github.com/alicevision/Meshroom) — *Open-source 3D reconstruction pipeline built on CUDA and AliceVision.*
4. **OpenSfM:** [https://github.com/mapillary/OpenSfM](https://github.com/mapillary/OpenSfM) — *Python/OpenCV Structure-from-Motion library by Mapillary.*
