# Module 03: In-Situ Subsurface & Geotechnical Contact Instruments
## Analysis of Solutions 9, 10, 11, 12, 13, 14, and 15 for Open-Pit Slope Monitoring
**Problem Statement:** SIH25071 | **Ministry of Mines** | **Disaster Management**  
**Author:** Angel Verman & Team

---

## 9. Inclinometers (Subsurface Borehole Inclinometers & In-Place Inclinometers - IPI)

### 📌 How It Works & System Architecture
Inclinometers measure subsurface horizontal lateral displacement as a function of borehole depth.
- **Physical Setup:** A grooved plastic/aluminum casing is installed in a vertical borehole drilled past the expected slip surface into stable bedrock and grouted in place.
- **Measurement Method:**
  - **Manual Probe:** A wheeled probe with internal MEMS or servo-accelerometers is traversed up the casing, logging tilt angle ($\theta$) every 0.5 meters.
  - **In-Place Inclinometers (IPI):** A permanent string of linked MEMS sensors suspended in the borehole logging real-time continuous tilt.
- **Displacement Calculation:** Horizontal displacement at interval $i$ of gauge length $L$:
  $$\delta x_i = L \cdot \sin(\theta_i)$$
  Cumulative horizontal displacement from bottom anchor:
  $$D_n = \sum_{i=1}^n \delta x_i$$

### 🌟 Pros & Core Capabilities
- **Deep Slip Surface Localization:** Accurately pinpoints the exact depth and thickness of the subsurface shear plane or failure slip surface.
- **Internal Mechanics:** Measures deep deformation long before any visible tension cracks or displacement appear on the surface.

### ⚠️ Cons & Operational Limitations
- **Destructive Failure Mode:** When the slope undergoes significant shearing (>50 mm), the rock movement shears the plastic casing, trapping or cutting the probe/cables and permanently destroying the instrument.
- **Drilling Cost & High Failure Rate:** Borehole drilling in fractured open-cast highwalls often collapses before casing can be grouted.
- **Single-Line Profile:** Monitors only a single vertical 1D line; completely blind to slope failures occurring 15 meters away.

### 💸 Cost & Commercial Barrier
- **Capex:** ₹5 Lakh – ₹15 Lakh per borehole (includes drilling, casing, sensor string, datalogger).
- **Opex:** ₹2 Lakh – ₹5 Lakh/year. Complete loss of capital upon major slope shear.

### ❌ Why It Fails Alone in the Market
- Single-point localized subsurface profile; expensive to deploy in high densities; high risk of premature loss due to shear shearing.

### 💡 How Our Proposed GeoShield AI Integrates & Enhances It
- **PINN Geomechanical Boundary Calibration:** Data from existing IPI strings serves as deep boundary condition ground-truth for GeoShield AI's Physics-Informed Neural Network (PINN), training the AI to map surface optical strain to subsurface slip depth.

---

## 10. Extensometers (Multipoint Borehole - MPBX & Surface Wire Extensometers)

### 📌 How It Works & System Architecture
Extensometers monitor relative displacement between anchors set at various depths or across surface tension cracks.
- **MPBX (Multi-Point Borehole Extensometer):** Stainless steel or fiberglass rods anchored at multiple depths (e.g., 10m, 20m, 50m) in a borehole extend up to an electronic head containing LVDT or vibrating-wire displacement transducers.
- **Wire Extensometers:** A stainless steel wire anchored on the unstable crest runs over a spring-loaded pulley connected to a rotary potentiometer anchored on stable ground.

### 🌟 Pros & Core Capabilities
- **Sub-Millimeter Strain Resolution:** Measures axial rock dilation and tension crack opening with sub-0.05 mm accuracy.
- **Real-Time Threshold Alerting:** Simple mechanical principle easily connected to basic electrical switch alarms.

### ⚠️ Cons & Operational Limitations
- **Mechanical Fragility:** Surface wires get snapped by falling rocks, monsoon rain, roaming wildlife, or haul truck tires.
- **Anchor Slippage:** Weathering and blast vibrations loosen anchor points, creating false displacement readings.
- **Point-Specific:** Only measures movement along the linear axis between the anchor and the instrument head.

### 💸 Cost & Commercial Barrier
- **Capex:** ₹50,000 – ₹3.0 Lakh per MPBX / Wire extensometer installation.
- **Opex:** ₹1.0 Lakh/year in continuous wire repair and re-tensioning.

### ❌ Why It Fails Alone in the Market
- High mechanical vulnerability in harsh blast zones; false alarms from wire snagging; extreme spatial sparsity.

### 💡 How Our Proposed GeoShield AI Integrates & Enhances It
- **Non-Contact Virtual Optical Crack Gauge:** GeoShield AI replaces vulnerable physical wires with high-resolution telephoto camera monitoring running edge sub-pixel feature disparity algorithms across tension cracks, achieving equal accuracy with zero physical wires.

---

## 11. Piezometers (Vibrating Wire & Casagrande)

### 📌 How It Works & System Architecture
Piezometers measure pore-water pressure ($u$) and phreatic water levels inside the rock mass.
- **Vibrating Wire Piezometer (VWP):** A diaphragm exposed to pore water pressure changes the resonant frequency of a tensioned steel wire plucked by an electromagnetic coil:
  $$f = \frac{1}{2L} \sqrt{\frac{T}{m}}, \quad u = K \cdot (f_0^2 - f^2)$$
  where $f$ is frequency, $T$ is wire tension proportional to water pressure, and $K$ is calibration factor.

### 🌟 Pros & Core Capabilities
- **Direct Cause Measurement:** Groundwater pore pressure is the #1 trigger of open-pit slope failure (it reduces effective normal stress $\sigma' = \sigma - u$, drastically cutting shear strength $\tau = c' + \sigma' \tan\phi'$).
- **Long-Term Durability:** Fully sealed stainless steel VWPs can operate for years underground.

### ⚠️ Cons & Operational Limitations
- **No Kinematic Output:** Piezometers measure water pressure only. They cannot tell you if the rock is currently moving, falling, or detaching.
- **Grouting Sensitivity:** Poor borehole sealing or impermeable grout creates hydrogeological lags of weeks, hiding sudden transient pore pressure spikes caused by cloudbursts.

### 💸 Cost & Commercial Barrier
- **Capex:** ₹1.0 Lakh – ₹3.0 Lakh per installed sensor + datalogger.

### ❌ Why It Fails Alone in the Market
- Measures the environmental trigger but cannot predict whether structural rock failure is actively underway or imminent.

### 💡 How Our Proposed GeoShield AI Integrates & Enhances It
- **Dynamic Factor of Safety (FoS) Engine:** GeoShield AI ingests live VWP pore pressure readings to continuously recompute the dynamic Mohr-Coulomb Factor of Safety in real-time, instantly upgrading TARP alert levels before kinematic surface displacement even begins.

---

## 12. Crack / Joint Meters

### 📌 How It Works & System Architecture
Crack meters (potentiometric, LVDT, or vibrating wire) are mounted across visible surface tension cracks or joint planes with anchor grouts on either side of the fracture.
- **Measurement:** Continuously logs 1D opening/closing $(\Delta w)$ and in 3D models logs shear displacement along $(X, Y, Z)$.

### 🌟 Pros & Core Capabilities
- **Direct Tension Crack Opening Monitoring:** Gives immediate warning when crest tension cracks begin to dilate rapidly during the tertiary creep phase.
- **Simple & Low Power:** Easily run on solar-charged micro-loggers.

### ⚠️ Cons & Operational Limitations
- **Hazardous Installation:** Requires geotechnical personnel to work directly at the edge of unstable, collapsing highwall crests to drill anchors.
- **Spatial Blindness:** If a new crack forms 1 meter behind or beside the monitored crack, the sensor registers zero movement while the bench collapses.

### 💸 Cost & Commercial Barrier
- **Capex:** ₹20,000 – ₹80,000 per crack meter node.

### ❌ Why It Fails Alone in the Market
- Extremely dangerous to install; monitors single fissures; cannot foresee progressive global bench failure.

### 💡 How Our Proposed GeoShield AI Integrates & Enhances It
- **Pit-Wide AI Crack Segmentation:** GeoShield AI runs semantic segmentation neural networks (Segment Anything Model / U-Net) on edge camera video to detect, trace, and measure crack opening width across the entire visible bench face simultaneously.

---

## 13. Tilt Sensors / Tiltmeters

### 📌 How It Works & System Architecture
MEMS (Micro-Electro-Mechanical Systems) bi-axial and tri-axial tiltmeters measure changes in gravitational acceleration ($\Delta g$) to compute angular rotation with high resolution (up to $0.001^\circ$).
- **Installation:** Bolted directly onto rock blocks, bench crests, retaining walls, or rockfall catch barriers.

### 🌟 Pros & Core Capabilities
- **Ultra-Low Cost & Low Power:** Inexpensive solid-state components operating for years on internal lithium batteries.
- **Wireless LoRa Integration:** Ideal for forming dense wireless mesh networks across hazardous cliffs.

### ⚠️ Cons & Operational Limitations
- **Insensitive to Pure Translation:** If an entire rock slab slides down a planar joint without rotating or toppling, a tiltmeter detects $0^\circ$ rotation despite massive dangerous displacement.
- **Blast Shock False Positives:** Heavy blast shockwaves and haul truck rumbling can trigger momentary tilt spikes.

### 💸 Cost & Commercial Barrier
- **Capex:** ₹5,000 – ₹25,000 per wireless LoRa tilt node.

### ❌ Why It Fails Alone in the Market
- Blind to pure translational sliding; easily confused by blast vibration spikes without multi-sensor correlation.

### 💡 How Our Proposed GeoShield AI Integrates & Enhances It
- **Distributed Wireless LoRa Tilt Array:** GeoShield AI deploys dozens of ₹3,000 ($35) custom LoRa tilt nodes across highwalls, combining them with edge vision AI. If a tilt node fires, the PTZ camera zooms in automatically to visually confirm crack dilation and rule out vibration artifacts.

---

## 14. Strain Gauges

### 📌 How It Works & System Architecture
Resistive foil or vibrating wire strain gauges bonded to rock surfaces, rock bolts, shotcrete linings, or steel cable anchors measure micro-deformation ($\mu\epsilon = \Delta L / L$).

### 🌟 Pros & Core Capabilities
- **Support Health Diagnostics:** Monitors whether installed slope support systems (rock bolts, anchors, wire netting) are exceeding their tensile yield limit.

### ⚠️ Cons & Operational Limitations
- **Hyper-Local:** Measures deformation over a 50 mm strip; completely ignores unbolted rock mass sections.
- **Debonding:** Extreme heat, moisture, and blast vibrations cause adhesive debonding from rock surfaces.

### 💸 Cost & Commercial Barrier
- **Capex:** ₹5,000 – ₹20,000 per strain gauge channel.

### ❌ Why It Fails Alone in the Market
- Diagnoses structural rock bolt load, not open-pit slope kinematic collapse.

### 💡 How Our Proposed GeoShield AI Integrates & Enhances It
- **Support Degradation Telemetry:** Telemetry from strain gauges is incorporated into GeoShield AI's structural health index, alerting operators when rock bolt anchors have yielded.

---

## 15. Time-Domain Reflectometry (TDR)

### 📌 How It Works & System Architecture
A coaxial metallic cable is placed inside a borehole across prospective shear zones and backfilled with brittle cement grout.
- **Physical Principle:** An ultra-fast electrical step pulse is transmitted down the cable. Subsurface rock shearing crimps, bends, or cuts the cable, causing a characteristic impedance reflection pulse at the exact distance of the shear plane:
  $$d = \frac{v_p \cdot t}{2}$$
  where $v_p$ is signal propagation velocity and $t$ is round-trip time.

### 🌟 Pros & Core Capabilities
- **Low-Cost Subsurface Shear Detection:** Far cheaper than borehole inclinometer strings for locating shear slip depths.
- **Long Cable Lengths:** A single cable can monitor depths up to 300+ meters.

### ⚠️ Cons & Operational Limitations
- **Single-Event Destruction:** Once the rock shears and snaps the cable, the instrument is permanently dead and cannot record further post-failure kinematics.
- **Non-Quantitative Deformation Rate:** Indicates *where* the cable was crimped, but struggles to output precise continuous mm/day velocity trends.

### 💸 Cost & Commercial Barrier
- **Capex:** ₹1.0 Lakh – ₹4.0 Lakh per borehole + TDR pulse generator.

### ❌ Why It Fails Alone in the Market
- Destructive single-use failure; lacks pre-failure kinematic velocity forecasting.

### 💡 How Our Proposed GeoShield AI Integrates & Enhances It
- **Deep Slip Surface Trigger Signal:** When a TDR cable crimp occurs, GeoShield AI instantly locks in the exact shear plane depth in its 3D geomechanical model, re-calculating the critical sliding mass volume and updating the evacuation runout zone.
