# TakeMeter


## Baseline Results

🎯 Baseline accuracy: 0.581 (evaluated on 42/43 parseable responses)

Per-class metrics (baseline):

**Personal Response**

- Precision: 0.36
- Recall: 1.00
- f1-score: 0.53
- Support: 8

**Interpretation & Analysis**

- Precision: 0.75
- Recall: 0.38
- f1-score: 0.50
- Support: 8

**Positive Evaluation**

- Precision: 0.75
- Recall: 0.38
- f1-score: 0.50
- Support: 16

**Mixed to Negative Evaluation**

- Precision: 1.00
- Recall: 0.80
- f1-score: 0.89
- Support: 16


**Accuracy**

- Precision:
- Recall:
- f1-score: 0.60
- Support: 42

**Macro Avg**

- Precision: 0.72
- Recall: 0.64
- f1-score: 0.61
- Support: 42

**Weighted Avg**

- Precision: 0.74
- Recall: 0.60
- f1-score: 0.60
- Support: 42

**Findings/Hypothesis**

Personal Response has high recall and low precision. Positive Evaluation and Interpretation &
Analysis both have low recall. Mixed to Negative Evaluation has a great f1-score and is the most
on track of the four labels.

Hypothesis: Personal Response is high recall and low precision because alot of other comments have phrases like "I love" or "I think" in them which is leading the model to get all the ones its supposed to but also take comments that belong in other label groups because those phrases are in them. Mixed to Negative Evaluation is good because dislike language is easy to separate from the rest. Positive Evaluation and Interpretation & Analysis are both suffering from low recall because Personal Response is probably leeching from them for the reasons stated earlier. A lot of the comments from these two labels do include prefaces or ending lines with phrases like "I like" or "I love" but the comments full context belong mostly in Positive or Analysis.