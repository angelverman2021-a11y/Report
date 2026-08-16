# Existing Technology 20: Standalone Computer Vision & Optical Flow

> **Document Type:** Research & Benchmark Analysis  
> **Problem Statement ID:** SIH25071 | **Ministry of Mines** | **Category:** Software  
> **Prepared For:** Smart India Hackathon (SIH 2025)

---

## 1. Background & Working Principle

Standalone computer vision algorithms process camera video feeds to detect motion, cracks, and rockfall events:
* **Optical Flow (Lucas-Kanade / Farneback / DIS):** Computes pixel motion vectors $(dx, dy)$ between consecutive frames based on brightness constancy:
  $$I(x, y, t) = I(x + \delta x, y + \delta y, t + \delta t)$$
* **Object Detection & Segmentation:** YOLOv8/v10/v11 detects falling boulders and Mobile-SAM segments tension cracks.

```mermaid
flowchart LR
    A[RTSP Camera Feed] --> B[Digital Image Stabilization DIS]
    B --> C[Dense Sub-Pixel Optical Flow Farneback/DIS]
    C --> D[YOLO Haul Road ROI Segmentation]
    D --> E[Sub-Pixel Disparity & 2D-to-3D DEM Ray Casting]
    E --> F[Real-World Metric Velocity mm/hr]
```

---

## 2. Strengths & Limitations

### Advantages:
* **Full-Field Non-Contact Measurement:** Monitors entire visible highwalls at 30 FPS.
* **Low Cost:** Operates as a software layer on edge accelerators (NVIDIA Jetson / RK3588).

### Limitations:
* **False Alarms:** Dust plumes, cloud shadows, moving haul dumpers, and birds trigger false optical motion alarms if not cross-validated.
* **No Inherent Depth:** Monocular cameras cannot distinguish small nearby pebble movement from large distant slope deformation without 3D DEM calibration.

---

## 3. What is Doable & How We Adopt It for SIH25071

| Computer Vision Feature | Standalone CV Approach | Proposed SIH25071 Implementation |
| :--- | :--- | :--- |
| **Depth Scale Ambiguity** | Uncalibrated 2D pixels | **2D-to-3D DEM Ray Casting:** Projects pixel optical flow onto drone 3D elevation models to extract true metric velocity ($mm/hr$). |
| **False Alarm Rejection** | Basic optical thresholding | **Multi-Modal Cross-Validation:** Fuses optical flow with wireless LoRa tilt and blast PPV telemetry to reject shadow and dust artifacts. |

---

## 4. References
1. **Horn, B. K., & Schunck, B. G.** (1981). *Determining optical flow*. Artificial Intelligence.
2. **Kromer, R. A., et al.** (2017). *Automated rockfall tracking and volume estimation using gigapixel camera imagery*. Landslides.
