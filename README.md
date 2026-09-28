# TakeMeter


## Community Choice

## Label Taxonomy

## Data Collection

## Fine-tuning Approach

## Baseline Description and Results

🎯 Baseline accuracy: 0.581 (evaluated on 40/43 parseable responses)

Per-class metrics (baseline):

**Personal Response**

- Precision: 0.38
- Recall: 1.00
- f1-score: 0.55
- Support: 8

**Interpretation & Analysis**

- Precision: 0.75
- Recall: 0.43
- f1-score: 0.55
- Support: 7

**Positive Evaluation**

- Precision: 0.75
- Recall: 0.38
- f1-score: 0.50
- Support: 16

**Mixed to Negative Evaluation**

- Precision: 1.00
- Recall: 0.78
- f1-score: 0.88
- Support: 9


**Accuracy**

- Precision:
- Recall:
- f1-score: 0.60
- Support: 40

**Macro Avg**

- Precision: 0.72
- Recall: 0.65
- f1-score: 0.62
- Support: 40

**Weighted Avg**

- Precision: 0.73
- Recall: 0.60
- f1-score: 0.60
- Support: 40

**Findings/Hypothesis**

Personal Response has high recall and low precision. Positive Evaluation and Interpretation &
Analysis both have low recall. Mixed to Negative Evaluation has a great f1-score and is the most
on track of the four labels.

Hypothesis: Personal Response is high recall and low precision because alot of other comments have phrases like "I love" or "I think" in them which is leading the model to get all the ones its supposed to but also take comments that belong in other label groups because those phrases are in them. Mixed to Negative Evaluation is good because dislike language is easy to separate from the rest. Positive Evaluation and Interpretation & Analysis are both suffering from low recall because Personal Response is probably leeching from them for the reasons stated earlier. A lot of the comments from these two labels do include prefaces or ending lines with phrases like "I like" or "I love" but the comments full context belong mostly in Positive or Analysis.

## Evaluation Report

- Wrong Prediction Analysis

**Example 1**

Text:      I think it’s her worst album
True:      Mixed to Negative Evaluation
Predicted: Positive Evaluation  (confidence: 0.37)

**Example 2**

Text:      Yeah. I feel like I understand her. This album has definitely moved me to tears, in the context of her life, and in the context of my own life. Im pretty sure thats hella parasocial tho.
True:      Personal Response
Predicted: Positive Evaluation  (confidence: 0.29)

**Example 3**

Text:      I do think it was slightly rushed in a way where if she would’ve maybe thought it out a little longer it could’ve been better. But it being put out so fast was because she needed to make it so it feel...
True:      Mixed to Negative Evaluation
Predicted: Interpretation & Analysis  (confidence: 0.27)

- Sample Classifications

| Post (truncated) | True label | Predicted | Confidence | Correct? |
|---|---|---|---|---|
| I think I’m feeling this way too. Im such a huge longtime fan, I caNNOT stop listening to ... | Positive Evaluation | Positive Evaluation | 0.35 | yes |
| There are still people questioning Petal? It's her best album to date. Most grown up music... | Positive Evaluation | Positive Evaluation | 0.30 | yes |
| I do think occasionally the lyrics lean into cliche or stuff we heard from her before. I t... | Mixed to Negative Evaluation | Mixed to Negative Evaluation | 0.31 | yes |
| for me personally, it's way deeper than the pain of living in the end times 💀 but yeah, i'... | Personal Response | Positive Evaluation | 0.30 | no |
| I hope things get better soon ❤️‍🩹 | Personal Response | Positive Evaluation | 0.43 | no |

Paste this table into your README under 'Sample Classifications'.
For at least one correct row, add a sentence on why that prediction is reasonable.


- Results Comparison

==================================================
RESULTS COMPARISON
==================================================
Model                               Accuracy
---------------------------------------------
Zero-shot baseline (Groq)              0.600
Fine-tuned DistilBERT                  0.488
---------------------------------------------

Fine-tuning regression: 0.112

Use these numbers in your README evaluation report.