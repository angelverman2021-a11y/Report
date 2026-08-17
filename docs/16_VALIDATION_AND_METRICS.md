# 16. Model Evaluation, Validation & Safety Metrics

> **Document Type:** Master Research & Architecture Report  
> **Problem Statement ID:** SIH25071  
> **Problem Statement Title:** AI-Based Rockfall Prediction and Alert System for Open-Pit Mines  
> **Organization:** Ministry of Mines | **Category:** Software | **Theme:** Disaster Management  
> **Target System:** MINE-SAFE AI Platform  
> **Target File:** `docs/16_VALIDATION_AND_METRICS.md`

---

## 1. The Imbalanced Safety Dataset Challenge

In open-pit mine slope monitoring, geotechnical data exhibits extreme **class imbalance**:

$$\text{Normal Baseline Conditions} \gg 99.5\% \quad \text{vs.} \quad \text{Imminent Slope Failure Events} < 0.5\%$$

> **Critical Safety Principle:**  
> *"In safety-critical disaster management, **overall classification accuracy is completely misleading**. A naive model predicting 'Safe' 100% of the time achieves 99.5% accuracy but results in a 100% casualty rate when a failure occurs. Therefore, MINE-SAFE AI is evaluated strictly on safety-specific metrics that penalize False Negatives (Missed Detections)."*

---

## 2. Evaluation Metrics Framework

```
+---------------------------------------------------------------------------------------------------+
|                           MINE-SAFE AI MODEL EVALUATION METRICS                                   |
+---------------------------------------------------------------------------------------------------+
|  1. CLASSIFICATION & RISK ESTIMATION METRICS:                                                     |
|     - Recall / Sensitivity:       TP / (TP + FN)  [PRIMARY METRIC - MUST EXCEED 98%]              |
|     - Precision:                  TP / (TP + FP)  [Minimizes false alarms and costly stoppages]   |
|     - F1-Score / F2-Score:        F_beta = (1 + beta^2) * (P * R) / (beta^2 * P + R)  (beta = 2)  |
|     - PR-AUC:                     Area Under Precision-Recall Curve (Robust to class imbalance)   |
|     - ROC-AUC:                    Receiver Operating Characteristic Area Under Curve              |
|                                                                                                   |
|  2. TEMPORAL REGRESSION & TIME-TO-FAILURE (tf) METRICS:                                           |
|     - Mean Absolute Error:        MAE = (1/N) * sum |y_i - y_hat_i|                                |
|     - Root Mean Squared Error:    RMSE = sqrt( (1/N) * sum (y_i - y_hat_i)^2 )                    |
|     - Coefficient of Determination: R^2 Score                                                     |
|                                                                                                   |
|  3. COMPUTER VISION & DETECTION METRICS:                                                          |
|     - Mean Average Precision:     mAP@0.50 and mAP@0.50:0.95 (YOLOv8 boulder detection)            |
|     - Intersection over Union:    IoU = Area of Overlap / Area of Union (DeepCrack segmentation)  |
|     - Sub-Pixel Optical Flow Error: Endpoint Error (EPE in pixels)                                |
+---------------------------------------------------------------------------------------------------+
```

---

## 3. Trade-Off Analysis: False Positives vs. False Negatives

```
                        Safety-Critical Confusion Matrix Trade-Off
                                          │
            ┌─────────────────────────────┴─────────────────────────────┐
            ▼                                                           ▼
  TYPE I ERROR: FALSE POSITIVE                                TYPE II ERROR: FALSE NEGATIVE
  (False Alarm: Alarming a Safe Bench)                        (Missed Detection: Failing to Alarm)
  ────────────────────────────────────                        ────────────────────────────────────
  - Operational Consequence: Temporary haulage halt          - Operational Consequence: FATAL CASUALTIES
  - Financial Cost: ₹10k–₹50k in lost production minutes      - Financial Cost: Multi-crore equipment loss
  - Psychological Impact: Operator alarm fatigue              - Regulatory Impact: Mine closure by DGMS
  
  ==> SYSTEM DESIGN PRIORITY: We optimize with beta = 2 (F2-Score) to strictly penalize Type II errors!
```

---

## 4. Multi-Fold Cross-Validation Strategy

To avoid temporal data leakage (where future time steps leak into past training sets), standard random k-fold cross-validation is prohibited. MINE-SAFE AI employs **Rolling Temporal Block Cross-Validation (Time-Series Split)**:

```
Fold 1: [ Train: Month 1-3 ]  -->  [ Test: Month 4 ]
Fold 2: [ Train: Month 1-4 ]  -->  [ Test: Month 5 ]
Fold 3: [ Train: Month 1-5 ]  -->  [ Test: Month 6 ]
```

This guarantees the AI models are tested exclusively on unseen future geotechnical trends.
