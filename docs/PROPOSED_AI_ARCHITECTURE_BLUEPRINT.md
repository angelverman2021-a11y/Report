# PROPOSED AI ARCHITECTURE BLUEPRINT: GeoShield AI
## Next-Generation Multi-Modal Rockfall Prediction & Autonomous TARP Platform
**Target Problem Statement:** SIH25071 | **Ministry of Mines** | **Disaster Management**  
**Author / Principal System Architect:** Angel Verman & Team

---

## 1. System Vision & Paradigm Shift

Current industry solutions for open-pit slope stability are trapped in a severe dilemma:
- **High-End Radars (SSR / GB-InSAR):** Cost ₹4 to ₹10 Crores ($500k – $1.2M), making them unattainable for >95% of mines in India.
- **Low-End Point Sensors (Prisms, Extensometers):** Are fragile, localized, dangerous to install, and incapable of full-field spatial prediction.
- **Manual Geological Surveys:** Are infrequent, subjective, and place human lives directly in lethal hazard zones.

**GeoShield AI** breaks this trade-off by combining **Edge Computer Vision**, **Ultra-Low-Cost LoRa IoT Mesh Sensing**, **Physics-Informed Neural Networks (PINNs)**, and **Autonomous Sub-Second TARP Evacuation Dispatch** to deliver **radar-grade spatial safety at 5% of the cost**.

```
+---------------------------------------------------------------------------------------------------------+
|                                    GEOSHIELD AI SYSTEM WORKFLOW                                         |
+---------------------------------------------------------------------------------------------------------+
  [ 1. EDGE SENSING ]               [ 2. FUSION & AI ENGINE ]              [ 3. DIGITAL TWIN & TARP ]
  - Optical PTZ CCTV (4K/30FPS)   ──► Edge NVIDIA Jetson Compute         ──► WebGPU 3D Interactive Canvas
  - LoRa Tilt/Crack Nodes ($30)   ──► Sub-Pixel Optical Flow (mm/hr)     ──► 3D Rockfall Kinetic Runout Cone
  - Micro-Weather AWS (Rain mm/hr)──► Saito Inverse Velocity ($1/v \to 0$)──► Sub-Second TARP Sirens
  - Blast Vibration Geophone (PPV)──► Mohr-Coulomb PINN (Factor of Safety)──► VHF Walkie-Talkie Voice Broadcast
+---------------------------------------------------------------------------------------------------------+
```

---

## 2. Hardware Bill of Materials (BOM) & Edge Node Schematics

GeoShield AI's hardware architecture is designed specifically for harsh Indian open-cast mining conditions (extreme dust, monsoonal downpours, $48^\circ\text{C}$ summer heat, and blasting flyrock).

### Component Specifications & Cost Breakdown

| Component | Specifications | Purpose in GeoShield AI | Estimated Cost (INR) |
| :--- | :--- | :--- | :--- |
| **Edge Master Gateway** | NVIDIA Jetson Orin Nano (8GB) / Industrial RK3588 Box in IP67 enclosure with solar backup | Runs real-time AI vision models, optical flow, and sensor fusion locally inside the pit | ₹45,000 – ₹65,000 |
| **High-Zoom PTZ IP Camera** | 4K / 8MP, 40x Optical Zoom, Sony STARVIS low-light sensor, IP67, IR range 200m | Continuous long-distance highwall video capture and optical keypoint tracking | ₹28,000 – ₹45,000 |
| **Solar-Powered LoRa Gateway** | SX1302 8-channel LoRaWAN gateway (865–867 MHz), 4G LTE fallback, 50W solar + 30Ah LiFePO4 | Collects telemetry from all pit wireless nodes and forwards to Edge Gateway | ₹18,000 – ₹25,000 |
| **LoRa Geotechnical Sensor Nodes (Qty: 20)** | ESP32-S3 + SX1262 LoRa + MPU6050/ADXL355 triaxial MEMS tilt + crack potentiometer in magnetic waterproof case | Anchored to highwall crests and boulders to log tilt ($\pm 0.005^\circ$) and vibration | ₹2,800 per node (₹56,000 for 20 nodes) |
| **Automated Micro-Weather Station** | Optical tipping-bucket rain gauge, temperature, barometric pressure, wind speed | Ingests real-time rainfall rate ($mm/hr$) and atmospheric correction parameters | ₹18,000 – ₹30,000 |
| **Smart Solar TARP Siren & Radio Unit** | 120 dB dual-tone directional siren, strobe flasher, VHF/UHF automated voice transmitter module | Autonomous physical alert broadcast across the open pit upon Level 4 trigger | ₹25,000 – ₹40,000 |
| **Total Hardware Cost per Active Pit** | **Complete Full-Pit Infrastructure** | **Turnkey Life-Safety Coverage** | **₹1.9 Lakh – ₹2.6 Lakh ($2,300 – $3,100 USD)** |

*(Comparison: A single GroundProbe SSR radar unit costs ₹5,00,00,000 — GeoShield AI is over **95% cheaper**).*

---

## 3. The Edge AI Computer Vision Pipeline

```
+---------------------------------------------------------------------------------------------------------+
|                                    EDGE COMPUTER VISION PIPELINE                                        |
+---------------------------------------------------------------------------------------------------------+
  RTSP 4K Stream (30 FPS)
            │
            ▼
  [ 1. Image Preprocessing & Stabilization ]
  - Digital Image Stabilization (DIS) filters out camera mast vibrations caused by wind and haul trucks.
  - CLAHE (Contrast Limited Adaptive Histogram Equalization) penetrates light dust and shadow changes.
            │
            ▼
  [ 2. Semantic Region-of-Interest (ROI) Masking ]
  - Fast YOLOv10 segmentation masks out haul roads, moving dumpers, excavators, and vegetation.
  - Active highwall rock faces are isolated into dynamic observation sectors.
            │
            ▼
  [ 3. Dense Sub-Pixel Optical Flow & Keypoint Tracking ]
  - SuperPoint / DIS Optical Flow tracks 50,000+ natural rock texture points across consecutive frames.
  - Sub-pixel phase correlation calculates deformation velocity down to $0.05\text{ mm/pixel}$.
            │
            ▼
  [ 4. 2D-to-3D DEM Metric Ray-Casting ]
  - Pixel motion vectors $(dx, dy)$ are projected onto the drone 3D Digital Elevation Model (DEM)
    to calculate true real-world metric velocity ($v = \frac{dr}{dt}$ in $\text{mm/hour}$).
            │
            ▼
  [ 5. Dynamic Crack Dilation Segmentation ]
  - Lightweight Mobile-SAM (Segment Anything Model) traces tension crack propagation along bench crests.
+---------------------------------------------------------------------------------------------------------+
```

---

## 4. Multi-Modal AI Fusion & Physics-Informed Neural Network (PINN)

Pure machine learning models are notorious for producing unphysical hallucinations or missing sudden failures on uncalibrated rock types. GeoShield AI implements a **Physics-Informed Neural Network (PINN)** that enforces strict geomechanical physical laws directly into the neural loss function.

### A. Geomechanical Mathematical Formulation
1. **Saito Creep Law for Time-to-Failure Prediction:**  
   During the tertiary creep stage prior to slope collapse, displacement velocity accelerates according to:
   $$\dot{\varepsilon}(t) = \frac{dr}{dt} = \frac{C}{(t_f - t)^m}$$
   Taking the inverse velocity:
   $$\frac{1}{v(t)} = \left(\frac{1}{C}\right) (t_f - t)^m \quad \xrightarrow{m \approx 1} \quad \frac{1}{v(t)} = A \cdot (t_f - t)$$
   The AI continuously performs linear and non-linear regression on $\frac{1}{v(t)}$ over a rolling 60-minute window. When $\frac{1}{v(t)}$ linearly trends toward zero, the X-intercept directly outputs the exact **Time-to-Failure ($t_f$)**.

2. **Mohr-Coulomb Factor of Safety (FoS) Dynamic PINN Loss:**  
   The neural network loss function penalizes violations of shear equilibrium:
   $$\mathcal{L}_{\text{PINN}} = \mathcal{L}_{\text{data}} + \lambda_1 \mathcal{L}_{\text{physics}} + \lambda_2 \mathcal{L}_{\text{inverse\_velocity}}$$
   $$\mathcal{L}_{\text{physics}} = \left\| \tau - (c' + (\sigma - u(t)) \tan\phi') \right\|^2$$
   where:
   - $\tau$ = Shear stress along joint plane (derived from bench slope angle $\beta$ and rock mass density $\gamma$).
   - $c'$ = Effective cohesion.
   - $\phi'$ = Internal friction angle.
   - $u(t)$ = Dynamic pore-water pressure continuously updated by rainfall infiltration rate ($I(t)$) and piezometer readings.

```
+---------------------------------------------------------------------------------------------------------+
|                                MULTI-MODAL TRANSFORMER FUSION ENGINE                                    |
+---------------------------------------------------------------------------------------------------------+
  INPUT TIME-SERIES CHANNELS:
  [Channel 1]: Sub-pixel Vision Optical Flow Velocity ($v_{\text{vision}}(t)$)
  [Channel 2]: Wireless LoRa MEMS Tilt Angle ($\theta_{\text{LoRa}}(t)$)
  [Channel 3]: Rainfall Infiltration Rate ($I_{\text{rain}}(t)$)
  [Channel 4]: Pore-Water Pressure Telemetry ($u_{\text{piezo}}(t)$)
  [Channel 5]: Blast Vibration Peak Particle Velocity ($\text{PPV}_{\text{seismic}}(t)$)
                                              │
                                              ▼
                             [ Multi-Head Cross-Attention Layer ]
             (Cross-correlates rainfall spikes with sudden micro-tilt accelerations)
                                              │
                                              ▼
                                 [ PINN Geomechanical Core ]
                  (Constrained by Saito Inverse Velocity & Mohr-Coulomb FoS)
                                              │
                                              ▼
  OUTPUT PREDICTIONS:
  1. Dynamic 3D Factor of Safety ($\text{FoS}(t)$)
  2. Failure Probability ($P_{\text{failure}} \in [0.0, 1.0]$)
  3. Predicted Time-to-Failure Window ($t_f \pm \sigma$ in minutes)
  4. Active TARP Level (Green / Yellow / Orange / Red)
+---------------------------------------------------------------------------------------------------------+
```

---

## 5. 3D Digital Twin & Kinetic Rockfall Runout Simulator

GeoShield AI includes an ultra-fast, in-browser **3D WebGPU Digital Twin** that renders the complete open-pit mine at 60 FPS on any standard PC, tablet, or smartphone without requiring high-end graphic workstations.

### Core Features:
1. **Dynamic Risk Heatmap:** The 3D mine mesh is color-coded in real-time based on the PINN Factor of Safety:
   - 🟢 **Green:** $\text{FoS} > 1.3$ (Stable)
   - 🟡 **Yellow:** $1.1 < \text{FoS} \le 1.3$ (Caution / Creep)
   - 🟠 **Orange:** $1.0 \le \text{FoS} \le 1.1$ (Critical Strain / Accelerated Dilation)
   - 🔴 **Red:** $\text{FoS} < 1.0$ (Imminent Failure / Active Evacuation)
2. **3D Kinetic Rockfall Bounce & Runout Cone Engine:**  
   When a boulder detachment is detected, a real-time rigid-body kinematic simulation calculates:
   $$v_{n}^{+} = -R_n \cdot v_n^{-}, \quad v_{t}^{+} = R_t \cdot v_t^{-}$$
   where $R_n$ and $R_t$ are normal and tangential restitution coefficients of the bench face. The simulation projects the exact **3D kinetic bounce trajectory, bounce heights, and hazard impact envelope** across lower haul roads, highlighting endangered haul trucks and machinery in real-time.

---

## 6. Autonomous Sub-Second TARP Dispatch Engine

In disaster management, **every single second saves lives**. Traditional manual alerting chains take 15 to 45 minutes to obtain bureaucratic approvals. GeoShield AI automates the entire Trigger Action Response Plan (TARP) execution in **under 1.0 second**.

```
                           +-------------------------------------+
                           |  TARP LEVEL 4 TRIGGER CONFIRMED     |
                           |  (TtF < 30 min OR FoS < 1.0)        |
                           +-------------------------------------+
                                              │
                    ┌─────────────────────────┼─────────────────────────┐
                    │                         │                         │
                    ▼                         ▼                         ▼
  +----------------------------------+ +-----------------------+ +----------------------------------+
  |    PHYSICAL PIT ALARMS (<0.5s)   | |  DIGITAL PUSH (<1.0s) | |    AUTOMATED LOGISTICS (<1.0s)   |
  |  - High-Decibel Pit Sirens sound | |  - Priority SMS /     | |  - Automated boom barriers close |
  |  - High-Intensity Strobe Beacons | |    WhatsApp alerts to | |    haul road access to bench     |
  |  - Synthesized VHF Voice over    | |    all mine personnel | |  - Dumper dispatch system halts  |
  |    Walkie-Talkie channels        | |  - Webhook to DGMS    | |    machinery heading to hazard   |
  +----------------------------------+ +-----------------------+ +----------------------------------+
```

---

## 7. DGMS Statutory Compliance & Regulatory Alignment

In India, all open-cast mines operate under the statutory oversight of the **Directorate General of Mines Safety (DGMS)** and the **Mines Act, 1952**. GeoShield AI is built from the ground up to comply directly with DGMS circulars:

1. **DGMS (Tech) Circular No. 02 of 2020 (Slope Stability Monitoring):** Mandates continuous scientific slope monitoring in deep open-cast mines. GeoShield AI provides automated, auditable digital logbooks exporting timestamped displacement histories and TARP audit trails.
2. **DGMS Circular No. 06 of 2021 (Safety Management Plans - SMP):** Requires formal Trigger Action Response Plans (TARP) with quantifiable numerical action triggers. GeoShield AI embeds calibrated TARP levels directly into software logic.
3. **Automated DGMS Incident Reporting:** Generates instant one-click PDF/CSV geotechnical audit reports summarizing pre-failure displacement curves, inverse velocity trends, weather triggers, and evacuation response times.

---

## 8. Summary of Strategic Advantages for SIH 2025

| Dimension | Legacy Industry Standard (Radar / Manual) | GeoShield AI (Our Solution) | SIH Hackathon Competitive Advantage |
| :--- | :--- | :--- | :--- |
| **Cost** | ₹4 Cr – ₹8 Cr (Prohibitive) | ₹2 Lakh – ₹5 Lakh (95% lower) | Democratizes slope safety for all 800+ mines in India. |
| **Detection Speed** | 2 to 10 min scan cycles | **< 200 ms real-time edge streaming** | Captures fast brittle rockfalls and sudden bench collapses. |
| **Alerting Latency** | 15–45 min manual human decision | **< 1.0 second automated multi-channel** | Direct life-safety impact; zero human delay. |
| **Atmospheric Immunity**| Prone to radar phase noise & dust | **Multi-modal sensor cross-validation** | Eliminates false alarms and alert fatigue. |
| **Trajectory Simulation**| ❌ None | **✅ 3D WebGPU kinetic runout cones** | Protects haul trucks and workers along active haul roads. |
| **Compliance** | Proprietary closed formats | **DGMS statutory standard compliant** | Ready for immediate adoption by Ministry of Mines & Coal India. |

---

> [!IMPORTANT]
> **Next Steps for SIH 2025 Development:**
> 1. Complete the core software microservices: Edge Vision Ingestion, Multi-Modal Transformer Engine, WebGPU 3D Canvas, and TARP Alert Dispatcher.
> 2. Test and validate algorithms on synthetic open-pit highwall datasets with simulated rockfall trajectories and rainfall spikes.
